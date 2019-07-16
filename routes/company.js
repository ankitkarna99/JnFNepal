const router = require('express').Router();
const companyController = require('../controllers/companyController');
const auth = require('../middlewares/auth');
const companyAuth = require('../middlewares/companyAuth');
const moment = require('moment');

router.get('/company/complete', auth, companyAuth, companyController.completeProfilePage);

router.post('/company/complete', auth, companyAuth, companyController.completeProfilePagePost);

router.get('/post', auth, companyAuth, companyController.postJobPage);

router.post('/post', auth, companyAuth, companyController.insertJob);

router.get('/myJobs', auth, companyAuth, async (req, res)=>{
    const jobs = await poolQuery("SELECT * FROM jobs WHERE company_id=? ORDER BY id DESC", [req.userData.id]);    

    jobs.forEach(job => {
        job.posted_on = moment.unix(job.posted_on / 1000).format("MMM DD, YYYY");
        job.expiry_date = (job.expiry_date < Date.now()) ? "Expired" : "Active";
    });

    res.render('company/myJobs', {
        jobs
    });
});

router.get('/jobs/:id/delete', auth, companyAuth, async (req, res) => {
    const result = await poolQuery("DELETE FROM jobs WHERE company_id=? AND id=?", [req.userData.id, req.params.id]);
    req.flash("info", "Job was deleted from website.");
    res.redirect("back");
});

router.get('/findEmployees', auth, companyAuth, async (req, res)=>{
    const cities = await poolQuery("SELECT * FROM cities", []);
    const categories = await poolQuery("SELECT * FROM categories", []);
    res.render('company/findEmployees', {
        cities,
        categories
    });
});

router.post('/findEmployees', auth, companyAuth, async (req, res)=>{
    var values = [req.body.keywords];
    var sql = "SELECT employee_profiles.*, employees.id as empID, employees.full_name FROM employee_profiles, employees WHERE INSTR(keywords, ?)";

    if (req.body.city !== 'any') {
        sql += " AND city=?";
        values.push(req.body.city);
    }

    if (req.body.category !== 'any') {
        sql += " AND preferred_category=?";
        values.push(req.body.category);
    }

    sql += " AND employee_profiles.employee_id=employees.id";

    sql += " LIMIT 50";

    var employees = await poolQuery(sql, values);

    res.render("company/employeeSearchResults", {
        employees
    });
});



module.exports = router;