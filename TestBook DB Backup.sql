-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2019 at 07:36 AM
-- Server version: 5.6.11
-- PHP Version: 5.5.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `testbook`
--
CREATE DATABASE IF NOT EXISTS `testbook` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `testbook`;

-- --------------------------------------------------------

--
-- Table structure for table `catagories`
--

CREATE TABLE IF NOT EXISTS `catagories` (
  `catagory_id` int(11) NOT NULL AUTO_INCREMENT,
  `catagory_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `logo_url` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`catagory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `catagories`
--

INSERT INTO `catagories` (`catagory_id`, `catagory_name`, `logo_url`) VALUES
(2, 'Computer Science', ''),
(8, 'General Knowledge', '');

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE IF NOT EXISTS `competitions` (
  `competition_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `arranged_by_user` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `num_of_questions` int(11) DEFAULT NULL,
  PRIMARY KEY (`competition_id`),
  KEY `fk_competitions_tests1_idx` (`test_id`),
  KEY `fk_competitions_users1_idx` (`arranged_by_user`),
  KEY `fk_competitions_posts1_idx` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `competitions`
--

INSERT INTO `competitions` (`competition_id`, `test_id`, `arranged_by_user`, `post_id`, `num_of_questions`) VALUES
(4, 1, 1, 7, 10);

-- --------------------------------------------------------

--
-- Table structure for table `competition_users`
--

CREATE TABLE IF NOT EXISTS `competition_users` (
  `competition_users_id` int(11) NOT NULL AUTO_INCREMENT,
  `competition_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `has_attempted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`competition_users_id`),
  KEY `fk_competitions_has_users_users1_idx` (`user_id`),
  KEY `fk_competitions_has_users_competitions1_idx` (`competition_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=15 ;

--
-- Dumping data for table `competition_users`
--

INSERT INTO `competition_users` (`competition_users_id`, `competition_id`, `user_id`, `has_attempted`) VALUES
(12, 4, 2, 0),
(13, 4, 3, 0),
(14, 4, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `followers`
--

CREATE TABLE IF NOT EXISTS `followers` (
  `followers_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`followers_id`),
  KEY `fk_followers_users1_idx` (`user_id`),
  KEY `fk_followers_users2_idx` (`follower_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `followers`
--

INSERT INTO `followers` (`followers_id`, `date_time`, `user_id`, `follower_id`) VALUES
(3, '2019-01-03 19:48:57', 1, 2),
(4, '0000-00-00 00:00:00', 1, 3),
(5, '0000-00-00 00:00:00', 1, 4),
(8, '2019-01-24 00:00:00', 3, 1),
(9, '2019-01-22 00:00:00', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `friends_id` int(11) NOT NULL AUTO_INCREMENT,
  `adder_user_id` int(11) DEFAULT NULL,
  `added_user_id` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`friends_id`),
  KEY `fk_users_has_users_users4_idx` (`added_user_id`),
  KEY `fk_users_has_users_users3_idx` (`adder_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`friends_id`, `adder_user_id`, `added_user_id`, `date_time`) VALUES
(1, 1, 2, NULL),
(2, 1, 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE IF NOT EXISTS `friend_requests` (
  `friend_request_id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `send_datetime` datetime DEFAULT NULL,
  `is_seen` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`friend_request_id`),
  KEY `fk_users_has_users_users2_idx` (`receiver_id`),
  KEY `fk_users_has_users_users1_idx` (`sender_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `friend_requests`
--

INSERT INTO `friend_requests` (`friend_request_id`, `sender_id`, `receiver_id`, `send_datetime`, `is_seen`) VALUES
(2, 4, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `fk_likes_posts1_idx` (`post_id`),
  KEY `fk_likes_users1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `datetime`, `post_id`, `user_id`) VALUES
(2, '2019-01-03 19:23:13', NULL, 1),
(6, '2019-01-03 23:40:01', NULL, 1),
(7, '2019-01-05 16:08:26', NULL, 1),
(8, '2019-01-05 16:43:28', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_text` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`option_id`),
  KEY `fk_options_questions1_idx` (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=52 ;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `option_text`, `is_correct`, `question_id`) VALUES
(1, 'Insert Menu', 1, 1),
(2, 'View Menu', 0, 1),
(3, 'Format Menu', 0, 1),
(4, 'Tools Menu', 0, 1),
(5, 'Insert', 1, 2),
(6, 'Format', 0, 2),
(7, 'Tools', 0, 2),
(8, 'Table', 0, 2),
(9, 'Copy & Paste', 0, 3),
(10, 'Cut & Paste', 1, 3),
(11, 'Bold', 0, 3),
(12, 'Justify', 0, 3),
(13, 'Strikethrough', 1, 4),
(14, 'Find', 0, 4),
(15, 'Replace', 0, 4),
(16, 'Change Styles', 0, 4),
(17, 'Task bar', 0, 5),
(18, 'Status bar', 1, 5),
(19, 'Tool bar', 0, 5),
(20, 'Title bar', 0, 5),
(21, 'Home tab', 0, 6),
(22, 'Insert Tab', 1, 6),
(23, 'Pagelayout tab', 0, 6),
(24, 'A word', 0, 7),
(25, 'A sentence', 1, 7),
(26, 'Entire document', 0, 7),
(27, 'Clipart ', 1, 8),
(28, 'WordArt ', 0, 8),
(29, 'Drop Cap ', 0, 8),
(30, 'All of above ', 0, 8),
(31, 'Increase font size ', 0, 9),
(32, 'Inserts a line break ', 0, 9),
(33, 'Indicate the text should be bold ', 0, 9),
(34, 'Applies italic format to selected text ', 1, 9),
(35, 'Outlined ', 0, 10),
(36, 'Raised ', 0, 10),
(37, 'Superscript ', 1, 10),
(38, 'Subscript ', 0, 10),
(39, 'To drop all the capital letters ', 0, 11),
(40, 'Office XP ', 0, 12),
(41, 'Office Vista ', 1, 12),
(42, 'Office 2007 ', 0, 12),
(43, 'None of above ', 0, 12),
(44, 'Spelling suggestions ', 0, 13),
(45, 'Grammar options ', 0, 13),
(46, 'Synonyms and Antonyms words ', 1, 13),
(47, 'All of above', 0, 13),
(48, 'Page Orientation ', 1, 14),
(49, 'Paper Size ', 0, 14),
(50, 'Page Layout ', 0, 14),
(51, 'All of above ', 0, 14);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `post_by_user` int(11) DEFAULT NULL,
  `post_type` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `fk_posts_users1_idx` (`post_by_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `date_time`, `post_by_user`, `post_type`) VALUES
(7, '2019-01-05 16:41:59', 1, 'competition');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `fk_questions_tests1_idx` (`test_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=15 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question`, `test_id`) VALUES
(1, 'From which menu you can insert Header and Footer?', 1),
(2, 'To get to the ''Symbol'' dialog box, click on the ______ menu and choose ''Symbol''.', 1),
(3, '______ option from clipboard is used to move data from one place to another in a document.', 1),
(4, '_______ is an option in Font Group.', 1),
(5, 'Shortcut for document views toolbar is situated in _____ bar.', 1),
(6, 'Bullets and Number is in ____ tab', 1),
(7, 'Pressing F8 key for three times selects', 1),
(8, 'Which of the following is graphics solution for Word Processors? ', 1),
(9, 'The keystrokes Ctrl + I is used to ', 1),
(10, 'A character that is raised and smaller above the baseline is known as', 1),
(11, 'Why Drop Caps are used in document? ', 1),
(12, 'Which of the following is not valid version of MS Office? ', 1),
(13, 'Thesaurus tool in MS Word is used for ', 1),
(14, 'Portrait and Landscape are ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_catagories`
--

CREATE TABLE IF NOT EXISTS `sub_catagories` (
  `sub_catagory_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_catagory_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_url` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catagory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sub_catagory_id`),
  KEY `fk_sub_catagories_catagories1_idx` (`catagory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `sub_catagories`
--

INSERT INTO `sub_catagories` (`sub_catagory_id`, `sub_catagory_name`, `logo_url`, `catagory_id`) VALUES
(1, 'Microsoft Office', 'pictures/subcategory_logos/logo.png', 2),
(6, 'Programming', 'pictures/subcategory_logos/coding_logo.png', 2);

-- --------------------------------------------------------

--
-- Table structure for table `testadmins`
--

CREATE TABLE IF NOT EXISTS `testadmins` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `admin_password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `fk_testadmins_users1_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `testadminstable`
--

CREATE TABLE IF NOT EXISTS `testadminstable` (
  `testadminstable_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`testadminstable_id`),
  KEY `fk_tests_has_testadmins_testadmins1_idx` (`admin_id`),
  KEY `fk_tests_has_testadmins_tests1_idx` (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE IF NOT EXISTS `tests` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `logo_url` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `sub_catagory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`test_id`),
  KEY `fk_tests_sub_catagories1_idx` (`sub_catagory_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`test_id`, `test_name`, `logo_url`, `sub_catagory_id`) VALUES
(1, 'Microsoft Word', '', 1),
(2, 'Microsoft Powerpoint', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `test_history`
--

CREATE TABLE IF NOT EXISTS `test_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `total_attempted` int(11) DEFAULT NULL,
  `correct_answers` int(11) DEFAULT NULL,
  `wrong_answers` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `score` float(6,2) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL,
  `test_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `competition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  KEY `fk_test_history_tests1_idx` (`test_id`),
  KEY `fk_test_history_users1_idx` (`user_id`),
  KEY `fk_test_history_posts1_idx` (`post_id`),
  KEY `fk_test_history_competitions1_idx` (`competition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=1 ;

--
-- Triggers `test_history`
--
DROP TRIGGER IF EXISTS `scoreTrigger`;
DELIMITER //
CREATE TRIGGER `scoreTrigger` BEFORE INSERT ON `test_history`
 FOR EACH ROW BEGIN
	SET NEW.score = (NEW.correct_answers / NEW.total_attempted * 100);
	SET NEW.wrong_answers = NEW.total_attempted - NEW.correct_answers;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picurl` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'user_profile_pics/default.gif',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `fullname`, `gender`, `email`, `picurl`) VALUES
(1, 'hallarazad', '111111', 'Hallar Azad', 'male', 'hallarazad@gmail.com', 'user_profile_pics/hallarazad.jpg'),
(2, 'nadeemali', '111111', 'Nadeem Ali ', 'male', 'nadeemali@gmail.com', 'user_profile_pics/nadeemchandio.png'),
(3, 'saleemali', '111111', 'Saleem Siyal', 'male', 'saleemali@gmail.com', 'user_profile_pics/saleemsiyal.png'),
(4, 'bakhtiarali', '111111', 'Bakhtiar Panhwar', 'male', 'bakhtiarali@gmail.com', 'user_profile_pics/bakhtiarpanhwar.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_me` longtext COLLATE utf8_unicode_ci,
  `facebook_link` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`profile_id`),
  KEY `fk_user_profile_users1_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`profile_id`, `country`, `city`, `about_me`, `facebook_link`, `twitter_link`, `user_id`) VALUES
(1, 'Pakistan', 'Karachi', 'I am a gameplay programmer and an evangelist. I''ve been developing VR content for last 2 years now during which I have worked on high end VR experiences for all major VR platforms (Vive, Rift, PSVR), mobile VR, non-VR and AR games. I am always excited to explore the new technologies in the XR family. I''m currently experimenting with WebVR.', 'facebook.com/hallarazad', 'twitter.com/hallarazad', 1),
(2, 'Pakistan', 'Dadu', 'Experienced J2EE Developer with a demonstrated history of working in the software development industry. Skilled in Java frameworks Struts2, Play, Spring boot, Hibernate and RDBMS.', 'facebook.com/nadeemali', NULL, 2),
(3, 'Pakistan', 'Karachi', 'As a dynamic and energetic software developer, I have worked on .NET projects using the following tools: C# WindowForms ASP.NET WinForms JavaScript Jquery', 'facebook.com/siyalsaleem', NULL, 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `competitions`
--
ALTER TABLE `competitions`
  ADD CONSTRAINT `fk_competitions_posts1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_competitions_tests1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_competitions_users1` FOREIGN KEY (`arranged_by_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `competition_users`
--
ALTER TABLE `competition_users`
  ADD CONSTRAINT `fk_competitions_has_users_competitions1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`competition_id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_competitions_has_users_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `followers`
--
ALTER TABLE `followers`
  ADD CONSTRAINT `fk_followers_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_followers_users2` FOREIGN KEY (`follower_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `fk_users_has_users_users3` FOREIGN KEY (`adder_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_users_has_users_users4` FOREIGN KEY (`added_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD CONSTRAINT `fk_users_has_users_users1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_users_has_users_users2` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_likes_posts1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_likes_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `options`
--
ALTER TABLE `options`
  ADD CONSTRAINT `fk_options_questions1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_users1` FOREIGN KEY (`post_by_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `fk_questions_tests1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `sub_catagories`
--
ALTER TABLE `sub_catagories`
  ADD CONSTRAINT `fk_sub_catagories_catagories1` FOREIGN KEY (`catagory_id`) REFERENCES `catagories` (`catagory_id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `testadmins`
--
ALTER TABLE `testadmins`
  ADD CONSTRAINT `fk_testadmins_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `testadminstable`
--
ALTER TABLE `testadminstable`
  ADD CONSTRAINT `fk_tests_has_testadmins_testadmins1` FOREIGN KEY (`admin_id`) REFERENCES `testadmins` (`admin_id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_tests_has_testadmins_tests1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `tests`
--
ALTER TABLE `tests`
  ADD CONSTRAINT `fk_tests_sub_catagories1` FOREIGN KEY (`sub_catagory_id`) REFERENCES `sub_catagories` (`sub_catagory_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test_history`
--
ALTER TABLE `test_history`
  ADD CONSTRAINT `fk_test_history_competitions1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`competition_id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_test_history_posts1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE ON UPDATE SET NULL,
  ADD CONSTRAINT `fk_test_history_tests1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`test_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_test_history_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `fk_user_profile_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
