-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2019 at 05:55 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jnf`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Healthcare'),
(2, 'Automobile Jobs'),
(3, 'Construction'),
(4, 'Food Service'),
(5, 'Computer &amp; IT'),
(6, 'Finance'),
(7, 'Others');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`) VALUES
(1, 'Kathmandu'),
(2, 'Pokhara'),
(3, 'Dharan'),
(4, 'Itahari'),
(5, 'Jhapa');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `name` text NOT NULL,
  `phone_number` varchar(25) NOT NULL DEFAULT '',
  `website` varchar(50) NOT NULL DEFAULT '',
  `logo` varchar(100) NOT NULL DEFAULT '',
  `city` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `email`, `password`, `name`, `phone_number`, `website`, `logo`, `city`) VALUES
(16, 'micco@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Michaelson Company', '123456', 'Nepal', 'https://www.freelogodesign.org/Content/img/logo-ex-7.png', 'Pokhara'),
(17, 'ujeli@gmail.com', '8942b9f9f1b58891accaab781f32ec30', 'Ujeli', '9869419236', '', 'http://www.advertguru.co.zw/wp-content/uploads/2015/09/logo-designing-in-Harare-Zimbabwe.jpg', 'Kathmandu'),
(18, 'a@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Ankit Karna', '123456', '234567', '234567', 'Pokhara');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `full_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `email`, `password`, `full_name`) VALUES
(6, 'ankitkarna99@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Ankit Karna'),
(7, 'sam1@gmail.com', '56ab24c15b72a457069c5ea42fcfc640', 'samjhana');

-- --------------------------------------------------------

--
-- Table structure for table `employee_profiles`
--

CREATE TABLE `employee_profiles` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `city` text NOT NULL,
  `picture` varchar(100) NOT NULL DEFAULT '',
  `keywords` text NOT NULL,
  `preferred_category` text NOT NULL,
  `academic_qualification` text NOT NULL,
  `resume` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_profiles`
--

INSERT INTO `employee_profiles` (`id`, `employee_id`, `city`, `picture`, `keywords`, `preferred_category`, `academic_qualification`, `resume`) VALUES
(3, 7, 'Kathmandu', '/uploads/employees/profile_pictures/7.gif', 'html , css', 'Computer &amp; IT', 'IT, Computing Studies and Technology\r\n', '/uploads/employees/resumes/7.pdf'),
(5, 6, 'Jhapa', '/uploads/employees/profile_pictures/6.gif', 'php, mysql, php, money, css', 'Computer &amp; IT', 'IT, Computing Studies and Technology\r\n', '/uploads/employees/resumes/6.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `company_id` int(11) NOT NULL,
  `city` text NOT NULL,
  `type` text NOT NULL,
  `no_of_vacancies` text NOT NULL,
  `category` text NOT NULL,
  `keywords` text NOT NULL,
  `description` text NOT NULL,
  `contact_email` text NOT NULL,
  `salary` text NOT NULL,
  `posted_on` bigint(20) NOT NULL,
  `expiry_date` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `company_id`, `city`, `type`, `no_of_vacancies`, `category`, `keywords`, `description`, `contact_email`, `salary`, `posted_on`, `expiry_date`) VALUES
(3, 'IT', 17, 'Kathmandu', 'Freelance', '1', 'Computer &amp; IT', 'html , css', '<ol><li>should have a good knowledge of</li></ol><ul><li>html</li><li>php</li><li>css</li><li>nodejs</li></ul>', 'ujeli@gmail.com', '2000', 1547621594614, 1848917594614);

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `keyword` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`id`, `category_id`, `keyword`) VALUES
(1, 1, 'public health'),
(2, 1, 'nursing'),
(3, 1, 'health science'),
(4, 1, 'pharma'),
(5, 1, 'biotech'),
(6, 1, 'physiology'),
(7, 1, 'medicare'),
(8, 1, 'specialist'),
(9, 1, 'therapy'),
(10, 1, 'health information'),
(11, 1, 'surgeon'),
(12, 2, 'aeronautics'),
(13, 2, 'automobile technician'),
(14, 2, 'automobile engineer'),
(15, 2, 'auto'),
(16, 2, 'bus'),
(17, 2, 'car'),
(18, 2, 'machine'),
(19, 2, 'motor'),
(20, 2, 'motor vehicle'),
(21, 2, 'motorcar'),
(22, 2, 'wheels'),
(23, 2, 'engine'),
(24, 2, 'vehicle'),
(25, 2, 'cab'),
(26, 2, 'transportation'),
(27, 2, 'van'),
(28, 2, 'truck'),
(29, 2, 'convertible'),
(30, 2, 'taxi'),
(31, 2, 'compact'),
(32, 2, 'ride'),
(33, 2, 'buggy'),
(34, 2, 'crate'),
(35, 2, 'four-wheeler'),
(36, 2, 'subcompact'),
(37, 3, 'heavy labor'),
(38, 3, 'lifting'),
(39, 3, 'labor'),
(40, 3, 'dexterity'),
(41, 3, 'measuring'),
(42, 3, 'building'),
(43, 3, 'building materials'),
(44, 3, 'drawings'),
(45, 3, 'safety'),
(46, 3, 'contract'),
(47, 3, 'repairs'),
(48, 3, 'brick laying'),
(49, 3, 'carpentry'),
(50, 3, 'cement'),
(51, 3, 'concrete'),
(52, 3, 'construction'),
(53, 3, 'drywall'),
(54, 3, 'masonry'),
(55, 3, 'metal'),
(56, 3, 'roofing'),
(57, 3, 'sheet metal work'),
(58, 3, 'equipment'),
(59, 3, 'tools'),
(60, 4, 'foods'),
(61, 4, 'drinks'),
(62, 4, 'beverages'),
(63, 4, 'cake'),
(64, 4, 'cheese'),
(65, 4, 'pastry'),
(66, 4, 'coffee'),
(67, 4, 'tea'),
(68, 4, 'non veg items'),
(69, 4, 'ice-creams'),
(70, 4, 'pasta'),
(71, 4, 'pizza'),
(72, 4, 'pork'),
(73, 4, 'chicken'),
(74, 4, 'soup'),
(75, 4, 'vegetables'),
(76, 4, 'noodles'),
(77, 4, 'snacking'),
(78, 4, 'cocktail'),
(79, 6, 'acounting'),
(80, 6, 'marketing'),
(81, 6, 'logistics'),
(82, 6, 'enterprenaurship'),
(83, 6, 'economics'),
(84, 6, 'finance'),
(85, 6, 'bba'),
(86, 6, 'bbs'),
(87, 6, 'mba'),
(88, 6, 'mbs'),
(89, 5, 'machine learning'),
(90, 5, 'apache hadoop'),
(91, 5, 'verilog'),
(92, 5, 'cisa'),
(93, 5, 'objective c'),
(94, 5, 'postgresql'),
(95, 5, 'big data'),
(96, 5, 'tableau'),
(97, 5, 'architectural design'),
(98, 5, 'software engineering'),
(99, 5, 'simulation'),
(100, 5, 'software as a service'),
(101, 5, 'saas'),
(102, 5, 'lamp stack'),
(103, 5, 'debugging'),
(104, 5, 'mysql'),
(105, 5, 'embedded systems'),
(106, 5, 'mobile application design'),
(107, 5, 'php'),
(108, 5, 'cryptography'),
(109, 5, 'nodejs'),
(110, 5, 'python'),
(111, 5, 'java'),
(112, 5, 'android'),
(113, 5, 'ssl'),
(114, 5, 'html'),
(115, 5, 'css'),
(116, 5, 'angular'),
(117, 5, 'react'),
(118, 5, 'vue'),
(119, 5, 'vuejs'),
(120, 5, 'redux');

-- --------------------------------------------------------

--
-- Table structure for table `messagelist`
--

CREATE TABLE `messagelist` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `sender` varchar(25) NOT NULL,
  `message` text NOT NULL,
  `seen` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messagelist`
--

INSERT INTO `messagelist` (`id`, `employee_id`, `company_id`, `sender`, `message`, `seen`) VALUES
(77, 7, 17, 'employee', '1', 0),
(78, 7, 16, 'employee', 'hi', 1),
(91, 6, 17, 'employee', 'nn', 0),
(93, 6, 16, 'company', 'Hello', 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `sender` varchar(25) NOT NULL,
  `message` text NOT NULL,
  `seen` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `employee_id`, `company_id`, `sender`, `message`, `seen`) VALUES
(3, 6, 16, 'company', 'hi', 1),
(4, 6, 16, 'company', 'hi', 1),
(5, 6, 16, 'employee', 'hi', 1),
(6, 6, 16, 'employee', 'hi', 1),
(7, 6, 16, 'employee', 'hmm', 1),
(8, 6, 16, 'employee', 'hoo', 1),
(9, 6, 16, 'employee', 's', 1),
(10, 6, 16, 'employee', 's', 1),
(11, 6, 16, 'employee', 'aa', 1),
(12, 6, 16, 'employee', 'a', 1),
(13, 6, 16, 'employee', 'a', 1),
(14, 6, 16, 'employee', 'a', 1),
(15, 6, 16, 'employee', 'a', 1),
(16, 6, 16, 'employee', '.', 1),
(17, 6, 16, 'employee', 'hmm', 1),
(18, 7, 17, 'company', 'hello', 0),
(19, 7, 17, 'employee', 'hi', 0),
(20, 7, 17, 'company', 'i have applied for the job', 0),
(21, 7, 17, 'employee', 'u(', 0),
(22, 7, 17, 'company', '........', 0),
(23, 7, 17, 'company', '.', 0),
(24, 7, 17, 'company', '.', 0),
(25, 7, 17, 'company', '.', 0),
(26, 7, 17, 'company', '.', 0),
(27, 7, 17, 'company', '.', 0),
(28, 7, 17, 'company', '.', 0),
(29, 7, 17, 'company', '.', 0),
(30, 7, 17, 'company', '.', 0),
(31, 7, 17, 'company', '.', 0),
(32, 7, 17, 'company', 'k', 0),
(33, 7, 17, 'company', 'a', 0),
(34, 7, 17, 'company', 'a', 0),
(35, 7, 17, 'company', 'a', 0),
(36, 7, 17, 'company', 'a', 0),
(37, 7, 17, 'company', 'aa', 0),
(38, 7, 17, 'company', 'a', 0),
(39, 7, 17, 'company', 'a', 0),
(40, 7, 17, 'company', 'a', 0),
(41, 7, 17, 'company', 'a', 0),
(42, 7, 17, 'company', 'a', 0),
(43, 7, 17, 'company', 'a', 0),
(44, 7, 17, 'company', 'a', 0),
(45, 7, 17, 'company', 'a', 0),
(46, 7, 17, 'company', 'aa', 0),
(47, 7, 17, 'company', 'a', 0),
(48, 7, 17, 'company', 'a', 0),
(49, 7, 17, 'company', 'a', 0),
(50, 7, 17, 'company', 'a', 0),
(51, 7, 17, 'company', 'a', 0),
(52, 7, 17, 'company', 'a', 0),
(53, 7, 17, 'company', 'a', 0),
(54, 7, 17, 'company', 'a', 0),
(55, 7, 17, 'company', 'a', 0),
(56, 7, 17, 'company', 'a', 0),
(57, 7, 17, 'company', 'a', 0),
(58, 7, 17, 'company', 'a', 0),
(59, 7, 17, 'company', 'a', 0),
(60, 7, 17, 'company', 'a', 0),
(61, 7, 17, 'company', 'a', 0),
(62, 7, 17, 'company', 'a', 0),
(63, 7, 17, 'company', 'a', 0),
(64, 7, 17, 'company', 'a', 0),
(65, 7, 17, 'company', 'a', 0),
(66, 7, 17, 'company', 'a', 0),
(67, 7, 17, 'company', 'a', 0),
(68, 7, 17, 'company', 'a', 0),
(69, 7, 17, 'company', 'a', 0),
(70, 7, 17, 'company', 'a', 0),
(71, 7, 17, 'company', 'a', 0),
(72, 7, 17, 'company', 'a', 0),
(73, 7, 17, 'company', 'a', 0),
(74, 7, 17, 'company', 'a', 0),
(75, 7, 17, 'company', 'a', 0),
(76, 7, 16, 'employee', 'hi', 1),
(77, 7, 17, 'employee', '1', 0),
(78, 7, 16, 'employee', 'hi', 1),
(79, 6, 16, 'employee', 'lol', 1),
(80, 6, 16, 'company', 'hi', 1),
(81, 6, 16, 'employee', 'Morocoo Hellosto sfsdjfi Himsdkh AOi9e', 1),
(82, 6, 16, 'employee', 'Morocoo Hellosto sfsdjfi Himsdkh AOi9e', 1),
(83, 6, 16, 'employee', 'Morocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9e', 1),
(84, 6, 16, 'employee', 'Morocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9e', 1),
(85, 6, 16, 'employee', 'Morocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9e', 1),
(86, 6, 16, 'employee', 'Morocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9e', 1),
(87, 6, 16, 'employee', 'hi', 1),
(88, 6, 16, 'employee', 'Morocoo Hellosto sfsdjfi Himsdkh AOi9eMorocoo Hellosto sfsdjfi Himsdkh AOi9e', 1),
(89, 6, 16, 'company', 'hello', 1),
(90, 6, 16, 'company', 'sdsd', 1),
(91, 6, 17, 'employee', 'nn', 0),
(92, 6, 16, 'employee', 'hi', 1),
(93, 6, 16, 'company', 'Hello', 1);

-- --------------------------------------------------------

--
-- Table structure for table `qualifications`
--

CREATE TABLE `qualifications` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `qualifications`
--

INSERT INTO `qualifications` (`id`, `name`) VALUES
(1, 'Accounting Finance\r'),
(2, 'Agriculture, Animal Science & Forestry\r'),
(3, 'Biological, Biomedical and Food Sciences\r'),
(4, 'Design & Fine Arts\r'),
(5, 'Diploma\r'),
(6, 'Education and Research\r'),
(7, 'Engineering, Architecture and Transportation Studies\r\n'),
(8, 'Environmental, Natural Resources, Population And Related Studies\r\n'),
(9, 'Health Care Management\r'),
(10, 'Health, Medical and Applied Science\r'),
(11, 'Hospitality & Tourism\r'),
(12, 'Humanities, Languages, Religious Studies and Liberal Science\r\n'),
(13, 'Intermediate\r'),
(14, 'IT, Computing Studies and Technology\r'),
(15, 'Law and Legal Studies\r'),
(16, 'Management, Accounting, Administration and Business Studies\r\n'),
(17, 'Media, Journalism & Related Studies\r'),
(18, 'Natural Science. Life Science & Related Studies\r'),
(19, 'Overseer\r'),
(20, 'Pharmacy & Nursing\r'),
(21, 'Physiotherapy\r'),
(22, 'S.L.C\r'),
(23, 'Social Work');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_profiles`
--
ALTER TABLE `employee_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `keywords` ADD FULLTEXT KEY `keyword` (`keyword`);

--
-- Indexes for table `messagelist`
--
ALTER TABLE `messagelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qualifications`
--
ALTER TABLE `qualifications`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employee_profiles`
--
ALTER TABLE `employee_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `messagelist`
--
ALTER TABLE `messagelist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `qualifications`
--
ALTER TABLE `qualifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
