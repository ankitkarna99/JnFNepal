const fs = require('fs');
const pdfUtil = require('pdf-parse');

function matchPercentage(haystack, needles) {
    haystack = haystack.toLowerCase();
    if (needles.length < 1) return 0;

    let matches = 0;
    needles.forEach(needle => {
        if (haystack.indexOf(needle.trim()) !== -1) {
            matches++;
        }
    });

    return (matches / needles.length) * 100;
}

exports.viewProfile = async (req, res) => {
    try {
        var data = await poolQuery("SELECT employee_profiles.*, employees.full_name, employees.id as userId FROM employee_profiles INNER JOIN employees ON employee_profiles.employee_id=employees.id AND employee_profiles.employee_id=?", [req.params.id]);
        if (data.length < 1) throw "Invalid link was followed.";

        res.render('employee/profile', {
            emp: data[0],
            myProfile: (data[0].userId == req.userData.id && req.userData.type == "employee") ? true : false
        });
    } catch (err) {
        req.flash('error', err);
        res.redirect('/');
    }
}

exports.completeProfilePage1 = async (req, res) => {
    const cities = await poolQuery("SELECT * FROM cities", []);
    const categories = await poolQuery("SELECT * FROM categories", []);
    const qualifications = await poolQuery("SELECT * FROM qualifications", []);

    const profile = await poolQuery("SELECT * FROM employee_profiles WHERE employee_id=?", [req.userData.id]);

    res.render('employee/complete', {
        cities,
        categories,
        qualifications,
        alreadyFilled: (profile.length > 0) ? true : false,
        profile: (profile.length > 0) ? profile[0] : {}
    });
};

exports.completeProfilePage1Post = async (req, res) => {
    try {
        if (req.body.city.length < 1 || req.body.academic_qualification.length < 1 || req.body.keywords < 1) {
            throw "Please fill all the fields";
        } else {
            req.body.keywords = req.body.keywords.toLowerCase();
            const data = await poolQuery("SELECT COUNT(*) as num FROM employee_profiles WHERE employee_id=?", [req.userData.id]);

            const data2 = await poolQuery("SELECT categories.* FROM keywords INNER JOIN categories ON keywords.category_id=categories.id AND INSTR(?, keywords.keyword) > 0 LIMIT 1", [req.body.keywords]);
            var preferred_category = "Others";
            if (data2.length > 0){
                preferred_category = data2[0].name;
            }

            if (data[0].num < 1) {
                const result = await poolQuery("INSERT INTO employee_profiles (employee_id, city, keywords, preferred_category, academic_qualification) VALUES (?,?,?,?,?)", [req.userData.id, req.body.city, req.body.keywords, preferred_category, req.body.academic_qualification]);
            } else {
                const result = await poolQuery("UPDATE employee_profiles SET city=?, keywords=?, preferred_category=?, academic_qualification=? WHERE employee_id=?", [req.body.city, req.body.keywords, preferred_category, req.body.academic_qualification, req.userData.id]);
            }
            res.redirect('/employee/complete2');
        }
    } catch (err) {
        req.flash('error', err);
        res.redirect('/employee/complete');
    }
};

exports.completeProfilePage2 = (req, res) => {
    res.render('employee/complete2');
};

exports.completeProfilePage2Post = async (req, res) => {
    try {
        if (!req.files) throw "File wasn't supplied.";

        var file = req.files.myFile;
        var fileName = file.name;
        var mimeType = file.mimetype;
        var size = file.data.length;
        var extension = path.extname(fileName);
        var allowedExtensions = /pdf/;

        var validExtension = allowedExtensions.test(extension.toLowerCase());
        var validMimeType = allowedExtensions.test(mimeType.toLowerCase());

        if (!(validExtension && validMimeType)) throw ("Only PDF is allowed!")

        if (size > 5000000) throw ("File size must be less than 5 MB")

        await moveFile(file, "./public/uploads/employees/resumes/" + req.userData.id + ".pdf");
        
        let dataBuffer = fs.readFileSync("./public/uploads/employees/resumes/" + req.userData.id + ".pdf");
        
        var pdfData = await pdfUtil(dataBuffer);

        var pdf = pdfData.text;

        var keywordsData = await poolQuery("SELECT keywords FROM employee_profiles WHERE employee_id=?", [req.userData.id]);
        
        keywords = "";

        if (keywordsData.length > 0){
            keywords = keywordsData[0].keywords;
        }

        var matchables = [];

        if (keywords.indexOf(",") !== -1){
            matchables = keywords.split(",");
        } else {
            if (keywords.length > 0){
                matchables.push(keywords);
            }
        }
              
        if (matchPercentage(pdf, matchables) < 75) throw ("The keywords you entered in the previous page are not existent in your pdf.");

        const result = await poolQuery("UPDATE employee_profiles SET resume=? WHERE employee_id=?", ["/uploads/employees/resumes/" + req.userData.id + ".pdf", req.userData.id]);
        res.redirect('/employee/complete3');

    } catch (err) {

        console.log(err);
        req.flash('error', err);
        res.redirect('/employee/complete2');
    }
};

exports.completeProfilePage3 = (req, res) => {
    res.render('employee/complete3');
};

exports.completeProfilePage3Post = async (req, res) => {
    try {
        if (!req.files) throw "File wasn't supplied.";

        var file = req.files.myFile;
        var fileName = file.name;
        var mimeType = file.mimetype;
        var size = file.data.length;
        var extension = path.extname(fileName);
        var allowedExtensions = /jpg|jpeg|png|gif/;

        var validExtension = allowedExtensions.test(extension.toLowerCase());
        var validMimeType = allowedExtensions.test(mimeType.toLowerCase());

        if (!(validExtension && validMimeType)) throw ("Only image files are allowed!")

        if (size > 5000000) throw ("File size must be less than 5 MB")

        await moveFile(file, "./public/uploads/employees/profile_pictures/" + req.userData.id + ".gif");

        const result = await poolQuery("UPDATE employee_profiles SET picture=? WHERE employee_id=?", ["/uploads/employees/profile_pictures/" + req.userData.id + ".gif", req.userData.id]);
        req.flash('success', "Profile was completed successfully.");
        res.redirect('/');

    } catch (err) {
        req.flash('error', err);
        res.redirect('/employee/complete3');
    }
};