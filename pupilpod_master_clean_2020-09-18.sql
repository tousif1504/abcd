# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.1.10-MariaDB)
# Database: pupilpod_master_clean
# Generation Time: 2020-09-18 13:36:16 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ac_elective_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ac_elective_group`;

CREATE TABLE `ac_elective_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(11) DEFAULT NULL,
  `pupilsightProgramID` int(11) DEFAULT NULL,
  `pupilsightYearGroupID` int(11) DEFAULT NULL,
  `name` varchar(256) NOT NULL,
  `order_no` tinyint(4) DEFAULT NULL,
  `max_selection` tinyint(4) DEFAULT NULL,
  `min_selection` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ac_elective_group_section
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ac_elective_group_section`;

CREATE TABLE `ac_elective_group_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ac_elective_group_id` int(11) NOT NULL,
  `pupilsightRollGroupID` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ac_elective_group_subjects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ac_elective_group_subjects`;

CREATE TABLE `ac_elective_group_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ac_elective_group_id` int(11) NOT NULL,
  `pupilsightDepartmentID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table ac_manage_skill
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ac_manage_skill`;

CREATE TABLE `ac_manage_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table acRemarks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `acRemarks`;

CREATE TABLE `acRemarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remarkcode` varchar(128) NOT NULL,
  `description` varchar(512) NOT NULL,
  `pupilsightYearGroupID` int(3) DEFAULT NULL,
  `pupilsightDepartmentID` int(4) unsigned NOT NULL,
  `skill` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `userid` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address` varchar(500) NOT NULL,
  `pwd` varchar(50) NOT NULL,
  `added_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `last_login_timedate` varchar(25) NOT NULL,
  `last_login_syst_ip` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'status: 1- active , 0-inactive',
  `role` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'role : 1 -  admin , 0 - User',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table alumniAlumnus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `alumniAlumnus`;

CREATE TABLE `alumniAlumnus` (
  `alumniAlumnusID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(5) NOT NULL,
  `surname` varchar(30) NOT NULL DEFAULT '',
  `firstName` varchar(30) NOT NULL DEFAULT '',
  `officialName` varchar(150) NOT NULL,
  `maidenName` varchar(30) NOT NULL,
  `gender` enum('M','F','Other','Unspecified') NOT NULL DEFAULT 'Unspecified',
  `username` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address1Country` varchar(255) NOT NULL,
  `profession` varchar(30) NOT NULL,
  `employer` varchar(30) NOT NULL,
  `jobTitle` varchar(30) NOT NULL,
  `graduatingYear` int(4) DEFAULT NULL,
  `formerRole` enum('Staff','Student','Parent','Other') DEFAULT NULL,
  `pupilsightPersonID` int(10) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`alumniAlumnusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table assign_core_subjects_toclass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assign_core_subjects_toclass`;

CREATE TABLE `assign_core_subjects_toclass` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pupilsightProgramID` int(3) NOT NULL,
  `pupilsightYearGroupID` int(3) unsigned NOT NULL,
  `pupilsightDepartmentID` int(4) unsigned NOT NULL,
  `pos` int(10) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table assign_elective_subjects_tostudents
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assign_elective_subjects_tostudents`;

CREATE TABLE `assign_elective_subjects_tostudents` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pupilsightProgramID` int(3) NOT NULL,
  `pupilsightYearGroupID` int(3) unsigned NOT NULL,
  `ac_elective_group_id` int(11) DEFAULT NULL,
  `pupilsightDepartmentID` int(4) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table assignstaff_toclasssection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assignstaff_toclasssection`;

CREATE TABLE `assignstaff_toclasssection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightMappingID` int(11) NOT NULL,
  `pupilsightPersonID` int(11) NOT NULL,
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table assignstaff_tosubject
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assignstaff_tosubject`;

CREATE TABLE `assignstaff_tosubject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightStaffID` int(11) NOT NULL,
  `pupilsightdepartmentID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table assignstudent_tostaff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `assignstudent_tostaff`;

CREATE TABLE `assignstudent_tostaff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightStaffID` int(11) NOT NULL,
  `pupilsightPersonID` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



# Dump of table atlColumn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `atlColumn`;

CREATE TABLE `atlColumn` (
  `atlColumnID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightCourseClassID` int(8) unsigned NOT NULL,
  `groupingID` int(8) unsigned DEFAULT NULL COMMENT 'A value used to group multiple ATL columns.',
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `pupilsightRubricID` int(8) unsigned DEFAULT NULL,
  `complete` enum('N','Y') NOT NULL,
  `completeDate` date DEFAULT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `pupilsightPersonIDLastEdit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`atlColumnID`),
  KEY `pupilsightCourseClassID` (`pupilsightCourseClassID`),
  KEY `pupilsightRubricID` (`pupilsightRubricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table atlEntry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `atlEntry`;

CREATE TABLE `atlEntry` (
  `atlEntryID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `atlColumnID` int(10) unsigned NOT NULL,
  `pupilsightPersonIDStudent` int(10) unsigned NOT NULL,
  `complete` enum('Y','N') NOT NULL DEFAULT 'N',
  `pupilsightPersonIDLastEdit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`atlEntryID`),
  KEY `atlColumnID` (`atlColumnID`),
  KEY `pupilsightPersonIDStudent` (`pupilsightPersonIDStudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table attn_session_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attn_session_settings`;

CREATE TABLE `attn_session_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attn_settings_id` int(11) NOT NULL,
  `session_no` int(11) NOT NULL,
  `session_name` varchar(156) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table attn_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attn_settings`;

CREATE TABLE `attn_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) DEFAULT NULL,
  `pupilsightProgramID` int(11) NOT NULL,
  `pupilsightYearGroupID` varchar(50) DEFAULT NULL,
  `attn_type` tinyint(2) NOT NULL COMMENT '1: Session, 2: Subject',
  `enable_sms_absent` tinyint(2) DEFAULT NULL COMMENT '1: Enable',
  `sms_template_id` int(11) NOT NULL COMMENT 'From pupilsightTemplateForAttendance id',
  `sms_recipients` varchar(500) NOT NULL,
  `select_sub_mandatory` tinyint(2) DEFAULT NULL COMMENT '1:Enable',
  `display_field_1` varchar(156) DEFAULT NULL,
  `enable_sort_display_field_1` tinyint(2) DEFAULT NULL COMMENT '1: Enable',
  `display_field_2` varchar(156) DEFAULT NULL,
  `enable_sort_display_field_2` tinyint(2) DEFAULT NULL COMMENT '1: Enable',
  `default_display` varchar(156) DEFAULT NULL,
  `no_of_session` int(2) DEFAULT NULL,
  `lock_attendance_marking` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'lock_attendance_marking:1 enabled , 0 - disabled',
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  `auto_lock_attendance` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'auto_lock_attendance : 1 - enabled, 0 - disabled',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table badgesBadge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `badgesBadge`;

CREATE TABLE `badgesBadge` (
  `badgesBadgeID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logoLicense` text NOT NULL,
  `pupilsightPersonIDCreator` int(8) unsigned NOT NULL,
  `timestampCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `license` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`badgesBadgeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table badgesBadgeStudent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `badgesBadgeStudent`;

CREATE TABLE `badgesBadgeStudent` (
  `badgesBadgeStudentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `badgesBadgeID` int(8) unsigned NOT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `date` date NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`badgesBadgeStudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table campaign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign`;

CREATE TABLE `campaign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `academic_id` int(11) NOT NULL,
  `academic_year` varchar(256) NOT NULL,
  `pupilsightProgramID` int(11) NOT NULL,
  `classes` varchar(256) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT 'publish action{1 - draft | 2 - published | 3 - stoped}',
  `seats` int(10) unsigned DEFAULT NULL,
  `limit_apply_form` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `page_link` text,
  `page_for` tinyint(4) DEFAULT NULL COMMENT 'publish action{1 - public | 2 - private}',
  `cuid` bigint(20) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table campaign_email_sms_sent_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_email_sms_sent_details`;

CREATE TABLE `campaign_email_sms_sent_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) DEFAULT NULL,
  `submission_id` int(11) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `state_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `attachment` text,
  `pupilsightPersonID` int(11) NOT NULL,
  `cdt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table campaign_form_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_form_status`;

CREATE TABLE `campaign_form_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `submission_id` int(11) NOT NULL,
  `state` varchar(256) NOT NULL,
  `state_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '2' COMMENT '1: True, 2: False',
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table campaign_parent_registration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_parent_registration`;

CREATE TABLE `campaign_parent_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `pupilsightPersonID` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `mobile` varchar(256) NOT NULL,
  `cdt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table campaign_transitions_form_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `campaign_transitions_form_map`;

CREATE TABLE `campaign_transitions_form_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transition_id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `fluent_form_column_name` varchar(256) NOT NULL,
  `cuid` bigint(20) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table custom_field
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_field`;

CREATE TABLE `custom_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(256) NOT NULL,
  `field_title` varchar(256) DEFAULT NULL,
  `field_type` enum('varchar','text','date','url','dropdown','checkboxes','radioboxes','tab') DEFAULT NULL,
  `field_description` varchar(512) DEFAULT NULL,
  `options` text,
  `default_value` varchar(256) DEFAULT NULL,
  `table_name` varchar(256) DEFAULT '',
  `table_column_after` varchar(256) DEFAULT NULL,
  `modules` varchar(256) DEFAULT '',
  `tab` varchar(256) DEFAULT '',
  `search` enum('N','Y') DEFAULT 'N' COMMENT '{1 - no | 2 - yes}',
  `required` enum('N','Y') DEFAULT 'N' COMMENT '{1 - no | 2 - yes}',
  `isunique` enum('N','Y') DEFAULT 'N',
  `visibility` enum('N','Y') DEFAULT 'Y',
  `editable` enum('N','Y') DEFAULT 'Y',
  `parent_visible` enum('N','Y') DEFAULT 'Y',
  `parent_editable` enum('N','Y') DEFAULT 'Y',
  `active` enum('N','Y') DEFAULT 'Y',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

LOCK TABLES `custom_field` WRITE;
/*!40000 ALTER TABLE `custom_field` DISABLE KEYS */;

INSERT INTO `custom_field` (`id`, `field_name`, `field_title`, `field_type`, `field_description`, `options`, `default_value`, `table_name`, `table_column_after`, `modules`, `tab`, `search`, `required`, `isunique`, `visibility`, `editable`, `parent_visible`, `parent_editable`, `active`)
VALUES
	(1,'admission_no','Admission No','varchar',NULL,NULL,NULL,'pupilsightPerson','pincode','student','basic_information','N','Y','N','Y','Y','Y','Y','Y'),
	(2,'roll_no','Roll No','varchar','Roll No (Text Field)',NULL,NULL,'pupilsightPerson','school_list','student','basic_information','N','Y','N','Y','Y','Y','Y','Y');

/*!40000 ALTER TABLE `custom_field` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table custom_field_modal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `custom_field_modal`;

CREATE TABLE `custom_field_modal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(256) NOT NULL DEFAULT '',
  `table_tag` varchar(256) NOT NULL DEFAULT '',
  `page_view` text,
  `page_edit` text,
  `modules` varchar(256) DEFAULT '',
  `tabs` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `custom_field_modal` WRITE;
/*!40000 ALTER TABLE `custom_field_modal` DISABLE KEYS */;

INSERT INTO `custom_field_modal` (`id`, `table_name`, `table_tag`, `page_view`, `page_edit`, `modules`, `tabs`)
VALUES
	(1,'pupilsightPerson','Users','student_view_details.php,staff_view_details.php','user_manage_edit.php,student_edit.php,student_add.php,staff_manage_add.php,parent_edit.php','student,staff,father,mother','basic_information,system_access,contact_information,school_information,background_information');

/*!40000 ALTER TABLE `custom_field_modal` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table examinationGradeSystem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationGradeSystem`;

CREATE TABLE `examinationGradeSystem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `code` varchar(256) NOT NULL,
  `pass_fail_condition` enum('Marks','Grade') DEFAULT 'Marks',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationGradeSystemConfiguration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationGradeSystemConfiguration`;

CREATE TABLE `examinationGradeSystemConfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gradeSystemId` int(11) NOT NULL,
  `grade_name` varchar(100) NOT NULL,
  `grade_point` tinyint(4) DEFAULT NULL,
  `lower_limit` decimal(5,2) DEFAULT NULL,
  `upper_limit` decimal(5,2) DEFAULT NULL,
  `rank` tinyint(4) DEFAULT NULL,
  `subject_status` enum('Pass','Fail') DEFAULT NULL,
  `class_obtained` enum('Distinction','First Class','Poor','Second Class') DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationMarksEntrybySubject
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationMarksEntrybySubject`;

CREATE TABLE `examinationMarksEntrybySubject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `pupilsightYearGroupID` int(3) unsigned NOT NULL,
  `pupilsightRollGroupID` int(5) unsigned NOT NULL,
  `pupilsightDepartmentID` int(11) NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `skill_id` int(11) NOT NULL,
  `marks_obtained` decimal(4,2) NOT NULL,
  `marks_abex` varchar(10) DEFAULT NULL,
  `gradeId` int(11) unsigned NOT NULL,
  `remarks` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '{0-unlocked,1-locked}',
  `entrytype` tinyint(1) NOT NULL DEFAULT '1' COMMENT '{by student-1 | by subject-2}',
  `pupilsightPersonIDTaker` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationReportTemplateAttributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationReportTemplateAttributes`;

CREATE TABLE `examinationReportTemplateAttributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sketch_id` int(11) NOT NULL,
  `attribute_name` varchar(255) NOT NULL,
  `attribute_category` varchar(255) NOT NULL,
  `attribute_type` varchar(255) NOT NULL,
  `ertc_id` int(11) NOT NULL COMMENT 'examinationReportTemplateConfiguration  Id',
  `ert_id` int(11) NOT NULL COMMENT 'examination report template id',
  `test_master_id` int(11) DEFAULT NULL,
  `attr_ids` varchar(255) DEFAULT NULL,
  `final_formula` varchar(255) DEFAULT NULL,
  `formula` enum('Scale','Add','Multiply','Divide','Subtract') NOT NULL,
  `grade_id` int(11) DEFAULT NULL,
  `supported_attribute` int(11) DEFAULT NULL,
  `pos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationReportTemplateConfiguration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationReportTemplateConfiguration`;

CREATE TABLE `examinationReportTemplateConfiguration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_column` varchar(256) NOT NULL,
  `report_column_label` varchar(255) NOT NULL,
  `report_column_word` varchar(256) NOT NULL,
  `table_name` varchar(256) NOT NULL,
  `table_label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationReportTemplateFormula
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationReportTemplateFormula`;

CREATE TABLE `examinationReportTemplateFormula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationReportTemplateFormulaAttributeMapping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationReportTemplateFormulaAttributeMapping`;

CREATE TABLE `examinationReportTemplateFormulaAttributeMapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formula_id` int(11) NOT NULL COMMENT 'examinationReportTemplateFormula Id',
  `erta_id` int(11) NOT NULL COMMENT 'examinationReportTemplateAttributes Id',
  `formula_val` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationReportTemplateMaster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationReportTemplateMaster`;

CREATE TABLE `examinationReportTemplateMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `path` text NOT NULL,
  `filename` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationReportTemplatePlugin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationReportTemplatePlugin`;

CREATE TABLE `examinationReportTemplatePlugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationReportTemplatePluginAttributeMapping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationReportTemplatePluginAttributeMapping`;

CREATE TABLE `examinationReportTemplatePluginAttributeMapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(11) NOT NULL COMMENT 'examinationReportTemplatePlugin Id',
  `erta_id` int(11) NOT NULL COMMENT 'examinationReportTemplateAttributes Id',
  `plugin_val` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationReportTemplateSketch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationReportTemplateSketch`;

CREATE TABLE `examinationReportTemplateSketch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) NOT NULL,
  `pupilsightProgramID` int(3) NOT NULL,
  `class_ids` varchar(20) NOT NULL,
  `sketch_name` varchar(255) NOT NULL,
  `sketch_code` varchar(255) NOT NULL,
  `sketch_query` text,
  `template_path` text NOT NULL,
  `template_filename` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1: In acive, 2:Active',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationReportTemplateSketchData
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationReportTemplateSketchData`;

CREATE TABLE `examinationReportTemplateSketchData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sketch_id` int(11) NOT NULL,
  `pupilsightPersonID` int(11) NOT NULL,
  `ertc_id` int(11) DEFAULT NULL COMMENT 'examinationReportTemplateConfiguration  Id',
  `erta_id` int(11) DEFAULT NULL COMMENT 'examination report template Attribute id',
  `attribute_name` varchar(255) DEFAULT NULL,
  `attribute_subject_name` varchar(255) DEFAULT NULL,
  `attribute_value` varchar(256) DEFAULT NULL,
  `attribute_type` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationRoomMaster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationRoomMaster`;

CREATE TABLE `examinationRoomMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `code` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationSubjectToTest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationSubjectToTest`;

CREATE TABLE `examinationSubjectToTest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `pupilsightDepartmentID` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `skill_configure` varchar(256) DEFAULT NULL,
  `skill_weightage_formula` varchar(256) DEFAULT NULL,
  `is_tested` tinyint(1) NOT NULL DEFAULT '0',
  `assesment_method` enum('Marks','Grade') NOT NULL,
  `assesment_option` enum('Radio Button','Dropdown') NOT NULL,
  `max_marks` decimal(5,2) NOT NULL,
  `min_marks` decimal(5,2) NOT NULL,
  `enable_remarks` tinyint(1) NOT NULL DEFAULT '0',
  `gradeSystemId` int(11) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_start_time` time NOT NULL,
  `exam_end_time` time NOT NULL,
  `room_id` int(11) NOT NULL COMMENT 'Room Id',
  `invigilator_id` int(11) NOT NULL COMMENT 'Staff Id',
  `aat` tinyint(1) NOT NULL DEFAULT '0',
  `aat_calcutaion_by` enum('Sum','Average') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationSubjectToTestSkillConfigure
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationSubjectToTestSkillConfigure`;

CREATE TABLE `examinationSubjectToTestSkillConfigure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `examinationSubjectToTestID` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `skill_weightage` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationTest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationTest`;

CREATE TABLE `examinationTest` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_master_id` int(11) NOT NULL,
  `pupilsightSchoolYearID` int(3) NOT NULL,
  `name` varchar(256) NOT NULL,
  `code` varchar(256) NOT NULL,
  `pupilsightSchoolYearTermID` int(5) DEFAULT NULL,
  `subject_type` tinyint(4) DEFAULT NULL COMMENT '{1 - All Subject | 2 - Subject Category}',
  `assesment_method` enum('Marks','Grade') DEFAULT NULL,
  `assesment_option` enum('Radio Button','Dropdown') DEFAULT NULL,
  `max_marks` decimal(5,2) DEFAULT NULL,
  `min_marks` decimal(5,2) DEFAULT NULL,
  `gradeSystemId` int(11) DEFAULT NULL,
  `report_template_id` int(11) DEFAULT NULL,
  `sketch_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `enable_remarks` tinyint(1) DEFAULT '0',
  `enable_schedule` tinyint(1) DEFAULT '0',
  `enable_marks_entry` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Enable',
  `enable_descriptive_entry` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Enable',
  `lock_marks_entry` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Lock, 0:Unlock',
  `enable_publish` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Enable',
  `enable_pdf` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Enable',
  `enable_html` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Enable',
  `enable_test_report` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Enable',
  `enable_sms` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Enable',
  `enable_email` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Enable',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table examinationTestAssignClass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationTestAssignClass`;

CREATE TABLE `examinationTestAssignClass` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_master_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `pupilsightProgramID` int(11) NOT NULL,
  `pupilsightYearGroupID` int(11) NOT NULL,
  `pupilsightRollGroupID` text,
  `pupilsightSchoolYearID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationTestMaster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationTestMaster`;

CREATE TABLE `examinationTestMaster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `code` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table examinationTestSubjectCategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `examinationTestSubjectCategory`;

CREATE TABLE `examinationTestSubjectCategory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_master_id` int(11) NOT NULL,
  `test_id` int(11) DEFAULT NULL,
  `subject_type` varchar(256) NOT NULL,
  `subject_type_id` int(11) DEFAULT NULL,
  `assesment_method` enum('Marks','Grade') DEFAULT NULL,
  `assesment_option` enum('Radio Button','Dropdown') DEFAULT NULL,
  `max_marks` decimal(5,2) DEFAULT NULL,
  `min_marks` decimal(5,2) DEFAULT NULL,
  `gradeSystemId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fee_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fee_category`;

CREATE TABLE `fee_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'status: 1 - active ,0-Inactive',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_admission_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_admission_settings`;

CREATE TABLE `fn_fee_admission_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(11) NOT NULL,
  `pupilsightProgramID` int(11) NOT NULL,
  `fn_fee_structure_id` int(11) NOT NULL,
  `classes` varchar(256) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table fn_fee_discount_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_discount_item`;

CREATE TABLE `fn_fee_discount_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fn_fees_discount_id` bigint(20) NOT NULL,
  `fees_discount_type` tinyint(4) NOT NULL,
  `fn_fee_item_id` int(6) unsigned DEFAULT NULL,
  `item_type` varchar(16) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `min_invoice` int(11) DEFAULT NULL,
  `max_invoice` int(11) DEFAULT NULL,
  `amount_in_percent` decimal(5,2) DEFAULT NULL,
  `amount_in_number` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_invoice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_invoice`;

CREATE TABLE `fn_fee_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` varchar(256) DEFAULT NULL,
  `fn_fee_structure_id` int(11) DEFAULT NULL,
  `transport_schedule_id` int(11) DEFAULT NULL,
  `pupilsightSchoolYearID` int(11) DEFAULT NULL,
  `pupilsightSchoolFinanceYearID` int(11) DEFAULT NULL,
  `title` varchar(128) NOT NULL,
  `fn_fees_head_id` int(11) NOT NULL,
  `inv_fn_fee_series_id` int(11) NOT NULL,
  `rec_fn_fee_series_id` int(11) NOT NULL,
  `due_date` date DEFAULT NULL,
  `amount_editable` tinyint(1) NOT NULL DEFAULT '0',
  `display_fee_item` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1: Show, 2: Hide',
  `fn_fees_fine_rule_id` int(11) DEFAULT NULL,
  `fn_fees_discount_id` int(11) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1: Active, 2: Cancel',
  `reason_for_cancel` text,
  `fee_structure_delete_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1: No Delete, 2: Delete',
  `cancel_user_id` int(11) DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_invoice_applicant_assign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_invoice_applicant_assign`;

CREATE TABLE `fn_fee_invoice_applicant_assign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) NOT NULL,
  `fn_fee_invoice_id` int(11) NOT NULL,
  `invoice_no` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_invoice_class_assign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_invoice_class_assign`;

CREATE TABLE `fn_fee_invoice_class_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fn_fee_invoice_id` int(11) NOT NULL,
  `pupilsightProgramID` int(11) NOT NULL,
  `pupilsightYearGroupID` int(11) NOT NULL COMMENT 'class id',
  `pupilsightRollGroupID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_invoice_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_invoice_item`;

CREATE TABLE `fn_fee_invoice_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fn_fee_invoice_id` int(11) NOT NULL,
  `fn_fee_item_id` int(11) DEFAULT NULL,
  `transport_route_id` int(11) DEFAULT NULL,
  `transport_stop_id` int(11) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `amount` decimal(12,2) DEFAULT NULL,
  `tax` decimal(5,2) DEFAULT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `total_amount` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table fn_fee_invoice_student_assign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_invoice_student_assign`;

CREATE TABLE `fn_fee_invoice_student_assign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(11) NOT NULL,
  `fn_fee_invoice_id` int(11) NOT NULL,
  `fn_fee_structure_id` int(11) DEFAULT NULL,
  `invoice_no` varchar(256) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1: Active, 2: InActive',
  `reason_for_cancel` text,
  `invoice_status` varchar(255) DEFAULT 'Not Paid',
  `cancel_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_item_level_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_item_level_discount`;

CREATE TABLE `fn_fee_item_level_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `discount` varchar(11) NOT NULL,
  `discount_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'discount type : 0 - amount in rupees,1 - amount in percentage',
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_item_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_item_map`;

CREATE TABLE `fn_fee_item_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fn_fee_item_id` int(11) NOT NULL,
  `fn_fee_structure_id` int(11) NOT NULL,
  `amount` decimal(11,3) NOT NULL,
  `tax` varchar(1) NOT NULL COMMENT '{y - n}',
  `tax_percentage` decimal(4,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_item_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_item_type`;

CREATE TABLE `fn_fee_item_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_items`;

CREATE TABLE `fn_fee_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `pupilsightSchoolYearID` int(3) NOT NULL,
  `fn_fee_item_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_payment_gateway
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_payment_gateway`;

CREATE TABLE `fn_fee_payment_gateway` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `mid` text,
  `key_id` text,
  `key_secret` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_series
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_series`;

CREATE TABLE `fn_fee_series` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `series_name` varchar(256) NOT NULL,
  `description` varchar(512) NOT NULL,
  `format` varchar(256) NOT NULL,
  `formatval` varchar(256) NOT NULL,
  `start_number` varchar(128) DEFAULT NULL COMMENT 'auto increment number',
  `no_of_digit` int(11) DEFAULT NULL,
  `start_char` varchar(128) DEFAULT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='fees series';



# Dump of table fn_fee_series_number_format
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_series_number_format`;

CREATE TABLE `fn_fee_series_number_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fn_fee_series_id` bigint(20) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `order_wise` int(11) DEFAULT NULL,
  `start_number` varchar(128) DEFAULT NULL,
  `no_of_digit` int(11) DEFAULT NULL,
  `last_no` varchar(128) DEFAULT NULL,
  `start_char` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table fn_fee_structure
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_structure`;

CREATE TABLE `fn_fee_structure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `invoice_title` varchar(256) NOT NULL,
  `pupilsightSchoolYearID` int(11) NOT NULL,
  `pupilsightSchoolFinanceYearID` int(11) NOT NULL,
  `fn_fees_head_id` int(11) NOT NULL,
  `inv_fee_series_id` int(11) NOT NULL,
  `recp_fee_series_id` int(11) DEFAULT NULL,
  `fn_fees_fine_rule_id` int(11) NOT NULL,
  `fn_fees_discount_id` int(11) NOT NULL,
  `due_date` date DEFAULT NULL,
  `amount_editable` tinyint(4) NOT NULL DEFAULT '0',
  `display_fee_item` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1: Show, 2: Hide',
  `seq_installment_NO` int(50) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fee_structure_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fee_structure_item`;

CREATE TABLE `fn_fee_structure_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fn_fee_structure_id` int(11) NOT NULL,
  `fn_fee_item_id` int(6) unsigned DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT NULL,
  `tax` varchar(1) NOT NULL DEFAULT 'N',
  `tax_percent` decimal(4,2) DEFAULT NULL,
  `total_amount` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_applicant_collection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_applicant_collection`;

CREATE TABLE `fn_fees_applicant_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) NOT NULL,
  `transaction_id` bigint(20) NOT NULL,
  `fn_fees_invoice_id` int(11) NOT NULL,
  `fn_fee_invoice_item_id` int(11) NOT NULL,
  `invoice_no` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table fn_fees_cancel_collection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_cancel_collection`;

CREATE TABLE `fn_fees_cancel_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fn_fees_collection_id` int(11) NOT NULL,
  `canceled_by` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `cdt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table fn_fees_class_assign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_class_assign`;

CREATE TABLE `fn_fees_class_assign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fn_fee_structure_id` int(11) NOT NULL,
  `pupilsightProgramID` int(11) NOT NULL,
  `pupilsightYearGroupID` int(11) NOT NULL COMMENT 'class id',
  `pupilsightRollGroupID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_collection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_collection`;

CREATE TABLE `fn_fees_collection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint(20) unsigned NOT NULL,
  `fn_fees_invoice_id` int(10) unsigned DEFAULT NULL,
  `pupilsightPersonID` int(10) unsigned DEFAULT NULL,
  `submission_id` int(11) DEFAULT NULL,
  `pupilsightSchoolYearID` int(3) NOT NULL,
  `fn_fees_counter_id` int(11) DEFAULT NULL,
  `receipt_number` varchar(128) NOT NULL,
  `is_custom` int(11) DEFAULT NULL COMMENT 'cehck is custom reciept',
  `pay_gateway_id` varchar(128) DEFAULT NULL,
  `payment_mode_id` int(10) unsigned DEFAULT NULL COMMENT 'fn master id',
  `bank_id` int(10) unsigned DEFAULT NULL COMMENT 'fn master id',
  `dd_cheque_no` varchar(128) DEFAULT NULL,
  `dd_cheque_date` date DEFAULT NULL,
  `dd_cheque_amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(128) DEFAULT NULL COMMENT 'fn master id',
  `payment_status_up_date` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `fn_fees_head_id` int(10) unsigned DEFAULT NULL COMMENT 'account head',
  `fn_fees_receipt_series_id` int(10) unsigned DEFAULT NULL COMMENT 'receipt series',
  `transcation_amount` decimal(10,2) NOT NULL,
  `total_amount_without_fine_discount` decimal(10,2) NOT NULL,
  `amount_paying` decimal(10,2) NOT NULL,
  `fine` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '{1 - active | 2 - cancel}',
  `transaction_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Status action{1 - Complete | 2 - Cancel | 3 - Refund}',
  `cdt` datetime DEFAULT NULL,
  `udt` datetime DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `reference_date` date NOT NULL,
  `instrument_no` varchar(255) DEFAULT NULL,
  `instrument_date` date DEFAULT NULL,
  `invoice_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Fees Collection';



# Dump of table fn_fees_collection_deposit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_collection_deposit`;

CREATE TABLE `fn_fees_collection_deposit` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(11) NOT NULL,
  `pupilsightSchoolYearID` int(3) NOT NULL,
  `deposit` decimal(10,2) DEFAULT NULL,
  `cdt` datetime DEFAULT NULL,
  `udt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_collection_refund
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_collection_refund`;

CREATE TABLE `fn_fees_collection_refund` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fn_fees_collection_id` int(11) NOT NULL,
  `transaction_id` bigint(20) unsigned NOT NULL,
  `fn_fees_invoice_id` int(10) unsigned DEFAULT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `receipt_number` varchar(128) NOT NULL,
  `payment_mode_id` int(10) unsigned NOT NULL COMMENT 'fn master id',
  `bank_id` int(10) unsigned NOT NULL COMMENT 'fn master id',
  `dd_cheque_no` varchar(128) DEFAULT NULL,
  `dd_cheque_date` date DEFAULT NULL,
  `dd_cheque_amount` decimal(10,2) DEFAULT NULL,
  `refund_date` date DEFAULT NULL,
  `refund_receipt_series_id` int(10) unsigned DEFAULT NULL COMMENT 'receipt series',
  `refund_receipt_number` varchar(128) DEFAULT NULL,
  `refund_amount` decimal(10,2) NOT NULL,
  `refund_by` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `cdt` datetime DEFAULT NULL,
  `udt` datetime DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `reference_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Fees Collection';



# Dump of table fn_fees_counter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_counter`;

CREATE TABLE `fn_fees_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(128) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '{1 - active | 2 - inactive}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_counter_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_counter_map`;

CREATE TABLE `fn_fees_counter_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fn_fees_counter_id` int(11) NOT NULL,
  `pupilsightPersonID` int(11) NOT NULL,
  `active_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_deposit_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_deposit_account`;

CREATE TABLE `fn_fees_deposit_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fn_fee_item_id` int(11) DEFAULT NULL,
  `ac_name` varchar(128) NOT NULL,
  `ac_code` varchar(128) NOT NULL,
  `overpayment_account` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_discount`;

CREATE TABLE `fn_fees_discount` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `pupilsightSchoolYearID` int(3) NOT NULL,
  `description` text,
  `fees_discount_type` tinyint(4) DEFAULT NULL COMMENT '{1-category | 2 - invoice}',
  `fn_fees_discount_category_ids` varchar(512) DEFAULT NULL,
  `cdt` datetime DEFAULT NULL,
  `udt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_discount_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_discount_category`;

CREATE TABLE `fn_fees_discount_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_discount_invoice_count
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_discount_invoice_count`;

CREATE TABLE `fn_fees_discount_invoice_count` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `min_invoice` int(11) NOT NULL,
  `max_invoice` int(11) NOT NULL,
  `amount_in_percent` decimal(4,2) NOT NULL,
  `amount_in_number` decimal(11,3) NOT NULL,
  `fn_fee_item_id` int(3) NOT NULL,
  `fn_fees_discount_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_fine_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_fine_rule`;

CREATE TABLE `fn_fees_fine_rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `code` varchar(256) NOT NULL,
  `description` text,
  `fine_type` tinyint(4) DEFAULT NULL COMMENT '{1 - fixed | 2 - daily | 3 - day}',
  `rule_type` tinyint(4) NOT NULL,
  `is_fine_editable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Enable',
  `cdt` datetime DEFAULT NULL,
  `udt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_head
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_head`;

CREATE TABLE `fn_fees_head` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) NOT NULL,
  `name` varchar(256) NOT NULL,
  `account_code` varchar(256) NOT NULL,
  `description` varchar(512) NOT NULL,
  `bank_name` varchar(256) NOT NULL,
  `ac_no` varchar(128) NOT NULL,
  `inv_fee_series_id` bigint(20) NOT NULL,
  `recp_fee_series_id` bigint(20) NOT NULL,
  `recp_fee_series_online_pay` bigint(20) NOT NULL,
  `refund_fee_series_online_pay` bigint(20) NOT NULL,
  `payment_gateway` varchar(1) NOT NULL COMMENT '{y | n}',
  `payment_gateway_id` int(11) NOT NULL,
  `invoice_template` varchar(256) DEFAULT NULL,
  `receipt_template` varchar(256) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_code` (`account_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_receipt_template_master
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_receipt_template_master`;

CREATE TABLE `fn_fees_receipt_template_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `path` text NOT NULL,
  `filename` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table fn_fees_rule_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_rule_type`;

CREATE TABLE `fn_fees_rule_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fn_fees_fine_rule_id` bigint(20) NOT NULL,
  `fine_type` tinyint(4) DEFAULT NULL COMMENT '{1 - fixed | 2 - daily | 3 - day}',
  `rule_type` tinyint(4) DEFAULT NULL,
  `amount_type` varchar(16) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `amount_in_percent` decimal(4,2) DEFAULT NULL,
  `amount_in_number` decimal(11,2) DEFAULT NULL,
  `from_day` int(10) unsigned DEFAULT NULL,
  `to_day` int(10) unsigned DEFAULT NULL,
  `ignore_holiday` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_student_assign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_student_assign`;

CREATE TABLE `fn_fees_student_assign` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(11) NOT NULL,
  `fn_fee_structure_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_fees_student_collection
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_fees_student_collection`;

CREATE TABLE `fn_fees_student_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(11) NOT NULL,
  `transaction_id` bigint(20) NOT NULL,
  `fn_fees_invoice_id` int(11) NOT NULL,
  `fn_fee_invoice_item_id` int(11) NOT NULL,
  `invoice_no` varchar(256) NOT NULL,
  `total_amount` decimal(12,3) DEFAULT NULL,
  `total_amount_collection` decimal(12,3) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1: Paid, 2: Partial Paid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table fn_invoice_level_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_invoice_level_discount`;

CREATE TABLE `fn_invoice_level_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `discount` varchar(11) NOT NULL DEFAULT '0',
  `discount_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'discount type : 0 -  amount in Rupee,1 - amount in percentage',
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_masters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_masters`;

CREATE TABLE `fn_masters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `type` varchar(128) NOT NULL COMMENT '{payment_mode | bank}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='payment mode and bank masters';



# Dump of table fn_multi_payment_mode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_multi_payment_mode`;

CREATE TABLE `fn_multi_payment_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(50) NOT NULL,
  `payment_mode_id` varchar(11) NOT NULL,
  `credit_id` varchar(11) NOT NULL,
  `bank_id` varchar(11) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `reference_no` varchar(50) NOT NULL,
  `instrument_date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table fn_refund
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fn_refund`;

CREATE TABLE `fn_refund` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `payment_mode_id` bigint(20) unsigned NOT NULL COMMENT 'fn_master_id',
  `transcation_id` bigint(20) unsigned NOT NULL,
  `bank_id` int(11) NOT NULL,
  `dd_cheque_no` varchar(128) DEFAULT NULL,
  `dd_cheque_date` date DEFAULT NULL,
  `dd_cheque_amount` decimal(10,0) DEFAULT NULL,
  `fn_fees_series_id` int(10) unsigned NOT NULL,
  `refund_date` date NOT NULL,
  `refund_amount` decimal(10,2) NOT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='refund';



# Dump of table helpDeskIssue
# ------------------------------------------------------------

DROP TABLE IF EXISTS `helpDeskIssue`;

CREATE TABLE `helpDeskIssue` (
  `issueID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `technicianID` int(4) unsigned DEFAULT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `issueName` varchar(55) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `status` enum('Unassigned','Pending','Resolved') DEFAULT 'Unassigned',
  `category` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `createdByID` int(12) unsigned NOT NULL,
  `privacySetting` enum('Everyone','Related','Owner','No one') DEFAULT 'Everyone',
  PRIMARY KEY (`issueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table helpDeskIssueDiscuss
# ------------------------------------------------------------

DROP TABLE IF EXISTS `helpDeskIssueDiscuss`;

CREATE TABLE `helpDeskIssueDiscuss` (
  `issueDiscussID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `issueID` int(12) unsigned NOT NULL,
  `comment` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`issueDiscussID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table helpDeskTechGroups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `helpDeskTechGroups`;

CREATE TABLE `helpDeskTechGroups` (
  `groupID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `groupName` varchar(55) NOT NULL,
  `viewIssue` tinyint(1) DEFAULT '1',
  `viewIssueStatus` enum('All','UP','PR','Pending') DEFAULT 'All',
  `assignIssue` tinyint(1) DEFAULT '0',
  `acceptIssue` tinyint(1) DEFAULT '1',
  `resolveIssue` tinyint(1) DEFAULT '1',
  `createIssueForOther` tinyint(1) DEFAULT '1',
  `fullAccess` tinyint(1) DEFAULT '0',
  `reassignIssue` tinyint(1) DEFAULT '0',
  `reincarnateIssue` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table helpDeskTechnicians
# ------------------------------------------------------------

DROP TABLE IF EXISTS `helpDeskTechnicians`;

CREATE TABLE `helpDeskTechnicians` (
  `technicianID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `groupID` int(4) unsigned NOT NULL,
  PRIMARY KEY (`technicianID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table higherEducationApplication
# ------------------------------------------------------------

DROP TABLE IF EXISTS `higherEducationApplication`;

CREATE TABLE `higherEducationApplication` (
  `higherEducationApplicationID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `applying` enum('Y','N') NOT NULL DEFAULT 'Y',
  `otherScores` text,
  `careerInterests` text,
  `coursesMajors` text,
  `personalStatement` text NOT NULL,
  `meetingNotes` text NOT NULL,
  PRIMARY KEY (`higherEducationApplicationID`),
  UNIQUE KEY `pupilsightPersonID` (`pupilsightPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table higherEducationApplicationInstitution
# ------------------------------------------------------------

DROP TABLE IF EXISTS `higherEducationApplicationInstitution`;

CREATE TABLE `higherEducationApplicationInstitution` (
  `higherEducationApplicationInstitutionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `higherEducationApplicationID` int(8) unsigned NOT NULL,
  `higherEducationInstitutionID` int(6) unsigned NOT NULL,
  `higherEducationMajorID` int(6) unsigned NOT NULL,
  `scholarship` text,
  `applicationNumber` varchar(50) DEFAULT '',
  `rank` varchar(10) DEFAULT '',
  `rating` varchar(100) DEFAULT '',
  `status` varchar(100) DEFAULT '',
  `question` text,
  `answer` text,
  `offer` enum('','First Choice','Backup','Y','N') NOT NULL DEFAULT '',
  `offerDetails` text,
  PRIMARY KEY (`higherEducationApplicationInstitutionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table higherEducationInstitution
# ------------------------------------------------------------

DROP TABLE IF EXISTS `higherEducationInstitution`;

CREATE TABLE `higherEducationInstitution` (
  `higherEducationInstitutionID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL DEFAULT '',
  `country` varchar(80) NOT NULL DEFAULT '',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`higherEducationInstitutionID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table higherEducationMajor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `higherEducationMajor`;

CREATE TABLE `higherEducationMajor` (
  `higherEducationMajorID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`higherEducationMajorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table higherEducationReference
# ------------------------------------------------------------

DROP TABLE IF EXISTS `higherEducationReference`;

CREATE TABLE `higherEducationReference` (
  `higherEducationReferenceID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `type` enum('Composite Reference','US Reference','') NOT NULL,
  `status` enum('Pending','In Progress','Complete','Cancelled') NOT NULL,
  `statusNotes` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `alertsSent` enum('N','Y') NOT NULL DEFAULT 'N',
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`higherEducationReferenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table higherEducationReferenceComponent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `higherEducationReferenceComponent`;

CREATE TABLE `higherEducationReferenceComponent` (
  `higherEducationReferenceComponentID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `higherEducationReferenceID` int(12) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL COMMENT 'Referee',
  `status` enum('Pending','In Progress','Complete') NOT NULL,
  `type` enum('General','Academic','Pastoral','Other') NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`higherEducationReferenceComponentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table higherEducationStaff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `higherEducationStaff`;

CREATE TABLE `higherEducationStaff` (
  `higherEducationStaffID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `role` enum('Coordinator','Advisor') NOT NULL,
  PRIMARY KEY (`higherEducationStaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table higherEducationStudent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `higherEducationStudent`;

CREATE TABLE `higherEducationStudent` (
  `higherEducationStudentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `pupilsightPersonIDAdvisor` int(10) unsigned DEFAULT NULL,
  `referenceNotes` text NOT NULL,
  PRIMARY KEY (`higherEducationStudentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table history_of_students_marks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `history_of_students_marks`;

CREATE TABLE `history_of_students_marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `pupilsightYearGroupID` int(11) NOT NULL,
  `pupilsightRollGroupID` int(5) unsigned NOT NULL,
  `pupilsightDepartmentID` int(11) NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `skill_id` int(11) NOT NULL,
  `marks_obtained` decimal(5,2) NOT NULL,
  `marks_abex` varchar(10) DEFAULT NULL,
  `remark` varchar(500) NOT NULL,
  `gradeId` int(11) NOT NULL,
  `pupilsightPersonIDTaker` int(10) unsigned NOT NULL,
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table history_of_subject_marks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `history_of_subject_marks`;

CREATE TABLE `history_of_subject_marks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `pupilsightRollGroupID` int(5) unsigned NOT NULL,
  `pupilsightDepartmentID` int(11) NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `skill_id` int(11) NOT NULL,
  `marks_obtained` decimal(5,2) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `gradeId` int(11) NOT NULL,
  `pupilsightPersonIDTaker` int(10) unsigned NOT NULL,
  `added_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table message_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message_category`;

CREATE TABLE `message_category` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table moodlecourse
# ------------------------------------------------------------

DROP VIEW IF EXISTS `moodlecourse`;

CREATE TABLE `moodlecourse` (
   `pupilsightCourseID` INT(8) UNSIGNED NOT NULL DEFAULT '0',
   `pupilsightSchoolYearID` INT(3) UNSIGNED NOT NULL,
   `pupilsightDepartmentID` INT(4) UNSIGNED NULL DEFAULT NULL,
   `name` VARCHAR(60) NOT NULL,
   `nameShort` VARCHAR(12) NOT NULL,
   `description` TEXT NOT NULL,
   `map` ENUM('Y','N') NOT NULL DEFAULT 'Y',
   `pupilsightYearGroupIDList` VARCHAR(255) NOT NULL,
   `orderBy` INT(3) NOT NULL
) ENGINE=MyISAM;



# Dump of table moodleenrolment
# ------------------------------------------------------------

DROP VIEW IF EXISTS `moodleenrolment`;

CREATE TABLE `moodleenrolment` (
   `pupilsightCourseID` INT(8) UNSIGNED NOT NULL DEFAULT '0',
   `name` VARCHAR(60) NOT NULL,
   `username` VARCHAR(255) NULL DEFAULT NULL,
   `role` ENUM('Student','Teacher','Assistant','Technician','Parent','Student - Left','Teacher - Left') NOT NULL
) ENGINE=MyISAM;



# Dump of table moodleuser
# ------------------------------------------------------------

DROP VIEW IF EXISTS `moodleuser`;

CREATE TABLE `moodleuser` (
   `username` VARCHAR(255) NULL DEFAULT NULL,
   `preferredName` VARCHAR(255) NOT NULL DEFAULT '',
   `surname` VARCHAR(255) NULL DEFAULT NULL,
   `email` VARCHAR(255) NULL DEFAULT NULL,
   `password` VARCHAR(255) NULL DEFAULT NULL,
   `website` VARCHAR(255) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table pupilsight_cms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsight_cms`;

CREATE TABLE `pupilsight_cms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cms_name` varchar(255) NOT NULL,
  `cms_description` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `cms_banner_title` varchar(255) NOT NULL,
  `cms_banner_short_description` text NOT NULL,
  `cms_banner_image` varchar(255) NOT NULL,
  `cms_banner_image_path` text NOT NULL,
  `logo_title` varchar(255) NOT NULL,
  `logo_image` varchar(255) NOT NULL,
  `logo_image_path` varchar(255) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `fax` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `primary_email` varchar(100) NOT NULL,
  `secondary_email` varchar(100) NOT NULL,
  `total_student` varchar(255) NOT NULL,
  `total_course` varchar(255) NOT NULL,
  `total_hours_video` varchar(255) NOT NULL,
  `course_status` tinyint(4) NOT NULL DEFAULT '1',
  `announcement_status` tinyint(4) NOT NULL DEFAULT '1',
  `experience_status` tinyint(4) NOT NULL DEFAULT '1',
  `aboutus_status` tinyint(4) NOT NULL DEFAULT '1',
  `events_status` tinyint(4) NOT NULL DEFAULT '1',
  `comments_status` tinyint(4) NOT NULL DEFAULT '1',
  `contact_status` tinyint(4) NOT NULL DEFAULT '1',
  `facebook_link` varchar(255) NOT NULL,
  `twitter_link` varchar(255) NOT NULL,
  `pinterest_link` varchar(255) NOT NULL,
  `linkdlin_link` varchar(255) NOT NULL,
  `comment_image` varchar(255) NOT NULL,
  `comment_image_path` text NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `contact_map` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `pupilsight_cms` WRITE;
/*!40000 ALTER TABLE `pupilsight_cms` DISABLE KEYS */;

INSERT INTO `pupilsight_cms` (`id`, `cms_name`, `cms_description`, `title`, `cms_banner_title`, `cms_banner_short_description`, `cms_banner_image`, `cms_banner_image_path`, `logo_title`, `logo_image`, `logo_image_path`, `phone`, `fax`, `address`, `primary_email`, `secondary_email`, `total_student`, `total_course`, `total_hours_video`, `course_status`, `announcement_status`, `experience_status`, `aboutus_status`, `events_status`, `comments_status`, `contact_status`, `facebook_link`, `twitter_link`, `pinterest_link`, `linkdlin_link`, `comment_image`, `comment_image_path`, `status`, `contact_map`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'','','Christ Academy','Welcome to Christ Academy','Christ Academy School aims a tradition of excellence','1597913371_ChirstAcademy.jpg','../images/banner/1597913371_ChirstAcademy.jpg','','1599653420_Christ.png','../images/logo/1599653420_Christ.png','9353400141','+91786787899','','bikash0389@gmail.com','bikash@thoughtnet.in','2000','850','6290',1,1,1,1,1,1,1,'','','','','1574139826_bg-22-1.jpg','../images/upload/1574139826_bg-22-1.jpg','1','&lt;div class=&quot;mapouter&quot;&gt;&lt;div class=&quot;gmap_canvas&quot;&gt;&lt;iframe width=&quot;600&quot; height=&quot;500&quot; id=&quot;gmap_canvas&quot; src=&quot;https://maps.google.com/maps?q=christ%20academy&amp;t=&amp;z=13&amp;ie=UTF8&amp;iwloc=&amp;output=embed&quot; frameborder=&quot;0&quot; scrolling=&quot;no&quot; marginheight=&quot;0&quot; marginwidth=&quot;0&quot;&gt;&lt;/iframe&gt;&lt;a href=&quot;https://putlocker-is.org&quot;&gt;put locker movie&lt;/a&gt;&lt;/div&gt;&lt;style&gt;.mapouter{position:relative;text-align:right;height:500px;width:600px;}.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:600px;}&lt;/style&gt;&lt;/div&gt;','2019-11-13 17:25:48',NULL,NULL);

/*!40000 ALTER TABLE `pupilsight_cms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsight_cms_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsight_cms_message`;

CREATE TABLE `pupilsight_cms_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table pupilsight_cms_sections
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsight_cms_sections`;

CREATE TABLE `pupilsight_cms_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT '',
  `image_path` text,
  `sorting_order` int(11) NOT NULL DEFAULT '1',
  `link` text,
  `date` varchar(100) DEFAULT '',
  `time` varchar(100) DEFAULT '',
  `venue` varchar(255) DEFAULT '',
  `slot` varchar(100) DEFAULT '',
  `price` varchar(255) DEFAULT '',
  `person_name` varchar(255) DEFAULT '',
  `person_designation` varchar(255) DEFAULT '',
  `person_address` varchar(255) DEFAULT '',
  `person_image` varchar(255) DEFAULT '',
  `person_image_path` text,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `pupilsight_cms_sections` WRITE;
/*!40000 ALTER TABLE `pupilsight_cms_sections` DISABLE KEYS */;

INSERT INTO `pupilsight_cms_sections` (`id`, `theme_id`, `type`, `title`, `short_description`, `description`, `image`, `image_path`, `sorting_order`, `link`, `date`, `time`, `venue`, `slot`, `price`, `person_name`, `person_designation`, `person_address`, `person_image`, `person_image_path`, `status`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(9,0,'6','ABOUT ','Demo Group of Institutes','Demo Group is an established education provider and entrepreneurship incubator in India','1573726080_bg-18.jpg','../images/upload/1573726080_bg-18.jpg',0,'','','00:00:00','','','','','','','','','1','2019-11-14 15:38:00',NULL,NULL),
	(11,0,'4','CHAIRMAN\'S MESSAGE','Few things have greater importance to parents than the education of their children. They look for academic excellence, good values, and discipline for their children. Choosing the right school for them is therefore a crucial decision.','','1574137742_Untitled-2-426x426.jpg','../images/upload/1574137742_Untitled-2-426x426.jpg',1,'','','','','','','','','','','','1','2019-11-14 17:41:38',NULL,NULL),
	(14,0,'2','Music Education','Conscious Discipline Institute ','','1573794501_event-02.jpg','../images/upload/1573794501_event-02.jpg',1,'','','00:00:00','','','','','','','','','1','2019-11-15 10:38:21',NULL,NULL),
	(15,0,'2','Marketing','Conscious Discipline Institute','','1573794540_collection-3-300x205.png','../images/upload/1573794540_collection-3-300x205.png',2,'','','00:00:00','','','','','','','','','1','2019-11-15 10:39:00',NULL,NULL),
	(16,0,'2','Entrepreneurship','Conscious Discipline Institute','','1573794579_collection-4-300x205.png','../images/upload/1573794579_collection-4-300x205.png',3,'','','00:00:00','','','','','','','','','1','2019-11-15 10:39:39',NULL,NULL),
	(17,0,'2','Business Administration','Education University Technology','','1573794626_collection-image-02.png','../images/upload/1573794626_collection-image-02.png',4,'','','00:00:00','','','','','','','','','1','2019-11-15 10:40:26',NULL,NULL),
	(18,0,'2','Computer Science','Education University Technology','','1573794657_event-01.jpg','../images/upload/1573794657_event-01.jpg',5,'','','00:00:00','','','','','','','','','1','2019-11-15 10:40:57',NULL,NULL),
	(19,0,'3','The registration for admission to Montessori, KG I and classes 2 to 9 closed.','','','1574079204_Untitled-18-450x300 (1).jpg','../images/upload/1574079204_Untitled-18-450x300 (1).jpg',1,'','','00:00:00','','','','','','','','','1','2019-11-15 11:28:31',NULL,NULL),
	(20,0,'3','Online applications for Grade 11','','','1574079217_Untitled-19-450x300 (1).jpg','../images/upload/1574079217_Untitled-19-450x300 (1).jpg',2,'','','00:00:00','','','','','','','','','1','2019-11-15 11:29:40',NULL,NULL),
	(28,0,'7','KG DIWALI CELEBRATIONS','','','1574059115_kg_diwali_19.jpg','../images/upload/1574059115_kg_diwali_19.jpg',1,'','','','','','','','','','1573799162_415d399408105b2c106c8f49e141fc66_s_96_d_mm_r_g.jpeg','../images/upload/1573799162_415d399408105b2c106c8f49e141fc66_s_96_d_mm_r_g.jpeg','1','2019-11-15 11:56:02',NULL,NULL),
	(29,0,'7','TEACHERS\' DAY - 2019','','','1574059208_hm_teachers_day.jpg','../images/upload/1574059208_hm_teachers_day.jpg',2,'','','','','','','','','','1573799235_415d399408105b2c106c8f49e141fc66_s_96_d_mm_r_g.jpeg','../images/upload/1573799235_415d399408105b2c106c8f49e141fc66_s_96_d_mm_r_g.jpeg','1','2019-11-15 11:57:15',NULL,NULL),
	(30,0,'7','ONAM CELEBRATIONS - 2019','','','1574059249_hm_onam19.jpg','../images/upload/1574059249_hm_onam19.jpg',3,'','','','','','','','','','1573799305_415d399408105b2c106c8f49e141fc66_s_96_d_mm_r_g.jpeg','../images/upload/1573799305_415d399408105b2c106c8f49e141fc66_s_96_d_mm_r_g.jpeg','1','2019-11-15 11:58:25',NULL,NULL),
	(31,0,'7','ACHIEVEMENTS','','','1574059288_hm_achv_vivum19.jpg','../images/upload/1574059288_hm_achv_vivum19.jpg',4,'','','','','','','','','','1573799368_415d399408105b2c106c8f49e141fc66_s_96_d_mm_r_g.jpeg','../images/upload/1573799368_415d399408105b2c106c8f49e141fc66_s_96_d_mm_r_g.jpeg','1','2019-11-15 11:59:28',NULL,NULL),
	(32,0,'7','MAITRA SPARDA - 2019','','','1574059468_hm_maitra_sparda19.jpg','../images/upload/1574059468_hm_maitra_sparda19.jpg',5,'','','','','','','','','','1573799411_415d399408105b2c106c8f49e141fc66_s_96_d_mm_r_g.jpeg','../images/upload/1573799411_415d399408105b2c106c8f49e141fc66_s_96_d_mm_r_g.jpeg','1','2019-11-15 12:00:11',NULL,NULL),
	(33,0,'8','','','I am proud that my children study in one of the top schools, NPS Indiranagar, in Bangalore. I am delighted to witness their multifaceted development, academic, cultural, personality and above all confidence to face the world.','','',1,'','','','','','','Mrs. Meena Ganesh','Parent','','','../images/upload/1574056595_gallery-07-40x40.jpg','1','2019-11-18 11:26:35',NULL,NULL),
	(34,0,'8','','','In the past 25 years I have been with the students of Class 2 and 3. It has been a wonderful journey throughout. The apt words to describe my experiences would be exciting, interesting, joyous and beautiful...','','',2,'','','','','','','Ms. Mary Christy,','Member of Faculty,  CLASS TEACHER OF CLASS 3','','','../images/upload/1574056669_avatar-comment-40x40.png','1','2019-11-18 11:27:49',NULL,NULL),
	(35,0,'8','','','I am very happy with our decision to entrust National Public School, Indiranagar with our daughter\'s schooling.\r\nThe School encourages excellence. The kids have a rich and vibrant exposure to both academics and culture...','','',3,'','','','','','','Mrs. Revathi Kasturi','Parent','','','../images/upload/1574056739_teacher-01-40x40.jpg','1','2019-11-18 11:28:59',NULL,NULL),
	(36,0,'7','GANESH CHATURTHI 2019','','','1574059500_hm_ganesh_19.jpg','../images/upload/1574059500_hm_ganesh_19.jpg',6,'','','','','','','','','','','','1','2019-11-18 12:15:00',NULL,NULL),
	(37,0,'7','INDEPENDENCE DAY','','','1574059528_hm_ind_day19.jpg','../images/upload/1574059528_hm_ind_day19.jpg',7,'','','','','','','','','','','','1','2019-11-18 12:15:28',NULL,NULL),
	(38,0,'7','SANSKRIT DIVAS 2019','','','1574059553_hm_sanskrit_aug19.jpg','../images/upload/1574059553_hm_sanskrit_aug19.jpg',8,'','','','','','','','','','','','1','2019-11-18 12:15:53',NULL,NULL),
	(39,0,'8','','','I am proud to be at NPS Indiranagar because of the brilliant ambience provided by the teachers and the students alike. At NPS, one can get a great combination of academics and co-curricular activities. It is just great to be an NPSite.','','',0,'','','','','','','Kedar D. ','Student - 12 C','','','','1','2019-11-18 12:39:53',NULL,NULL),
	(42,1,'3','School Fun Fest on new year celebration','Happy to announce a new year school fun fest. ','Funfair on new year','1574403323_Fun Fair.png','../images/upload/1574403323_Fun Fair.png',1,NULL,'','','','','','','','','',NULL,'1','2019-11-22 17:15:23',NULL,NULL),
	(43,1,'3','Annual Sports Day on 10th Jan 2020','Upcoming annual sports day on 10th Jan 2020','Upcoming annual sports day on 10th Jan 2020','1574403698_download.jpeg','../images/upload/1574403698_download.jpeg',1,NULL,'','','','','','','','','',NULL,'1','2019-11-22 17:21:38',NULL,NULL);

/*!40000 ALTER TABLE `pupilsight_cms_sections` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsight_deregister_students
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsight_deregister_students`;

CREATE TABLE `pupilsight_deregister_students` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pupilsightStudentEnrolmentID` int(10) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `status` varchar(128) CHARACTER SET latin1 NOT NULL,
  `cdt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table pupilsightAction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightAction`;

CREATE TABLE `pupilsightAction` (
  `pupilsightActionID` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightModuleID` int(4) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT 'The action name should be unqiue to the module that it is related to',
  `precedence` int(2) NOT NULL,
  `order_wise` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `URLList` text NOT NULL COMMENT 'Comma seperated list of all URLs that make up this action',
  `entryURL` varchar(255) NOT NULL,
  `entrySidebar` enum('Y','N') NOT NULL DEFAULT 'Y',
  `menuShow` enum('Y','N') NOT NULL DEFAULT 'Y',
  `defaultPermissionAdmin` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionTeacher` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionStudent` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionParent` enum('N','Y') NOT NULL DEFAULT 'N',
  `defaultPermissionSupport` enum('N','Y') NOT NULL DEFAULT 'N',
  `categoryPermissionStaff` enum('Y','N') NOT NULL DEFAULT 'Y',
  `categoryPermissionStudent` enum('Y','N') NOT NULL DEFAULT 'Y',
  `categoryPermissionParent` enum('Y','N') NOT NULL DEFAULT 'Y',
  `categoryPermissionOther` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`pupilsightActionID`),
  UNIQUE KEY `moduleActionName` (`name`,`pupilsightModuleID`),
  KEY `pupilsightModuleID` (`pupilsightModuleID`)
) ENGINE=InnoDB AUTO_INCREMENT=1097 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightAction` WRITE;
/*!40000 ALTER TABLE `pupilsightAction` DISABLE KEYS */;

INSERT INTO `pupilsightAction` (`pupilsightActionID`, `pupilsightModuleID`, `name`, `precedence`, `order_wise`, `category`, `description`, `URLList`, `entryURL`, `entrySidebar`, `menuShow`, `defaultPermissionAdmin`, `defaultPermissionTeacher`, `defaultPermissionStudent`, `defaultPermissionParent`, `defaultPermissionSupport`, `categoryPermissionStaff`, `categoryPermissionStudent`, `categoryPermissionParent`, `categoryPermissionOther`)
VALUES
	(1,2,'Application Form Settings',0,NULL,'Student Management','Allows admins to control the application form','applicationFormSettings.php','applicationFormSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(2,2,'Manage Users_editDelete',1,NULL,'User Management','Edit any user within the system','user_manage.php, user_manage_add.php, user_manage_edit.php, user_manage_delete.php, user_manage_password.php','user_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(3,1,'Manage Academic Years',0,NULL,'Years, Days & Times','Allows user to control the definition of academic years within the system','schoolYear_manage.php,schoolYear_manage_edit.php,schoolYear_manage_delete.php,schoolYear_manage_add.php','schoolYear_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(4,5,'Student Enrolment',0,NULL,'Admissions','Allows user to control student enrolment in the current year','studentEnrolment_manage.php,studentEnrolment_manage_add.php,studentEnrolment_manage_edit.php,studentEnrolment_manage_delete.php','studentEnrolment_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(5,3,'System Settings',0,NULL,'Settings','Main system settings','systemSettings.php','systemSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(6,1,'Class Master',5,2,'Groupings','','yearGroup_manage.php,yearGroup_manage_edit.php,yearGroup_manage_add.php,yearGroup_manage_delete.php','yearGroup_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(7,1,'Section Master',0,3,'Groupings','','rollGroup_manage.php,rollGroup_manage_edit.php,rollGroup_manage_add.php,rollGroup_manage_delete.php','rollGroup_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(8,1,'Houses Master',0,5,'Groupings','','house_manage.php,house_manage_edit.php,house_manage_add.php,house_manage_delete.php,house_manage_assign.php','house_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(9,2,'Manage Roles',0,NULL,'User Management','','role_manage.php,role_manage_add.php,role_manage_edit.php,role_manage_delete.php,role_manage_duplicate.php','role_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(10,3,'Manage Modules',0,NULL,'Extend & Update','','module_manage.php,module_manage_install.php,module_manage_edit.php,module_manage_uninstall.php,module_manage_update.php','module_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(11,5,'Emergency SMS by Year Group',0,NULL,'Reports','Output all parental first mobile numbers by year group: if there are no details, then show emergency details.','report_emergencySMS_byYearGroup.php','report_emergencySMS_byYearGroup.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(12,2,'Manage Permissions',0,NULL,'User Management','','permission_manage.php,permission_manage_edit.php','permission_manage.php','N','Y','Y','N','N','N','N','Y','N','N','N'),
	(13,1,'Manage Days of the Week',0,NULL,'Years, Days & Times','','daysOfWeek_manage.php','daysOfWeek_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(14,8,'Update Personal Data_family',0,NULL,'Request Updates','Allows users to update personal information for themselves and their family members','data_personal.php','data_personal.php','Y','Y','N','Y','N','Y','Y','Y','Y','Y','Y'),
	(15,1,'Manage Terms',0,NULL,'Years, Days & Times','','schoolYearTerm_manage.php,schoolYearTerm_manage_add.php,schoolYearTerm_manage_edit.php,schoolYearTerm_manage_delete.php','schoolYearTerm_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(16,1,'Manage Special Days',0,NULL,'Years, Days & Times','','schoolYearSpecialDay_manage.php,schoolYearSpecialDay_manage_add.php,schoolYearSpecialDay_manage_edit.php,schoolYearSpecialDay_manage_delete.php','schoolYearSpecialDay_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(17,13,'Manage Courses & Classes',0,NULL,'Courses & Classes','','course_manage.php,course_manage_add.php,course_manage_edit.php,course_manage_delete.php,course_manage_class_add.php,course_manage_class_edit.phpcourse_manage_class_delete.php','course_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(18,13,'Course Enrolment by Class',0,NULL,'Courses & Classes','','courseEnrolment_manage.php,courseEnrolment_manage_class_edit.php,courseEnrolment_manage_class_edit_edit.php,courseEnrolment_manage_class_edit_delete.php','courseEnrolment_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(19,2,'Manage Families',0,NULL,'User Management','','family_manage.php,family_manage_add.php,family_manage_edit.php,family_manage_delete.php,family_manage_edit_editChild.php,family_manage_edit_deleteChild.php,family_manage_edit_editAdult.php,family_manage_edit_deleteAdult.php','family_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(20,3,'Manage Themes',0,NULL,'Extend & Update','','theme_manage.php,theme_manage_install.php,theme_manage_edit.php,theme_manage_uninstall.php','theme_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(21,5,'Manage Medical Forms',0,NULL,'Medical','Manage medical form information for users','medicalForm_manage.php,medicalForm_manage_add.php,medicalForm_manage_edit.php,medicalForm_manage_delete.php,medicalForm_manage_condition_add.php,medicalForm_manage_condition_edit.php,medicalForm_manage_condition_delete.php','medicalForm_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(22,4,'View Departments',0,NULL,'Departments','Allows uers to view all department details.','departments.php, department.php, department_course.php, department_course_class.php, department_course_class_full.php, department_course_unit_add.php, department_course_unit_edit.php, department_course_unit_delete.php, department_course_unit_duplicate.php, department_edit.php, department_course_edit.php','departments.php','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),
	(23,5,'View Student Profile_brief',0,NULL,'Profiles','View brief profile of any student in the school.','student_view.php,student_view_details.php','student_view.php','Y','Y','N','N','Y','N','N','Y','Y','Y','Y'),
	(24,5,'View Student Profile_full',3,NULL,'Profiles','View full profile of any student in the school.','student_view.php,student_view_details.php,student_view_details_notes_add.php,student_view_details_notes_edit.php','student_view.php','Y','Y','Y','Y','N','N','Y','Y','N','N','N'),
	(25,1,'Manage Facilities',0,NULL,'Other','Allows users to create a list of spaces and rooms in the school','space_manage.php, space_manage_add.php, space_manage_edit.php, space_manage_delete.php','space_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(26,6,'Attendance By Person',0,NULL,'Take Attendance','Take attendance, one person at a time','attendance_take_byPerson.php','attendance_take_byPerson.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(27,6,'Attendance By Section',1,NULL,'Take Attendance','Take attendance, one roll group at a time','attendance_take_byRollGroup.php,attendance_take_byRollGroupListView.php','attendance_take_byRollGroup.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(28,6,'Set Future Absence',0,NULL,'Future Information','Set future absences one student at a time','attendance_future_byPerson.php','attendance_future_byPerson.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(29,6,'Students Not Present',0,NULL,'Reports','Print a report of students who are not present on a given day','report_studentsNotPresent_byDate.php,report_studentsNotPresent_byDate_print.php','report_studentsNotPresent_byDate.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(30,6,'Roll Groups Not Registered',0,NULL,'Reports','Print a report of roll groups who have not been registered on a given day','report_rollGroupsNotRegistered_byDate.php,report_rollGroupsNotRegistered_byDate_print.php','report_rollGroupsNotRegistered_byDate.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(31,6,'Student History_all',2,NULL,'Reports','Print a report of all attendance data in the current school year for a student','report_studentHistory.php,report_studentHistory_print.php','report_studentHistory.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(32,136,'Manage Staff_general',0,NULL,'Staff Management','Edit general information on members of staff.','staff_manage.php, staff_manage_add.php, staff_manage_edit.php, staff_manage_delete.php, staff_manage_edit_facility_add.php, staff_manage_edit_facility_delete.php','staff_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(33,7,'View Markbook_allClassesAllData',4,NULL,'Markbook','View all markbook information for all users','markbook_view.php, markbook_view_full.php','markbook_view.php','N','Y','Y','Y','N','N','Y','Y','Y','Y','Y'),
	(34,7,'Edit Markbook_singleClass',0,NULL,'Markbook','Edit columns and grades for a single class at a time.','markbook_edit.php, markbook_edit_add.php, markbook_edit_edit.php, markbook_edit_delete.php,markbook_edit_data.php,markbook_edit_targets.php,markbook_edit_copy.php','markbook_edit.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','Y'),
	(35,9,'Lesson Planner_viewMyClasses',1,NULL,'Planning','View all planner information for classes user is in','planner.php, planner_view_full.php, planner_deadlines.php, planner_view_full_post.php, planner_unitOverview.php','planner.php','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y'),
	(36,9,'Lesson Planner_viewAllEditMyClasses',2,NULL,'Planning','View all planner information and edit all planner information for classes user is in','planner.php, planner_view_full.php, planner_add.php, planner_edit.php, planner_delete.php, planner_deadlines.php, planner_duplicate.php, planner_view_full_post.php, planner_view_full_submit_edit.php, planner_bump.php, planner_unitOverview.php','planner.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','Y'),
	(38,9,'Lesson Planner_viewEditAllClasses',3,NULL,'Planning','View and edit all planner information for all classes','planner.php, planner_view_full.php, planner_add.php, planner_edit.php, planner_delete.php, planner_deadlines.php, planner_duplicate.php, planner_view_full_post.php, planner_view_full_submit_edit.php, planner_bump.php, planner_unitOverview.php','planner.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(39,7,'View Markbook_myMarks',2,NULL,'Markbook','View your own marks','markbook_view.php','markbook_view.php','N','Y','N','N','Y','N','N','Y','Y','Y','Y'),
	(40,9,'Lesson Planner_viewMyChildrensClasses',0,NULL,'Planning','Allows parents to view their children\'s classes','planner.php, planner_view_full.php, planner_deadlines.php, planner_view_full_post.php, planner_unitOverview.php','planner.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(41,7,'View Markbook_viewMyChildrensClasses',1,NULL,'','Allows parents to view their children\'s classes','markbook_view.php','markbook_view.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(42,5,'View Student Profile_myChildren',1,NULL,'Profiles','Allows parents to view their student\'s information','student_view.php, student_view_details.php','student_view.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(43,5,'Students by Roll Group',0,NULL,'Reports','Print student roll group lists','report_students_byRollGroup.php, report_students_byRollGroup_print.php','report_students_byRollGroup.php','N','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(44,6,'Students Not Onsite',0,NULL,'Reports','Print a report of students who are not physically on the school campus on a given day','report_studentsNotOnsite_byDate.php,report_studentsNotOnsite_byDate_print.php','report_studentsNotOnsite_byDate.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(45,11,'Individual Needs Records_view',0,NULL,'Individual Needs','Allows user to view IN records for all students','in_view.php, in_edit.php','in_view.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(46,11,'Individual Needs Records_viewEdit',2,NULL,'Individual Needs','Allows users to edit IN records for all students','in_view.php, in_edit.php','in_view.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(47,12,'Assess',0,NULL,'Crowd Assessment','Allows users to assess each other\'s work','crowdAssess.php,crowdAssess_view.php,crowdAssess_view_discuss.php, crowdAssess_view_discuss_post.php','crowdAssess.php','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),
	(48,13,'Manage Timetables',0,NULL,'Timetable','Allow admins to create and manage timetables','tt.php, tt_add.php, tt_edit.php, tt_delete.php, tt_import.php, tt_edit_day_add.php, tt_edit_day_edit.php, tt_edit_day_delete.php, tt_edit_day_edit_class.php, tt_edit_day_edit_class_delete.php, tt_edit_day_edit_class_add.php, tt_edit_day_edit_class_edit.php, tt_edit_day_edit_class_exception.php, tt_edit_day_edit_class_exception_add.php, tt_edit_day_edit_class_exception_delete.php','tt.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(49,13,'Manage Slots & Timings',0,NULL,'Timetable','Allow admins to manage timetable columns','ttColumn.php, ttColumn_add.php, ttColumn_edit.php, ttColumn_delete.php, ttColumn_edit_row_add.php, ttColumn_edit_row_edit.php, ttColumn_edit_row_delete.php','ttColumn.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(50,13,'Tie Days To Dates',0,NULL,'Timetable','Allows admins to place timetable days into the school calendar','ttDates.php, ttDates_edit.php, ttDates_edit_add.php, ttDates_edit_delete.php','ttDates.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(51,14,'View Timetable by Person',2,NULL,'View Timetables','Allows users to view timetables','tt.php, tt_view.php','tt.php','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),
	(52,15,'View Activities_view',0,NULL,'Activities','Allows users to view activities','activities_view.php, activities_view_full.php','activities_view.php','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),
	(53,15,'View Activities_studentRegister',1,NULL,'Activities','Allows students to view activities and register','activities_view.php, activities_view_full.php, activities_view_register.php','activities_view.php','Y','Y','N','N','Y','N','N','N','Y','N','N'),
	(54,1,'Manage Activity Settings',0,NULL,'Learn','Control activity settings','activitySettings.php','activitySettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(55,15,'Manage Activities',0,NULL,'Administration','Allows managers to build activity program','activities_manage.php, activities_manage_add.php, activities_manage_edit.php, activities_manage_delete.php,activities_manage_enrolment.php,activities_manage_enrolment_add.php,activities_manage_enrolment_edit.php,activities_manage_enrolment_delete.php','activities_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(56,15,'My Activities',0,NULL,'Activities','Allows a user to view the activities they are involved in','activities_my.php, activities_my_full.php','activities_my.php','Y','Y','Y','Y','Y','N','N','Y','Y','Y','Y'),
	(57,15,'Participants by Activity',0,NULL,'Reports','Print participant lists','report_participants.php, report_participants_print.php','report_participants.php','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y'),
	(58,15,'Attendance History by Activity',0,NULL,'Attendance','Print attendance lists','report_attendance.php, report_attendanceExport.php','report_attendance.php','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y'),
	(59,15,'Generate Invoices',0,NULL,'Administration','Print payment list','activities_payment.php','activities_payment.php','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y'),
	(60,6,'Student History_myChildren',0,NULL,'Reports','Print a report of all attendance data in the current school yearfor my children','report_studentHistory.php','report_studentHistory.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(61,9,'Work Summary by Roll Group',0,NULL,'Reports','Print work summary statistical data by roll group','report_workSummary_byRollGroup.php','report_workSummary_byRollGroup.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','Y'),
	(62,180,'Subject  Master',0,4,'Manage Curriculum','Allows admins to create learning areas and administrative groups.','department_manage.php,department_manage_add.php,department_manage_edit.php,department_manage_delete.php','department_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(63,8,'Personal Data Updates',0,NULL,'Manage Updates','Allows admins to process data update requests for personal data','data_personal_manage.php, data_personal_manage_edit.php, data_personal_manage_delete.php','data_personal_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(64,8,'Update Medical Form_family',0,NULL,'Request Updates','Allows users to update medical information for themselves and their family members','data_medical.php','data_medical.php','Y','Y','N','N','N','Y','N','Y','Y','Y','Y'),
	(65,8,'Medical Form Updates',0,NULL,'Manage Updates','Allows admins to process data update requests for medical data','data_medical_manage.php, data_medical_manage_edit.php, data_medical_manage_delete.php','data_medical_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(66,13,'Class Enrolment by Roll Group',0,NULL,'Reports','Shows the number of classes students are enroled in, organised by roll group','report_classEnrolment_byRollGroup.php','report_classEnrolment_byRollGroup.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(67,15,'Activity Type by Roll Group',0,NULL,'Reports','Print roll group lists showing count of various activity types','report_activityType_rollGroup.php','report_activityType_rollGroup.php','Y','Y','Y','Y','N','N','Y','Y','N','N','N'),
	(68,16,'External Assessment Data_view',0,NULL,'External Assessment','Allow users to view assessment data for all students','externalAssessment.php, externalAssessment_details.php','externalAssessment.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(69,16,'External Assessment Data_manage',1,NULL,'External Assessment','Allows users to manage external assessment data','externalAssessment.php, externalAssessment_details.php, externalAssessment_manage_details_add.php, externalAssessment_manage_details_edit.php, externalAssessment_manage_details_delete.php','externalAssessment.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(70,2,'Promotion',0,NULL,'Student Management','Allows admins to kick the school forward one year','rollover.php','rollover.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(72,5,'Student Transport',0,NULL,'Reports','Shows student transport details','report_transport_student.php','report_transport_student.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(73,8,'Student Data Updater History',0,NULL,'Reports','Allows users to check, for a group of students, how recently they have been updated','report_student_dataUpdaterHistory.php','report_student_dataUpdaterHistory.php','Y','Y','Y','Y','N','N','Y','Y','N','N','N'),
	(74,5,'Application Form',0,NULL,'Admissions','Allows users, with or without an account, to apply for student place.','applicationForm.php','applicationForm.php','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y'),
	(75,5,'Medical Data Summary',0,NULL,'Reports','Allows users to show a summary of medical data for a group of students.','report_student_medicalSummary.php, report_student_medicalSummary_print.php','report_student_medicalSummary.php','Y','Y','Y','Y','N','N','Y','Y','N','N','N'),
	(77,5,'Emergency Data Summary',0,NULL,'Reports','Allows users to show a summary of emergency contact data for a group of students.','report_student_emergencySummary.php, report_student_emergencySummary_print.php','report_student_emergencySummary.php','Y','Y','Y','Y','N','N','Y','Y','N','N','N'),
	(78,5,'Manage Applications_editDelete',1,NULL,'Admissions','Allows admins to view and action applications','applicationForm_manage.php, applicationForm_manage_edit.php, applicationForm_manage_delete.php, applicationForm_manage_accept.php, applicationForm_manage_reject.php, applicationForm_manage_add.php','applicationForm_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(585,8,'Update Personal Data_any',1,NULL,'Request Updates','Create personal data update request for any user','data_personal.php','data_personal.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(586,8,'Update Medical Data_any',1,NULL,'Request Updates','Create medical data update request for any user','data_medical.php','data_medical.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(605,1,'Manage Behaviour Settings',0,NULL,'People','Manage settings for the Behaviour module','behaviourSettings.php','behaviourSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(606,119,'Manage Behaviour Records_all',1,NULL,'Behaviour Records','Manage all behaviour records','behaviour_manage.php, behaviour_manage_add.php, behaviour_manage_edit.php, behaviour_manage_delete.php','behaviour_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(607,119,'Manage Behaviour Records_my',0,NULL,'Behaviour Records','Manage behaviour records create by the user','behaviour_manage.php, behaviour_manage_add.php, behaviour_manage_edit.php, behaviour_manage_delete.php','behaviour_manage.php','Y','Y','N','Y','N','N','N','Y','N','N','N'),
	(608,119,'View Behaviour Records_all',1,NULL,'Behaviour Records','View behaviour records by student','behaviour_view.php,behaviour_view_details.php','behaviour_view.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(609,5,'Emergency SMS by Transport',0,NULL,'Reports','Show SMS emergency details by transport route','report_emergencySMS_byTransport.php','report_emergencySMS_byTransport.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(610,1,'Manage Resource Settings',0,NULL,'Learn','Manage settings for the resources module','resourceSettings.php','resourceSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(611,9,'Manage Resources_all',1,NULL,'Resources','Manage all resources','resources_manage.php, resources_manage_add.php, resources_manage_edit.php, resources_manage_delete.php','resources_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(612,9,'Manage Resources_my',0,NULL,'Resources','Manage resources created by the user','resources_manage.php, resources_manage_add.php, resources_manage_edit.php, resources_manage_delete.php','resources_manage.php','Y','Y','N','Y','N','N','N','Y','N','N','N'),
	(613,9,'View Resources',0,NULL,'Resources','View resources','resources_view.php,resources_view_details.php,resources_view_full.php','resources_view.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','Y'),
	(614,121,'New Message_classes_my',1,NULL,'Manage Messages','Bulk email to any of my classes','messenger_post.php','messenger_post.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','N'),
	(615,121,'New Message_classes_any',9,NULL,'Manage Messages','Bulk email to any class','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(616,121,'New Message_classes_parents',5,NULL,'Manage Messages','Include parents in messages posted to classes','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(617,121,'New Message_courses_my',3,NULL,'Manage Messages','Bulk email to any of my courses','messenger_post.php','messenger_post.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','N'),
	(618,121,'New Message_courses_any',11,NULL,'Manage Messages','Bulk email to any courses','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(619,121,'New Message_courses_parents',7,NULL,'Manage Messages','Include parents in messages posted to courses','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(620,121,'New Message_rollGroups_my',2,NULL,'Manage Messages','Bulk email to any of my roll groups','messenger_post.php','messenger_post.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','N'),
	(621,121,'New Message_rollGroups_any',10,NULL,'Manage Messages','Bulk email to any roll group','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(622,121,'New Message_rollGroups_parents',6,NULL,'Manage Messages','Include parents in messages posted to parents','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(623,121,'New Message_activities_my',0,NULL,'Manage Messages','Bulk email to any of my activities','messenger_post.php','messenger_post.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','N'),
	(624,121,'New Message_activities_any',8,NULL,'Manage Messages','Bulk email to any activity','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(625,121,'New Message_activities_parents',4,NULL,'Manage Messages','Include parents in messages posted to activities','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(626,121,'New Message_yearGroups_any',8,NULL,'Manage Messages','Bulk email to any year group','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(627,121,'New Message_yearGroups_parents',4,NULL,'Manage Messages','Include parents in messages posted to year group','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(628,121,'New Message_role',8,NULL,'Manage Messages','Bulk email to a particular role','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(629,121,'Manage Messages_my',0,NULL,'Manage Messages','Edit all messages created by the user','messenger_manage.php,messenger_manage_delete.php,messenger_manage_edit.php,messenger_manage_report.php','messenger_manage.php','N','Y','Y','Y','N','N','N','Y','Y','Y','N'),
	(630,121,'Manage Messages_all',1,NULL,'Manage Messages','Edit all messages','messenger_manage.php,messenger_manage_delete.php,messenger_manage_edit.php,messenger_manage_report.php','messenger_manage.php','N','Y','Y','N','N','N','N','Y','N','Y','N'),
	(631,3,'Update',0,NULL,'Extend & Update','Update Pupilsight to a new version','update.php','update.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(632,121,'New Message_fromSchool',0,NULL,'Manage Messages','Bulk email from the school\'s email address','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(655,14,'View Timetable by Facility',0,NULL,'View Timetables','View space usage according to the timetable','tt_space.php,tt_space_view.php','tt_space.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(656,13,'Course Enrolment by Person',0,NULL,'Courses & Classes','Manage course enrolment for a single user','courseEnrolment_manage_byPerson.php, courseEnrolment_manage_byPerson_edit.php, courseEnrolment_manage_byPerson_edit_edit.php, courseEnrolment_manage_byPerson_edit_delete.php','courseEnrolment_manage_byPerson.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(657,121,'New Message_applicants',12,NULL,'Manage Messages','Bulk email to applicants by intended school year of entry','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','N','Y','N'),
	(658,121,'New Message_individuals',13,NULL,'Manage Messages','Bulk email to indvidual users','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(659,121,'New Message_houses_my',14,NULL,'Manage Messages','Bulk email to members of my house','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(660,121,'New Message_houses_all',15,NULL,'Manage Messages','Bulk email to members of all houses','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(661,9,'Unit Planner_all',1,NULL,'Planning','Manage all units within the school','units.php, units_add.php, units_delete.php, units_edit.php, units_duplicate.php, units_edit_deploy.php, units_edit_working.php, units_edit_working_copyback.php, units_edit_working_add.php, units_edit_copyBack.php, units_edit_copyForward.php, units_dump.php,units_edit_smartBlockify.php','units.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(662,9,'Unit Planner_learningAreas',0,NULL,'Planning','Manage all units within the learning areas I have appropriate permission','units.php, units_add.php, units_delete.php, units_edit.php, units_duplicate.php, units_edit_deploy.php, units_edit_working.php, units_edit_working_copyback.php, units_edit_working_add.php, units_edit_copyBack.php, units_edit_copyForward.php, units_dump.php,units_edit_smartBlockify.php','units.php','Y','Y','N','Y','N','N','N','Y','N','N','N'),
	(673,15,'Activity Spread by Roll Group',0,NULL,'Reports','View spread of enrolment over terms and days by roll group','report_activitySpread_rollGroup.php','report_activitySpread_rollGroup.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(674,1,'Manage Planner Settings',0,NULL,'Learn','Edit settings for the planner','plannerSettings.php','plannerSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(675,9,'Manage Outcomes_viewAllEditLearningArea',1,NULL,'Outcomes','View all outcomes in the school, edit any from Learning Areas where you are Coordinator or Teacher (Curriculum)','outcomes.php, outcomes_add.php, outcomes_edit.php, outcomes_delete.php','outcomes.php','Y','Y','N','Y','N','N','N','Y','N','N','N'),
	(676,9,'Manage Outcomes_viewEditAll',2,NULL,'Outcomes','Manage all outcomes in the school','outcomes.php, outcomes_add.php, outcomes_edit.php, outcomes_delete.php','outcomes.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(677,9,'Manage Outcomes_viewAll',0,NULL,'Outcomes','View all outcomes in the school','outcomes.php','outcomes.php','Y','Y','N','N','N','N','N','Y','N','N','N'),
	(678,126,'Manage Rubrics_viewAllEditLearningArea',0,NULL,'Rubrics','View all rubrics in the school, edit any from Learning Areas where you are Coordinator or Teacher (Curriculum)','rubrics.php, rubrics_add.php, rubrics_edit.php, rubrics_delete.php, rubrics_edit_editRowsColumns.php, rubrics_duplicate.php','rubrics.php','Y','Y','N','Y','N','N','N','Y','N','N','N'),
	(679,126,'Manage Rubrics_viewEditAll',1,NULL,'Rubrics','Manage all rubrics in the school','rubrics.php, rubrics_add.php, rubrics_edit.php, rubrics_delete.php, rubrics_edit_editRowsColumns.php, rubrics_duplicate.php','rubrics.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(705,15,'Activity Choices by Student',1,NULL,'Reports','View all student activity choices in the current year for a given student','report_activityChoices_byStudent.php','report_activityChoices_byStudent.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(706,1,'Manage Grade Scales',1,NULL,'Assess','Manage all aspects of grade scales, which are used throughout ARR to control grade input.','gradeScales_manage.php, gradeScales_manage_add.php, gradeScales_manage_edit.php, gradeScales_manage_delete.php, gradeScales_manage_edit_grade_add.php, gradeScales_manage_edit_grade_edit.php, gradeScales_manage_edit_grade_delete.php','gradeScales_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(707,5,'New Students',1,NULL,'Reports','A report showing all new students in the current school year.','report_students_new.php','report_students_new.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(708,126,'View Rubrics',0,NULL,'Rubrics','View all rubrics in the school, except students who can only view those for own year group.','rubrics_view.php, rubrics_view_full.php','rubrics_view.php','Y','Y','N','N','Y','N','N','Y','Y','Y','N'),
	(709,15,'Activity Enrolment Summary',0,NULL,'Reports','View summary enrolment information for all activities in the current year.','report_activityEnrollmentSummary.php','report_activityEnrollmentSummary.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(710,130,'Manage Catalog',0,NULL,'Catalog','Control all items in the school library catalog','library_manage_catalog.php, library_manage_catalog_add.php, library_manage_catalog_edit.php, library_manage_catalog_delete.php, library_manage_catalog_duplicate.php','library_manage_catalog.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(711,130,'Lending & Activity Log',0,NULL,'Catalog','Manage lending, returns, reservations, repairs, decommissioning, etc.','library_lending.php, library_lending_item.php,library_lending_item_signout.php,library_lending_item_return.php,library_lending_item_edit.php,library_lending_item_renew.php','library_lending.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(712,1,'Manage Library Settings',0,NULL,'Learn','Manage settings for the Library module','librarySettings.php','librarySettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(713,5,'Age & Gender Summary',0,NULL,'Reports','Summarises gender, age and school year','report_students_ageGenderSummary.php','report_students_ageGenderSummary.php','N','Y','Y','N','N','N','N','Y','N','N','N'),
	(714,5,'Roll Group Summary',0,NULL,'Reports','Summarises gender and number of students across all roll groups.','report_rollGroupSummary.php','report_rollGroupSummary.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(715,1,'Manage Alert Levels',0,NULL,'People','Manage the alert levels which are used throughout the school to flag problems.','alertLevelSettings.php','alertLevelSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(716,11,'Individual Needs Records_viewContribute',1,NULL,'Individual Needs','Allows users to contribute teaching strategies to IN records for all students','in_view.php, in_edit.php','in_view.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(717,1,'Manage IN Settings',0,NULL,'People','Allows admins to control the descriptors available for use in the Individual Needs module.','inSettings.php, inSettings_add.php, inSettings_edit.php, inSettings_delete.php','inSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(718,11,'Individual Needs Summary',0,NULL,'Individual Needs','Allows user to see a flexible summary of IN data.','in_summary.php','in_summary.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(719,119,'Find Behaviour Patterns',0,NULL,'Behaviour Tracking','Allows user to spot students who are repeat or regular offenders.','behaviour_pattern.php','behaviour_pattern.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(720,130,'Browse The Library',0,NULL,'Catalog','Search and view all borrowable items maintained by the library','library_browse.php','library_browse.php','N','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),
	(721,130,'View Overdue Items',0,NULL,'Reports','View items which are on loan and have exceeded their due date.','report_viewOverdueItems.php','report_viewOverdueItems.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(722,130,'Student Borrowing Record',0,NULL,'Reports','View items borrowed by an individual student.','report_studentBorrowingRecord.php','report_studentBorrowingRecord.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(723,2,'Manage User Settings',0,NULL,'User Settings','Configure settings relating to user management.','userSettings.php','userSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(724,5,'Family Address by Student',0,NULL,'Reports','View family addresses by student','report_familyAddress_byStudent.php','report_familyAddress_byStudent.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(725,2,'Data Updater Settings',0,NULL,'User Settings','Configure options for the Data Updater module','dataUpdaterSettings.php','dataUpdaterSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(726,1,'Formal Assessment Settings',0,NULL,'Assess','Configure External Assessment module options','formalAssessmentSettings.php','formalAssessmentSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(727,1,'Markbook Settings',0,NULL,'Assess','Configure options for the Markbook module','markbookSettings.php','markbookSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(741,15,'View Activities_studentRegisterByParent',2,NULL,'Activities','Allows parents to register their children for activities','activities_view.php, activities_view_full.php, activities_view_register.php','activities_view.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(742,2,'Manage Students Settings',0,NULL,'User Settings','Manage settings for the Student module','studentsSettings.php,studentsSettings_noteCategory_add.php,studentsSettings_noteCategory_edit.php,studentsSettings_noteCategory_delete.php','studentsSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(743,121,'New Message_byEmail',0,NULL,'Manage Messages','Send messages by email.','messenger_post.php','messenger_post.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','N'),
	(744,121,'New Message_byMessageWall',0,NULL,'Manage Messages','Send messages by message wall.','messenger_post.php','messenger_post.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','N'),
	(745,121,'New Message_bySMS',0,NULL,'Manage Messages','Send messages by SMS.','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(746,121,'View Message Wall',0,NULL,'View Messages','Allows users to view all messages posted on their message wall.','messageWall_view.php,messageWall_view_full.php','messageWall_view.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','N'),
	(747,1,'Manage Messenger Settings',0,NULL,'Other','Manage gateway settings for outgoing SMS messages.','messengerSettings.php','messengerSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(748,130,'Catalog Summary',0,NULL,'Reports','Provides an summary overview of items in the catalog.','report_catalogSummary.php','report_catalogSummary.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(755,5,'Left Students',1,NULL,'Reports','A report showing all the students who have left within a specified date range.','report_students_left.php','report_students_left.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(756,1,'Manage File Extensions',0,NULL,'Other','Manage file extensions allowed across the system','fileExtensions_manage.php,fileExtensions_manage_add.php,fileExtensions_manage_edit.php,fileExtensions_manage_delete.php','fileExtensions_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(757,5,'Student ID Cards',1,NULL,'Reports','A report for bulk creation of student ID cards.','report_students_IDCards.php','report_students_IDCards.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(758,7,'Edit Markbook_multipleClassesInDepartment',1,NULL,'Markbook','Edit columns and grades for a single class belonging to the user, or multiple classes within departments.','markbook_edit.php, markbook_edit_add.php, markbook_edit_edit.php, markbook_edit_delete.php,markbook_edit_data.php,markbook_edit_targets.php,markbook_edit_copy.php,markbook_edit_addMulti.php','markbook_edit.php','Y','Y','N','Y','N','N','N','Y','N','N','N'),
	(759,7,'Edit Markbook_multipleClassesAcrossSchool',2,NULL,'Markbook','Edit columns and grades for a single class belonging to the user, or multiple classes across the whole school.','markbook_edit.php, markbook_edit_add.php, markbook_edit_edit.php, markbook_edit_delete.php,markbook_edit_data.php,markbook_edit_targets.php,markbook_edit_copy.php,markbook_edit_addMulti.php','markbook_edit.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(760,14,'View Available Facilities',0,NULL,'Reports','View unassigned rooms by timetable.','report_viewAvailableSpaces.php','report_viewAvailableSpaces.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(764,8,'Update Family Data_any',1,NULL,'Request Updates','Create family data update request for any user','data_family.php','data_family.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(765,8,'Update Family Data_family',0,NULL,'Request Updates','Allows adults in a family to create data update request for their family.','data_family.php','data_family.php','Y','Y','Y','Y','N','Y','Y','Y','N','Y','N'),
	(766,8,'Family Data Updates',0,NULL,'Manage Updates','Manage requests for updates to family data.','data_family_manage.php,data_family_manage_edit.php,data_family_manage_delete.php','data_family_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(767,135,'Manage Fee Categories',0,NULL,'Billing','Allows users to create, edit and delete fee categories.','feeCategories_manage.php,feeCategories_manage_add.php,feeCategories_manage_edit.php,feeCategories_manage_delete.php','feeCategories_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(768,135,'Manage Invoicees',0,NULL,'Billing','Allows users to view and edit invoice recipients.','invoicees_manage.php,invoicees_manage_edit.php','invoicees_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(769,135,'Manage Fees',0,NULL,'Billing','Allows users to create, view and edit fees.','fees_manage.php,fees_manage_edit.php,fees_manage_add.php','fees_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(770,135,'Manage Billing Schedule',0,NULL,'Billing','Allows users to create, view and edit billing windows.','billingSchedule_manage.php,billingSchedule_manage_edit.php,billingSchedule_manage_add.php','billingSchedule_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(771,135,'Manage Invoices',0,NULL,'Billing','Allows users to generate, view, delete and edit invoices.','invoices_manage.php,invoices_manage_edit.php,invoices_manage_add.php,invoices_manage_delete.php,invoices_manage_view.php,invoices_manage_issue.php,invoices_manage_print.php','invoices_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(772,1,'Manage Finance Settings',0,NULL,'Other','Allows users to edit the text that appears in invoices and receipts.','financeSettings.php','financeSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(773,8,'Update Finance Data_any',1,NULL,'Request Updates','Create finance data update request for any user','data_finance.php','data_finance.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(774,8,'Update Finance Data_family',0,NULL,'Request Updates','Allows adults in a family to create finance data update request for their family.','data_finance.php','data_finance.php','Y','Y','Y','Y','N','Y','Y','Y','N','Y','N'),
	(775,8,'Finance Data Updates',0,NULL,'Manage Updates','Manage requests for updates to finance data.','data_finance_manage.php,data_finance_manage_edit.php,data_finance_manage_delete.php','data_finance_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(779,136,'View Staff Profile_brief',1,NULL,'Profiles','View brief profile of any staff member in the school.','staff_view.php,staff_view_details.php','staff_view.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(780,136,'View Staff Profile_full',2,NULL,'Profiles','View full profile of any staff member in the school.','staff_view.php,staff_view_details.php','staff_view.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(781,137,'View Roll Groups',1,NULL,'Roll Groups','View a brief profile of roll groups in school.','rollGroups.php,rollGroups_details.php','rollGroups.php','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y'),
	(796,1,'Manage External Assessments',1,NULL,'Assess','Add, edit and delete external assessments.','externalAssessments_manage.php,externalAssessments_manage_edit.php,externalAssessments_manage_edit_field_add.php,externalAssessments_manage_edit_field_edit.php,externalAssessments_manage_edit_field_delete.php, externalAssessments_manage_add.php, externalAssessments_manage_delete.php','externalAssessments_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(803,7,'Edit Markbook_everything',4,NULL,'Markbook','Allows editing of any column in any class.','markbook_edit.php, markbook_edit_add.php, markbook_edit_edit.php, markbook_edit_delete.php,markbook_edit_data.php,markbook_edit_targets.php,markbook_edit_copy.php','markbook_edit.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(804,2,'Manage Districts',0,NULL,'User Management','Manage a list of districts for address autocomplete.','district_manage.php, district_manage_add.php, district_manage_edit.php, district_manage_delete.php','district_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(805,5,'Letters Home by Roll Group',0,NULL,'Reports','Show students in roll group, less those with an older sibling, so that letters can be carried home by oldest in family.','report_lettersHome_byRollGroup.php','report_lettersHome_byRollGroup.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(806,3,'Manage Languages',0,NULL,'Extend & Update','Allows administrators to control system-wide language and localisation settings.','i18n_manage.php','i18n_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(807,5,'Privacy Choices by Student',0,NULL,'Reports','Shows privacy options selected, for those students with a selection made.','report_privacy_student.php','report_privacy_student.php','N','Y','Y','Y','N','N','N','Y','N','N','N'),
	(808,14,'View Available Teachers',0,NULL,'Reports','View unassigned teachers by timetable.','report_viewAvailableTeachers.php','report_viewAvailableTeachers.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(810,9,'Parent Weekly Email Summary',0,NULL,'Reports','This report shows responses to the weekly summary email, organised by calendar week and role group.','report_parentWeeklyEmailSummaryConfirmation.php','report_parentWeeklyEmailSummaryConfirmation.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(812,14,'Manage Facility Changes_allClasses',2,NULL,'Facilities','Allows a user to create and manage one-off location changes for all classes within the timetable.','spaceChange_manage.php,spaceChange_manage_add.php,spaceChange_manage_edit.php,spaceChange_manage_delete.php','spaceChange_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(813,14,'Manage Facility Changes_myClasses',0,NULL,'Facilities','Allows a user to create and manage one-off location changes for their own classes within the timetable.','spaceChange_manage.php,spaceChange_manage_add.php,spaceChange_manage_edit.php,spaceChange_manage_delete.php','spaceChange_manage.php','Y','Y','N','Y','N','N','N','Y','N','N','N'),
	(814,14,'Manage Facility Bookings_allBookings',0,NULL,'Facilities','Allows a user to book a room for on-off use, and manage bookings made by all other users.','spaceBooking_manage.php,spaceBooking_manage_add.php,spaceBooking_manage_edit.php,spaceBooking_manage_delete.php','spaceBooking_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(815,14,'Manage Facility Bookings_myBookings',0,NULL,'Facilities','Allows a user to book a room for on-off use, and manage their own bookings.','spaceBooking_manage.php,spaceBooking_manage_add.php,spaceBooking_manage_edit.php,spaceBooking_manage_delete.php','spaceBooking_manage.php','Y','Y','N','Y','N','N','N','Y','N','N','N'),
	(817,9,'Outcomes By Course',0,NULL,'Outcomes','This view gives an overview of which whole school and learning area outcomes are covered by classes in a given course, allowing for curriculum mapping by outcome and course.','curriculumMapping_outcomesByCourse.php','curriculumMapping_outcomesByCourse.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(818,121,'New Quick Wall Message',0,NULL,'Manage Messages','Allows for the quick posting of a Message Wall message to all users.','messenger_postQuickWall.php','messenger_postQuickWall.php','Y','Y','Y','Y','N','N','Y','Y','Y','Y','N'),
	(820,121,'New Message_transport_any',0,NULL,'Manage Messages','Send messages users by transport field.','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','N','N'),
	(821,121,'New Message_transport_parents',0,NULL,'Manage Messages','Send messages parents of users by transport field.','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','N','N'),
	(822,11,'Archive Records',0,NULL,'Other','Allows for current records to be archived for viewing in the future.','in_archive.php','in_archive.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(823,14,'View Timetable by Person_allYears',3,NULL,'View Timetables','Allows users to view timetables in all school years.','tt.php, tt_view.php','tt.php','Y','Y','Y','N','N','N','N','Y','Y','Y','N'),
	(824,135,'Manage Budgets',0,NULL,'Expenses','Allows users to create, edit and delete budgets.','budgets_manage.php,budgets_manage_add.php,budgets_manage_edit.php,budgets_manage_delete.php','budgets_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(825,135,'Manage Expense Approvers',0,NULL,'Expenses','Determines who can approve expense requests, in accordance to the Expense Approval Type setting in School Admin.','expenseApprovers_manage.php,expenseApprovers_manage_add.php,expenseApprovers_manage_edit.php,expenseApprovers_manage_delete.php','expenseApprovers_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(826,135,'Manage Budget Cycles',0,NULL,'Expenses','Allows a sufficiently priviledged user to create and manage budget cycles.','budgetCycles_manage.php,budgetCycles_manage_add.php,budgetCycles_manage_edit.php,budgetCycles_manage_delete.php','budgetCycles_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(827,135,'My Expense Requests',0,NULL,'Expenses','Allows a user to request expenses from budgets they have access to.','expenseRequest_manage.php,expenseRequest_manage_add.php,expenseRequest_manage_view.php,expenseRequest_manage_reimburse.php','expenseRequest_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(828,135,'Manage Expenses_all',0,NULL,'Expenses','Gives access to full control all expenses across all budgets.','expenses_manage.php, expenses_manage_add.php, expenses_manage_edit.php, expenses_manage_print.php, expenses_manage_approve.php, expenses_manage_view.php','expenses_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(829,135,'Manage Expenses_myBudgets',0,NULL,'Expenses','Gives access to control expenses, according to budget-level access rights.','expenses_manage.php, expenses_manage_edit.php, expenses_manage_print.php, expenses_manage_approve.php, expenses_manage_view.php','expenses_manage.php','Y','Y','N','Y','N','N','Y','Y','N','N','N'),
	(830,3,'Third Party Settings',0,NULL,'Settings','Allows administrators to configure and make use of third party services.','thirdPartySettings.php','thirdPartySettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(831,2,'Public Registration Settings',0,NULL,'Student Management','Gives access to enable and configure public registration.','publicRegistrationSettings.php','publicRegistrationSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(832,3,'Sound Alarm',0,NULL,'Alarm','Allows user to issue a system-wide audio alert to all staff.','alarm.php','alarm.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(833,16,'Manage Internal Assessments',0,NULL,'Internal Assessment','Allows privileged users to create and manage Internal Assessment columns.','internalAssessment_manage.php, internalAssessment_manage_add.php, internalAssessment_manage_edit.php, internalAssessment_manage_delete.php','internalAssessment_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(834,16,'Write Internal Assessments_myClasses',0,NULL,'Internal Assessment','Allows teachers to enter Internal Assessment assessment data to columns in their classes.','internalAssessment_write.php, internalAssessment_write_data.php','internalAssessment_write.php','Y','Y','N','Y','N','N','N','Y','N','N','N'),
	(835,16,'Write Internal Assessments_all',1,NULL,'Internal Assessment','Allows privileged users to enter Internal Assessment assessment data to columns in all classes.','internalAssessment_write.php, internalAssessment_write_data.php','internalAssessment_write.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(836,16,'View Internal Assessments_mine',0,NULL,'Internal Assessment','Allows students to view their own Internal Assessment results.','internalAssessment_view.php','internalAssessment_view.php','Y','Y','N','N','Y','N','N','N','Y','N','N'),
	(837,16,'View Internal Assessments_myChildrens',1,NULL,'Internal Assessment','Allows parents to view their childrens\' Internal Assessment results.','internalAssessment_view.php','internalAssessment_view.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(838,16,'View Internal Assessments_all',2,NULL,'Internal Assessment','Allows staff to see Internal Assessment results for all children.','internalAssessment_view.php','internalAssessment_view.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(839,1,'Manage Facility Settings',0,NULL,'Other','Allows privileged users to manage settings for spaces.','spaceSettings.php','spaceSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(840,119,'View Behaviour Records_myChildren',0,NULL,'Behaviour Records','View behaviour records for students within a family.','behaviour_view.php,behaviour_view_details.php','behaviour_view.php','Y','Y','N','N','N','N','N','N','N','Y','N'),
	(841,14,'View Master Timetable',0,NULL,'View Timetables','Allows a user to see all days, periods, teachers and rooms in a timetable.','tt_master.php','tt_master.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(842,141,'Graphing_all',2,NULL,'Visualise','Allows a user to see progress tracking graphs for all students in school.','graphing.php','graphing.php','N','Y','Y','N','N','N','N','Y','N','N','N'),
	(843,13,'Course Enrolment Rollover',0,NULL,'Courses & Classes','Allows privileged users to move enrolments from the current year to the next year.','course_rollover.php','course_rollover.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(844,2,'Manage Custom Fields',0,NULL,'User Management','Allows a user to create, edit and delete custom fields for users.','userFields.php, userFields_add.php, userFields_edit.php, userFields_delete.php','userFields.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(845,14,'Manage Student Enrolment',0,NULL,'Edit Timetables','Allows a departmental Coordinator or Assistant Coordinator to manage student enrolment within their department.','studentEnrolment_manage.php, studentEnrolment_manage_edit.php, studentEnrolment_manage_edit_edit.php','studentEnrolment_manage.php','Y','Y','N','N','N','N','N','Y','N','N','N'),
	(846,1,'Tracking Settings',0,NULL,'Assess','Allows a user to manage settings for the Tracking module.','trackingSettings.php','trackingSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(847,141,'Data Points',0,NULL,'Analyse','Allows a user to export certain key assessment data points to a spreadsheet.','dataPoints.php','dataPoints.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(848,119,'View Behaviour Letters',0,NULL,'Behaviour Tracking','Allows a user to view automated behaviour letters sent out by the system.','behaviour_letters.php','behaviour_letters.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(849,135,'View Invoices_myChildren',1,NULL,'Billing','Allows parents to view invoices issued to members of their family.','invoices_view.php, invoices_view_print.php','invoices_view.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(850,11,'View Individual Education Plans_myChildren',0,NULL,'Individual Needs','Allows parents to view individual needs plans for members of their family.','iep_view_myChildren.php','iep_view_myChildren.php','Y','Y','N','N','N','N','N','N','N','Y','N'),
	(851,3,'String Replacement',0,NULL,'Settings','Allows for interface strings to be replaced with custom values.','stringReplacement_manage.php, stringReplacement_manage_add.php, stringReplacement_manage_edit.php, stringReplacement_manage_delete.php','stringReplacement_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(852,2,'Import User Photos',0,NULL,'Import','Allows bulk import of user photos based on a ZIP file.','import_userPhotos.php','import_userPhotos.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(853,121,'Canned Response',0,NULL,'Manage Messages','Allows for the creation of message templates.','cannedResponse_manage.php, cannedResponse_manage_add.php, cannedResponse_manage_edit.php, cannedResponse_manage_delete.php','cannedResponse_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(854,136,'Job Openings',0,NULL,'Staff Management','Allows for the creation of job openings, which can be used in the job application form.','jobOpenings_manage.php, jobOpenings_manage_add.php, jobOpenings_manage_edit.php, jobOpenings_manage_delete.php','jobOpenings_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(855,2,'Manage Staff Settings',0,NULL,'User Settings','Controls settings for users with role category Staff.','staffSettings.php,staffSettings_manage_add.php,staffSettings_manage_edit.php,staffSettings_manage_delete.php','staffSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(856,136,'Application Form',0,NULL,'Staff Management','Allows prospective staff to apply for job openings.','applicationForm.php, applicationForm_jobOpenings_view.php','applicationForm.php','Y','Y','Y','Y','N','N','Y','Y','Y','Y','Y'),
	(857,2,'Staff Application Form Settings',0,NULL,'Staff Management','Allows admins to control the staff application form.','staffApplicationFormSettings.php','staffApplicationFormSettings.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(858,136,'Manage Applications',0,NULL,'Staff Management','Allows administrators to view and action staff applications.','applicationForm_manage.php, applicationForm_manage_edit.php, applicationForm_manage_delete.php, applicationForm_manage_accept.php, applicationForm_manage_reject.php','applicationForm_manage.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(859,136,'Manage Staff_confidential',1,NULL,'Staff Management','Edit general and confidential information on members of staff.','staff_manage.php, staff_manage_add.php, staff_manage_edit.php, staff_manage_delete.php, staff_manage_edit_contract_add.php, staff_manage_edit_contract_edit.php, staff_manage_edit_facility_add.php, staff_manage_edit_facility_delete.php','staff_manage.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(860,15,'Enter Activity Attendance',1,NULL,'Attendance','Record student attendance for activities.','activities_attendance.php,activities_attendanceProcess.php','activities_attendance.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(861,15,'Printable Attendance Sheet',1,NULL,'Attendance','Generate a printable attendance sheet for activities.','activities_attendance_sheet.php,activities_attendance_sheetPrint.php','activities_attendance_sheet.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(862,16,'View External Assessments_mine',0,NULL,'External Assessment','Allows a student to view their own external assessment records.','externalAssessment_view.php','externalAssessment_view.php','Y','Y','N','N','N','N','N','N','Y','N','N'),
	(863,16,'View External Assessments_myChildrens',1,NULL,'External Assessment','Allows a parent to view external assessment records for their children.','externalAssessment_view.php','externalAssessment_view.php','Y','Y','N','N','N','N','N','N','N','Y','N'),
	(864,135,'View Invoices_mine',0,NULL,'Billing','Allows a student to view their own invoices.','invoices_view.php, invoices_view_print.php','invoices_view.php','Y','Y','N','N','N','N','N','N','Y','N','N'),
	(865,14,'Manage Facility Changes_myDepartment',1,NULL,'Facilities','Allows a department coordinator to manage changes for all classes in their department.','spaceChange_manage.php,spaceChange_manage_add.php,spaceChange_manage_edit.php,spaceChange_manage_delete.php','spaceChange_manage.php','Y','Y','N','N','N','N','N','Y','N','N','N'),
	(866,121,'New Message_attendance',0,NULL,'Manage Messages','Bulk email by student attendance.','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(868,7,'Manage Weightings_everything',1,NULL,'Markbook','Manage markbook weightings for any class.','weighting_manage.php,weighting_manage_add.php,weighting_manage_edit.php,weighting_manage_delete.php','weighting_manage.php','Y','N','Y','N','N','N','N','Y','N','N','N'),
	(869,7,'Manage Weightings_singleClass',0,NULL,'Markbook','Manage markbook weightings for a single class at a time.','weighting_manage.php,weighting_manage_add.php,weighting_manage_edit.php,weighting_manage_delete.php','weighting_manage.php','Y','N','Y','Y','N','N','N','Y','N','N','N'),
	(870,1,'Manage Dashboard Settings',0,NULL,'Other','Manage settings that control Staff, Student and Parent dashboards.','dashboardSettings.php','dashboardSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(872,3,'Display Settings',0,NULL,'Settings','Allows administrators to configure the system display settings.','displaySettings.php','displaySettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(873,9,'Scope & Sequence',0,NULL,'Curriculum Overview','Allows users to generate scope and sequence documentation for individual courses, based on the Unit Planner.','scopeAndSequence.php','scopeAndSequence.php','N','Y','Y','Y','N','N','N','Y','N','N','N'),
	(874,9,'Concept Explorer',0,NULL,'Curriculum Overview','Allows users to browse and explore concepts and keywords, based on the Unit Planner.','conceptExplorer.php','conceptExplorer.php','N','Y','Y','Y','N','N','N','Y','N','N','N'),
	(875,6,'Attendance By Class',0,NULL,'Take Attendance','Take attendance, one class at a time','attendance_take_byCourseClass.php','attendance_take_byCourseClass.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(876,6,'View Daily Attendance',0,NULL,'Take Attendance','View attendance, by roll group and class','attendance.php','attendance.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(877,1,'Attendance Master',0,NULL,'People','Allows administrators to configure the attendance module.','attendanceSettings.php,attendanceSettings_manage_add.php,attendanceSettings_manage_edit.php,attendanceSettings_manage_delete.php','attendanceSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(878,6,'Classes Not Registered',0,NULL,'Reports','Print a report of classes who have not been registered on a given day','report_courseClassesNotRegistered_byDate.php,report_courseClassesNotRegistered_byDate_print.php','report_courseClassesNotRegistered_byDate.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(879,6,'Manage Attendance Logs',0,NULL,'Take Attendance','Edit student attendance logs.','attendance_take_byPerson_edit.php,attendance_take_byPerson_delete.php','attendance_take_byPerson_edit.php','Y','N','Y','N','N','N','N','Y','N','N','N'),
	(880,6,'Attendance Summary by Date',0,NULL,'Reports','Print a report of student attendace in a given date range','report_summary_byDate.php,report_summary_byDate_print.php','report_summary_byDate.php','Y','Y','Y','Y','N','N','N','Y','N','N','Y'),
	(881,6,'Attendance Trends',0,NULL,'Reports','Display a graph of student attendance types over time','report_graph_byType.php','report_graph_byType.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(882,121,'New Message_cannedResponse',0,NULL,'Manage Messages','Allows user to use pre-defined Canned Responses.','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(883,121,'New Message_readReceipts',0,NULL,'Manage Messages','Allows users to include read receipts in emails.','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(884,5,'First Aid Record',0,NULL,'Medical','Allows user to record first aid visits and actions.','firstAidRecord.php, firstAidRecord_add.php, firstAidRecord_edit.php','firstAidRecord.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(885,5,'View Student Profile_fullNoNotes',2,NULL,'Profiles','View full profile of any student in the school, without access to Notes.','student_view.php,student_view_details.php','student_view.php','Y','Y','N','N','N','N','N','Y','N','N','N'),
	(886,3,'System Check',0,NULL,'Extend & Update','Check system versions and extensions installed.','systemCheck.php','systemCheck.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(887,6,'Student Self Registration',0,NULL,'Take Attendance','Allows students to self register as Present, provided they are within a certain range of IP addresses.','attendance_studentSelfRegister.php','attendance_studentSelfRegister.php','Y','Y','N','N','N','N','N','N','Y','N','N'),
	(888,15,'My Activities_viewEditEnrolment',0,NULL,'Activities','Allows an activity organizer to manage enrolment for their activities.','activities_my.php,activities_my_full.php,activities_manage_enrolment.php,activities_manage_enrolment_add.php,activities_manage_enrolment_edit.php,activities_manage_enrolment_delete.php','activities_my.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(889,15,'Enter Activity Attendance_leader',0,NULL,'Attendance','Record student attendance for activities you organise, coach or assist in.','activities_attendance.php,activities_attendanceProcess.php','activities_attendance.php','Y','Y','Y','Y','N','N','N','Y','Y','N','N'),
	(890,15,'Activity Attendance by Date',0,NULL,'Reports','Record student attendance for activities.','report_attendance_byDate.php,report_attendance_byDate_print.php','report_attendance_byDate.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(891,3,'Notification Settings',0,NULL,'Settings','Manage settings for system notifications.','notificationSettings.php,notificationSettings_manage_edit.php','notificationSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(892,5,'Manage Applications_edit',0,NULL,'Admissions','Allows admins to view and action applications, but not to delete them','applicationForm_manage.php, applicationForm_manage_edit.php, applicationForm_manage_accept.php, applicationForm_manage_reject.php, applicationForm_manage_add.php','applicationForm_manage.php','Y','Y','N','N','N','N','N','Y','N','N','N'),
	(893,6,'Attendance By Roll Group_myGroups',0,NULL,'Take Attendance','Take attendance for a teacher\'s own roll groups','attendance_take_byRollGroup.php','attendance_take_byRollGroup.php','Y','Y','N','N','N','N','Y','Y','N','N','Y'),
	(894,14,'View Timetable by Person_my',1,NULL,'View Timetables','Allows users to view their own timetable','tt.php, tt_view.php','tt.php','Y','Y','N','N','Y','N','N','Y','Y','N','Y'),
	(895,14,'View Timetable by Person_myChildren',0,NULL,'View Timetables','Allows parents to view their children\'s timetable','tt.php, tt_view.php','tt.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(896,5,'View Student Profile_my',1,NULL,'Profiles','Allows students to view their own information','student_view.php, student_view_details.php','student_view.php','Y','Y','N','N','Y','N','N','N','Y','N','N'),
	(897,7,'View Markbook_myClasses',3,NULL,'Profiles','Allows teachers to view their own markbook information','markbook_view.php, markbook_view_full.php','markbook_view.php','Y','Y','N','Y','N','N','N','Y','N','N','Y'),
	(898,5,'Student Enrolment Trends',0,NULL,'Visualise','Provides a visual graph of student enrolment over a range of time.','report_graph_studentEnrolment.php','report_graph_studentEnrolment.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(899,5,'Students by House',0,NULL,'Reports','View a report of student houses by year group.','report_students_byHouse.php','report_students_byHouse.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(900,13,'Sync Course Enrolment',0,NULL,'Courses & Classes','Allows users to map enrolments from homerooms to classes.','courseEnrolment_sync.php,courseEnrolment_sync_add.php,courseEnrolment_sync_edit.php,courseEnrolment_sync_delete.php,courseEnrolment_sync_run.php','courseEnrolment_sync.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(901,6,'Student History_my',1,NULL,'Reports','Allows a student to print a report of their attendance data in the current school year.','report_studentHistory.php','report_studentHistory.php','Y','Y','N','N','N','N','N','N','Y','N','N'),
	(903,15,'Activity Choices by Roll Group',0,NULL,'Reports','View all student activity choices in the current year for a given roll group.','report_activityChoices_byRollGroup.php','report_activityChoices_byRollGroup.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(904,8,'My Data Updates',0,NULL,'Request Updates','Provides an overview of any required data updates for a user, including family data if applicable.','data_updates.php','data_updates.php','Y','Y','Y','Y','N','Y','Y','Y','Y','Y','Y'),
	(905,121,'Manage Groups_all',1,NULL,'Targets','Allows management of custom groups for message targetting','groups_manage.php,groups_manage_add.php,groups_manage_edit.php,groups_manage_delete.php','groups_manage.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(906,121,'Manage Groups_my',0,NULL,'Targets','Allows management of custom groups for message targetting','groups_manage.php,groups_manage_add.php,groups_manage_edit.php,groups_manage_delete.php','groups_manage.php','Y','Y','N','Y','N','N','N','Y','Y','Y','Y'),
	(907,121,'New Message_groups_any',1,NULL,'Manage Messages','Bulk email to any group','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(908,121,'New Message_groups_my',0,NULL,'Manage Messages','Bulk email to any group a user owns or is a member of','messenger_post.php','messenger_post.php','Y','Y','N','Y','N','N','N','Y','Y','Y','Y'),
	(909,121,'New Message_groups_parents',1,NULL,'Manage Messages','Include parents in messages posted to groups','messenger_post.php','messenger_post.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(910,8,'Family Data Updater History',0,NULL,'Reports','Allows users to check, for active families, how recently they have been updated.','report_family_dataUpdaterHistory.php','report_family_dataUpdaterHistory.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(911,2,'Manage Users_edit',0,NULL,'User Management','Allows admin to edit any user within the system, but not to delete them.','user_manage.php, user_manage_add.php, user_manage_edit.php, user_manage_password.php','user_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(912,3,'Import From File',0,NULL,'Import & Export','Allows a user to view and run available imports.','import_manage.php,import_run.php,export_run.php,import_history.php,import_history_view.php','import_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(914,136,'Manage Substitutes',0,NULL,'Staff Management','Edit information for users who can provide staff coverage.','substitutes_manage.php,substitutes_manage_add.php,substitutes_manage_edit.php,substitutes_manage_delete.php,coverage_availability.php','substitutes_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(915,136,'New Absence_mine',0,NULL,'Absences','Allows a user to submit their own staff absences.','absences_add.php','absences_add.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(916,136,'New Absence_any',2,NULL,'Absences','Submit staff absences for any user.','absences_add.php','absences_add.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(917,136,'View Absences_mine',0,NULL,'Absences','Provides an overview of staff absences for the selected user.','absences_view_byPerson.php,absences_view_details.php','absences_view_byPerson.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(918,136,'View Absences_any',2,NULL,'Absences','Provides an overview of staff absences for the selected user.','absences_view_byPerson.php,absences_view_details.php','absences_view_byPerson.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(919,136,'Approve Staff Absences',0,NULL,'Absences','Allows users to approve or decline staff absences.','absences_approval.php,absences_approval_action.php','absences_approval.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(920,136,'Manage Staff Absences',0,NULL,'Absences','Allows administrators to edit and delete staff absences.','absences_manage.php,absences_manage_edit.php,absences_manage_edit_edit.php,absences_manage_delete.php','absences_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(921,11,'Individual Needs Overview',1,NULL,'Reports','Provides a visual graph of individual needs school-wide.','report_graph_overview.php','report_graph_overview.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(922,136,'Request Coverage',0,NULL,'Coverage','Allows a staff member to request coverage for their absences.','coverage_request.php,coverage_view_details.php','coverage_request.php','Y','N','Y','Y','N','N','Y','Y','N','N','Y'),
	(923,136,'My Coverage',0,NULL,'Coverage','Provides an overview of coverage for staff absences.','coverage_my.php,coverage_view_details.php,coverage_availability.php,coverage_view_cancel.php,coverage_view_edit.php','coverage_my.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(924,136,'Open Requests',0,NULL,'Coverage','Users can view and accept any available coverage requests.','coverage_view.php,coverage_view_accept.php,coverage_view_decline.php','coverage_view.php','Y','Y','Y','N','N','N','Y','Y','N','N','Y'),
	(925,136,'Manage Staff Coverage',0,NULL,'Coverage','Allows administrators to manage coverage requests.','coverage_manage.php,coverage_manage_add.php,coverage_manage_edit.php,coverage_manage_delete.php,coverage_view_details.php','coverage_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(926,136,'Staff Absence Summary',0,NULL,'Reports','Provides an overview of staff absences for the school year.','report_absences_summary.php','report_absences_summary.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(927,136,'Weekly Absences',0,NULL,'Reports','A week-by-week overview of staff absences.','report_absences_weekly.php','report_absences_weekly.php','Y','Y','Y','Y','N','N','N','Y','N','N','Y'),
	(928,136,'Substitute Availability',0,NULL,'Coverage','Allows users to view the availability of subs by date.','report_subs_availability.php','report_subs_availability.php','Y','Y','Y','Y','N','N','N','Y','N','N','Y'),
	(935,145,'Manage ATLs_all',0,NULL,'Manage & Assess','Allows privileged users to create and manage ATL columns.','atl_manage.php, atl_manage_add.php, atl_manage_edit.php, atl_manage_delete.php','atl_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(936,145,'Write ATLs_myClasses',0,NULL,'Manage & Assess','Allows teachers to enter ATL assessment data to columns in their classes.','atl_write.php, atl_write_data.php','atl_write.php','Y','Y','N','Y','N','N','N','Y','N','N','N'),
	(937,145,'Write ATLs_all',1,NULL,'Manage & Assess','Allows privileged users to enter ATL assessment data to columns in all classes.','atl_write.php, atl_write_data.php','atl_write.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(938,145,'View ATLs_mine',0,NULL,'View','Allows students to view their own ATL results.','atl_view.php','atl_view.php','Y','Y','N','N','Y','N','N','N','Y','N','N'),
	(939,145,'View ATLs_myChildrens',1,NULL,'View','Allows parents to view their childrens\' ATL results.','atl_view.php','atl_view.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(940,145,'View ATLs_all',2,NULL,'View','Allows staff to see ATL results for all children.','atl_view.php','atl_view.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(972,153,'Manage Alumni',0,NULL,'Admin','Allows privileged users to manage all alumni records.','alumni_manage.php, alumni_manage_add.php, alumni_manage_edit.php, alumni_manage_delete.php','alumni_manage.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(976,155,'Manage Badges',0,NULL,'Manage Badges','Allows a user to define and edit badges.','badges_manage.php, badges_manage_add.php, badges_manage_edit.php, badges_manage_delete.php','badges_manage.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(977,155,'Badge Settings',0,NULL,'Manage Badges','Allows a user to adjust badge settings.','badgeSettings.php','badgeSettings.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(978,155,'Grant Badges',0,NULL,'Manage Badges','Allows a user to give out badges to students.','badges_grant.php, badges_grant_add.php, badges_grant_delete.php','badges_grant.php','Y','Y','Y','N','N','N','N','Y','Y','Y','Y'),
	(979,155,'View Badges_my',0,NULL,'View Badges','Allows a user to view badges that they have been granted.','badges_view.php','badges_view.php','Y','Y','N','N','Y','N','N','Y','Y','N','N'),
	(980,155,'View Badges_myChildren',1,NULL,'View Badges','Allows parents to view badges that have have been granted to their children.','badges_view.php','badges_view.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(981,155,'View Badges_all',2,NULL,'View Badges','Allows a user to view badges that have been granted to any student.','badges_view.php','badges_view.php','Y','Y','Y','Y','N','N','N','Y','Y','Y','Y'),
	(982,155,'Credits & Licenses',0,NULL,'Credits','Allows a user to view image credits for licensed images.','badges_credits.php','badges_credits.php','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),
	(983,155,'View Available Badges',0,NULL,'View Badges','Allows a user to view all available badges.','badges_view_available.php','badges_view_available.php','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'),
	(984,155,'Licenses by Class',0,NULL,'Report','Shows possession of selected license by students in a class.','report_licensesByClass.php','report_licensesByClass.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(985,155,'Licenses by Activity',0,NULL,'Report','Shows possession of selected license by students in an activity.','report_licensesByActivity.php','report_licensesByActivity.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(987,157,'Create Issue',0,NULL,'Issues','Allows the user to submit an issue to be resolved by the help desk staff.','issues_create.php','issues_create.php','Y','Y','Y','Y','Y','N','Y','Y','Y','Y','Y'),
	(988,157,'Issues',0,NULL,'Issues','Gives the user access to the Issues section.','issues_view.php','issues_view.php','N','Y','Y','Y','Y','N','Y','Y','Y','Y','Y'),
	(989,157,'Help Desk Settings',0,NULL,'Admin','Allows the user to edit the settings for the module.','helpDesk_settings.php','helpDesk_settings.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(990,157,'Manage Technicians',0,NULL,'Technician','Allows the user to manage the Technicians.','helpDesk_manageTechnicians.php','helpDesk_manageTechnicians.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(991,157,'Manage Technician Groups',0,NULL,'Technician','Allows the user to manage the Technicians Groups.','helpDesk_manageTechnicianGroup.php','helpDesk_manageTechnicianGroup.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(992,157,'Help Desk Statistics',0,NULL,'Admin','Statistics for the Help Desk.','helpDesk_statistics.php','helpDesk_statistics.php','Y','Y','Y','N','N','N','N','Y','N','N','Y'),
	(993,158,'Manage Institutions',0,NULL,'Admin','Allows admins to manage list of institutions.','institutions_manage.php, institutions_manage_add.php, institutions_manage_edit.php, institutions_manage_delete.php','institutions_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(994,158,'Manage Majors',0,NULL,'Admin','Allows admins to manage list of majors.','majors_manage.php, majors_manage_add.php, majors_manage_edit.php, majors_manage_delete.php','majors_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(995,158,'Manage Staff',2,NULL,'Admin','Allows admins to manage staff roles.','staff_manage.php, staff_manage_add.php, staff_manage_edit.php, staff_manage_delete.php','staff_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(996,158,'Manage Students',0,NULL,'Admin','Allows admins to manage students.','student_manage.php, student_manage_add.php, student_manage_edit.php, student_manage_delete.php','student_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(997,158,'Track Applications',0,NULL,'Applications','Allows users to track their own higher education applications.','applications_track.php, applications_track_add.php,  applications_track_edit.php,  applications_track_delete.php','applications_track.php','Y','Y','N','N','Y','N','N','N','Y','N','N'),
	(998,158,'View Applications',0,NULL,'Applications','Allows staff to view student higher education applications.','applications_view.php, applications_view_details.php','applications_view.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(999,158,'Edit My Reference Notes',0,NULL,'References','Allows students to share some notes with referees, outlining their achievements.','references_myNotes.php','references_myNotes.php','Y','Y','N','N','Y','N','N','N','Y','N','N'),
	(1000,158,'Request References',0,NULL,'References','Allows students to request that a reference be written for them.','references_request.php, references_request_add.php','references_request.php','Y','Y','N','N','Y','N','N','N','Y','N','N'),
	(1001,158,'Manage References',0,NULL,'References','Allows coordinators to see, approve and edit all references.','references_manage.php, references_manage_edit.php, references_manage_delete.php, references_manage_addMulti.php','references_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1002,158,'Write References',0,NULL,'References','Allows teachers to contribute to those references that have been assigned to them.','references_write.php, references_write_edit.php','references_write.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(1003,160,'View Feed',0,NULL,'Feed','Allows a user to view their feed.','feed_view.php','feed_view.php','Y','N','Y','Y','Y','Y','Y','Y','Y','Y','Y'),
	(1021,178,'Campaign',0,NULL,'','','index.php, add.php, edit.php, delete.php, deleteProcess.php, addProcess.php, editProcess.php, deleteseatmatrix.php, addCampaignAjaxForm.php, campaignfor.php, add_wf_transitions.php, ajax_add_wf_transitions.php, transitions.php, transitionsColumnList.php, campaignFluentFields.php, ajax_transitions.php, transitionProcess.php, campaignFormList.php, campaignFormStates.php, check_status.php, formopen.php, campaignFromListSearch.php, transitionsList.php, transitionEditProcess.php, transitionDeleteProcess.php, transitionImportProcess.php, ajax_data.php,fee_setting.php,fee_make_payment.php,email_sms_template.php','index.php','Y','Y','Y','Y','N','N','N','Y','N','N','Y'),
	(1022,2,'Manage Students',0,NULL,'User Management','Allows admin to edit any student within the system, but not to delete them.','students.php, student_add.php, student_edit.php, parent_add.php, parent_edit.php','students.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1023,1,'Program  Master',6,1,'Groupings','Allows admins to create programs.','program_manage.php,program_manage_add.php,program_manage_edit.php,program_manage_delete.php','program_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1024,1,'Mapping',0,6,'Groupings','Allows admins to create mappings for Program, Class , Section.','mapping_manage.php,mapping_manage_add.php,mapping_manage_edit.php,mapping_manage_delete.php','mapping_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1025,135,'Manage Fee Item Type',0,NULL,'Manage','Allows users to create, edit and delete fee item type.','fee_item_type_manage.php,fee_item_type_manage_add.php,fee_item_type_manage_edit.php,fee_item_type_manage_delete.php','fee_item_type_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1026,135,'Manage Fee Item',0,NULL,'Manage','Allows users to create, edit and delete fee item.','fee_item_manage.php,fee_item_manage_add.php,fee_item_manage_edit.php,fee_item_manage_delete.php','fee_item_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1027,135,'Manage Deposit Account',0,NULL,'Manage','Allows users to create, edit and delete Deposit Account.','deposit_account_manage.php,deposit_account_manage_add.php,deposit_account_manage_edit.php,deposit_account_manage_delete.php','deposit_account_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1028,135,'Manage Fee Counter',0,NULL,'Manage','Allows users to create, edit and delete Fee Counter.','fee_counter_manage.php,fee_counter_manage_add.php,fee_counter_manage_edit.php,fee_counter_manage_delete.php','fee_counter_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1029,135,'Manage Fee Series',0,NULL,'Manage','Allows users to create, edit and delete Fee Series.','fee_series_manage.php,fee_series_manage_add.php,fee_series_manage_edit.php,fee_series_manage_delete.php','fee_series_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1030,135,'Manage Fee Head',0,NULL,'Manage','Allows users to create, edit and delete Fee Head.','fee_head_manage.php,fee_head_manage_add.php,fee_head_manage_edit.php,fee_head_manage_delete.php','fee_head_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1031,135,'Manage Fee Fine Rule',0,NULL,'Manage','Allows users to create, edit and delete Fee Fine Rule.','fee_fine_rule_manage.php,fee_fine_rule_manage_add.php,fee_fine_rule_manage_edit.php,fee_fine_rule_manage_delete.php','fee_fine_rule_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1032,135,'Manage Fee Discount Rule',0,NULL,'Manage','Allows users to create, edit and delete Fee Discount Rule.','fee_discount_rule_manage.php,fee_discount_rule_manage_add.php,fee_discount_rule_manage_edit.php,fee_discount_rule_manage_delete.php, fee_discount_rule_manage_copy.php','fee_discount_rule_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1033,135,'Manage Fee Payment Gateway',0,NULL,'Manage','Allows users to create, edit and delete Fee Payment Gateway.','fee_payment_gateway_manage.php,fee_payment_gateway_manage_add.php,fee_payment_gateway_manage_edit.php,fee_payment_gateway_manage_delete.php','fee_payment_gateway_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1034,135,'Fee Structure',0,NULL,'Structure','Allows users to create, edit and delete Fee Payment Gateway.','fee_structure_manage.php,fee_structure_manage_add.php,fee_structure_manage_edit.php,fee_structure_manage_delete.php,fee_structure_manage_copy.php,fee_structure_assign_manage.php,fee_structure_assign_manage_add.php,fee_structure_assign_manage_edit.php,fee_structure_assign_manage_delete.php,fee_structure_assign_student_manage.php,fee_structure_assign_student_manage_add.php,fee_structure_assign_student_manage_edit.php,fee_structure_assign_student_manage_delete.php,fee_structure_assign_student_manage_copy.php,fee_structure_assign_student_manage_massDelete.php','fee_structure_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1037,135,'Manage Invoice',0,NULL,'Payment','Allows users to create, edit and delete Fee Payment Gateway.','invoice_manage.php,invoice_manage_add.php,invoice_manage_edit.php,invoice_manage_delete.php,invoice_manage_copy.php,invoice_assign_manage.php,invoice_assign_manage_add.php,invoice_assign_manage_edit.php,invoice_assign_manage_delete.php,invoice_assign_student_manage_add.php,invoice_assign_student_manage_addProcess.php,invoice_manage_reason_delete.php','invoice_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1038,135,'Manage Payment & Bank',0,NULL,'Manage','Allows users to create, edit and delete Fee Payment Gateway.','fee_master_manage.php,fee_master_manage_add.php,fee_master_manage_edit.php,fee_master_manage_delete.php','fee_master_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1039,135,'Fee Collection',0,NULL,'Payment','Allows users to create, edit and delete Fee Payment Gateway.','fee_collection_manage.php,fee_quick_cash_payment_add.php,fee_counter_check_add.php,fee_payment_history.php','fee_collection_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1040,135,'Fee Transaction',0,NULL,'Payment','Allows users to create, edit and delete Fee Payment Gateway.','fee_transaction_manage.php,fee_transaction_cancel.php,fee_transaction_refund.php','fee_transaction_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1041,135,'Fee Cancel Transaction',0,NULL,'Payment','Allows users to create, edit and delete Fee Payment Gateway.','fee_transaction_cancel_manage.php','fee_transaction_cancel_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1042,135,'Fee Refund Transaction',0,NULL,'Payment','Allows users to create, edit and delete Fee Payment Gateway.','fee_transaction_refund_manage.php','fee_transaction_refund_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1045,179,'Manage Route',0,NULL,'Route','Allows users to create, edit and delete Transport Payment Gateway.','routes.php,transport_route_add.php,transport_route_edit.php,transport_route_delete.php','routes.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(1046,179,'Bus Details',0,NULL,'Bus','Allows users to create, edit and delete,view bus details','bus_manage.php,bus_view_details.php,bus_manage_add.php,bus_manage_addProcess.php,bus_manage_edit.php,bus_manage_editProcess.php,bus_manage_delete.php,','bus_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1047,179,'Assign Student to route',0,NULL,'Route','Allows users to create, edit and delete,view bus details','assign_route.php,assign_route_student_add.php,assign_route_change_student_add.php','assign_route.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1048,179,'Assign Staff to route',0,NULL,'Route','Allows Staff to route','assign_staff_route_manage.php,assign_route_to_staff_add.php,assign_route_change_to_staff_add.php','assign_staff_route_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1049,179,'View Member in route',0,NULL,'Route','View Member in route','view_members_in_route.php,send_route_email_msg.php','view_members_in_route.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1050,179,'Transport Fee',0,NULL,'Route','Transport Fee','transport_fee.php,transport_fee_add.php,transport_fee_edit.php,transport_fee_delete.php,transport_fee_deleteProcess.php,transport_amount_config.php,transport_fee_assign_class.php,transport_fee_assign_student.php,transport_fee_copy.php,transport_fee_assign_manage.php,transport_fee_assign_manage_add.php,transport_fee_assign_manage_edit.php,transport_fee_assign_manage_delete.php,transport_invoice_assign_manage_add.php,transport_invoice_assign_student_manage_add.php,transport_amount_config.php,transport_amount_manage.php,transport_amount_delete.php','transport_fee.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1051,135,'Child Invoices',1,NULL,'Payment','Allows parents to view invoices issued to members of their family.','invoice_child_view.php,invoice_child_pay.php','invoice_child_view.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(1052,136,'Assign Staff To Class and Section',0,NULL,'Assign Staff ','Allows for the creation of job openings, which can be used in the job application form.','assign_staff_toClassSection.php,select_staff_toAssign.php,assign_staff_toClassSectionProcess.php,assign_staff_toClassSection_add.php,remove_assined_staff.php','assign_staff_toClassSection.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1053,136,'Assign Staff To Subject',0,NULL,'Assign subject ','Allows for the creation of job openings, which can be used in the job application form.','assign_Staff_toSubject.php,unassign_staff_toSubject.php,assigned_staff_toStudent_add.php,remove_assigned_staffSub.php,select_staff_sub.php','assign_staff_toSubject.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1054,136,'Assign Student To Staff',0,NULL,'Assign subject ','Allows for the creation of job openings, which can be used in the job application form.','assign_student_toStaff.php,unassign_student_toStaff.php,assigned_student_toStaff_add','assign_student_toStaff.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1055,179,'Student Bus Route',1,NULL,'Transport','Allows parents to view transport details to members of their family.','assign_route_child.php','assign_route_child.php','Y','Y','N','N','N','Y','N','N','N','Y','N'),
	(1058,6,'Attendance Configuration',0,NULL,' Attendance Configur','Allows administrators to configure the attendance module.','attendance_configSettings.php,attendance_configSettings_manage_add.php,attendance_configSettings_manage_edit.php,attendance_configSettings_manage_delete.php','attendance_configSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1059,6,'Block Attendance',0,NULL,'Blocked Attendance','Blocked Attendace','blocked_attendance.php,add_blocked_attendance.php','blocked_attendance.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(1060,6,'Attendance Not Taken',0,NULL,'Reports','Attendance not taken ','attendance_not_taken.php','attendance_not_taken.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(1061,6,'Attendance Not Taken timetable wise',0,NULL,'Reports','Attendance not taken time table wise','attendance_not_taken_timetable_wise.php','attendance_not_taken_timetable_wise.php','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(1062,6,'Attendance Summary Report by Date ',0,NULL,'Reports','Print a report of student attendace in a given date range','attendance_report_by_date.php','attendance_report_by_date.php','Y','Y','Y','Y','N','N','N','Y','N','N','Y'),
	(1063,6,'Attendance Summary by Date & Percentage',0,NULL,'Reports','Print a report of student attendace in a given date range and Percentage','attendance_report_by_date_and_percentage.php','attendance_report_by_date_and_percentage.php','Y','Y','Y','Y','N','N','N','Y','N','N','Y'),
	(1064,6,'Attendance By Subject',0,NULL,'Take Attendance','Take attendance, one Subject at a time','attendance_take_bysubject.php','attendance_take_bysubject.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(1065,6,'Attendance By Person Period Wise',0,NULL,'Take Attendance','Take attendance, one person at a time table wise','attendance_take_byPerson_periodWise.php\r\n','attendance_take_byPerson_periodWise.php\r\n','Y','Y','Y','Y','N','N','Y','Y','N','N','Y'),
	(1066,6,'Attendance By TimeTable',0,NULL,'Take Attendance','Take attendance, one Subject at a time','attendance_take_bySection.php','attendance_take_bySection.php','Y','Y','Y','Y','N','N','N','Y','N','N','N'),
	(1067,180,'Manage Skill ',0,NULL,'Manage Curriculum','Allows user to control the definition of academic curriculum and test within the system','ac_manage_skill.php.ac_manage_skill_edit.php,ac_manage_skill_add.php,ac_manage_skill_delete.php','ac_manage_skill.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1068,180,'Subject To Class',0,NULL,'Manage Curriculum','','subject_to_class_manage.php,subject_to_class_manage_copy.php,subject_to_class_manage_edit.php,subject_to_class_manage_delete.php','subject_to_class_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1069,180,'Manage Remarks',0,NULL,'Manage Curriculum','Allows user to control the definition of academic curriculum and test within the system','ac_manage_remarks.php,ac_manage_remarks_edit.php,ac_manage_remarks_add.php,ac_manage_remarks_delete.php','ac_manage_remarks.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1070,5,' Student Information system',0,NULL,'Profiles','Allows user to control the definition of academic curriculum and test within the system','ac_student_information_system.php,select_student_to_addsubjects.php','ac_student_information_system.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1071,180,'Test Home',0,NULL,'Examination','Allows user to control the definition of Examination and  test within the system','test_home.php,test_home_general_add.php,test_home_edit.php,test_home_delete.php,test_create.php,test_home_copy.php','test_home.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1072,180,'Manage Elective Group',0,NULL,'Manage Curriculum','Allows user to control the definition of academic curriculum and test within the system','manage_elective_group.php,create_elective_group.php,ac_manage_electiveGrp_edit.php,ac_manage_electiveGrp_delete.php,copy_elective_group.php','manage_elective_group.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1073,180,'Manage Grade System',0,NULL,'Examination','Allows user to control the definition of Examination and Grade systemand test within the system','grade_system_manage.php,grade_system_add.php,grade_system_edit.php,grade_system_delete.php,grade_system_configure.php,grade_system_configure_add.php,grade_system_configure_edit.php,grade_system_configure_delete.php','grade_system_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1074,180,'Edit Test',0,NULL,'Examination','Allows user to control the definition of Examination and Edit Test within the system','manage_edit_test.php,modify_test_class_section_wise.php,copy_test_to_sections.php,test_create_with_section.php,test_exam_delete.php','manage_edit_test.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1075,180,'Marks Entry By Subject',0,NULL,'Examination','Allows user to control the definition of Examination and Marks entry By subject  within the system','manage_marks_entry_by_subject.php','manage_marks_entry_by_subject.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1076,180,'Marks Upload',0,NULL,'Examination','Allows user to control the definition of Examination and Test mark Upload within the system','test_marks_upload.php','test_marks_upload.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1077,180,'Test Results',0,NULL,'Examination','Allows user to control the definition of Examination and Test results within the system','manage_test_results.php','manage_test_results.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1078,180,'Marks Not Entered',0,NULL,'Examination','Allows user to control the definition of Examination and Marks Not Entered within the system','marks_not_entered.php','marks_not_entered.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1079,180,'Enter A.A.T',0,NULL,'Examination','Allows user to control the definition of Examination and Enter A.A.T within the system','manage_enter_aat.php','manage_enter_aat.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1080,180,'Manage Test',0,NULL,'Examination','Allows user to control the definition of Examination and  test within the system','manage_test.php,update_manage_test.php','manage_test.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1081,180,'Marks Entry By Student',0,NULL,'Examination','Allows user to control the definition of Examination and  test within the system','marks_by_student.php,entry_marks_byStudent.php','marks_by_student.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1082,180,'Descriptive Indicator Config',0,NULL,'Manage Curriculum','Allows user to control the descriptive indicator configuration','descriptive_indicator_config.php,descriptive_manage_indicator_config.php','descriptive_indicator_config.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1083,1,'Manage Financial Years',0,NULL,'Years, Days & Times','Allows user to control the definition of Financial years within the system','financial_year_manage.php,financial_year_manage_edit.php,financial_year_manage_delete.php,financial_year_manage_add.php','financial_year_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1084,3,'Import Student\'s',0,NULL,'Import & Export','Allows a user to view and run available imports.','import_student_manage.php,import_student_run.php,export_student_run.php','import_student_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1085,136,'Import Staff\'s',0,NULL,'Import & Export','Allows a user to view and run available imports.','import_staff_manage.php,import_staff_run.php,export_staff_run.php','import_staff_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1086,136,'Data Update',0,NULL,'Import & Export','Allows a user to view and update Data','data_update_staff_manage.php,data_update_staff_run.php,data_update_export_staff_run.php','data_update_staff_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1087,5,'Import Student\'s',0,NULL,'Import & Export','Allows a user to view and run available imports.','import_student_manage.php,import_student_run.php,export_student_run.php','import_student_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1088,5,'Data Update',0,NULL,'Import & Export','Allows a user to view and update Data','data_update_student_manage.php,data_update_student_run.php,data_update_export_student_run.php','data_update_student_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1089,3,'Custom Field Settings',0,NULL,'Settings','Allows administrators to configure custom field creation.','customFieldSettings.php','customFieldSettings.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1090,1,'Manage Email & Sms Template',0,NULL,'Other','Manage Email & Sms Template.','email_template_manage.php,email_template_manage_add.php,email_template_manage_edit.php,email_template_manage_delete.php,sms_template_manage.php,sms_template_manage_add.php,sms_template_manage_edit.php,sms_template_manage_delete.php','email_template_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1091,178,'Fee Setting',0,NULL,'Fee settings','Fee setting ','fee_setting.php','fee_setting.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1092,135,'Manage Fee Receipts',0,NULL,'Manage','Allows users to create, edit .','fee_receipts_manage.php','fee_receipts_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1093,180,'Examination Room',0,NULL,'Examination','Allows user to control the Examination Room','examination_room_manage.php,examination_room_manage_add.php,examination_room_manage_edit.php,examination_room_manage_delete.php','examination_room_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1094,180,'Report Template',0,NULL,'Examination','Allows user to control the Examination Report Template','examination_report_template_manage.php,examination_report_template_add.php,examination_report_template_edit.php,examination_report_template_delete.php','examination_report_template_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1095,180,'Sketch Master',0,NULL,'Examination','Allows user to control the Sketch Report Template','sketch_manage.php,sketch_manage_add.php,sketch_manage_edit.php,sketch_manage_delete.php,sketch_manage_attribute.php,sketch_manage_attribute_plugin.php,sketch_manage_plugin.php','sketch_manage.php','Y','Y','Y','N','N','N','N','Y','N','N','N'),
	(1096,6,'Manage Sms Template',0,NULL,' Attendance Configur','Allows administrators to configure the sms attendance module.','manange_sms_template.php\r\nmanange_sms_template_add.php\r\nmanange_sms_template_addProcess.php\r\nmanange_sms_template_edit.php\r\nmanange_sms_template_editProcess.php\r\nmanange_sms_template_delete.php\r\nmanange_sms_template_deleteProcess.php','manange_sms_template.php','Y','Y','Y','N','N','N','N','Y','N','N','N');

/*!40000 ALTER TABLE `pupilsightAction` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightActivity
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightActivity`;

CREATE TABLE `pupilsightActivity` (
  `pupilsightActivityID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL DEFAULT '0',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `registration` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT 'Can a parent/student select this for registration?',
  `name` varchar(40) NOT NULL DEFAULT '',
  `provider` enum('School','External') NOT NULL DEFAULT 'School',
  `type` varchar(255) NOT NULL,
  `pupilsightSchoolYearTermIDList` text NOT NULL,
  `listingStart` date DEFAULT NULL,
  `listingEnd` date DEFAULT NULL,
  `programStart` date DEFAULT NULL,
  `programEnd` date DEFAULT NULL,
  `pupilsightYearGroupIDList` varchar(255) NOT NULL DEFAULT '',
  `maxParticipants` int(3) NOT NULL DEFAULT '0',
  `description` text,
  `payment` decimal(8,2) DEFAULT NULL,
  `paymentType` enum('Entire Programme','Per Session','Per Week','Per Term') DEFAULT 'Entire Programme',
  `paymentFirmness` enum('Finalised','Estimated') DEFAULT 'Finalised',
  PRIMARY KEY (`pupilsightActivityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightActivityAttendance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightActivityAttendance`;

CREATE TABLE `pupilsightActivityAttendance` (
  `pupilsightActivityAttendanceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightActivityID` int(8) unsigned NOT NULL,
  `pupilsightPersonIDTaker` int(10) unsigned NOT NULL,
  `attendance` text NOT NULL,
  `date` date DEFAULT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightActivityAttendanceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightActivitySlot
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightActivitySlot`;

CREATE TABLE `pupilsightActivitySlot` (
  `pupilsightActivitySlotID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightActivityID` int(8) unsigned NOT NULL,
  `pupilsightSpaceID` int(5) unsigned DEFAULT NULL,
  `locationExternal` varchar(50) NOT NULL,
  `pupilsightDaysOfWeekID` int(2) unsigned NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL,
  PRIMARY KEY (`pupilsightActivitySlotID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightActivityStaff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightActivityStaff`;

CREATE TABLE `pupilsightActivityStaff` (
  `pupilsightActivityStaffID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightActivityID` int(8) unsigned NOT NULL DEFAULT '0',
  `pupilsightPersonID` int(10) unsigned NOT NULL DEFAULT '0',
  `role` enum('Organiser','Coach','Assistant','Other') NOT NULL DEFAULT 'Organiser',
  PRIMARY KEY (`pupilsightActivityStaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightActivityStudent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightActivityStudent`;

CREATE TABLE `pupilsightActivityStudent` (
  `pupilsightActivityStudentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightActivityID` int(8) unsigned NOT NULL DEFAULT '0',
  `pupilsightPersonID` int(10) unsigned NOT NULL DEFAULT '0',
  `status` enum('Accepted','Pending','Waiting List','Not Accepted') NOT NULL DEFAULT 'Pending',
  `timestamp` datetime NOT NULL,
  `pupilsightActivityIDBackup` int(8) unsigned DEFAULT NULL,
  `invoiceGenerated` enum('N','Y') NOT NULL DEFAULT 'N',
  `pupilsightFinanceInvoiceID` int(14) unsigned DEFAULT NULL,
  PRIMARY KEY (`pupilsightActivityStudentID`),
  KEY `pupilsightActivityID` (`pupilsightActivityID`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightAlarm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightAlarm`;

CREATE TABLE `pupilsightAlarm` (
  `pupilsightAlarmID` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('General','Lockdown','Custom') DEFAULT NULL,
  `status` enum('Current','Past') NOT NULL DEFAULT 'Past',
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `timestampStart` timestamp NULL DEFAULT NULL,
  `timestampEnd` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightAlarmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightAlarmConfirm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightAlarmConfirm`;

CREATE TABLE `pupilsightAlarmConfirm` (
  `pupilsightAlarmConfirmID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightAlarmID` int(5) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightAlarmConfirmID`),
  UNIQUE KEY `pupilsightAlarmID` (`pupilsightAlarmID`,`pupilsightPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightAlertLevel
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightAlertLevel`;

CREATE TABLE `pupilsightAlertLevel` (
  `pupilsightAlertLevelID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `color` varchar(6) NOT NULL COMMENT 'RGB Hex, no leading #',
  `colorBG` varchar(6) NOT NULL COMMENT 'RGB Hex, no leading #',
  `description` text NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`pupilsightAlertLevelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightApplicationForm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightApplicationForm`;

CREATE TABLE `pupilsightApplicationForm` (
  `pupilsightApplicationFormID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightApplicationFormHash` varchar(40) DEFAULT NULL,
  `surname` varchar(60) NOT NULL DEFAULT '',
  `firstName` varchar(60) NOT NULL DEFAULT '',
  `preferredName` varchar(60) NOT NULL DEFAULT '',
  `officialName` varchar(150) NOT NULL,
  `nameInCharacters` varchar(20) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `username` varchar(20) DEFAULT NULL,
  `status` enum('Pending','Waiting List','Accepted','Rejected','Withdrawn') NOT NULL DEFAULT 'Pending',
  `dob` date DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `homeAddress` mediumtext,
  `homeAddressDistrict` varchar(255) DEFAULT NULL,
  `homeAddressCountry` varchar(255) DEFAULT NULL,
  `phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone1CountryCode` varchar(7) NOT NULL,
  `phone1` varchar(20) NOT NULL,
  `phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone2CountryCode` varchar(7) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `countryOfBirth` varchar(30) NOT NULL,
  `citizenship1` varchar(255) NOT NULL,
  `citizenship1Passport` varchar(30) NOT NULL,
  `nationalIDCardNumber` varchar(30) NOT NULL,
  `residencyStatus` varchar(255) NOT NULL,
  `visaExpiryDate` date DEFAULT NULL,
  `pupilsightSchoolYearIDEntry` int(3) unsigned NOT NULL,
  `pupilsightYearGroupIDEntry` int(3) unsigned NOT NULL,
  `dayType` varchar(255) DEFAULT NULL,
  `referenceEmail` varchar(100) DEFAULT NULL,
  `schoolName1` varchar(50) NOT NULL,
  `schoolAddress1` varchar(255) NOT NULL,
  `schoolGrades1` varchar(20) NOT NULL,
  `schoolLanguage1` varchar(50) NOT NULL,
  `schoolDate1` date DEFAULT NULL,
  `schoolName2` varchar(50) NOT NULL,
  `schoolAddress2` varchar(255) NOT NULL,
  `schoolGrades2` varchar(20) NOT NULL,
  `schoolLanguage2` varchar(50) NOT NULL,
  `schoolDate2` date DEFAULT NULL,
  `pupilsightFamilyID` int(7) unsigned DEFAULT NULL,
  `siblingName1` varchar(50) NOT NULL,
  `siblingDOB1` date DEFAULT NULL,
  `siblingSchool1` varchar(50) NOT NULL,
  `siblingSchoolJoiningDate1` date DEFAULT NULL,
  `siblingName2` varchar(50) NOT NULL,
  `siblingDOB2` date DEFAULT NULL,
  `siblingSchool2` varchar(50) NOT NULL,
  `siblingSchoolJoiningDate2` date DEFAULT NULL,
  `siblingName3` varchar(50) NOT NULL,
  `siblingDOB3` date DEFAULT NULL,
  `siblingSchool3` varchar(50) NOT NULL,
  `siblingSchoolJoiningDate3` date DEFAULT NULL,
  `languageHomePrimary` varchar(30) NOT NULL,
  `languageHomeSecondary` varchar(30) NOT NULL,
  `languageFirst` varchar(30) NOT NULL,
  `languageSecond` varchar(30) NOT NULL,
  `languageThird` varchar(30) NOT NULL,
  `medicalInformation` text NOT NULL,
  `sen` enum('N','Y') DEFAULT NULL,
  `senDetails` text NOT NULL,
  `languageChoice` varchar(100) DEFAULT NULL,
  `languageChoiceExperience` text,
  `scholarshipInterest` enum('N','Y') NOT NULL DEFAULT 'N',
  `scholarshipRequired` enum('N','Y') NOT NULL DEFAULT 'N',
  `payment` enum('Family','Company') NOT NULL DEFAULT 'Family',
  `companyName` varchar(100) DEFAULT NULL,
  `companyContact` varchar(100) DEFAULT NULL,
  `companyAddress` varchar(255) DEFAULT NULL,
  `companyEmail` text,
  `companyCCFamily` enum('N','Y') DEFAULT NULL COMMENT 'When company is billed, should family receive a copy?',
  `companyPhone` varchar(20) DEFAULT NULL,
  `companyAll` enum('Y','N') DEFAULT NULL,
  `pupilsightFinanceFeeCategoryIDList` text,
  `agreement` enum('N','Y') DEFAULT NULL,
  `parent1pupilsightPersonID` int(10) unsigned DEFAULT NULL,
  `parent1title` varchar(5) DEFAULT NULL,
  `parent1surname` varchar(60) DEFAULT '',
  `parent1firstName` varchar(60) DEFAULT '',
  `parent1preferredName` varchar(60) DEFAULT '',
  `parent1officialName` varchar(150) DEFAULT NULL,
  `parent1nameInCharacters` varchar(20) DEFAULT NULL,
  `parent1gender` enum('M','F','Other','Unspecified') DEFAULT 'Unspecified',
  `parent1relationship` varchar(50) DEFAULT NULL,
  `parent1languageFirst` varchar(30) DEFAULT NULL,
  `parent1languageSecond` varchar(30) DEFAULT NULL,
  `parent1citizenship1` varchar(255) DEFAULT NULL,
  `parent1nationalIDCardNumber` varchar(30) DEFAULT NULL,
  `parent1residencyStatus` varchar(255) DEFAULT NULL,
  `parent1visaExpiryDate` date DEFAULT NULL,
  `parent1email` varchar(75) DEFAULT NULL,
  `parent1phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `parent1phone1CountryCode` varchar(7) DEFAULT NULL,
  `parent1phone1` varchar(20) DEFAULT NULL,
  `parent1phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `parent1phone2CountryCode` varchar(7) DEFAULT NULL,
  `parent1phone2` varchar(20) DEFAULT NULL,
  `parent1profession` varchar(30) DEFAULT NULL,
  `parent1employer` varchar(30) DEFAULT NULL,
  `parent2title` varchar(5) DEFAULT NULL,
  `parent2surname` varchar(60) DEFAULT '',
  `parent2firstName` varchar(60) DEFAULT '',
  `parent2preferredName` varchar(60) DEFAULT '',
  `parent2officialName` varchar(150) DEFAULT NULL,
  `parent2nameInCharacters` varchar(20) DEFAULT NULL,
  `parent2gender` enum('M','F','Other','Unspecified') DEFAULT 'Unspecified',
  `parent2relationship` varchar(50) DEFAULT NULL,
  `parent2languageFirst` varchar(30) DEFAULT NULL,
  `parent2languageSecond` varchar(30) DEFAULT NULL,
  `parent2citizenship1` varchar(255) DEFAULT NULL,
  `parent2nationalIDCardNumber` varchar(30) DEFAULT NULL,
  `parent2residencyStatus` varchar(255) DEFAULT NULL,
  `parent2visaExpiryDate` date DEFAULT NULL,
  `parent2email` varchar(75) DEFAULT NULL,
  `parent2phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `parent2phone1CountryCode` varchar(7) DEFAULT NULL,
  `parent2phone1` varchar(20) DEFAULT NULL,
  `parent2phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `parent2phone2CountryCode` varchar(7) DEFAULT NULL,
  `parent2phone2` varchar(20) DEFAULT NULL,
  `parent2profession` varchar(30) DEFAULT NULL,
  `parent2employer` varchar(30) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `priority` int(1) NOT NULL DEFAULT '0',
  `milestones` text NOT NULL,
  `notes` text NOT NULL,
  `dateStart` date DEFAULT NULL,
  `pupilsightRollGroupID` int(5) unsigned DEFAULT NULL,
  `howDidYouHear` varchar(255) DEFAULT NULL,
  `howDidYouHearMore` varchar(255) DEFAULT NULL,
  `paymentMade` enum('N','Y','Exemption') NOT NULL DEFAULT 'N',
  `pupilsightPaymentID` int(14) unsigned DEFAULT NULL,
  `studentID` varchar(10) DEFAULT NULL,
  `privacy` text,
  `fields` text NOT NULL COMMENT 'Serialised array of custom field values',
  `parent1fields` text NOT NULL COMMENT 'Serialised array of custom field values',
  `parent2fields` text NOT NULL COMMENT 'Serialised array of custom field values',
  PRIMARY KEY (`pupilsightApplicationFormID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightApplicationFormFile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightApplicationFormFile`;

CREATE TABLE `pupilsightApplicationFormFile` (
  `pupilsightApplicationFormFileID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightApplicationFormID` int(12) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`pupilsightApplicationFormFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightApplicationFormLink
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightApplicationFormLink`;

CREATE TABLE `pupilsightApplicationFormLink` (
  `pupilsightApplicationFormLinkID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightApplicationFormID1` int(12) unsigned NOT NULL,
  `pupilsightApplicationFormID2` int(12) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightApplicationFormLinkID`),
  UNIQUE KEY `link` (`pupilsightApplicationFormID1`,`pupilsightApplicationFormID2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightApplicationFormRelationship
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightApplicationFormRelationship`;

CREATE TABLE `pupilsightApplicationFormRelationship` (
  `pupilsightApplicationFormRelationshipID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightApplicationFormID` int(12) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `relationship` varchar(50) NOT NULL,
  PRIMARY KEY (`pupilsightApplicationFormRelationshipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightAttendanceBlocked
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightAttendanceBlocked`;

CREATE TABLE `pupilsightAttendanceBlocked` (
  `pupilsightAttendanceBlockID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightRollGroupID` int(5) unsigned NOT NULL,
  `pupilsightYearGroupID` int(3) unsigned NOT NULL,
  `name` varchar(256) CHARACTER SET latin1 NOT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `remark` varchar(512) CHARACTER SET latin1 NOT NULL,
  `pupilsightPersonIDTaker` int(10) unsigned NOT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightAttendanceBlockID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightAttendanceCode
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightAttendanceCode`;

CREATE TABLE `pupilsightAttendanceCode` (
  `pupilsightAttendanceCodeID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `type` enum('Core','Additional') NOT NULL,
  `direction` enum('In','Out') NOT NULL,
  `scope` enum('Onsite','Onsite - Late','Offsite','Offsite - Left') NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `reportable` enum('Y','N') NOT NULL,
  `future` enum('Y','N') NOT NULL,
  `pupilsightRoleIDAll` varchar(90) NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`pupilsightAttendanceCodeID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `nameShort` (`nameShort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightAttendanceLogCourseClass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightAttendanceLogCourseClass`;

CREATE TABLE `pupilsightAttendanceLogCourseClass` (
  `pupilsightAttendanceLogCourseClassID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightCourseClassID` int(8) unsigned NOT NULL,
  `periodID` int(11) DEFAULT NULL,
  `pupilsightPersonIDTaker` int(10) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightAttendanceLogCourseClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightAttendanceLogDepartment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightAttendanceLogDepartment`;

CREATE TABLE `pupilsightAttendanceLogDepartment` (
  `pupilsightAttendanceLogDepartmentID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightRollGroupID` int(5) unsigned NOT NULL,
  `pupilsightDepartmentID` int(4) unsigned NOT NULL,
  `pupilsightTTColumnRowID` int(8) unsigned NOT NULL COMMENT 'period slote id',
  `pupilsightPersonIDTaker` int(10) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightAttendanceLogDepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightAttendanceLogPerson
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightAttendanceLogPerson`;

CREATE TABLE `pupilsightAttendanceLogPerson` (
  `pupilsightAttendanceLogPersonID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightAttendanceCodeID` int(3) unsigned DEFAULT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `direction` enum('In','Out') NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `reason` varchar(30) NOT NULL DEFAULT '',
  `context` enum('Roll Group','Class','Person','Future','Self Registration','Subject') DEFAULT NULL,
  `pupilsightAttendanceLogID` int(5) DEFAULT NULL,
  `session_no` int(5) DEFAULT NULL,
  `periodID` int(20) DEFAULT NULL,
  `comment` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `pupilsightPersonIDTaker` int(10) unsigned NOT NULL,
  `pupilsightCourseClassID` int(8) unsigned DEFAULT NULL,
  `timestampTaken` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightAttendanceLogPersonID`),
  KEY `date` (`date`),
  KEY `pupilsightPersonID` (`pupilsightPersonID`),
  KEY `dateAndPerson` (`date`,`pupilsightPersonID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightAttendanceLogRollGroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightAttendanceLogRollGroup`;

CREATE TABLE `pupilsightAttendanceLogRollGroup` (
  `pupilsightAttendanceLogRollGroupID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightRollGroupID` int(5) unsigned NOT NULL,
  `pupilsightYearGroupID` int(11) NOT NULL,
  `pupilsightDepartmentID` int(20) DEFAULT NULL,
  `session_no` int(11) DEFAULT NULL,
  `pupilsightPersonIDTaker` int(10) unsigned NOT NULL,
  `date` date DEFAULT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightAttendanceLogRollGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightBehaviour
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightBehaviour`;

CREATE TABLE `pupilsightBehaviour` (
  `pupilsightBehaviourID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `date` date NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `type` enum('Positive','Negative') CHARACTER SET utf8 NOT NULL,
  `descriptor` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `level` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `comment` text CHARACTER SET utf8 NOT NULL,
  `followup` text COLLATE utf8_unicode_ci NOT NULL,
  `pupilsightPlannerEntryID` int(14) unsigned DEFAULT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightBehaviourID`),
  KEY `pupilsightPersonID` (`pupilsightPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table pupilsightBehaviourLetter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightBehaviourLetter`;

CREATE TABLE `pupilsightBehaviourLetter` (
  `pupilsightBehaviourLetterID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `letterLevel` enum('1','2','3') NOT NULL,
  `status` enum('Warning','Issued') NOT NULL,
  `recordCountAtCreation` int(3) NOT NULL,
  `body` text NOT NULL,
  `recipientList` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightBehaviourLetterID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightCountry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightCountry`;

CREATE TABLE `pupilsightCountry` (
  `printable_name` varchar(80) NOT NULL,
  `iddCountryCode` varchar(7) NOT NULL,
  PRIMARY KEY (`printable_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightCountry` WRITE;
/*!40000 ALTER TABLE `pupilsightCountry` DISABLE KEYS */;

INSERT INTO `pupilsightCountry` (`printable_name`, `iddCountryCode`)
VALUES
	('Afghanistan','93'),
	('Albania','355'),
	('Algeria','213'),
	('American Samoa','1 684'),
	('Andorra','376'),
	('Angola','244'),
	('Anguilla','1 264'),
	('Antarctica','672'),
	('Antigua and Barbuda','1 268'),
	('Argentina','54'),
	('Armenia','374'),
	('Aruba','297'),
	('Australia','61'),
	('Austria','43'),
	('Azerbaijan','994'),
	('Bahamas','1 242'),
	('Bahrain','973'),
	('Bangladesh','880'),
	('Barbados','1 246'),
	('Belarus','375'),
	('Belgium','32'),
	('Belize','501'),
	('Benin','229'),
	('Bermuda','1 441'),
	('Bhutan','975'),
	('Bolivia','591'),
	('Bosnia and Herzegovina','387'),
	('Botswana','267'),
	('Bouvet Island',''),
	('Brazil','55'),
	('British Indian Ocean Territory',''),
	('Brunei Darussalam',''),
	('Bulgaria','359'),
	('Burkina Faso','226'),
	('Burundi','257'),
	('Cambodia','855'),
	('Cameroon','237'),
	('Canada','1'),
	('Cape Verde','238'),
	('Cayman Islands','1 345'),
	('Central African Republic','236'),
	('Chad','235'),
	('Chile','56'),
	('China','86'),
	('Christmas Island','61'),
	('Cocos (Keeling) Islands','61'),
	('Colombia','57'),
	('Comoros','269'),
	('Congo',''),
	('Congo, the Democratic Republic of the',''),
	('Cook Islands','682'),
	('Costa Rica','506'),
	('Cote D\'Ivoire',''),
	('Croatia','385'),
	('Cuba','53'),
	('Cyprus','357'),
	('Czech Republic','420'),
	('Denmark','45'),
	('Djibouti','253'),
	('Dominica','1 767'),
	('Dominican Republic','1 809'),
	('Ecuador','593'),
	('Egypt','20'),
	('El Salvador','503'),
	('Equatorial Guinea','240'),
	('Eritrea','291'),
	('Estonia','372'),
	('Ethiopia','251'),
	('Falkland Islands (Malvinas)',''),
	('Faroe Islands','298'),
	('Fiji','679'),
	('Finland','358'),
	('France','33'),
	('French Guiana',''),
	('French Polynesia','689'),
	('French Southern Territories',''),
	('Gabon','241'),
	('Gambia','220'),
	('Georgia','995'),
	('Germany','49'),
	('Ghana','233'),
	('Gibraltar','350'),
	('Greece','30'),
	('Greenland','299'),
	('Grenada','1 473'),
	('Guadeloupe',''),
	('Guam','1 671'),
	('Guatemala','502'),
	('Guinea','224'),
	('Guinea-Bissau','245'),
	('Guyana','592'),
	('Haiti','509'),
	('Heard Island and Mcdonald Islands',''),
	('Holy See (Vatican City State)',''),
	('Honduras','504'),
	('Hong Kong','852'),
	('Hungary','36'),
	('Iceland','354'),
	('India','91'),
	('Indonesia','62'),
	('Iran, Islamic Republic of',''),
	('Iraq','964'),
	('Ireland','353'),
	('Israel','972'),
	('Italy','39'),
	('Jamaica','1 876'),
	('Japan','81'),
	('Jordan','962'),
	('Kazakhstan','7'),
	('Kenya','254'),
	('Kiribati','686'),
	('Korea, Democratic People\'s Republic of',''),
	('Korea, Republic of',''),
	('Kuwait','965'),
	('Kyrgyzstan','996'),
	('Lao People\'s Democratic Republic',''),
	('Latvia','371'),
	('Lebanon','961'),
	('Lesotho','266'),
	('Liberia','231'),
	('Libyan Arab Jamahiriya',''),
	('Liechtenstein','423'),
	('Lithuania','370'),
	('Luxembourg','352'),
	('Macao','853'),
	('Macedonia, the Former Yugoslav Republic of',''),
	('Madagascar','261'),
	('Malawi','265'),
	('Malaysia','60'),
	('Maldives','960'),
	('Mali','223'),
	('Malta','356'),
	('Marshall Islands','692'),
	('Martinique',''),
	('Mauritania','222'),
	('Mauritius','230'),
	('Mayotte','262'),
	('Mexico','52'),
	('Micronesia, Federated States of',''),
	('Moldova, Republic of',''),
	('Monaco','377'),
	('Mongolia','976'),
	('Montserrat','1 664'),
	('Morocco','212'),
	('Mozambique','258'),
	('Myanmar','95'),
	('Namibia','264'),
	('Nauru','674'),
	('Nepal','977'),
	('Netherlands','31'),
	('Netherlands Antilles','599'),
	('New Caledonia','687'),
	('New Zealand','64'),
	('Nicaragua','505'),
	('Niger','227'),
	('Nigeria','234'),
	('Niue','683'),
	('Norfolk Island','672'),
	('Northern Mariana Islands','1 670'),
	('Norway','47'),
	('Oman','968'),
	('Pakistan','92'),
	('Palau','680'),
	('Palestinian Territory, Occupied',''),
	('Panama','507'),
	('Papua New Guinea','675'),
	('Paraguay','595'),
	('Peru','51'),
	('Philippines','63'),
	('Pitcairn',''),
	('Poland','48'),
	('Portugal','351'),
	('Puerto Rico','1'),
	('Qatar','974'),
	('Reunion',''),
	('Romania','40'),
	('Russia','7'),
	('Rwanda','250'),
	('Saint Helena','290'),
	('Saint Kitts and Nevis','1 869'),
	('Saint Lucia','1 758'),
	('Saint Pierre and Miquelon','508'),
	('Saint Vincent and the Grenadines','1 784'),
	('Samoa','685'),
	('San Marino','378'),
	('Sao Tome and Principe','239'),
	('Saudi Arabia','966'),
	('Senegal','221'),
	('Serbia and Montenegro',''),
	('Seychelles','248'),
	('Sierra Leone','232'),
	('Singapore','65'),
	('Slovakia','421'),
	('Slovenia','386'),
	('Solomon Islands','677'),
	('Somalia','252'),
	('South Africa','27'),
	('South Georgia and the South Sandwich Islands',''),
	('Spain','34'),
	('Sri Lanka','94'),
	('Sudan','249'),
	('Suriname','597'),
	('Svalbard and Jan Mayen',''),
	('Swaziland','268'),
	('Sweden','46'),
	('Switzerland','41'),
	('Syrian Arab Republic',''),
	('Taiwan','886'),
	('Tajikistan','992'),
	('Tanzania, United Republic of',''),
	('Thailand','66'),
	('Timor-Leste','670'),
	('Togo','228'),
	('Tokelau','690'),
	('Tonga','676'),
	('Trinidad and Tobago','1 868'),
	('Tunisia','216'),
	('Turkey','90'),
	('Turkmenistan','993'),
	('Turks and Caicos Islands','1 649'),
	('Tuvalu','688'),
	('Uganda','256'),
	('Ukraine','380'),
	('United Arab Emirates','971'),
	('United Kingdom','44'),
	('United States','1'),
	('United States Minor Outlying Islands',''),
	('Uruguay','598'),
	('Uzbekistan','998'),
	('Vanuatu','678'),
	('Venezuela','58'),
	('Vietnam','84'),
	('Virgin Islands, British',''),
	('Virgin Islands, U.s.',''),
	('Wallis and Futuna','681'),
	('Western Sahara',''),
	('Yemen','967'),
	('Zambia','260'),
	('Zimbabwe','263');

/*!40000 ALTER TABLE `pupilsightCountry` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightCourse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightCourse`;

CREATE TABLE `pupilsightCourse` (
  `pupilsightCourseID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `pupilsightDepartmentID` int(4) unsigned DEFAULT NULL,
  `name` varchar(60) NOT NULL,
  `nameShort` varchar(12) NOT NULL,
  `description` text NOT NULL,
  `map` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT 'Should this course be included in curriculum maps and other summaries?',
  `pupilsightYearGroupIDList` varchar(255) NOT NULL,
  `orderBy` int(3) NOT NULL,
  PRIMARY KEY (`pupilsightCourseID`),
  UNIQUE KEY `nameYear` (`pupilsightSchoolYearID`,`name`),
  KEY `pupilsightSchoolYearID` (`pupilsightSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightCourseClass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightCourseClass`;

CREATE TABLE `pupilsightCourseClass` (
  `pupilsightCourseClassID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightCourseID` int(8) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `nameShort` varchar(8) NOT NULL,
  `reportable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `attendance` enum('Y','N') NOT NULL DEFAULT 'Y',
  `pupilsightScaleIDTarget` int(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`pupilsightCourseClassID`),
  KEY `pupilsightCourseID` (`pupilsightCourseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightCourseClassMap
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightCourseClassMap`;

CREATE TABLE `pupilsightCourseClassMap` (
  `pupilsightCourseClassMapID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightCourseClassID` int(8) unsigned DEFAULT NULL,
  `pupilsightRollGroupID` int(5) unsigned DEFAULT NULL,
  `pupilsightYearGroupID` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`pupilsightCourseClassMapID`),
  UNIQUE KEY `pupilsightCourseClassID` (`pupilsightCourseClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table pupilsightCourseClassPerson
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightCourseClassPerson`;

CREATE TABLE `pupilsightCourseClassPerson` (
  `pupilsightCourseClassPersonID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightCourseClassID` int(8) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `role` enum('Student','Teacher','Assistant','Technician','Parent','Student - Left','Teacher - Left') NOT NULL,
  `reportable` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`pupilsightCourseClassPersonID`),
  KEY `pupilsightCourseClassID` (`pupilsightCourseClassID`),
  KEY `pupilsightPersonID` (`pupilsightPersonID`,`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightCrowdAssessDiscuss
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightCrowdAssessDiscuss`;

CREATE TABLE `pupilsightCrowdAssessDiscuss` (
  `pupilsightCrowdAssessDiscussID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPlannerEntryHomeworkID` int(16) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text NOT NULL,
  `pupilsightCrowdAssessDiscussIDReplyTo` int(16) unsigned DEFAULT NULL,
  PRIMARY KEY (`pupilsightCrowdAssessDiscussID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightDaysOfWeek
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightDaysOfWeek`;

CREATE TABLE `pupilsightDaysOfWeek` (
  `pupilsightDaysOfWeekID` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `sequenceNumber` int(2) NOT NULL,
  `schoolDay` enum('Y','N') NOT NULL DEFAULT 'Y',
  `schoolOpen` time DEFAULT NULL,
  `schoolStart` time DEFAULT NULL,
  `schoolEnd` time DEFAULT NULL,
  `schoolClose` time DEFAULT NULL,
  PRIMARY KEY (`pupilsightDaysOfWeekID`),
  UNIQUE KEY `name` (`name`,`nameShort`),
  UNIQUE KEY `nameShort` (`nameShort`),
  UNIQUE KEY `sequenceNumber` (`sequenceNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightDaysOfWeek` WRITE;
/*!40000 ALTER TABLE `pupilsightDaysOfWeek` DISABLE KEYS */;

INSERT INTO `pupilsightDaysOfWeek` (`pupilsightDaysOfWeekID`, `name`, `nameShort`, `sequenceNumber`, `schoolDay`, `schoolOpen`, `schoolStart`, `schoolEnd`, `schoolClose`)
VALUES
	(1,'Monday','Mon',1,'Y','07:45:00','08:00:00','15:30:00','17:00:00'),
	(2,'Tuesday','Tue',2,'Y','07:45:00','08:00:00','15:30:00','17:00:00'),
	(3,'Wednesday','Wed',3,'Y','07:45:00','08:00:00','15:30:00','17:00:00'),
	(4,'Thursday','Thu',4,'Y','07:45:00','08:00:00','15:30:00','17:00:00'),
	(5,'Friday','Fri',5,'Y','07:45:00','08:00:00','15:30:00','17:00:00'),
	(6,'Saturday','Sat',6,'N',NULL,NULL,NULL,NULL),
	(7,'Sunday','Sun',7,'N',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `pupilsightDaysOfWeek` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightDepartment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightDepartment`;

CREATE TABLE `pupilsightDepartment` (
  `pupilsightDepartmentID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Learning Area','Administration','Part A','Part B','Scholastic','Co-Scholastic') NOT NULL DEFAULT 'Learning Area',
  `name` varchar(40) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `subjectListing` varchar(255) NOT NULL,
  `blurb` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  PRIMARY KEY (`pupilsightDepartmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightDepartmentResource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightDepartmentResource`;

CREATE TABLE `pupilsightDepartmentResource` (
  `pupilsightDepartmentResourceID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightDepartmentID` int(4) unsigned NOT NULL,
  `type` enum('Link','File') NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`pupilsightDepartmentResourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightDepartmentStaff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightDepartmentStaff`;

CREATE TABLE `pupilsightDepartmentStaff` (
  `pupilsightDepartmentStaffID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightDepartmentID` int(4) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `role` enum('Coordinator','Assistant Coordinator','Teacher (Curriculum)','Teacher','Director','Manager','Administrator','Other') NOT NULL,
  PRIMARY KEY (`pupilsightDepartmentStaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightDepartmentType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightDepartmentType`;

CREATE TABLE `pupilsightDepartmentType` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

LOCK TABLES `pupilsightDepartmentType` WRITE;
/*!40000 ALTER TABLE `pupilsightDepartmentType` DISABLE KEYS */;

INSERT INTO `pupilsightDepartmentType` (`id`, `name`)
VALUES
	(6,'Administration'),
	(2,'Co-Scholastic'),
	(5,'Learning Area'),
	(3,'Part A'),
	(4,'Part B'),
	(1,'Scholastic');

/*!40000 ALTER TABLE `pupilsightDepartmentType` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightDistrict
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightDistrict`;

CREATE TABLE `pupilsightDistrict` (
  `pupilsightDistrictID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`pupilsightDistrictID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightExternalAssessment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightExternalAssessment`;

CREATE TABLE `pupilsightExternalAssessment` (
  `pupilsightExternalAssessmentID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `nameShort` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `website` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `allowFileUpload` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`pupilsightExternalAssessmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightExternalAssessmentField
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightExternalAssessmentField`;

CREATE TABLE `pupilsightExternalAssessmentField` (
  `pupilsightExternalAssessmentFieldID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightExternalAssessmentID` int(4) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `order` int(4) NOT NULL,
  `pupilsightScaleID` int(5) unsigned NOT NULL,
  `pupilsightYearGroupIDList` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pupilsightExternalAssessmentFieldID`),
  KEY `pupilsightExternalAssessmentID` (`pupilsightExternalAssessmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightExternalAssessmentStudent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightExternalAssessmentStudent`;

CREATE TABLE `pupilsightExternalAssessmentStudent` (
  `pupilsightExternalAssessmentStudentID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightExternalAssessmentID` int(4) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `attachment` varchar(255) NOT NULL,
  PRIMARY KEY (`pupilsightExternalAssessmentStudentID`),
  KEY `pupilsightExternalAssessmentID` (`pupilsightExternalAssessmentID`),
  KEY `pupilsightPersonID` (`pupilsightPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightExternalAssessmentStudentEntry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightExternalAssessmentStudentEntry`;

CREATE TABLE `pupilsightExternalAssessmentStudentEntry` (
  `pupilsightExternalAssessmentStudentEntryID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightExternalAssessmentStudentID` int(12) unsigned NOT NULL,
  `pupilsightExternalAssessmentFieldID` int(6) unsigned NOT NULL,
  `pupilsightScaleGradeID` int(7) unsigned DEFAULT NULL COMMENT 'Key for the actual grade achieved',
  PRIMARY KEY (`pupilsightExternalAssessmentStudentEntryID`),
  KEY `pupilsightExternalAssessmentStudentID` (`pupilsightExternalAssessmentStudentID`),
  KEY `pupilsightExternalAssessmentFieldID` (`pupilsightExternalAssessmentFieldID`),
  KEY `pupilsightScaleGradeID` (`pupilsightScaleGradeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFamily
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFamily`;

CREATE TABLE `pupilsightFamily` (
  `pupilsightFamilyID` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `nameAddress` varchar(255) DEFAULT NULL COMMENT 'The formal name to be used for addressing the family (e.g. Mr. & Mrs. Smith)',
  `homeAddress` mediumtext,
  `homeAddressDistrict` varchar(255) DEFAULT NULL,
  `homeAddressCountry` varchar(255) DEFAULT NULL,
  `status` enum('Married','Separated','Divorced','De Facto','Other') DEFAULT NULL,
  `languageHomePrimary` varchar(30) DEFAULT NULL,
  `languageHomeSecondary` varchar(30) DEFAULT NULL,
  `familySync` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pupilsightFamilyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFamilyAdult
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFamilyAdult`;

CREATE TABLE `pupilsightFamilyAdult` (
  `pupilsightFamilyAdultID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightFamilyID` int(7) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `comment` text,
  `childDataAccess` enum('Y','N') DEFAULT NULL,
  `contactPriority` int(2) DEFAULT '1',
  `contactCall` enum('Y','N') DEFAULT NULL,
  `contactSMS` enum('Y','N') DEFAULT NULL,
  `contactEmail` enum('Y','N') DEFAULT NULL,
  `contactMail` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`pupilsightFamilyAdultID`),
  KEY `pupilsightFamilyID` (`pupilsightFamilyID`,`contactPriority`),
  KEY `pupilsightPersonIndex` (`pupilsightPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFamilyChild
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFamilyChild`;

CREATE TABLE `pupilsightFamilyChild` (
  `pupilsightFamilyChildID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightFamilyID` int(7) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `comment` text,
  PRIMARY KEY (`pupilsightFamilyChildID`),
  KEY `pupilsightPersonIndex` (`pupilsightPersonID`),
  KEY `pupilsightFamilyIndex` (`pupilsightFamilyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFamilyRelationship
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFamilyRelationship`;

CREATE TABLE `pupilsightFamilyRelationship` (
  `pupilsightFamilyRelationshipID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightFamilyID` int(7) unsigned NOT NULL,
  `pupilsightPersonID1` int(10) unsigned NOT NULL,
  `pupilsightPersonID2` int(10) unsigned NOT NULL,
  `relationship` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pupilsightFamilyRelationshipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Person 1 is [relationship] to person 2?';



# Dump of table pupilsightFamilyUpdate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFamilyUpdate`;

CREATE TABLE `pupilsightFamilyUpdate` (
  `pupilsightFamilyUpdateID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned DEFAULT NULL,
  `status` enum('Pending','Complete') NOT NULL DEFAULT 'Pending',
  `pupilsightFamilyID` int(7) unsigned NOT NULL,
  `nameAddress` varchar(100) NOT NULL DEFAULT '',
  `homeAddress` mediumtext NOT NULL,
  `homeAddressDistrict` varchar(255) NOT NULL DEFAULT '',
  `homeAddressCountry` varchar(255) NOT NULL DEFAULT '',
  `languageHomePrimary` varchar(30) NOT NULL,
  `languageHomeSecondary` varchar(30) NOT NULL,
  `pupilsightPersonIDUpdater` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightFamilyUpdateID`),
  KEY `pupilsightFamilyIndex` (`pupilsightFamilyID`,`pupilsightSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFileExtension
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFileExtension`;

CREATE TABLE `pupilsightFileExtension` (
  `pupilsightFileExtensionID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Document','Spreadsheet','Presentation','Graphics/Design','Video','Audio','Other') NOT NULL DEFAULT 'Other',
  `extension` varchar(7) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`pupilsightFileExtensionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceBillingSchedule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceBillingSchedule`;

CREATE TABLE `pupilsightFinanceBillingSchedule` (
  `pupilsightFinanceBillingScheduleID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `invoiceIssueDate` date DEFAULT NULL,
  `invoiceDueDate` date DEFAULT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `pupilsightPersonIDUpdate` int(10) unsigned DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightFinanceBillingScheduleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceBudget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceBudget`;

CREATE TABLE `pupilsightFinanceBudget` (
  `pupilsightFinanceBudgetID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(8) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `category` varchar(255) NOT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `pupilsightPersonIDUpdate` int(10) unsigned DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightFinanceBudgetID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `nameShort` (`nameShort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceBudgetCycle
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceBudgetCycle`;

CREATE TABLE `pupilsightFinanceBudgetCycle` (
  `pupilsightFinanceBudgetCycleID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(7) NOT NULL,
  `status` enum('Past','Current','Upcoming') NOT NULL DEFAULT 'Upcoming',
  `dateStart` date NOT NULL,
  `dateEnd` date NOT NULL,
  `sequenceNumber` int(6) NOT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `pupilsightPersonIDUpdate` int(10) unsigned DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightFinanceBudgetCycleID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceBudgetCycleAllocation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceBudgetCycleAllocation`;

CREATE TABLE `pupilsightFinanceBudgetCycleAllocation` (
  `pupilsightFinanceBudgetCycleAllocationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightFinanceBudgetID` int(4) unsigned NOT NULL,
  `pupilsightFinanceBudgetCycleID` int(6) unsigned NOT NULL,
  `value` decimal(14,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`pupilsightFinanceBudgetCycleAllocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceBudgetPerson
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceBudgetPerson`;

CREATE TABLE `pupilsightFinanceBudgetPerson` (
  `pupilsightFinanceBudgetPersonID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightFinanceBudgetID` int(4) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `access` enum('Full','Write','Read') NOT NULL,
  PRIMARY KEY (`pupilsightFinanceBudgetPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceExpense
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceExpense`;

CREATE TABLE `pupilsightFinanceExpense` (
  `pupilsightFinanceExpenseID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightFinanceBudgetID` int(4) unsigned NOT NULL,
  `pupilsightFinanceBudgetCycleID` int(6) unsigned NOT NULL,
  `title` varchar(60) NOT NULL,
  `body` text NOT NULL,
  `status` enum('Requested','Approved','Rejected','Cancelled','Ordered','Paid') NOT NULL,
  `cost` decimal(12,2) NOT NULL,
  `countAgainstBudget` enum('Y','N') NOT NULL DEFAULT 'Y',
  `purchaseBy` enum('School','Self') NOT NULL DEFAULT 'School',
  `purchaseDetails` text NOT NULL,
  `paymentMethod` enum('Cash','Cheque','Credit Card','Bank Transfer','Other') DEFAULT NULL,
  `paymentDate` date DEFAULT NULL,
  `paymentAmount` decimal(12,2) DEFAULT NULL,
  `pupilsightPersonIDPayment` int(10) unsigned DEFAULT NULL,
  `paymentID` varchar(100) DEFAULT NULL,
  `paymentReimbursementReceipt` varchar(255) NOT NULL,
  `paymentReimbursementStatus` enum('Requested','Complete') DEFAULT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statusApprovalBudgetCleared` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`pupilsightFinanceExpenseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceExpenseApprover
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceExpenseApprover`;

CREATE TABLE `pupilsightFinanceExpenseApprover` (
  `pupilsightFinanceExpenseApproverID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `sequenceNumber` int(4) DEFAULT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `pupilsightPersonIDUpdate` int(10) unsigned DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightFinanceExpenseApproverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceExpenseLog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceExpenseLog`;

CREATE TABLE `pupilsightFinanceExpenseLog` (
  `pupilsightFinanceExpenseLogID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightFinanceExpenseID` int(14) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action` enum('Request','Approval - Partial - Budget','Approval - Partial - School','Approval - Final','Approval - Exempt','Rejection','Cancellation','Order','Payment','Reimbursement Request','Reimbursement Completion','Comment') NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`pupilsightFinanceExpenseLogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceFee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceFee`;

CREATE TABLE `pupilsightFinanceFee` (
  `pupilsightFinanceFeeID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `nameShort` varchar(6) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `pupilsightFinanceFeeCategoryID` int(4) unsigned NOT NULL,
  `fee` decimal(12,2) NOT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `pupilsightPersonIDUpdate` int(10) unsigned DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightFinanceFeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceFeeCategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceFeeCategory`;

CREATE TABLE `pupilsightFinanceFeeCategory` (
  `pupilsightFinanceFeeCategoryID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nameShort` varchar(6) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `pupilsightPersonIDUpdate` int(10) unsigned DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightFinanceFeeCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceInvoice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceInvoice`;

CREATE TABLE `pupilsightFinanceInvoice` (
  `pupilsightFinanceInvoiceID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `pupilsightFinanceInvoiceeID` int(10) unsigned NOT NULL,
  `invoiceTo` enum('Family','Company') NOT NULL DEFAULT 'Family',
  `billingScheduleType` enum('Scheduled','Ad Hoc') NOT NULL DEFAULT 'Ad Hoc',
  `separated` enum('N','Y') DEFAULT NULL COMMENT 'Has this invoice been separated from its schedule in pupilsightFinanceBillingSchedule? Only applies to scheduled invoices. Separation takes place during invoice issueing.',
  `pupilsightFinanceBillingScheduleID` int(6) unsigned DEFAULT NULL,
  `status` enum('Pending','Issued','Paid','Paid - Partial','Cancelled','Refunded') NOT NULL DEFAULT 'Pending',
  `pupilsightFinanceFeeCategoryIDList` text,
  `invoiceIssueDate` date DEFAULT NULL,
  `invoiceDueDate` date DEFAULT NULL,
  `paidDate` date DEFAULT NULL,
  `paidAmount` decimal(13,2) DEFAULT NULL COMMENT 'The current running total amount paid to this invoice',
  `pupilsightPaymentID` int(14) unsigned DEFAULT NULL,
  `reminderCount` int(3) NOT NULL DEFAULT '0',
  `notes` text NOT NULL,
  `key` varchar(40) NOT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` timestamp NULL DEFAULT NULL,
  `pupilsightPersonIDUpdate` int(10) unsigned DEFAULT NULL,
  `timestampUpdate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightFinanceInvoiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceInvoicee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceInvoicee`;

CREATE TABLE `pupilsightFinanceInvoicee` (
  `pupilsightFinanceInvoiceeID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `invoiceTo` enum('Family','Company') NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `companyContact` varchar(100) DEFAULT NULL,
  `companyAddress` varchar(255) DEFAULT NULL,
  `companyEmail` text,
  `companyCCFamily` enum('N','Y') DEFAULT NULL COMMENT 'When company is billed, should family receive a copy?',
  `companyPhone` varchar(20) DEFAULT NULL,
  `companyAll` enum('Y','N') DEFAULT NULL COMMENT 'Should company pay all invoices?.',
  `pupilsightFinanceFeeCategoryIDList` text COMMENT 'If companyAll is N, list category IDs for campany to pay here.',
  PRIMARY KEY (`pupilsightFinanceInvoiceeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceInvoiceeUpdate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceInvoiceeUpdate`;

CREATE TABLE `pupilsightFinanceInvoiceeUpdate` (
  `pupilsightFinanceInvoiceeUpdateID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned DEFAULT NULL,
  `status` enum('Pending','Complete') NOT NULL DEFAULT 'Pending',
  `pupilsightFinanceInvoiceeID` int(10) unsigned NOT NULL,
  `invoiceTo` enum('Family','Company') NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `companyContact` varchar(100) DEFAULT NULL,
  `companyAddress` varchar(255) DEFAULT NULL,
  `companyEmail` text,
  `companyCCFamily` enum('N','Y') DEFAULT NULL COMMENT 'When company is billed, should family receive a copy?',
  `companyPhone` varchar(20) DEFAULT NULL,
  `companyAll` enum('Y','N') DEFAULT NULL COMMENT 'Should company pay all invoices?.',
  `pupilsightFinanceFeeCategoryIDList` text COMMENT 'If companyAll is N, list category IDs for campany to pay here.',
  `pupilsightPersonIDUpdater` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightFinanceInvoiceeUpdateID`),
  KEY `pupilsightInvoiceeIndex` (`pupilsightFinanceInvoiceeID`,`pupilsightSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFinanceInvoiceFee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFinanceInvoiceFee`;

CREATE TABLE `pupilsightFinanceInvoiceFee` (
  `pupilsightFinanceInvoiceFeeID` int(15) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightFinanceInvoiceID` int(14) unsigned NOT NULL,
  `feeType` enum('Standard','Ad Hoc') NOT NULL DEFAULT 'Ad Hoc',
  `pupilsightFinanceFeeID` int(6) unsigned DEFAULT NULL,
  `separated` enum('N','Y') DEFAULT NULL COMMENT 'Has this fee been separated from its parent in pupilsightFinanceFee? Only applies to Standard fees. Separation takes place during invoice issueing.',
  `name` varchar(100) DEFAULT NULL,
  `description` text,
  `pupilsightFinanceFeeCategoryID` int(4) unsigned DEFAULT NULL,
  `fee` decimal(12,2) DEFAULT NULL,
  `sequenceNumber` int(10) DEFAULT NULL,
  PRIMARY KEY (`pupilsightFinanceInvoiceFeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightFirstAid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightFirstAid`;

CREATE TABLE `pupilsightFirstAid` (
  `pupilsightFirstAidID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonIDPatient` int(10) unsigned NOT NULL,
  `pupilsightCourseClassID` int(8) unsigned DEFAULT NULL,
  `pupilsightPersonIDFirstAider` int(10) unsigned NOT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `description` text NOT NULL,
  `actionTaken` text NOT NULL,
  `followUp` text NOT NULL,
  `date` date NOT NULL,
  `timeIn` time NOT NULL,
  `timeOut` time DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightFirstAidID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightGroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightGroup`;

CREATE TABLE `pupilsightGroup` (
  `pupilsightGroupID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonIDOwner` int(10) unsigned NOT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `timestampCreated` timestamp NULL DEFAULT NULL,
  `timestampUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightGroupPerson
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightGroupPerson`;

CREATE TABLE `pupilsightGroupPerson` (
  `pupilsightGroupPersonID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightGroupID` int(8) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightGroupPersonID`),
  UNIQUE KEY `pupilsightGroupID` (`pupilsightGroupID`,`pupilsightPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightHook
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightHook`;

CREATE TABLE `pupilsightHook` (
  `pupilsightHookID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` enum('Public Home Page','Student Profile','Parental Dashboard','Staff Dashboard','Student Dashboard') DEFAULT NULL,
  `options` text NOT NULL,
  `pupilsightModuleID` int(4) unsigned NOT NULL COMMENT 'The module which installed this hook.',
  PRIMARY KEY (`pupilsightHookID`),
  UNIQUE KEY `name` (`name`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightHouse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightHouse`;

CREATE TABLE `pupilsightHouse` (
  `pupilsightHouseID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(10) NOT NULL,
  `logo` varchar(255) NOT NULL,
  PRIMARY KEY (`pupilsightHouseID`),
  UNIQUE KEY `name` (`name`,`nameShort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsighti18n
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsighti18n`;

CREATE TABLE `pupilsighti18n` (
  `pupilsighti18nID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `version` varchar(10) DEFAULT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `installed` enum('Y','N') NOT NULL DEFAULT 'N',
  `systemDefault` enum('Y','N') NOT NULL DEFAULT 'N',
  `dateFormat` varchar(20) NOT NULL,
  `dateFormatRegEx` text NOT NULL,
  `dateFormatPHP` varchar(20) NOT NULL,
  `rtl` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`pupilsighti18nID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsighti18n` WRITE;
/*!40000 ALTER TABLE `pupilsighti18n` DISABLE KEYS */;

INSERT INTO `pupilsighti18n` (`pupilsighti18nID`, `code`, `name`, `version`, `active`, `installed`, `systemDefault`, `dateFormat`, `dateFormatRegEx`, `dateFormatPHP`, `rtl`)
VALUES
	(1,'en_GB','English - United Kingdom',NULL,'Y','N','Y','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(2,'en_US','English - United States',NULL,'Y','N','N','mm/dd/yyyy','/(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20\\d\\d)/','m/d/Y','N'),
	(3,'es_ES','Espa',NULL,'Y','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(4,'zh_CN','?? - ??',NULL,'Y','N','N','yyyy-mm-dd','/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/','Y-m-d','N'),
	(5,'zh_HK','?? - ??',NULL,'Y','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(7,'pl_PL','J?zyk polski - Polska',NULL,'Y','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\\\d\\\\d$/i','d/m/Y','N'),
	(8,'it_IT','Italiano - Italia',NULL,'Y','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(10,'id_ID','Bahasa Indonesia - Indonesia',NULL,'N','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(11,'ar_SA','??????? - ??????? ??????? ????????',NULL,'Y','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','Y'),
	(12,'fr_FR','Fran',NULL,'Y','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(13,'ur_PK','??????? - ??????',NULL,'Y','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','Y'),
	(14,'sw_KE','Swahili',NULL,'N','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(15,'pt_PT','Portugu',NULL,'N','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(16,'ro_RO','Rom',NULL,'Y','N','N','dd.mm.yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d.m.Y','N'),
	(17,'ja_JP','???',NULL,'N','N','N','yyyy-mm-dd','/^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/','Y-m-d','N'),
	(18,'ru_RU','??????? ????',NULL,'N','N','N','dd.mm.yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d.m.Y','N'),
	(19,'uk_UA','?????????? ????',NULL,'N','N','N','dd.mm.yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d.m.Y','N'),
	(20,'bn_BD','?????',NULL,'N','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(21,'da_DK','Dansk - Danmark',NULL,'N','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(22,'fa_IR','?????',NULL,'N','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','Y'),
	(23,'pt_BR','Portugu',NULL,'Y','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(24,'ka_GE','??????? ???',NULL,'N','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(25,'nl_NL','Dutch - Nederland',NULL,'Y','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(26,'hu_HU','Magyar - Magyarorsz',NULL,'N','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(27,'bg_BG','????????? ????',NULL,'N','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(28,'ko_KP','??? - ????',NULL,'N','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(29,'fi_FI','Suomen Kieli - Suomi',NULL,'N','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(30,'de_DE','Deutsch - Deutschland',NULL,'N','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(31,'in_OR','????? - ??????',NULL,'N','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(32,'no_NO','Norsk - Norge',NULL,'N','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(33,'vi_VN','Ti?ng Vi?t - Vi?t Nam',NULL,'Y','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(34,'sq_AL','Shqip - Shqip',NULL,'Y','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(35,'th_TH','??????? - ??????????????',NULL,'Y','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(36,'el_GR','???????? - ??????',NULL,'N','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[-](0[1-9]|1[012])[-](19|20)\\d\\d$/i','d-m-Y','N'),
	(37,'am_ET','???? - ?????',NULL,'N','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(38,'om_ET','Afaan Oromo - Ethiopia',NULL,'N','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(39,'hr_HR','Hrvatski - Hrvatska',NULL,'Y','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(40,'et_EE','Eesti Keel - Eesti',NULL,'N','N','N','dd/mm/yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d/m/Y','N'),
	(41,'he_IL','????? - ?????',NULL,'Y','N','N','dd.mm.yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d.m.Y','Y'),
	(42,'tr_TR','T',NULL,'Y','N','N','dd.mm.yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d.m.Y','N'),
	(43,'my_MM','?????? - ??????',NULL,'N','N','N','dd-mm-yyyy','/^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\\d\\d$/i','d-m-Y','N');

/*!40000 ALTER TABLE `pupilsighti18n` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightIN
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightIN`;

CREATE TABLE `pupilsightIN` (
  `pupilsightINID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `strategies` text NOT NULL,
  `targets` text NOT NULL,
  `notes` text NOT NULL,
  PRIMARY KEY (`pupilsightINID`),
  UNIQUE KEY `pupilsightPersonID` (`pupilsightPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightINArchive
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightINArchive`;

CREATE TABLE `pupilsightINArchive` (
  `pupilsightINArchiveID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `strategies` text NOT NULL,
  `targets` text NOT NULL,
  `notes` text NOT NULL,
  `descriptors` text NOT NULL COMMENT 'Serialised array of descriptors.',
  `archiveTitle` varchar(50) NOT NULL,
  `archiveTimestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightINArchiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightINAssistant
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightINAssistant`;

CREATE TABLE `pupilsightINAssistant` (
  `pupilsightINAssistantID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonIDStudent` int(10) unsigned NOT NULL,
  `pupilsightPersonIDAssistant` int(10) unsigned NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pupilsightINAssistantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table pupilsightINDescriptor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightINDescriptor`;

CREATE TABLE `pupilsightINDescriptor` (
  `pupilsightINDescriptorID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `nameShort` varchar(5) NOT NULL,
  `description` text NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`pupilsightINDescriptorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightINPersonDescriptor
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightINPersonDescriptor`;

CREATE TABLE `pupilsightINPersonDescriptor` (
  `pupilsightINPersonDescriptorID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `pupilsightINDescriptorID` int(3) unsigned NOT NULL,
  `pupilsightAlertLevelID` int(3) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightINPersonDescriptorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightInternalAssessmentColumn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightInternalAssessmentColumn`;

CREATE TABLE `pupilsightInternalAssessmentColumn` (
  `pupilsightInternalAssessmentColumnID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightCourseClassID` int(8) unsigned NOT NULL,
  `groupingID` int(8) unsigned DEFAULT NULL COMMENT 'A value used to group multiple columns.',
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `type` varchar(50) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `attainment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `pupilsightScaleIDAttainment` int(5) unsigned DEFAULT NULL,
  `effort` enum('Y','N') NOT NULL DEFAULT 'Y',
  `pupilsightScaleIDEffort` int(5) unsigned DEFAULT NULL,
  `comment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `uploadedResponse` enum('N','Y') NOT NULL DEFAULT 'N',
  `complete` enum('N','Y') NOT NULL,
  `completeDate` date DEFAULT NULL,
  `viewableStudents` enum('N','Y') NOT NULL,
  `viewableParents` enum('N','Y') NOT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `pupilsightPersonIDLastEdit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightInternalAssessmentColumnID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightInternalAssessmentEntry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightInternalAssessmentEntry`;

CREATE TABLE `pupilsightInternalAssessmentEntry` (
  `pupilsightInternalAssessmentEntryID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightInternalAssessmentColumnID` int(10) unsigned NOT NULL,
  `pupilsightPersonIDStudent` int(10) unsigned NOT NULL,
  `attainmentValue` varchar(10) DEFAULT NULL,
  `attainmentDescriptor` varchar(100) DEFAULT NULL,
  `effortValue` varchar(10) DEFAULT NULL,
  `effortDescriptor` varchar(100) DEFAULT NULL,
  `comment` text,
  `response` text,
  `pupilsightPersonIDLastEdit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightInternalAssessmentEntryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightLanguage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightLanguage`;

CREATE TABLE `pupilsightLanguage` (
  `pupilsightLanguageID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`pupilsightLanguageID`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightLanguage` WRITE;
/*!40000 ALTER TABLE `pupilsightLanguage` DISABLE KEYS */;

INSERT INTO `pupilsightLanguage` (`pupilsightLanguageID`, `name`)
VALUES
	(1,'Afrikaans'),
	(2,'Albanian'),
	(3,'Arabic'),
	(4,'Armenian'),
	(5,'Basque'),
	(6,'Bengali'),
	(7,'Bulgarian'),
	(8,'Catalan'),
	(9,'Cambodian'),
	(10,'Chinese (Mandarin)'),
	(11,'Chinese (Cantonese)'),
	(12,'Croatian'),
	(13,'Czech'),
	(14,'Danish'),
	(15,'Dutch'),
	(16,'English'),
	(17,'Estonian'),
	(18,'Fijian'),
	(19,'Finnish'),
	(20,'French'),
	(21,'Georgian'),
	(22,'German'),
	(23,'Greek'),
	(24,'Gujarati'),
	(25,'Hebrew'),
	(26,'Hindi'),
	(27,'Hungarian'),
	(28,'Icelandic'),
	(29,'Indonesian'),
	(30,'Irish'),
	(31,'Italian'),
	(32,'Japanese'),
	(33,'Javanese'),
	(34,'Korean'),
	(35,'Latin'),
	(36,'Latvian'),
	(37,'Lithuanian'),
	(38,'Macedonian'),
	(39,'Malay'),
	(40,'Malayalam'),
	(41,'Maltese'),
	(42,'Maori'),
	(43,'Marathi'),
	(44,'Mongolian'),
	(45,'Nepali'),
	(46,'Norwegian'),
	(47,'Persian'),
	(48,'Polish'),
	(49,'Portuguese'),
	(50,'Punjabi'),
	(51,'Quechua'),
	(52,'Romanian'),
	(53,'Russian'),
	(54,'Samoan'),
	(55,'Serbian'),
	(56,'Slovak'),
	(57,'Slovenian'),
	(58,'Spanish'),
	(59,'Swahili'),
	(60,'Swedish'),
	(61,'Tamil'),
	(62,'Tatar'),
	(63,'Telugu'),
	(64,'Thai'),
	(65,'Tibetan'),
	(66,'Tongan'),
	(67,'Turkish'),
	(68,'Ukrainian'),
	(69,'Urdu'),
	(70,'Uzbek'),
	(71,'Vietnamese'),
	(72,'Welsh'),
	(73,'Xhosa'),
	(74,'Odia'),
	(75,'Myanmar'),
	(76,'Burmese'),
	(77,'Filipino'),
	(78,'Sinhala');

/*!40000 ALTER TABLE `pupilsightLanguage` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightLibraryItem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightLibraryItem`;

CREATE TABLE `pupilsightLibraryItem` (
  `pupilsightLibraryItemID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightLibraryTypeID` int(5) unsigned NOT NULL,
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Name for book, model for computer, etc.',
  `producer` varchar(255) NOT NULL COMMENT 'Author for book, manufacturer for computer, etc',
  `fields` text NOT NULL,
  `vendor` varchar(100) NOT NULL,
  `purchaseDate` date DEFAULT NULL,
  `invoiceNumber` varchar(50) NOT NULL,
  `imageType` enum('','Link','File') NOT NULL DEFAULT '' COMMENT 'Type of image. Image should be 240px x 240px, or smaller.',
  `imageLocation` varchar(255) NOT NULL COMMENT 'URL or local FS path of image.',
  `comment` text NOT NULL,
  `pupilsightSpaceID` int(5) unsigned DEFAULT NULL,
  `locationDetail` varchar(255) NOT NULL,
  `ownershipType` enum('School','Individual') NOT NULL DEFAULT 'School',
  `pupilsightPersonIDOwnership` int(10) unsigned DEFAULT NULL COMMENT 'If owned by school, then this is the main user. If owned by individual, then this is that individual.',
  `pupilsightDepartmentID` int(4) unsigned DEFAULT NULL COMMENT 'Who is responsible for managing this item? By default this will be the person who added the record, but it can be changed.',
  `replacement` enum('Y','N') NOT NULL DEFAULT 'Y',
  `replacementCost` decimal(10,2) DEFAULT NULL,
  `pupilsightSchoolYearIDReplacement` int(3) unsigned DEFAULT NULL,
  `physicalCondition` enum('','As New','Lightly Worn','Moderately Worn','Damaged','Unusable') NOT NULL,
  `bookable` enum('N','Y') NOT NULL DEFAULT 'N',
  `borrowable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `status` enum('Available','In Use','Decommissioned','Lost','On Loan','Repair','Reserved') NOT NULL DEFAULT 'Available' COMMENT 'The current status of the item.',
  `pupilsightPersonIDStatusResponsible` int(10) unsigned DEFAULT NULL COMMENT 'The person who is responsible for the current status.',
  `pupilsightPersonIDStatusRecorder` int(10) unsigned DEFAULT NULL COMMENT 'The person who recored the current status.',
  `timestampStatus` datetime DEFAULT NULL COMMENT 'The time the status was recorded',
  `returnExpected` date DEFAULT NULL COMMENT 'The time when the event expires.',
  `returnAction` enum('Make Available','Decommission','Repair','Reserve') DEFAULT NULL COMMENT 'What to do when the item is returned?',
  `pupilsightPersonIDReturnAction` int(10) unsigned DEFAULT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` datetime NOT NULL,
  `pupilsightPersonIDUpdate` int(10) unsigned DEFAULT NULL,
  `timestampUpdate` datetime DEFAULT NULL,
  PRIMARY KEY (`pupilsightLibraryItemID`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightLibraryItemEvent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightLibraryItemEvent`;

CREATE TABLE `pupilsightLibraryItemEvent` (
  `pupilsightLibraryItemEventID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightLibraryItemID` int(10) unsigned NOT NULL,
  `type` enum('Decommission','Loss','Loan','Repair','Reserve','Other') NOT NULL DEFAULT 'Other' COMMENT 'This is maintained even after the item is returned, so we know what type of event it was.',
  `status` enum('Available','Decommissioned','Lost','On Loan','Repair','Reserved','Returned') NOT NULL DEFAULT 'Available',
  `pupilsightPersonIDStatusResponsible` int(10) unsigned DEFAULT NULL COMMENT 'The person who was responsible for the event.',
  `pupilsightPersonIDOut` int(10) unsigned DEFAULT NULL COMMENT 'The person who recored the event.',
  `timestampOut` datetime DEFAULT NULL COMMENT 'The time the event was recorded',
  `returnExpected` date DEFAULT NULL COMMENT 'The time when the event expires.',
  `returnAction` enum('Make Available','Decommission','Repair','Reserve') DEFAULT NULL COMMENT 'What to do when the item is returned?',
  `pupilsightPersonIDReturnAction` int(10) unsigned DEFAULT NULL,
  `timestampReturn` datetime DEFAULT NULL,
  `pupilsightPersonIDIn` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pupilsightLibraryItemEventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightLibraryType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightLibraryType`;

CREATE TABLE `pupilsightLibraryType` (
  `pupilsightLibraryTypeID` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `fields` text NOT NULL,
  PRIMARY KEY (`pupilsightLibraryTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightLog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightLog`;

CREATE TABLE `pupilsightLog` (
  `pupilsightLogID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightModuleID` int(4) unsigned DEFAULT NULL,
  `pupilsightPersonID` int(10) unsigned DEFAULT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(50) NOT NULL,
  `serialisedArray` text,
  `ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`pupilsightLogID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightMarkbookColumn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightMarkbookColumn`;

CREATE TABLE `pupilsightMarkbookColumn` (
  `pupilsightMarkbookColumnID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightCourseClassID` int(8) unsigned NOT NULL,
  `pupilsightHookID` int(4) unsigned DEFAULT NULL,
  `pupilsightUnitID` int(10) unsigned DEFAULT NULL,
  `pupilsightPlannerEntryID` int(14) unsigned DEFAULT NULL,
  `pupilsightSchoolYearTermID` int(5) unsigned DEFAULT NULL,
  `groupingID` int(8) unsigned DEFAULT NULL COMMENT 'A value used to group multiple markbook columns.',
  `type` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `date` date DEFAULT NULL,
  `sequenceNumber` int(3) unsigned NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL,
  `attainment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `pupilsightScaleIDAttainment` int(5) unsigned DEFAULT NULL,
  `attainmentWeighting` decimal(5,2) DEFAULT NULL,
  `attainmentRaw` enum('Y','N') NOT NULL DEFAULT 'N',
  `attainmentRawMax` decimal(8,2) DEFAULT NULL,
  `effort` enum('Y','N') NOT NULL DEFAULT 'Y',
  `pupilsightScaleIDEffort` int(5) unsigned DEFAULT NULL,
  `pupilsightRubricIDAttainment` int(8) unsigned DEFAULT NULL,
  `pupilsightRubricIDEffort` int(8) unsigned DEFAULT NULL,
  `comment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `uploadedResponse` enum('Y','N') NOT NULL DEFAULT 'Y',
  `complete` enum('N','Y') NOT NULL,
  `completeDate` date DEFAULT NULL,
  `viewableStudents` enum('N','Y') NOT NULL,
  `viewableParents` enum('N','Y') NOT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `pupilsightPersonIDLastEdit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightMarkbookColumnID`),
  KEY `pupilsightCourseClassID` (`pupilsightCourseClassID`),
  KEY `completeDate` (`completeDate`),
  KEY `complete` (`complete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightMarkbookEntry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightMarkbookEntry`;

CREATE TABLE `pupilsightMarkbookEntry` (
  `pupilsightMarkbookEntryID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightMarkbookColumnID` int(10) unsigned NOT NULL,
  `pupilsightPersonIDStudent` int(10) unsigned NOT NULL,
  `modifiedAssessment` enum('N','Y') DEFAULT NULL,
  `attainmentValue` varchar(10) DEFAULT NULL,
  `attainmentValueRaw` varchar(10) DEFAULT NULL,
  `attainmentDescriptor` varchar(100) DEFAULT NULL,
  `attainmentConcern` enum('N','Y','P') DEFAULT NULL COMMENT '''P'' denotes that student has exceed their personal target',
  `effortValue` varchar(10) DEFAULT NULL,
  `effortDescriptor` varchar(100) DEFAULT NULL,
  `effortConcern` enum('N','Y') DEFAULT NULL,
  `comment` text,
  `response` varchar(255) DEFAULT NULL,
  `pupilsightPersonIDLastEdit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightMarkbookEntryID`),
  KEY `pupilsightPersonIDStudent` (`pupilsightPersonIDStudent`),
  KEY `pupilsightMarkbookColumnID` (`pupilsightMarkbookColumnID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightMarkbookTarget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightMarkbookTarget`;

CREATE TABLE `pupilsightMarkbookTarget` (
  `pupilsightMarkbookTargetID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightCourseClassID` int(8) unsigned NOT NULL,
  `pupilsightPersonIDStudent` int(10) unsigned NOT NULL,
  `pupilsightScaleGradeID` int(7) unsigned DEFAULT NULL,
  PRIMARY KEY (`pupilsightMarkbookTargetID`),
  UNIQUE KEY `coursePerson` (`pupilsightCourseClassID`,`pupilsightPersonIDStudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightMarkbookWeight
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightMarkbookWeight`;

CREATE TABLE `pupilsightMarkbookWeight` (
  `pupilsightMarkbookWeightID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightCourseClassID` int(8) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `reportable` enum('Y','N') NOT NULL DEFAULT 'Y',
  `calculate` enum('term','year') NOT NULL DEFAULT 'year',
  `weighting` decimal(5,2) NOT NULL,
  PRIMARY KEY (`pupilsightMarkbookWeightID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightMedicalCondition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightMedicalCondition`;

CREATE TABLE `pupilsightMedicalCondition` (
  `pupilsightMedicalConditionID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`pupilsightMedicalConditionID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightMessenger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightMessenger`;

CREATE TABLE `pupilsightMessenger` (
  `pupilsightMessengerID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `email` enum('N','Y') NOT NULL DEFAULT 'N',
  `messageWall` enum('N','Y') NOT NULL DEFAULT 'N',
  `messageWall_date1` date DEFAULT NULL,
  `messageWall_date2` date DEFAULT NULL,
  `messageWall_date3` date DEFAULT NULL,
  `sms` enum('N','Y') NOT NULL DEFAULT 'N',
  `subject` varchar(60) NOT NULL,
  `attachment` varchar(2560) DEFAULT NULL,
  `body` text NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `emailReport` text NOT NULL,
  `emailReceipt` enum('N','Y') DEFAULT NULL,
  `emailReceiptText` text,
  `smsReport` text NOT NULL,
  PRIMARY KEY (`pupilsightMessengerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightMessengerCannedResponse
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightMessengerCannedResponse`;

CREATE TABLE `pupilsightMessengerCannedResponse` (
  `pupilsightMessengerCannedResponseID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(30) NOT NULL,
  `body` text NOT NULL,
  `timestampCreator` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightMessengerCannedResponseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightMessengerReceipt
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightMessengerReceipt`;

CREATE TABLE `pupilsightMessengerReceipt` (
  `pupilsightMessengerReceiptID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightMessengerID` int(12) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned DEFAULT NULL,
  `targetType` enum('Class','Course','Roll Group','Year Group','Activity','Role','Applicants','Individuals','Houses','Role Category','Transport','Attendance','Group') COLLATE utf8_unicode_ci NOT NULL,
  `targetID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `contactType` enum('Email','SMS') COLLATE utf8_unicode_ci DEFAULT NULL,
  `contactDetail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmedTimestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightMessengerReceiptID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table pupilsightMessengerTarget
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightMessengerTarget`;

CREATE TABLE `pupilsightMessengerTarget` (
  `pupilsightMessengerTargetID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightMessengerID` int(12) unsigned NOT NULL,
  `type` enum('Class','Course','Roll Group','Year Group','Activity','Role','Applicants','Individuals','Houses','Role Category','Transport','Attendance','Group') DEFAULT NULL,
  `id` varchar(30) NOT NULL,
  `parents` enum('N','Y') NOT NULL DEFAULT 'N',
  `students` enum('N','Y') NOT NULL DEFAULT 'N',
  `staff` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`pupilsightMessengerTargetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightModule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightModule`;

CREATE TABLE `pupilsightModule` (
  `pupilsightModuleID` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT 'This number is assigned at install, and is only unique to the installation',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT 'This name should be globally unique preferably, but certainly locally unique',
  `description` text NOT NULL,
  `entryURL` varchar(255) NOT NULL DEFAULT 'index.php',
  `type` enum('Core','Additional') NOT NULL DEFAULT 'Core',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `category` varchar(255) NOT NULL,
  `version` varchar(6) NOT NULL,
  `author` varchar(40) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`pupilsightModuleID`),
  UNIQUE KEY `pupilsightModuleName` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightModule` WRITE;
/*!40000 ALTER TABLE `pupilsightModule` DISABLE KEYS */;

INSERT INTO `pupilsightModule` (`pupilsightModuleID`, `name`, `description`, `entryURL`, `type`, `active`, `category`, `version`, `author`, `url`)
VALUES
	(1,'School Admin','Allows administrators to configure school settings.','schoolYear_manage.php','Core','Y','Admin','','pupilsight','http://www.pupilsight.in'),
	(2,'User Admin','Allows administrators to manage users.','user_manage.php','Core','Y','Admin','','pupilsight','http://www.pupilsight.in'),
	(3,'System Admin','Allows administrators to configure system settings.','systemSettings.php','Core','Y','Admin','','pupilsight','http://www.pupilsight.in'),
	(4,'Departments','View details within a department','departments.php','Core','Y','Learn','','pupilsight','http://www.pupilsight.in'),
	(5,'Students','Allows users to view student data','student_view.php','Core','Y','People','','pupilsight','http://www.pupilsight.in'),
	(6,'Attendance','School attendance taking','attendance.php','Core','Y','Attendance','','pupilsight','http://www.pupilsight.in'),
	(7,'Markbook','A system for keeping track of marks','markbook_view.php','Core','Y','Assess','','pupilsight','http://www.pupilsight.in'),
	(8,'Data Updater','Allow users to update their family\'s data','data_updates.php','Core','Y','People','','pupilsight','http://www.pupilsight.in'),
	(9,'Planner','Supports lesson planning and information sharing for staff, student and parents','planner.php','Core','Y','Learn','','pupilsight','http://www.pupilsight.in'),
	(11,'Individual Needs','Individual Needs','in_view.php','Core','Y','Learn','','pupilsight','http://www.pupilsight.in'),
	(12,'Crowd Assessment','Allows users to assess each other\'s work','crowdAssess.php','Core','Y','Assess','','pupilsight','http://www.pupilsight.in'),
	(13,'Timetable Admin','Timetable administration','tt.php','Core','Y','TimeTable','','pupilsight','http://www.pupilsight.in'),
	(14,'Timetable','Allows users to view timetables','tt.php','Core','Y','Learn','','pupilsight','http://www.pupilsight.in'),
	(15,'Activities','Run a school activities program','activities_view.php','Core','Y','Learn','','pupilsight','http://www.pupilsight.in'),
	(16,'Formal Assessment','Facilitates tracking of student performance in external examinations.','externalAssessment.php','Core','Y','Assess','','pupilsight','http://www.pupilsight.in'),
	(119,'Behaviour','Tracking Student Behaviour','behaviour_manage.php','Core','Y','People','','pupilsight','http://www.pupilsight.in'),
	(121,'Messenger','Unified messenger for email, message wall and more.','messenger_manage.php','Core','Y','Communication','','pupilsight','http://www.pupilsight.in'),
	(126,'Rubrics','Allows users to create rubrics for assessment','rubrics.php','Core','Y','Assess','','pupilsight','http://www.pupilsight.in'),
	(130,'Library','Allows the management of a catalog from which items can be borrowed.','library_manage_catalog.php','Core','Y','Learn','','pupilsight','http://www.pupilsight.in'),
	(135,'Finance','Allows a school to issue invoices and track payments.','fee_structure_manage.php','Core','Y','Finance','','pupilsight','http://www.pupilsight.in'),
	(136,'Staff','Allows users to view staff information','staff_view.php','Core','Y','People','','pupilsight','http://www.pupilsight.in'),
	(137,'Roll Groups','Allows users to view a listing of roll groups','rollGroups.php','Core','Y','People','','pupilsight','http://www.pupilsight.in'),
	(141,'Tracking','Provides visual graphing of student progress, as recorded in the Markbook and Internal Assessment.','graphing.php','Core','Y','Assess','','pupilsight','http://www.pupilsight.in'),
	(145,'ATL','The ATL module allows schools to run a program of Approaches To Learning assessments, based on a rubric.','atl_write.php','Additional','Y','Assess','1.4.09','pupilsight','http://www.pupilsight.in'),
	(153,'Alumni','The Alumni module allows schools to accept alumni registrations, and then link these to existing user accounts.','alumni_manage.php','Additional','Y','People','0.6.00','pupilsight','http://rossparker.org/free-learning'),
	(155,'Badges','The Badges module allows a school to define and assign a range of badges or awards to users. Badges recognise, for example, student progress, staff professional development or parent involvement in school life.','badges_view.php','Additional','Y','Assess','2.6.00','pupilsight','http://rossparker.org'),
	(157,'Help Desk','A virtual help desk module for Pupilsight.','issues_view.php','Additional','Y','Other','1.1.04','pupilsight','https://github.com/raynichc/helpdesk'),
	(158,'Higher Education','A module to support students as they undertake the higher education application process.','index.php','Additional','Y','Other','1.0','pupilsight','http://rossparker.org'),
	(159,'Moodle','A module to support support Moodle Integration. This module has no actions and is not seen by users, it just alters the database.','','Additional','Y','LMS','1.0.04','pupilsight','http://rossparker.org'),
	(160,'Feed','Offers a unified feed of latest posts from student and class websites to staff, parent and student dashboards.','feed_view.php','Additional','Y','Other','1.0.05','pupilsight','http://rossparker.org'),
	(178,'Campaign','Admission Module','index.php','Additional','Y','Admission','18.0.0','','http://www.pupilsight.in'),
	(179,'Transport','Transport Module','index.php','Additional','Y','Transport','18.0.0','','http://www.pupilsight.in'),
	(180,'Academics','Academics Module','department_manage.php','Additional','Y','Academics','18.0.0','','http://www.pupilsight.in');

/*!40000 ALTER TABLE `pupilsightModule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightNotification
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightNotification`;

CREATE TABLE `pupilsightNotification` (
  `pupilsightNotificationID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `status` enum('New','Archived') NOT NULL DEFAULT 'New',
  `pupilsightModuleID` int(4) unsigned DEFAULT NULL,
  `count` int(4) NOT NULL DEFAULT '1',
  `text` text NOT NULL,
  `actionLink` varchar(255) NOT NULL COMMENT 'Relative to absoluteURL, start with a forward slash',
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`pupilsightNotificationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightNotificationEvent
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightNotificationEvent`;

CREATE TABLE `pupilsightNotificationEvent` (
  `pupilsightNotificationEventID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `event` varchar(90) NOT NULL,
  `moduleName` varchar(30) NOT NULL,
  `actionName` varchar(50) NOT NULL,
  `type` enum('Core','Additional','CLI') NOT NULL DEFAULT 'Core',
  `scopes` varchar(255) NOT NULL DEFAULT 'All',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`pupilsightNotificationEventID`),
  UNIQUE KEY `event` (`event`,`moduleName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightNotificationListener
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightNotificationListener`;

CREATE TABLE `pupilsightNotificationListener` (
  `pupilsightNotificationListenerID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightNotificationEventID` int(6) unsigned DEFAULT NULL,
  `pupilsightPersonID` int(10) unsigned DEFAULT NULL,
  `scopeType` varchar(30) DEFAULT NULL,
  `scopeID` int(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`pupilsightNotificationListenerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightOutcome
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightOutcome`;

CREATE TABLE `pupilsightOutcome` (
  `pupilsightOutcomeID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `nameShort` varchar(14) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `scope` enum('School','Learning Area') NOT NULL,
  `pupilsightDepartmentID` int(4) unsigned DEFAULT NULL,
  `pupilsightYearGroupIDList` varchar(255) NOT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightOutcomeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPayment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPayment`;

CREATE TABLE `pupilsightPayment` (
  `pupilsightPaymentID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `foreignTable` varchar(50) NOT NULL,
  `foreignTableID` int(14) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned DEFAULT NULL COMMENT 'Person recording the transaction',
  `type` enum('Online','Bank Transfer','Cash','Cheque','Other','Credit Card') NOT NULL DEFAULT 'Online',
  `status` enum('Complete','Partial','Final','Failure') NOT NULL DEFAULT 'Complete' COMMENT 'Complete means paid in one go, partial is part of a set of payments, and final is last in a set of payments.',
  `amount` decimal(13,2) NOT NULL,
  `gateway` enum('Paypal') DEFAULT NULL,
  `onlineTransactionStatus` enum('Success','Failure') DEFAULT NULL,
  `paymentToken` varchar(50) DEFAULT NULL,
  `paymentPayerID` varchar(50) DEFAULT NULL,
  `paymentTransactionID` varchar(50) DEFAULT NULL,
  `paymentReceiptID` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightPaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPermission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPermission`;

CREATE TABLE `pupilsightPermission` (
  `permissionID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightRoleID` int(3) unsigned NOT NULL,
  `pupilsightActionID` int(7) unsigned NOT NULL,
  PRIMARY KEY (`permissionID`),
  KEY `pupilsightRoleID` (`pupilsightRoleID`),
  KEY `pupilsightActionID` (`pupilsightActionID`)
) ENGINE=InnoDB AUTO_INCREMENT=57783 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightPermission` WRITE;
/*!40000 ALTER TABLE `pupilsightPermission` DISABLE KEYS */;

INSERT INTO `pupilsightPermission` (`permissionID`, `pupilsightRoleID`, `pupilsightActionID`)
VALUES
	(53609,1,719),
	(53611,1,606),
	(53613,1,608),
	(53619,1,764),
	(53620,1,765),
	(53621,4,765),
	(53622,6,765),
	(53624,1,773),
	(53625,1,774),
	(53626,4,774),
	(53627,6,774),
	(53629,1,586),
	(53630,4,64),
	(53631,1,585),
	(53632,4,14),
	(53633,6,14),
	(53673,1,630),
	(53674,2,629),
	(53675,1,624),
	(53676,1,623),
	(53677,2,623),
	(53678,1,625),
	(53679,2,625),
	(53680,1,657),
	(53681,1,743),
	(53682,2,743),
	(53683,1,744),
	(53684,2,744),
	(53685,1,745),
	(53686,1,615),
	(53687,1,614),
	(53688,2,614),
	(53689,1,616),
	(53690,2,616),
	(53691,1,618),
	(53692,1,617),
	(53693,2,617),
	(53694,1,619),
	(53695,2,619),
	(53696,1,632),
	(53697,1,660),
	(53698,2,660),
	(53699,1,658),
	(53700,2,658),
	(53701,1,628),
	(53702,1,621),
	(53703,1,620),
	(53704,2,620),
	(53705,1,622),
	(53706,2,622),
	(53707,1,626),
	(53708,2,626),
	(53709,1,627),
	(53710,1,746),
	(53713,2,746),
	(53734,2,678),
	(53735,1,679),
	(53736,1,708),
	(53738,3,708),
	(53739,2,708),
	(53776,1,73),
	(53777,6,73),
	(53813,1,766),
	(53814,1,775),
	(53823,1,65),
	(53824,1,63),
	(53827,1,778),
	(53828,1,777),
	(53829,1,776),
	(53851,1,802),
	(53852,2,802),
	(53862,1,809),
	(53865,1,811),
	(53870,1,816),
	(53873,1,818),
	(53874,2,818),
	(53875,6,818),
	(53876,1,819),
	(53878,1,820),
	(53879,1,821),
	(53903,1,842),
	(53907,1,847),
	(53908,1,848),
	(53912,1,853),
	(53925,1,866),
	(53926,1,867),
	(53931,1,871),
	(53949,1,882),
	(53950,1,883),
	(53953,6,746),
	(53966,1,902),
	(53969,1,904),
	(53971,4,904),
	(53972,6,904),
	(53973,1,905),
	(53974,2,906),
	(53975,1,907),
	(53976,2,908),
	(53977,1,909),
	(53978,1,910),
	(53980,1,913),
	(54041,1,822),
	(54042,1,921),
	(54043,2,716),
	(54044,1,46),
	(54045,2,46),
	(54046,1,718),
	(54070,1,66),
	(54071,1,18),
	(54072,1,656),
	(54073,1,843),
	(54074,1,49),
	(54075,1,17),
	(54076,1,48),
	(54077,1,900),
	(54078,1,50),
	(54294,1,47),
	(54296,3,47),
	(54329,1,69),
	(54330,2,69),
	(54331,1,68),
	(54332,2,68),
	(54333,1,833),
	(54334,2,833),
	(54335,3,862),
	(54336,1,838),
	(54337,2,838),
	(54338,3,836),
	(54340,1,835),
	(54341,2,834),
	(54461,1,874),
	(54464,1,38),
	(54466,1,35),
	(54469,1,677),
	(54470,6,677),
	(54472,1,675),
	(54473,1,676),
	(54474,1,611),
	(54476,1,817),
	(54477,6,817),
	(54479,1,810),
	(54481,1,873),
	(54483,1,661),
	(54486,1,613),
	(54487,6,613),
	(54489,1,61),
	(54490,6,61),
	(54492,1,803),
	(54493,1,759),
	(54494,1,34),
	(54496,1,868),
	(54497,1,869),
	(54499,1,33),
	(54500,6,33),
	(54501,3,33),
	(54504,3,39),
	(54534,1,890),
	(54535,2,890),
	(54536,1,903),
	(54537,2,903),
	(54538,1,705),
	(54539,6,705),
	(54540,2,705),
	(54541,1,709),
	(54542,2,709),
	(54543,1,673),
	(54544,6,673),
	(54545,2,673),
	(54546,1,67),
	(54547,6,67),
	(54548,2,67),
	(54549,1,58),
	(54550,6,58),
	(54551,2,58),
	(54552,1,860),
	(54553,2,860),
	(54554,1,889),
	(54555,2,889),
	(54556,1,59),
	(54557,6,59),
	(54558,1,55),
	(54559,2,55),
	(54560,1,56),
	(54561,6,56),
	(54562,3,56),
	(54563,2,56),
	(54564,1,888),
	(54565,2,888),
	(54566,1,57),
	(54567,6,57),
	(54568,2,57),
	(54569,1,861),
	(54570,2,861),
	(54571,3,53),
	(54572,1,52),
	(54574,6,52),
	(54575,3,52),
	(54576,2,52),
	(54640,1,22),
	(54642,6,22),
	(54643,3,22),
	(54645,1,781),
	(54647,6,781),
	(54667,1,720),
	(54669,6,720),
	(54670,3,720),
	(54672,1,748),
	(54673,6,748),
	(54674,3,748),
	(54676,1,711),
	(54677,1,710),
	(54678,1,722),
	(54680,1,721),
	(54682,6,721),
	(54683,3,721),
	(54685,1,972),
	(54715,1,987),
	(54716,2,987),
	(54717,3,987),
	(54718,6,987),
	(54719,1,988),
	(54720,2,988),
	(54721,3,988),
	(54722,6,988),
	(54723,1,989),
	(54724,1,990),
	(54725,1,991),
	(54726,1,992),
	(54739,1,1003),
	(54740,2,1003),
	(54741,3,1003),
	(54742,4,1003),
	(54743,6,1003),
	(54744,31,972),
	(54759,1,977),
	(54760,1,982),
	(54762,6,982),
	(54763,3,982),
	(54765,1,978),
	(54767,1,985),
	(54769,1,984),
	(54771,1,976),
	(54772,1,983),
	(54774,6,983),
	(54775,3,983),
	(54777,1,981),
	(54779,3,979),
	(54991,3,999),
	(54992,1,993),
	(54994,1,994),
	(54995,1,1001),
	(54997,1,995),
	(54998,1,996),
	(54999,6,996),
	(55001,3,1000),
	(55002,3,997),
	(55003,1,998),
	(55005,1,1002),
	(55086,1,814),
	(55087,1,815),
	(55089,1,812),
	(55090,1,813),
	(55092,1,865),
	(55093,1,845),
	(55095,1,760),
	(55096,1,808),
	(55097,1,841),
	(55098,1,655),
	(55099,6,655),
	(55101,1,51),
	(55102,6,51),
	(55103,3,51),
	(55105,1,823),
	(55107,6,894),
	(55108,3,894),
	(55149,1,1020),
	(55150,2,1020),
	(55151,1,1021),
	(55153,4,1021),
	(55154,33,1021),
	(55468,1,1035),
	(55570,1,1048),
	(55571,1,1047),
	(55572,1,1046),
	(55573,1,1045),
	(55574,1,1050),
	(55575,1,1049),
	(55688,4,1055),
	(55755,4,56),
	(55756,4,57),
	(55757,4,741),
	(55758,4,52),
	(56074,4,895),
	(56075,2,894),
	(56077,34,894),
	(56196,4,40),
	(56197,4,613),
	(56198,4,863),
	(56199,4,837),
	(56245,35,719),
	(56246,35,606),
	(56247,35,608),
	(56248,35,764),
	(56249,35,765),
	(56250,35,773),
	(56251,35,774),
	(56252,35,586),
	(56253,35,585),
	(56254,35,630),
	(56255,35,624),
	(56256,35,623),
	(56257,35,625),
	(56258,35,657),
	(56259,35,743),
	(56260,35,744),
	(56261,35,745),
	(56262,35,615),
	(56263,35,614),
	(56264,35,616),
	(56265,35,618),
	(56266,35,617),
	(56267,35,619),
	(56268,35,632),
	(56269,35,660),
	(56270,35,658),
	(56271,35,628),
	(56272,35,621),
	(56273,35,620),
	(56274,35,622),
	(56275,35,626),
	(56276,35,627),
	(56277,35,746),
	(56278,35,679),
	(56279,35,708),
	(56280,35,73),
	(56281,35,766),
	(56282,35,775),
	(56283,35,65),
	(56284,35,63),
	(56285,35,778),
	(56286,35,777),
	(56287,35,776),
	(56288,35,802),
	(56289,35,809),
	(56290,35,811),
	(56291,35,816),
	(56292,35,818),
	(56293,35,819),
	(56294,35,820),
	(56295,35,821),
	(56296,35,842),
	(56297,35,847),
	(56298,35,848),
	(56299,35,853),
	(56300,35,866),
	(56301,35,867),
	(56302,35,871),
	(56303,35,882),
	(56304,35,883),
	(56305,35,902),
	(56306,35,904),
	(56307,35,905),
	(56308,35,907),
	(56309,35,909),
	(56310,35,910),
	(56311,35,913),
	(56312,35,822),
	(56313,35,921),
	(56314,35,46),
	(56315,35,718),
	(56316,35,66),
	(56317,35,18),
	(56318,35,656),
	(56319,35,843),
	(56320,35,49),
	(56321,35,17),
	(56322,35,48),
	(56323,35,900),
	(56324,35,50),
	(56325,35,47),
	(56326,35,69),
	(56327,35,68),
	(56328,35,833),
	(56329,35,838),
	(56330,35,835),
	(56331,35,874),
	(56332,35,38),
	(56333,35,35),
	(56334,35,677),
	(56335,35,675),
	(56336,35,676),
	(56337,35,611),
	(56338,35,817),
	(56339,35,810),
	(56340,35,873),
	(56341,35,661),
	(56342,35,613),
	(56343,35,61),
	(56344,35,803),
	(56345,35,759),
	(56346,35,34),
	(56347,35,868),
	(56348,35,869),
	(56349,35,33),
	(56350,35,890),
	(56351,35,903),
	(56352,35,705),
	(56353,35,709),
	(56354,35,673),
	(56355,35,67),
	(56356,35,58),
	(56357,35,860),
	(56358,35,889),
	(56359,35,59),
	(56360,35,55),
	(56361,35,56),
	(56362,35,888),
	(56363,35,57),
	(56364,35,861),
	(56365,35,52),
	(56366,35,22),
	(56367,35,781),
	(56368,35,720),
	(56369,35,748),
	(56370,35,711),
	(56371,35,710),
	(56372,35,722),
	(56373,35,721),
	(56374,35,972),
	(56375,35,987),
	(56376,35,988),
	(56377,35,989),
	(56378,35,990),
	(56379,35,991),
	(56380,35,992),
	(56381,35,1003),
	(56382,35,977),
	(56383,35,982),
	(56384,35,978),
	(56385,35,985),
	(56386,35,984),
	(56387,35,976),
	(56388,35,983),
	(56389,35,981),
	(56423,35,993),
	(56424,35,994),
	(56425,35,1001),
	(56426,35,995),
	(56427,35,996),
	(56428,35,998),
	(56429,35,1002),
	(56430,35,814),
	(56431,35,815),
	(56432,35,812),
	(56433,35,813),
	(56434,35,865),
	(56435,35,845),
	(56436,35,760),
	(56437,35,808),
	(56438,35,841),
	(56439,35,655),
	(56440,35,51),
	(56441,35,823),
	(56442,35,1020),
	(56443,35,1021),
	(56460,35,1035),
	(56477,35,1048),
	(56478,35,1047),
	(56479,35,1046),
	(56480,35,1045),
	(56481,35,1050),
	(56482,35,1049),
	(56870,1,856),
	(56871,6,856),
	(56872,35,856),
	(56873,1,919),
	(56874,35,919),
	(56875,1,1052),
	(56876,35,1052),
	(56877,1,1053),
	(56878,35,1053),
	(56879,1,1054),
	(56880,35,1054),
	(56881,1,1086),
	(56882,1,1085),
	(56883,1,854),
	(56884,35,854),
	(56885,1,858),
	(56886,35,858),
	(56887,1,920),
	(56888,35,920),
	(56889,1,925),
	(56890,35,925),
	(56891,1,859),
	(56892,35,859),
	(56893,1,32),
	(56894,35,32),
	(56895,1,914),
	(56896,35,914),
	(56897,1,923),
	(56898,35,923),
	(56899,1,916),
	(56900,35,916),
	(56901,1,924),
	(56902,35,924),
	(56903,1,922),
	(56904,35,922),
	(56905,1,926),
	(56906,35,926),
	(56907,1,928),
	(56908,35,928),
	(56909,1,918),
	(56910,35,918),
	(56911,1,779),
	(56912,35,779),
	(56913,1,780),
	(56914,35,780),
	(56915,1,927),
	(56916,35,927),
	(56917,1,713),
	(56918,35,713),
	(56919,1,74),
	(56920,35,74),
	(56921,1,1088),
	(56922,1,77),
	(56923,6,77),
	(56924,35,77),
	(56925,1,724),
	(56926,35,724),
	(56927,1,884),
	(56928,35,884),
	(56929,1,1087),
	(56930,1,755),
	(56931,35,755),
	(56932,1,805),
	(56933,35,805),
	(56934,1,892),
	(56935,35,892),
	(56936,1,78),
	(56937,35,78),
	(56938,1,21),
	(56939,35,21),
	(56940,1,75),
	(56941,6,75),
	(56942,35,75),
	(56943,1,707),
	(56944,35,707),
	(56945,1,807),
	(56946,35,807),
	(56947,1,714),
	(56948,35,714),
	(56949,1,4),
	(56950,35,4),
	(56951,1,898),
	(56952,35,898),
	(56953,1,757),
	(56954,35,757),
	(56955,1,72),
	(56956,6,72),
	(56957,35,72),
	(56958,1,899),
	(56959,35,899),
	(56960,1,43),
	(56961,6,43),
	(56962,35,43),
	(56963,1,24),
	(56964,6,24),
	(56965,35,24),
	(56968,1,1089),
	(56969,1,872),
	(56970,35,872),
	(56971,1,912),
	(56972,35,912),
	(56973,1,1084),
	(56974,1,806),
	(56975,35,806),
	(56976,1,10),
	(56977,35,10),
	(56978,1,20),
	(56979,35,20),
	(56980,1,891),
	(56981,35,891),
	(56982,1,832),
	(56983,35,832),
	(56984,1,851),
	(56985,35,851),
	(56986,1,886),
	(56987,35,886),
	(56988,1,5),
	(56989,35,5),
	(56990,1,830),
	(56991,35,830),
	(56992,1,631),
	(56993,35,631),
	(56994,1,1),
	(56995,35,1),
	(56996,1,725),
	(56997,35,725),
	(56998,1,852),
	(56999,35,852),
	(57000,35,844),
	(57001,1,804),
	(57002,35,804),
	(57003,1,19),
	(57004,35,19),
	(57005,1,12),
	(57006,35,12),
	(57007,1,9),
	(57008,35,9),
	(57009,1,855),
	(57010,35,855),
	(57011,1,1022),
	(57012,35,1022),
	(57013,1,742),
	(57014,35,742),
	(57015,1,723),
	(57016,35,723),
	(57017,1,2),
	(57018,35,2),
	(57019,1,70),
	(57020,35,70),
	(57021,1,831),
	(57022,35,831),
	(57023,1,857),
	(57024,35,857),
	(57027,1,1070),
	(57028,35,1070),
	(57029,1,877),
	(57030,35,877),
	(57031,1,6),
	(57032,35,6),
	(57038,1,726),
	(57039,35,726),
	(57040,1,8),
	(57041,35,8),
	(57042,1,3),
	(57043,35,3),
	(57044,1,54),
	(57045,35,54),
	(57046,1,715),
	(57047,35,715),
	(57048,1,605),
	(57049,35,605),
	(57050,1,870),
	(57051,35,870),
	(57052,1,13),
	(57053,35,13),
	(57056,1,1090),
	(57057,1,796),
	(57058,35,796),
	(57059,1,25),
	(57060,35,25),
	(57061,1,839),
	(57062,35,839),
	(57063,1,756),
	(57064,35,756),
	(57065,1,772),
	(57066,35,772),
	(57067,1,1083),
	(57068,1,706),
	(57069,35,706),
	(57072,1,717),
	(57073,35,717),
	(57074,1,712),
	(57075,35,712),
	(57076,1,747),
	(57077,35,747),
	(57078,1,674),
	(57079,35,674),
	(57082,1,610),
	(57083,35,610),
	(57086,1,16),
	(57087,35,16),
	(57088,1,15),
	(57089,35,15),
	(57092,1,1024),
	(57093,35,1024),
	(57094,1,727),
	(57095,35,727),
	(57104,1,1023),
	(57105,35,1023),
	(57106,1,7),
	(57107,35,7),
	(57116,1,846),
	(57117,35,846),
	(57301,3,896),
	(57304,4,42),
	(57480,4,1051),
	(57481,1,1041),
	(57482,35,1041),
	(57483,1,1039),
	(57484,35,1039),
	(57485,1,1042),
	(57486,35,1042),
	(57487,1,1034),
	(57488,35,1034),
	(57489,1,1040),
	(57490,35,1040),
	(57491,1,1027),
	(57492,35,1027),
	(57493,6,829),
	(57494,1,1028),
	(57495,35,1028),
	(57496,1,1032),
	(57497,35,1032),
	(57498,1,1031),
	(57499,35,1031),
	(57500,1,1030),
	(57501,35,1030),
	(57502,1,1026),
	(57503,35,1026),
	(57504,1,1025),
	(57505,35,1025),
	(57506,1,1033),
	(57507,35,1033),
	(57508,1,1092),
	(57509,1,1029),
	(57510,35,1029),
	(57511,1,1037),
	(57512,35,1037),
	(57513,1,1038),
	(57514,35,1038),
	(57515,6,827),
	(57595,3,629),
	(57596,3,614),
	(57597,3,908),
	(57598,3,659),
	(57599,3,746),
	(57602,4,746),
	(57603,1,1082),
	(57604,35,1082),
	(57605,1,1074),
	(57606,35,1074),
	(57607,1,1079),
	(57608,1,1093),
	(57609,1,1072),
	(57610,35,1072),
	(57611,1,1073),
	(57612,35,1073),
	(57613,1,1069),
	(57614,35,1069),
	(57615,1,1067),
	(57616,35,1067),
	(57617,1,1080),
	(57618,35,1080),
	(57619,1,1081),
	(57620,35,1081),
	(57621,1,1075),
	(57622,35,1075),
	(57623,1,1078),
	(57624,35,1078),
	(57625,1,1076),
	(57626,35,1076),
	(57627,1,1094),
	(57628,1,1095),
	(57629,1,62),
	(57630,35,62),
	(57631,1,1068),
	(57632,35,1068),
	(57633,1,1071),
	(57634,35,1071),
	(57635,1,1077),
	(57636,35,1077),
	(57717,3,864),
	(57718,1,26),
	(57719,6,26),
	(57720,2,26),
	(57721,35,26),
	(57722,34,26),
	(57723,1,1065),
	(57724,6,1065),
	(57725,2,1065),
	(57726,35,1065),
	(57727,34,1065),
	(57728,2,893),
	(57729,1,27),
	(57730,6,27),
	(57731,2,27),
	(57732,35,27),
	(57733,34,27),
	(57734,1,1064),
	(57735,6,1064),
	(57736,2,1064),
	(57737,35,1064),
	(57738,34,1064),
	(57739,1,1066),
	(57740,6,1066),
	(57741,2,1066),
	(57742,35,1066),
	(57743,34,1066),
	(57744,1,1058),
	(57745,35,1058),
	(57746,1,1060),
	(57747,2,1060),
	(57748,35,1060),
	(57749,34,1060),
	(57750,2,1061),
	(57751,1,880),
	(57752,6,880),
	(57753,2,880),
	(57754,35,880),
	(57755,34,880),
	(57756,1,1063),
	(57757,6,1063),
	(57758,2,1063),
	(57759,35,1063),
	(57760,1,1062),
	(57761,6,1062),
	(57762,2,1062),
	(57763,35,1062),
	(57764,1,1059),
	(57765,6,1059),
	(57766,35,1059),
	(57767,1,879),
	(57768,35,879),
	(57769,1,1096),
	(57770,1,28),
	(57771,2,28),
	(57772,35,28),
	(57773,1,31),
	(57774,2,31),
	(57775,35,31),
	(57776,3,901),
	(57777,4,60),
	(57778,1,876),
	(57779,6,876),
	(57780,2,876),
	(57781,35,876),
	(57782,34,876);

/*!40000 ALTER TABLE `pupilsightPermission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightPerson
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPerson`;

CREATE TABLE `pupilsightPerson` (
  `pupilsightPersonID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `surname` varchar(255) DEFAULT '',
  `firstName` varchar(255) DEFAULT '',
  `preferredName` varchar(255) NOT NULL DEFAULT '',
  `officialName` varchar(255) NOT NULL,
  `nameInCharacters` varchar(255) DEFAULT NULL,
  `gender` enum('M','F','Other','Unspecified') DEFAULT 'Unspecified',
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT '',
  `passwordStrong` varchar(255) DEFAULT NULL,
  `passwordStrongSalt` varchar(255) DEFAULT NULL,
  `passwordForceReset` enum('N','Y') DEFAULT 'N' COMMENT 'Force user to reset password on next login.',
  `status` enum('Full','Expected','Left','Pending Approval') DEFAULT 'Full',
  `canLogin` enum('Y','N') DEFAULT 'Y',
  `pupilsightRoleIDPrimary` int(3) unsigned zerofill DEFAULT NULL,
  `pupilsightRoleIDAll` varchar(255) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emailAlternate` varchar(255) DEFAULT NULL,
  `image_240` varchar(255) DEFAULT NULL,
  `lastIPAddress` varchar(15) DEFAULT '',
  `lastTimestamp` timestamp NULL DEFAULT NULL,
  `lastFailIPAddress` varchar(15) DEFAULT NULL,
  `lastFailTimestamp` timestamp NULL DEFAULT NULL,
  `failCount` int(1) DEFAULT '0',
  `address1` mediumtext,
  `address1District` varchar(255) DEFAULT NULL,
  `address1Country` varchar(255) DEFAULT NULL,
  `address2` mediumtext,
  `address2District` varchar(255) DEFAULT NULL,
  `address2Country` varchar(255) DEFAULT NULL,
  `phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `phone1CountryCode` varchar(7) DEFAULT NULL,
  `phone1` varchar(20) DEFAULT NULL,
  `phone3Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `phone3CountryCode` varchar(7) DEFAULT NULL,
  `phone3` varchar(20) DEFAULT NULL,
  `phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `phone2CountryCode` varchar(7) DEFAULT NULL,
  `phone2` varchar(20) DEFAULT NULL,
  `phone4Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT '',
  `phone4CountryCode` varchar(7) DEFAULT NULL,
  `phone4` varchar(20) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `languageFirst` varchar(250) DEFAULT NULL,
  `languageSecond` varchar(250) DEFAULT NULL,
  `languageThird` varchar(250) DEFAULT NULL,
  `countryOfBirth` varchar(250) DEFAULT NULL,
  `birthCertificateScan` varchar(255) DEFAULT NULL,
  `ethnicity` varchar(255) DEFAULT NULL,
  `citizenship1` varchar(255) DEFAULT NULL,
  `citizenship1Passport` varchar(30) DEFAULT NULL,
  `citizenship1PassportScan` varchar(255) DEFAULT NULL,
  `citizenship2` varchar(255) DEFAULT NULL,
  `citizenship2Passport` varchar(30) DEFAULT NULL,
  `religion` varchar(30) DEFAULT NULL,
  `nationalIDCardNumber` varchar(30) DEFAULT NULL,
  `nationalIDCardScan` varchar(255) DEFAULT NULL,
  `residencyStatus` varchar(255) DEFAULT NULL,
  `visaExpiryDate` date DEFAULT NULL,
  `profession` varchar(90) DEFAULT NULL,
  `employer` varchar(90) DEFAULT NULL,
  `jobTitle` varchar(90) DEFAULT NULL,
  `emergency1Name` varchar(90) DEFAULT NULL,
  `emergency1Number1` varchar(30) DEFAULT NULL,
  `emergency1Number2` varchar(30) DEFAULT NULL,
  `emergency1Relationship` varchar(30) DEFAULT NULL,
  `emergency2Name` varchar(90) DEFAULT NULL,
  `emergency2Number1` varchar(30) DEFAULT NULL,
  `emergency2Number2` varchar(30) DEFAULT NULL,
  `emergency2Relationship` varchar(30) DEFAULT NULL,
  `pupilsightHouseID` int(3) unsigned DEFAULT NULL,
  `studentID` varchar(10) DEFAULT NULL,
  `dateStart` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `pupilsightSchoolYearIDClassOf` int(3) unsigned DEFAULT NULL,
  `lastSchool` varchar(100) DEFAULT NULL,
  `nextSchool` varchar(100) DEFAULT NULL,
  `departureReason` varchar(50) DEFAULT NULL,
  `transport` varchar(255) DEFAULT NULL,
  `transportNotes` text,
  `calendarFeedPersonal` text,
  `viewCalendarSchool` enum('Y','N') DEFAULT 'Y',
  `viewCalendarPersonal` enum('Y','N') DEFAULT 'Y',
  `viewCalendarSpaceBooking` enum('Y','N') DEFAULT 'N',
  `pupilsightApplicationFormID` int(12) unsigned DEFAULT NULL,
  `lockerNumber` varchar(20) DEFAULT NULL,
  `vehicleRegistration` varchar(20) DEFAULT NULL,
  `personalBackground` varchar(255) DEFAULT NULL,
  `messengerLastBubble` date DEFAULT NULL,
  `privacy` text,
  `dayType` varchar(255) DEFAULT NULL COMMENT 'Student day type, as specified in the application form.',
  `pupilsightThemeIDPersonal` int(4) unsigned DEFAULT NULL,
  `pupilsighti18nIDPersonal` int(4) unsigned DEFAULT NULL,
  `studentAgreements` text,
  `googleAPIRefreshToken` varchar(255) DEFAULT NULL,
  `receiveNotificationEmails` enum('Y','N') DEFAULT 'Y',
  `fields` text COMMENT 'Serialised array of custom field values',
  `signature` varchar(256) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `admission_no` varchar(256) DEFAULT NULL,
  `roll_no` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`pupilsightPersonID`),
  UNIQUE KEY `username` (`username`),
  KEY `username_2` (`username`,`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightPerson` WRITE;
/*!40000 ALTER TABLE `pupilsightPerson` DISABLE KEYS */;

INSERT INTO `pupilsightPerson` (`pupilsightPersonID`, `title`, `surname`, `firstName`, `preferredName`, `officialName`, `nameInCharacters`, `gender`, `username`, `password`, `passwordStrong`, `passwordStrongSalt`, `passwordForceReset`, `status`, `canLogin`, `pupilsightRoleIDPrimary`, `pupilsightRoleIDAll`, `dob`, `email`, `emailAlternate`, `image_240`, `lastIPAddress`, `lastTimestamp`, `lastFailIPAddress`, `lastFailTimestamp`, `failCount`, `address1`, `address1District`, `address1Country`, `address2`, `address2District`, `address2Country`, `phone1Type`, `phone1CountryCode`, `phone1`, `phone3Type`, `phone3CountryCode`, `phone3`, `phone2Type`, `phone2CountryCode`, `phone2`, `phone4Type`, `phone4CountryCode`, `phone4`, `website`, `languageFirst`, `languageSecond`, `languageThird`, `countryOfBirth`, `birthCertificateScan`, `ethnicity`, `citizenship1`, `citizenship1Passport`, `citizenship1PassportScan`, `citizenship2`, `citizenship2Passport`, `religion`, `nationalIDCardNumber`, `nationalIDCardScan`, `residencyStatus`, `visaExpiryDate`, `profession`, `employer`, `jobTitle`, `emergency1Name`, `emergency1Number1`, `emergency1Number2`, `emergency1Relationship`, `emergency2Name`, `emergency2Number1`, `emergency2Number2`, `emergency2Relationship`, `pupilsightHouseID`, `studentID`, `dateStart`, `dateEnd`, `pupilsightSchoolYearIDClassOf`, `lastSchool`, `nextSchool`, `departureReason`, `transport`, `transportNotes`, `calendarFeedPersonal`, `viewCalendarSchool`, `viewCalendarPersonal`, `viewCalendarSpaceBooking`, `pupilsightApplicationFormID`, `lockerNumber`, `vehicleRegistration`, `personalBackground`, `messengerLastBubble`, `privacy`, `dayType`, `pupilsightThemeIDPersonal`, `pupilsighti18nIDPersonal`, `studentAgreements`, `googleAPIRefreshToken`, `receiveNotificationEmails`, `fields`, `signature`, `active`, `admission_no`, `roll_no`)
VALUES
	(1,'Mr.','Kumar','Rakesh','Rakesh','Rakesh Kumar','','Unspecified','admin','','94ccfdc43602bb8eb6d0b6559e880ab34a89e0e9d304cd5aff50dcf97ac249c8','adEFGHmNpPqQruvwXyYZ69','N','Full','Y',001,'001',NULL,'rakesh@thoughtnet.in',NULL,NULL,'103.51.32.11','2020-09-18 23:37:01','106.51.17.167','2020-08-28 17:28:23',0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','','',NULL,'','','','','','','','','','','',NULL,'','2020-09-01',NULL,NULL,'','','','','','','N','N','Y',NULL,'','','','2019-12-02',NULL,NULL,NULL,NULL,NULL,'','Y','',NULL,1,NULL,NULL);

/*!40000 ALTER TABLE `pupilsightPerson` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightPersonField
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPersonField`;

CREATE TABLE `pupilsightPersonField` (
  `pupilsightPersonFieldID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `description` varchar(255) NOT NULL,
  `type` enum('varchar','text','date','url','select','checkboxes') NOT NULL,
  `options` text NOT NULL COMMENT 'Field length for varchar, rows for text, comma-separate list for select/checkbox.',
  `required` enum('N','Y') NOT NULL DEFAULT 'N',
  `activePersonStudent` tinyint(1) NOT NULL DEFAULT '0',
  `activePersonStaff` tinyint(1) NOT NULL DEFAULT '0',
  `activePersonParent` tinyint(1) NOT NULL DEFAULT '0',
  `activePersonOther` tinyint(1) NOT NULL DEFAULT '0',
  `activeApplicationForm` tinyint(1) NOT NULL DEFAULT '0',
  `activeDataUpdater` tinyint(1) NOT NULL DEFAULT '0',
  `activePublicRegistration` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pupilsightPersonFieldID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPersonMedical
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPersonMedical`;

CREATE TABLE `pupilsightPersonMedical` (
  `pupilsightPersonMedicalID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `bloodType` enum('','O+','A+','B+','AB+','O-','A-','B-','AB-') NOT NULL,
  `longTermMedication` enum('','Y','N') NOT NULL,
  `longTermMedicationDetails` text NOT NULL,
  `tetanusWithin10Years` enum('','Y','N') NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`pupilsightPersonMedicalID`),
  KEY `pupilsightPersonID` (`pupilsightPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPersonMedicalCondition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPersonMedicalCondition`;

CREATE TABLE `pupilsightPersonMedicalCondition` (
  `pupilsightPersonMedicalConditionID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonMedicalID` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `pupilsightAlertLevelID` int(3) unsigned DEFAULT NULL,
  `triggers` varchar(255) NOT NULL,
  `reaction` varchar(255) NOT NULL,
  `response` varchar(255) NOT NULL,
  `medication` varchar(255) NOT NULL,
  `lastEpisode` date DEFAULT NULL,
  `lastEpisodeTreatment` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`pupilsightPersonMedicalConditionID`),
  KEY `pupilsightPersonMedicalID` (`pupilsightPersonMedicalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPersonMedicalConditionUpdate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPersonMedicalConditionUpdate`;

CREATE TABLE `pupilsightPersonMedicalConditionUpdate` (
  `pupilsightPersonMedicalConditionUpdateID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonMedicalUpdateID` int(12) unsigned DEFAULT NULL,
  `pupilsightPersonMedicalConditionID` int(12) unsigned DEFAULT NULL,
  `pupilsightPersonMedicalID` int(10) unsigned DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `pupilsightAlertLevelID` int(3) unsigned DEFAULT NULL,
  `triggers` varchar(255) NOT NULL,
  `reaction` varchar(255) NOT NULL,
  `response` varchar(255) NOT NULL,
  `medication` varchar(255) NOT NULL,
  `lastEpisode` date DEFAULT NULL,
  `lastEpisodeTreatment` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `pupilsightPersonIDUpdater` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightPersonMedicalConditionUpdateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPersonMedicalSymptoms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPersonMedicalSymptoms`;

CREATE TABLE `pupilsightPersonMedicalSymptoms` (
  `pupilsightPersonMedicalSymptomsID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `symptoms` text NOT NULL,
  `date` date NOT NULL,
  `timestampTaken` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pupilsightPersonIDTaker` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightPersonMedicalSymptomsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPersonMedicalUpdate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPersonMedicalUpdate`;

CREATE TABLE `pupilsightPersonMedicalUpdate` (
  `pupilsightPersonMedicalUpdateID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned DEFAULT NULL,
  `status` enum('Pending','Complete') NOT NULL DEFAULT 'Pending',
  `pupilsightPersonMedicalID` int(10) unsigned DEFAULT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `bloodType` enum('','O+','A+','B+','AB+','O-','A-','B-','AB-') NOT NULL,
  `longTermMedication` enum('','Y','N') NOT NULL,
  `longTermMedicationDetails` text NOT NULL,
  `tetanusWithin10Years` enum('','Y','N') NOT NULL,
  `comment` text NOT NULL,
  `pupilsightPersonIDUpdater` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightPersonMedicalUpdateID`),
  KEY `pupilsightMedicalIndex` (`pupilsightPersonID`,`pupilsightPersonMedicalID`,`pupilsightSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPersonReset
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPersonReset`;

CREATE TABLE `pupilsightPersonReset` (
  `pupilsightPersonResetID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightPersonResetID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table pupilsightPersonUpdate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPersonUpdate`;

CREATE TABLE `pupilsightPersonUpdate` (
  `pupilsightPersonUpdateID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned DEFAULT NULL,
  `status` enum('Pending','Complete') NOT NULL DEFAULT 'Pending',
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `title` varchar(5) NOT NULL,
  `surname` varchar(60) NOT NULL DEFAULT '',
  `firstName` varchar(60) NOT NULL DEFAULT '',
  `preferredName` varchar(60) NOT NULL DEFAULT '',
  `officialName` varchar(150) NOT NULL,
  `nameInCharacters` varchar(60) NOT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `emailAlternate` varchar(75) DEFAULT NULL,
  `address1` mediumtext NOT NULL,
  `address1District` varchar(255) NOT NULL,
  `address1Country` varchar(255) NOT NULL,
  `address2` mediumtext NOT NULL,
  `address2District` varchar(255) NOT NULL,
  `address2Country` varchar(255) NOT NULL,
  `phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone1CountryCode` varchar(7) NOT NULL,
  `phone1` varchar(20) NOT NULL,
  `phone3Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone3CountryCode` varchar(7) NOT NULL,
  `phone3` varchar(20) NOT NULL,
  `phone2Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone2CountryCode` varchar(7) NOT NULL,
  `phone2` varchar(20) NOT NULL,
  `phone4Type` enum('','Mobile','Home','Work','Fax','Pager','Other') NOT NULL DEFAULT '',
  `phone4CountryCode` varchar(7) NOT NULL,
  `phone4` varchar(20) NOT NULL,
  `languageFirst` varchar(30) NOT NULL,
  `languageSecond` varchar(30) NOT NULL,
  `languageThird` varchar(30) NOT NULL,
  `countryOfBirth` varchar(30) NOT NULL,
  `ethnicity` varchar(255) NOT NULL,
  `citizenship1` varchar(255) NOT NULL,
  `citizenship1Passport` varchar(30) NOT NULL,
  `citizenship2` varchar(255) NOT NULL,
  `citizenship2Passport` varchar(30) NOT NULL,
  `religion` varchar(30) NOT NULL,
  `nationalIDCardCountry` varchar(30) NOT NULL,
  `nationalIDCardNumber` varchar(30) NOT NULL,
  `residencyStatus` varchar(255) NOT NULL,
  `visaExpiryDate` date DEFAULT NULL,
  `profession` varchar(90) DEFAULT NULL,
  `employer` varchar(90) DEFAULT NULL,
  `jobTitle` varchar(90) DEFAULT NULL,
  `emergency1Name` varchar(90) DEFAULT NULL,
  `emergency1Number1` varchar(30) DEFAULT NULL,
  `emergency1Number2` varchar(30) DEFAULT NULL,
  `emergency1Relationship` varchar(30) DEFAULT NULL,
  `emergency2Name` varchar(90) DEFAULT NULL,
  `emergency2Number1` varchar(30) DEFAULT NULL,
  `emergency2Number2` varchar(30) DEFAULT NULL,
  `emergency2Relationship` varchar(30) DEFAULT NULL,
  `vehicleRegistration` varchar(20) NOT NULL,
  `pupilsightPersonIDUpdater` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `privacy` text,
  `fields` text NOT NULL COMMENT 'Serialised array of custom field values',
  PRIMARY KEY (`pupilsightPersonUpdateID`),
  KEY `pupilsightPersonIndex` (`pupilsightPersonID`,`pupilsightSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPlannerEntry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPlannerEntry`;

CREATE TABLE `pupilsightPlannerEntry` (
  `pupilsightPlannerEntryID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightCourseClassID` int(8) unsigned NOT NULL,
  `pupilsightUnitID` int(10) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `timeStart` time DEFAULT NULL,
  `timeEnd` time DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `teachersNotes` mediumtext NOT NULL,
  `homework` enum('N','Y') NOT NULL DEFAULT 'N',
  `homeworkDueDateTime` datetime DEFAULT NULL,
  `homeworkDetails` mediumtext NOT NULL,
  `homeworkSubmission` enum('N','Y') NOT NULL,
  `homeworkSubmissionDateOpen` date DEFAULT NULL,
  `homeworkSubmissionDrafts` varchar(1) DEFAULT NULL,
  `homeworkSubmissionType` enum('','Link','File','Link/File') NOT NULL,
  `homeworkSubmissionRequired` enum('Optional','Compulsory') DEFAULT 'Optional',
  `homeworkCrowdAssess` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessOtherTeachersRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessOtherParentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessClassmatesParentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessSubmitterParentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessOtherStudentsRead` enum('N','Y') NOT NULL,
  `homeworkCrowdAssessClassmatesRead` enum('N','Y') NOT NULL,
  `viewableStudents` enum('Y','N') NOT NULL DEFAULT 'Y',
  `viewableParents` enum('Y','N') NOT NULL DEFAULT 'N',
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `pupilsightPersonIDLastEdit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightPlannerEntryID`),
  KEY `pupilsightCourseClassID` (`pupilsightCourseClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPlannerEntryDiscuss
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPlannerEntryDiscuss`;

CREATE TABLE `pupilsightPlannerEntryDiscuss` (
  `pupilsightPlannerEntryDiscussID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPlannerEntryID` int(14) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text NOT NULL,
  `pupilsightPlannerEntryDiscussIDReplyTo` int(16) unsigned DEFAULT NULL,
  PRIMARY KEY (`pupilsightPlannerEntryDiscussID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPlannerEntryGuest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPlannerEntryGuest`;

CREATE TABLE `pupilsightPlannerEntryGuest` (
  `pupilsightPlannerEntryGuestID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPlannerEntryID` int(14) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `role` enum('Guest Student','Guest Teacher','Guest Assistant','Guest Technician','Guest Parent','Other Guest') NOT NULL,
  PRIMARY KEY (`pupilsightPlannerEntryGuestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPlannerEntryHomework
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPlannerEntryHomework`;

CREATE TABLE `pupilsightPlannerEntryHomework` (
  `pupilsightPlannerEntryHomeworkID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPlannerEntryID` int(14) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `type` enum('Link','File') NOT NULL,
  `version` enum('Draft','Final') NOT NULL,
  `status` enum('On Time','Late','Exemption') NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `count` int(1) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightPlannerEntryHomeworkID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPlannerEntryOutcome
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPlannerEntryOutcome`;

CREATE TABLE `pupilsightPlannerEntryOutcome` (
  `pupilsightPlannerEntryOutcomeID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPlannerEntryID` int(14) unsigned NOT NULL,
  `pupilsightOutcomeID` int(8) unsigned NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`pupilsightPlannerEntryOutcomeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPlannerEntryStudentHomework
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPlannerEntryStudentHomework`;

CREATE TABLE `pupilsightPlannerEntryStudentHomework` (
  `pupilsightPlannerEntryStudentHomeworkID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPlannerEntryID` int(14) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `homeworkDueDateTime` datetime NOT NULL,
  `homeworkDetails` mediumtext NOT NULL,
  `homeworkComplete` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`pupilsightPlannerEntryStudentHomeworkID`),
  KEY `pupilsightPlannerEntryID` (`pupilsightPlannerEntryID`,`pupilsightPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Allows students to add homework deadlines themselves';



# Dump of table pupilsightPlannerEntryStudentTracker
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPlannerEntryStudentTracker`;

CREATE TABLE `pupilsightPlannerEntryStudentTracker` (
  `pupilsightPlannerEntryStudentTrackerID` int(16) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPlannerEntryID` int(14) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `homeworkComplete` enum('Y','N') NOT NULL,
  PRIMARY KEY (`pupilsightPlannerEntryStudentTrackerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightPlannerParentWeeklyEmailSummary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightPlannerParentWeeklyEmailSummary`;

CREATE TABLE `pupilsightPlannerParentWeeklyEmailSummary` (
  `pupilsightPlannerParentWeeklyEmailSummaryID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `pupilsightPersonIDParent` int(10) unsigned NOT NULL,
  `pupilsightPersonIDStudent` int(10) unsigned NOT NULL,
  `weekOfYear` int(2) NOT NULL,
  `key` varchar(40) NOT NULL,
  `confirmed` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`pupilsightPlannerParentWeeklyEmailSummaryID`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightProgram
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightProgram`;

CREATE TABLE `pupilsightProgram` (
  `pupilsightProgramID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`pupilsightProgramID`),
  UNIQUE KEY `name` (`name`,`nameShort`,`sequenceNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightProgramClassSectionMapping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightProgramClassSectionMapping`;

CREATE TABLE `pupilsightProgramClassSectionMapping` (
  `pupilsightMappingID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) DEFAULT NULL,
  `pupilsightProgramID` int(3) unsigned NOT NULL,
  `pupilsightYearGroupID` int(3) unsigned NOT NULL,
  `pupilsightRollGroupID` int(5) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightMappingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightResource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightResource`;

CREATE TABLE `pupilsightResource` (
  `pupilsightResourceID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `description` text NOT NULL,
  `pupilsightYearGroupIDList` varchar(255) NOT NULL,
  `type` enum('File','HTML','Link') NOT NULL,
  `category` varchar(255) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `content` text NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightResourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightResourceTag
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightResourceTag`;

CREATE TABLE `pupilsightResourceTag` (
  `pupilsightResourceTagID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `tag` varchar(100) NOT NULL,
  `count` int(6) NOT NULL,
  PRIMARY KEY (`pupilsightResourceTagID`),
  UNIQUE KEY `tag` (`tag`),
  KEY `tag_2` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightRole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightRole`;

CREATE TABLE `pupilsightRole` (
  `pupilsightRoleID` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `category` enum('Staff','Student','Parent','Other') NOT NULL DEFAULT 'Staff',
  `name` varchar(20) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `description` varchar(60) NOT NULL,
  `type` enum('Core','Additional') NOT NULL DEFAULT 'Core',
  `canLoginRole` enum('Y','N') NOT NULL DEFAULT 'Y',
  `futureYearsLogin` enum('Y','N') NOT NULL DEFAULT 'Y',
  `pastYearsLogin` enum('Y','N') NOT NULL DEFAULT 'Y',
  `restriction` enum('None','Same Role','Admin Only') NOT NULL DEFAULT 'None',
  PRIMARY KEY (`pupilsightRoleID`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `nameShort` (`nameShort`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightRole` WRITE;
/*!40000 ALTER TABLE `pupilsightRole` DISABLE KEYS */;

INSERT INTO `pupilsightRole` (`pupilsightRoleID`, `category`, `name`, `nameShort`, `description`, `type`, `canLoginRole`, `futureYearsLogin`, `pastYearsLogin`, `restriction`)
VALUES
	(001,'Staff','Administrator','Adm','Controls all aspects of the system','Core','Y','Y','Y','Admin Only'),
	(002,'Staff','Teacher','Tcr','Regular, classroom teacher','Core','Y','Y','Y','None'),
	(003,'Student','Student','Std','Person studying in the school','Core','Y','Y','Y','None'),
	(004,'Parent','Parent','Prt','Parent or guardian of person studying in','Core','Y','Y','Y','None'),
	(006,'Staff','Support Staff','SSt','Staff who support teaching and learning','Core','Y','Y','Y','None'),
	(031,'Other','Alumni','Alum','Alumni Test','Additional','Y','Y','Y','Admin Only'),
	(032,'Other','Admission Officer','AO','Manages Admission','Additional','Y','Y','Y','None'),
	(033,'Other','Campaign Parent','CP','Parent Register For Campaign','Additional','Y','Y','Y','None'),
	(034,'Staff','Subject Teacher','STec','STec','Additional','Y','Y','Y','None'),
	(035,'Staff','Coordinator','Cord','Controls all aspects of the system','Additional','Y','Y','Y','Admin Only');

/*!40000 ALTER TABLE `pupilsightRole` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightRollGroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightRollGroup`;

CREATE TABLE `pupilsightRollGroup` (
  `pupilsightRollGroupID` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `nameShort` varchar(8) NOT NULL,
  `pupilsightPersonIDTutor` int(10) unsigned DEFAULT NULL,
  `pupilsightPersonIDTutor2` int(10) unsigned DEFAULT NULL,
  `pupilsightPersonIDTutor3` int(10) unsigned DEFAULT NULL,
  `pupilsightPersonIDEA` int(10) unsigned DEFAULT NULL,
  `pupilsightPersonIDEA2` int(10) unsigned DEFAULT NULL,
  `pupilsightPersonIDEA3` int(10) unsigned DEFAULT NULL,
  `pupilsightSpaceID` int(5) unsigned DEFAULT NULL,
  `pupilsightRollGroupIDNext` int(5) unsigned DEFAULT NULL,
  `attendance` enum('Y','N') NOT NULL DEFAULT 'Y',
  `website` varchar(255) NOT NULL,
  PRIMARY KEY (`pupilsightRollGroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightRubric
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightRubric`;

CREATE TABLE `pupilsightRubric` (
  `pupilsightRubricID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `active` enum('Y','N') NOT NULL,
  `scope` enum('School','Learning Area') NOT NULL,
  `pupilsightDepartmentID` int(4) unsigned DEFAULT NULL,
  `pupilsightYearGroupIDList` varchar(255) NOT NULL,
  `pupilsightScaleID` int(5) unsigned DEFAULT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightRubricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightRubricCell
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightRubricCell`;

CREATE TABLE `pupilsightRubricCell` (
  `pupilsightRubricCellID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightRubricID` int(8) unsigned NOT NULL,
  `pupilsightRubricColumnID` int(9) unsigned NOT NULL,
  `pupilsightRubricRowID` int(9) unsigned NOT NULL,
  `contents` text NOT NULL,
  PRIMARY KEY (`pupilsightRubricCellID`),
  KEY `pupilsightRubricID` (`pupilsightRubricID`),
  KEY `pupilsightRubricColumnID` (`pupilsightRubricColumnID`),
  KEY `pupilsightRubricRowID` (`pupilsightRubricRowID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightRubricColumn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightRubricColumn`;

CREATE TABLE `pupilsightRubricColumn` (
  `pupilsightRubricColumnID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightRubricID` int(8) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `sequenceNumber` int(2) NOT NULL,
  `pupilsightScaleGradeID` int(7) unsigned DEFAULT NULL,
  `visualise` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`pupilsightRubricColumnID`),
  KEY `pupilsightRubricID` (`pupilsightRubricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightRubricEntry
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightRubricEntry`;

CREATE TABLE `pupilsightRubricEntry` (
  `pupilsightRubricEntry` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightRubricID` int(8) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `pupilsightRubricCellID` int(11) unsigned NOT NULL,
  `contextDBTable` varchar(255) NOT NULL COMMENT 'Which database table is this entry related to?',
  `contextDBTableID` int(20) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightRubricEntry`),
  KEY `pupilsightRubricID` (`pupilsightRubricID`),
  KEY `pupilsightPersonID` (`pupilsightPersonID`),
  KEY `pupilsightRubricCellID` (`pupilsightRubricCellID`),
  KEY `contextDBTable` (`contextDBTable`),
  KEY `contextDBTableID` (`contextDBTableID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightRubricRow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightRubricRow`;

CREATE TABLE `pupilsightRubricRow` (
  `pupilsightRubricRowID` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightRubricID` int(8) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `sequenceNumber` int(2) NOT NULL,
  `pupilsightOutcomeID` int(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`pupilsightRubricRowID`),
  KEY `pupilsightRubricID` (`pupilsightRubricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightScale
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightScale`;

CREATE TABLE `pupilsightScale` (
  `pupilsightScaleID` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `nameShort` varchar(5) NOT NULL,
  `usage` varchar(50) NOT NULL,
  `lowestAcceptable` varchar(5) DEFAULT NULL COMMENT 'This is the sequence number of the lowest grade a student can get without being unsatisfactory',
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `numeric` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`pupilsightScaleID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightScale` WRITE;
/*!40000 ALTER TABLE `pupilsightScale` DISABLE KEYS */;

INSERT INTO `pupilsightScale` (`pupilsightScaleID`, `name`, `nameShort`, `usage`, `lowestAcceptable`, `active`, `numeric`)
VALUES
	(1,'International Baccalaureate','IB','7 (highest) to 1 (lowest)','','N','Y'),
	(2,'International Baccalaureate EE','IBEE','A (highest) to E (lowest)','','N','N'),
	(3,'United Kingdom GCSE/iGCSE','GCSE','A* (highest) to U (lowest)','','Y','N'),
	(4,'Percentage','%','100 (highest) to 0 (lowest)','51','Y','Y'),
	(5,'Full Letter Grade','FLG','A+ (highest) to F (lowest)','','Y','N'),
	(6,'Simple Letter Grade','SLG','A (highest) to F (lowest)','','N','N'),
	(7,'International College HK','ICHK','7 (highest) to 1 (lowest)','4','Y','Y'),
	(9,'Completion','Comp','Has task has been completed?','1','Y','N'),
	(10,'Cognitive Abilities Test','CAT','140 (highest) to 60 (lowest)','70','Y','Y'),
	(11,'UK National Curriculum KS3','KS3','8A (highest) to B3 (lowest)','14','Y','N'),
	(12,'United Kingdom GCSE/iGCSE Predicted','GPrd','8A (highest) to B3 (lowest)','','Y','N'),
	(13,'IB Diploma (Subject)','IBDS','7 (highest) to 1 (lowest)','4','Y','Y'),
	(14,'IB Diploma (Total)','IBDT','45 (highest) to 0','22','Y','Y'),
	(15,'UK National Curriculum KS3 Simplified','KS3S','Level 8 (highest) to Level 3 (lowest)','4','Y','N'),
	(16,'Scholastic Grade Scale','SGS','100 is highest 0 is minimum','5','Y','Y'),
	(17,'Scholastic Grade_new','SGN','0-100','','Y','N'),
	(18,'Test','T','Tes',NULL,'Y','Y');

/*!40000 ALTER TABLE `pupilsightScale` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightScaleGrade
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightScaleGrade`;

CREATE TABLE `pupilsightScaleGrade` (
  `pupilsightScaleGradeID` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightScaleID` int(5) unsigned NOT NULL,
  `value` varchar(10) NOT NULL,
  `descriptor` varchar(50) NOT NULL,
  `sequenceNumber` int(5) NOT NULL,
  `isDefault` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`pupilsightScaleGradeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightSchoolFinanceYear
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightSchoolFinanceYear`;

CREATE TABLE `pupilsightSchoolFinanceYear` (
  `pupilsightSchoolFinanceYearID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(36) NOT NULL DEFAULT '',
  `status` enum('Past','Current','Upcoming') NOT NULL DEFAULT 'Upcoming',
  `sequenceNumber` int(10) NOT NULL,
  `firstDay` date DEFAULT NULL,
  `lastDay` date DEFAULT NULL,
  PRIMARY KEY (`pupilsightSchoolFinanceYearID`),
  UNIQUE KEY `academicYearName` (`name`),
  UNIQUE KEY `sequenceNumber` (`sequenceNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightSchoolFinanceYear` WRITE;
/*!40000 ALTER TABLE `pupilsightSchoolFinanceYear` DISABLE KEYS */;

INSERT INTO `pupilsightSchoolFinanceYear` (`pupilsightSchoolFinanceYearID`, `name`, `status`, `sequenceNumber`, `firstDay`, `lastDay`)
VALUES
	(1,'2020-2021','Current',1,'2020-04-01','2021-03-31');

/*!40000 ALTER TABLE `pupilsightSchoolFinanceYear` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightSchoolYear
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightSchoolYear`;

CREATE TABLE `pupilsightSchoolYear` (
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(36) NOT NULL DEFAULT '',
  `status` enum('Past','Current','Upcoming') NOT NULL DEFAULT 'Upcoming',
  `sequenceNumber` int(10) NOT NULL,
  `firstDay` date DEFAULT NULL,
  `lastDay` date DEFAULT NULL,
  PRIMARY KEY (`pupilsightSchoolYearID`),
  UNIQUE KEY `academicYearName` (`name`),
  UNIQUE KEY `sequenceNumber` (`sequenceNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightSchoolYear` WRITE;
/*!40000 ALTER TABLE `pupilsightSchoolYear` DISABLE KEYS */;

INSERT INTO `pupilsightSchoolYear` (`pupilsightSchoolYearID`, `name`, `status`, `sequenceNumber`, `firstDay`, `lastDay`)
VALUES
	(1,'2020-2021','Current',1,'2020-06-01','2021-05-31');

/*!40000 ALTER TABLE `pupilsightSchoolYear` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightSchoolYearSpecialDay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightSchoolYearSpecialDay`;

CREATE TABLE `pupilsightSchoolYearSpecialDay` (
  `pupilsightSchoolYearSpecialDayID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearTermID` int(5) unsigned NOT NULL,
  `type` enum('School Closure','Timing Change') NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `schoolOpen` time DEFAULT NULL,
  `schoolStart` time DEFAULT NULL,
  `schoolEnd` time DEFAULT NULL,
  `schoolClose` time DEFAULT NULL,
  PRIMARY KEY (`pupilsightSchoolYearSpecialDayID`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightSchoolYearTerm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightSchoolYearTerm`;

CREATE TABLE `pupilsightSchoolYearTerm` (
  `pupilsightSchoolYearTermID` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `sequenceNumber` int(5) NOT NULL,
  `name` varchar(20) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `firstDay` date NOT NULL,
  `lastDay` date NOT NULL,
  PRIMARY KEY (`pupilsightSchoolYearTermID`),
  UNIQUE KEY `sequenceNumber` (`sequenceNumber`,`pupilsightSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightSetting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightSetting`;

CREATE TABLE `pupilsightSetting` (
  `pupilsightSettingID` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `scope` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `nameDisplay` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`pupilsightSettingID`),
  UNIQUE KEY `scope` (`scope`,`nameDisplay`),
  UNIQUE KEY `scope_2` (`scope`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightSetting` WRITE;
/*!40000 ALTER TABLE `pupilsightSetting` DISABLE KEYS */;

INSERT INTO `pupilsightSetting` (`pupilsightSettingID`, `scope`, `name`, `nameDisplay`, `description`, `value`)
VALUES
	(1,'System','absoluteURL','Base URL','The address at which the whole system resides.','http://testoxygen.pupilpod.net'),
	(2,'System','organisationName','Organisation Name','','Christ Academy'),
	(3,'System','organisationNameShort','Organisation Initials','','Christ Academy'),
	(6,'System','pagination','Pagination Count','Must be numeric. Number of records shown per page.','50'),
	(7,'System','systemName','System Name','','Christ Academy'),
	(8,'System','indexText','Index Page Text','Text displayed in system\'s welcome page.','Welcome to Christ Academy'),
	(9,'System','absolutePath','Base Path','The local FS path to the system','/var/www/testoxygen/public'),
	(11,'System','timezone','Timezone','The timezone where the school is located','Asia/Kolkata'),
	(13,'System','analytics','Analytics','Javascript code to integrate statistics, such as Google Analytics',''),
	(14,'System','emailLink','Link To Email','The link that points to the school/\'s email system',''),
	(15,'System','webLink','Link To Web','The link that points to the school/\'s website',''),
	(18,'System','defaultAssessmentScale','Default Assessment Scale','This is the scale used as a default where assessment scales need to be selected.','00004'),
	(21,'System','country','Country','The country the school is located in','India'),
	(22,'System','organisationLogo','Logo','Relative path to site logo (400 x 100px)','themes/Default/img/logo.png'),
	(23,'System','calendarFeed','School Google Calendar ID','Google Calendar ID for your school calendar. Only enables timetable integration when logging in via Google.',''),
	(24,'Activities','access','Access','System-wide access control','Register'),
	(25,'Activities','payment','Payment','Payment system','Single'),
	(26,'Activities','enrolmentType','Enrolment Type','Enrolment process type','Selection'),
	(27,'Activities','backupChoice','Backup Choice','Allow students to choose a backup, in case enroled activity is full.','Y'),
	(28,'Activities','activityTypes','Activity Types','Comma-seperated list of the different activity types available in school. Leave blank to disalbe this feature.','Creativity,Action,Service,Cultural'),
	(29,'Application Form','introduction','Introduction','Information to display before the form','Complete the following application form and submit the required documents.'),
	(30,'Application Form','postscript','Postscript','Information to display at the end of the form','All original documents to be uploaded into the school database before payment of school fees on receiving an admission offer letter.\r\n'),
	(31,'Application Form','scholarships','Scholarships','Information to display before the scholarship options',''),
	(32,'Application Form','agreement','Agreement','Without this text, which is displayed above the agreement, users will not be asked to agree to anything','In submitting this form, I confirm that all information provided above is accurate and complete to the best of my knowledge.'),
	(33,'Application Form','publicApplications','Public Applications?','If yes, members of the public can submit applications','Y'),
	(34,'Behaviour','positiveDescriptors','Positive Descriptors','Allowable choices for positive behaviour','Attitude to learning,Collaboration,Community spirit,Creativity,Effort,Leadership,Participation,Persistence,Problem solving,Quality of work,Values'),
	(35,'Behaviour','negativeDescriptors','Negative Descriptors','Allowable choices for negative behaviour','Classwork - Late,Classwork - Incomplete,Classwork - Unacceptable,Disrespectful,Disruptive,Homework - Late,Homework - Incomplete,Homework - Unacceptable,ICT Misuse,Truancy,Other'),
	(36,'Behaviour','levels','Levels','Allowable choices for severity level (from lowest to highest)',',Stage 1,Stage 1 (Actioned),Stage 2,Stage 2 (Actioned),Stage 3,Stage 3 (Actioned),Actioned'),
	(37,'Resources','categories','Categories','Allowable choices for category','Article,Book,Document,Graphic,Idea,Music,Object,Painting,Person,Photo,Place,Poetry,Prose,Rubric,Text,Video,Website,Work Sample,Other'),
	(38,'Resources','purposesGeneral','Purposes (General)','Allowable choices for purpose when creating a resource','Assessment Aid,Concept,Inspiration,Learner Profile,Mass Mailer Attachment,Provocation,Skill,Teaching and Learning Strategy,Other'),
	(39,'System','version','Version','The version of the Pupilsight database','18.0.01'),
	(40,'Resources','purposesRestricted','Purposes (Restricted)','Additional allowable choices for purpose when creating a resource, for those with \"Manage All Resources\" rights',''),
	(41,'System','organisationEmail','Organisation Email','General email address for the school','anand.r@thoughtnet.in'),
	(42,'Activities','dateType','Date Type','Should activities be organised around dates (flexible) or terms (easy)?','Term'),
	(43,'System','installType','Install Type','The purpose of this installation of Pupilsight','Development'),
	(44,'System','statsCollection','Statistics Collection','To track Pupilsight uptake, the system tracks basic data (current URL, install type, organisation name) on each install. Do you want to help?','Y'),
	(45,'Activities','maxPerTerm','Maximum Activities per Term','The most a student can sign up for in one term. Set to 0 for unlimited.','5'),
	(46,'Planner','lessonDetailsTemplate','Lesson Details Template','Template to be inserted into Lesson Details field','Lesson details\r\n\r\n'),
	(47,'Planner','teachersNotesTemplate','Teacher\'s Notes Template','Template to be inserted into Teacher\'s Notes field','S.No,Lesson name'),
	(48,'Planner','smartBlockTemplate','Smart Block Template','Template to be inserted into new block in Smart Unit',''),
	(49,'Planner','unitOutlineTemplate','Unit Outline Template','Template to be inserted into Unit Outline section of planner','Unit'),
	(50,'Application Form','milestones','Milestones','Comma-separated list of the major steps in the application process. Applicants can be tracked through the various stages.','Registered, Shortlisted, First Interview, Rejected, Pending, Accepted,Other'),
	(51,'Library','defaultLoanLength','Default Loan Length','The standard loan length for a library item, in days','7'),
	(52,'Behaviour','policyLink','Policy Link','A link to the school behaviour policy.',''),
	(53,'Library','browseBGColor','Browse Library BG Color','RGB Hex value, without leading #. Background color used behind library browsing screen.','00255'),
	(54,'Library','browseBGImage','Browse Library BG Image','URL to background image used behind library browsing screen.',''),
	(55,'System','passwordPolicyAlpha','Password - Alpha Requirement','Require both upper and lower case alpha characters?','Y'),
	(56,'System','passwordPolicyNumeric','Password - Numeric Requirement','Require at least one numeric character?','Y'),
	(57,'System','passwordPolicyNonAlphaNumeric','Password - Non-Alphanumeric Requirement','Require at least one non-alphanumeric character (e.g. punctuation mark or space)?','N'),
	(58,'System','passwordPolicyMinLength','Password - Minimum Length','Minimum acceptable password length.','8'),
	(59,'User Admin','ethnicity','Ethnicity','Comma-separated list of ethnicities available in system',''),
	(60,'User Admin','nationality','Nationality','Comma-separated list of nationalities available in system. If blank, system will default to list of countries',''),
	(61,'User Admin','residencyStatus','Residency Status','Comma-separated list of residency status available in system. If blank, system will allow text input',''),
	(63,'User Admin','personalDataUpdaterRequiredFields','Personal Data Updater Required Fields','Serialized array listed personal fields in data updater, and whether or not they are required.','a:4:{s:5:\"Staff\";a:38:{s:5:\"title\";s:8:\"required\";s:7:\"surname\";s:0:\"\";s:9:\"firstName\";s:0:\"\";s:13:\"preferredName\";s:8:\"required\";s:12:\"officialName\";s:8:\"required\";s:16:\"nameInCharacters\";s:0:\"\";s:3:\"dob\";s:0:\"\";s:5:\"email\";s:0:\"\";s:14:\"emailAlternate\";s:0:\"\";s:6:\"phone1\";s:0:\"\";s:6:\"phone2\";s:0:\"\";s:6:\"phone3\";s:0:\"\";s:6:\"phone4\";s:0:\"\";s:13:\"languageFirst\";s:0:\"\";s:14:\"languageSecond\";s:0:\"\";s:13:\"languageThird\";s:0:\"\";s:14:\"countryOfBirth\";s:0:\"\";s:9:\"ethnicity\";s:0:\"\";s:8:\"religion\";s:0:\"\";s:12:\"citizenship1\";s:0:\"\";s:20:\"citizenship1Passport\";s:0:\"\";s:12:\"citizenship2\";s:0:\"\";s:20:\"citizenship2Passport\";s:0:\"\";s:20:\"nationalIDCardNumber\";s:0:\"\";s:15:\"residencyStatus\";s:0:\"\";s:14:\"visaExpiryDate\";s:0:\"\";s:10:\"profession\";s:0:\"\";s:8:\"employer\";s:0:\"\";s:8:\"jobTitle\";s:0:\"\";s:14:\"emergency1Name\";s:0:\"\";s:17:\"emergency1Number1\";s:0:\"\";s:17:\"emergency1Number2\";s:0:\"\";s:22:\"emergency1Relationship\";s:0:\"\";s:14:\"emergency2Name\";s:0:\"\";s:17:\"emergency2Number1\";s:0:\"\";s:17:\"emergency2Number2\";s:0:\"\";s:22:\"emergency2Relationship\";s:0:\"\";s:19:\"vehicleRegistration\";s:0:\"\";}s:7:\"Student\";a:38:{s:5:\"title\";s:8:\"required\";s:7:\"surname\";s:0:\"\";s:9:\"firstName\";s:0:\"\";s:13:\"preferredName\";s:8:\"required\";s:12:\"officialName\";s:8:\"required\";s:16:\"nameInCharacters\";s:0:\"\";s:3:\"dob\";s:0:\"\";s:5:\"email\";s:0:\"\";s:14:\"emailAlternate\";s:0:\"\";s:6:\"phone1\";s:0:\"\";s:6:\"phone2\";s:0:\"\";s:6:\"phone3\";s:0:\"\";s:6:\"phone4\";s:0:\"\";s:13:\"languageFirst\";s:0:\"\";s:14:\"languageSecond\";s:0:\"\";s:13:\"languageThird\";s:0:\"\";s:14:\"countryOfBirth\";s:0:\"\";s:9:\"ethnicity\";s:0:\"\";s:8:\"religion\";s:0:\"\";s:12:\"citizenship1\";s:0:\"\";s:20:\"citizenship1Passport\";s:0:\"\";s:12:\"citizenship2\";s:0:\"\";s:20:\"citizenship2Passport\";s:0:\"\";s:20:\"nationalIDCardNumber\";s:0:\"\";s:15:\"residencyStatus\";s:0:\"\";s:14:\"visaExpiryDate\";s:0:\"\";s:10:\"profession\";s:0:\"\";s:8:\"employer\";s:0:\"\";s:8:\"jobTitle\";s:0:\"\";s:14:\"emergency1Name\";s:0:\"\";s:17:\"emergency1Number1\";s:0:\"\";s:17:\"emergency1Number2\";s:0:\"\";s:22:\"emergency1Relationship\";s:0:\"\";s:14:\"emergency2Name\";s:0:\"\";s:17:\"emergency2Number1\";s:0:\"\";s:17:\"emergency2Number2\";s:0:\"\";s:22:\"emergency2Relationship\";s:0:\"\";s:19:\"vehicleRegistration\";s:0:\"\";}s:6:\"Parent\";a:38:{s:5:\"title\";s:8:\"required\";s:7:\"surname\";s:0:\"\";s:9:\"firstName\";s:0:\"\";s:13:\"preferredName\";s:8:\"required\";s:12:\"officialName\";s:8:\"required\";s:16:\"nameInCharacters\";s:0:\"\";s:3:\"dob\";s:0:\"\";s:5:\"email\";s:0:\"\";s:14:\"emailAlternate\";s:0:\"\";s:6:\"phone1\";s:0:\"\";s:6:\"phone2\";s:0:\"\";s:6:\"phone3\";s:0:\"\";s:6:\"phone4\";s:0:\"\";s:13:\"languageFirst\";s:0:\"\";s:14:\"languageSecond\";s:0:\"\";s:13:\"languageThird\";s:0:\"\";s:14:\"countryOfBirth\";s:0:\"\";s:9:\"ethnicity\";s:0:\"\";s:8:\"religion\";s:0:\"\";s:12:\"citizenship1\";s:0:\"\";s:20:\"citizenship1Passport\";s:0:\"\";s:12:\"citizenship2\";s:0:\"\";s:20:\"citizenship2Passport\";s:0:\"\";s:20:\"nationalIDCardNumber\";s:0:\"\";s:15:\"residencyStatus\";s:0:\"\";s:14:\"visaExpiryDate\";s:0:\"\";s:10:\"profession\";s:0:\"\";s:8:\"employer\";s:0:\"\";s:8:\"jobTitle\";s:0:\"\";s:14:\"emergency1Name\";s:0:\"\";s:17:\"emergency1Number1\";s:0:\"\";s:17:\"emergency1Number2\";s:0:\"\";s:22:\"emergency1Relationship\";s:0:\"\";s:14:\"emergency2Name\";s:0:\"\";s:17:\"emergency2Number1\";s:0:\"\";s:17:\"emergency2Number2\";s:0:\"\";s:22:\"emergency2Relationship\";s:0:\"\";s:19:\"vehicleRegistration\";s:0:\"\";}s:5:\"Other\";a:38:{s:5:\"title\";s:8:\"required\";s:7:\"surname\";s:0:\"\";s:9:\"firstName\";s:0:\"\";s:13:\"preferredName\";s:8:\"required\";s:12:\"officialName\";s:8:\"required\";s:16:\"nameInCharacters\";s:0:\"\";s:3:\"dob\";s:0:\"\";s:5:\"email\";s:0:\"\";s:14:\"emailAlternate\";s:0:\"\";s:6:\"phone1\";s:0:\"\";s:6:\"phone2\";s:0:\"\";s:6:\"phone3\";s:0:\"\";s:6:\"phone4\";s:0:\"\";s:13:\"languageFirst\";s:0:\"\";s:14:\"languageSecond\";s:0:\"\";s:13:\"languageThird\";s:0:\"\";s:14:\"countryOfBirth\";s:0:\"\";s:9:\"ethnicity\";s:0:\"\";s:8:\"religion\";s:0:\"\";s:12:\"citizenship1\";s:0:\"\";s:20:\"citizenship1Passport\";s:0:\"\";s:12:\"citizenship2\";s:0:\"\";s:20:\"citizenship2Passport\";s:0:\"\";s:20:\"nationalIDCardNumber\";s:0:\"\";s:15:\"residencyStatus\";s:0:\"\";s:14:\"visaExpiryDate\";s:0:\"\";s:10:\"profession\";s:0:\"\";s:8:\"employer\";s:0:\"\";s:8:\"jobTitle\";s:0:\"\";s:14:\"emergency1Name\";s:0:\"\";s:17:\"emergency1Number1\";s:0:\"\";s:17:\"emergency1Number2\";s:0:\"\";s:22:\"emergency1Relationship\";s:0:\"\";s:14:\"emergency2Name\";s:0:\"\";s:17:\"emergency2Number1\";s:0:\"\";s:17:\"emergency2Number2\";s:0:\"\";s:22:\"emergency2Relationship\";s:0:\"\";s:19:\"vehicleRegistration\";s:0:\"\";}}'),
	(65,'School Admin','primaryExternalAssessmentByYearGroup','Primary External Assessment By Year Group','Serialized array connected pupilsightExternalAssessmentID to pupilsightYearGroupID, and specify which field set to use.','a:12:{s:3:\"001\";s:13:\"0001-1_Scores\";s:3:\"002\";s:10:\"0006-Test1\";s:3:\"008\";s:13:\"0001-1_Scores\";s:3:\"012\";s:19:\"0002-0_Target Grade\";s:3:\"003\";N;s:3:\"004\";N;s:3:\"005\";N;s:3:\"006\";N;s:3:\"007\";N;s:3:\"009\";N;s:3:\"010\";N;s:3:\"011\";N;}'),
	(66,'Markbook','markbookType','Markbook Type','Comma-separated list of types to make available in the Markbook.','Essay,Exam,Homework,Reflection,Test,Unit,End of Year,Other'),
	(67,'System','allowableHTML','Allowable HTML','TinyMCE-style list of acceptable HTML tags and options.','br[style],strong[style],em[style],span[style],p[style],address[style],pre[style],h1[style],h2[style],h3[style],h4[style],h5[style],h6[style],table[style],thead[style],tbody[style],tfoot[style],tr[style],td[style|colspan|rowspan],ol[style],ul[style],li[style],blockquote[style],a[style|target|href],img[style|class|src|width|height],video[style],source[style],hr[style],iframe[style|width|height|src|frameborder|allowfullscreen],embed[style],div[style],sup[style],sub[style]'),
	(68,'Application Form','howDidYouHear','How Did Your Hear?','Comma-separated list','Advertisement,Personal Recommendation,World Wide Web,Others'),
	(70,'Messenger','smsUsername','SMS Username','SMS gateway username.',''),
	(71,'Messenger','smsPassword','SMS Password','SMS gateway password.',''),
	(72,'Messenger','smsURL','SMS URL','SMS gateway URL for send requests.',''),
	(73,'Messenger','smsURLCredit','SMS URL Credit','SMS gateway URL for checking credit.',''),
	(74,'System','currency','Currency','System-wde currency for financial transactions. Support for online payment in this currency depends on your credit card gateway: please consult their support documentation.','INR ₹'),
	(75,'System','enablePayments','Enable Payments','Should payments be enabled across the system?','N'),
	(76,'System','paypalAPIUsername','PayPal API Username','API Username provided by PayPal.',''),
	(77,'System','paypalAPIPassword','PayPal API Password','API Password provided by PayPal.',''),
	(78,'System','paypalAPISignature','PayPal API Signature','API Signature provided by PayPal.',''),
	(79,'Application Form','applicationFee','Application Fee','The cost of applying to the school.','200'),
	(80,'Application Form','requiredDocuments','Required Documents','Comma-separated list of documents which must be submitted electronically with the application form.','Birth Certificate, Aadhar Card, Original TC, Caste Certificate, Passport, 3 Years Marks Card, Income tax, Custody documents, Photos, Other'),
	(81,'Application Form','requiredDocumentsCompulsory','Required Documents Compulsory?','Are the required documents compulsory?','N'),
	(82,'Application Form','requiredDocumentsText','Required Documents Text','Explanatory text to appear with the required documents?','Original Birth Certificate to verify with an attested photocopy, Original Aadhar Card to verify with an attested photocopy, Original TC, Original Caste Certificate to verify with an attested photocopy, Original Passport to verify with an attested photocopy, Original 3 Years Marks Card, Original Recent IT return Copy of Parents to verify with attested photocopy, Original Custody documents if any to verify with attested photocopy, Digital Photos of Student, Others'),
	(83,'Application Form','notificationStudentDefault','Student Notification Default','Should student acceptance email be turned on or off by default.','Y'),
	(84,'Application Form','languageOptionsActive','Language Options Active','Should the Language Options section be turned on?','Y'),
	(85,'Application Form','languageOptionsBlurb','Language Options Blurb','Introductory text if Language Options section is turned on.','Select your Language'),
	(86,'Application Form','languageOptionsLanguageList','Language Options Language List','Comma-separated list of available language selections if Language Options section is turned on.','English, Hindi, Marathi, Bengali, Urdhu,Tamil, Telgu, Malyalum,Kannada'),
	(88,'User Admin','personalBackground','Personal Background','Should users be allowed to set their own personal backgrounds?','Y'),
	(91,'User Admin','dayTypeOptions','Day-Type Options','Comma-separated list of options to make available (e.g. half-day, full-day). If blank, this field will not show up in the application form.',''),
	(92,'User Admin','dayTypeText','Day-Type Text','Explanatory text to include with Day-Type Options.',''),
	(95,'Markbook','showStudentAttainmentWarning','Show Student Attainment Warning','Show low attainment grade visual warning to students?','Y'),
	(96,'Markbook','showStudentEffortWarning','Show Student Effort Warning','Show low effort grade visual warning to students?','Y'),
	(97,'Markbook','showParentAttainmentWarning','Show Parent Attainment Warning','Show low attainment grade visual warning to parents?','Y'),
	(98,'Markbook','showParentEffortWarning','Show Parent Effort Warning','Show low effort grade visual warning to parents?','Y'),
	(99,'Planner','allowOutcomeEditing','Allow Outcome Editing','Should the text within outcomes be editable when planning lessons and units?','Y'),
	(100,'User Admin','privacy','Privacy','Should privacy options be turned on across the system?','N'),
	(101,'User Admin','privacyBlurb','Privacy Blurb','Descriptive text to accompany image privacy option when shown to users.',''),
	(102,'Finance','invoiceText','Invoice Text','Text to appear in invoice, above invoice details and fees.',''),
	(103,'Finance','invoiceNotes','Invoice Notes','Text to appear in invoice, below invoice details and fees.',''),
	(104,'Finance','receiptText','Receipt Text','Text to appear in receipt, above receipt details and fees.',''),
	(105,'Finance','receiptNotes','Receipt Notes','Text to appear in receipt, below receipt details and fees.',''),
	(106,'Finance','reminder1Text','Reminder 1 Text','Text to appear in first level reminder level, above invoice details and fees.','Test Invoice1'),
	(107,'Finance','reminder2Text','Reminder 2 Text','Text to appear in second level reminder level, above invoice details and fees.','Test Invoice2'),
	(108,'Finance','reminder3Text','Reminder 3 Text','Text to appear in third level reminder level, above invoice details and fees.','Test Invoice3'),
	(109,'Finance','email','Email','Email address to send finance emails from.','rakesh@thoughtnet.in'),
	(110,'Application Form','notificationParentsDefault','Parents Notification Default','Should parent acceptance email be turned on or off by default.','Y'),
	(111,'User Admin','privacyOptions','Privacy Options','Comma-separated list of choices to make available if privacy options are turned on. If blank, privacy fields will not be displayed.',''),
	(112,'Planner','sharingDefaultParents','Sharing Default: Parents','When adding lessons and deploying units, should sharing default for parents be Y or N?','Y'),
	(113,'Planner','sharingDefaultStudents','Sharing Default: Students','When adding lessons and deploying units, should sharing default for students be Y or N?','Y'),
	(115,'Students','extendedBriefProfile','Extended Brief Profile','The extended version of the brief student profile includes contact information of parents.','N'),
	(116,'Application Form','notificationParentsMessage','Parents Notification Message','A custom message to add to the standard email to parents on acceptance.','Your application is submitted, the following further process is in process.'),
	(117,'Application Form','notificationStudentMessage','Student Notification Message','A custom message to add to the standard email to students on acceptance.',''),
	(118,'Finance','invoiceNumber','Invoice Number Style','How should invoice numbers be constructed?','Student ID + Invoice ID'),
	(119,'User Admin','departureReasons','Departure Reasons','Comma-separated list of reasons for departure from school. If blank, user can enter any text.',''),
	(120,'System','googleOAuth','Google Integration','Enable Pupilsight-wide integration with the Google APIs?','N'),
	(122,'System','googleClientName','Google Developers Client Name','Name of Google Project in Developers Console.',''),
	(123,'System','googleClientID','Google Developers Client ID','Client ID for Google Project In Developers Console.',''),
	(124,'System','googleClientSecret','Google Developers Client Secret','Client Secret for Google Project In Developers Console.',''),
	(125,'System','googleRedirectUri','Google Developers Redirect Url','Google Redirect on sucessful auth.',''),
	(126,'System','googleDeveloperKey','Google Developers Developer Key','Google project Developer Key.',''),
	(127,'Markbook','personalisedWarnings','Personalised Warnings','Should markbook warnings be based on personal targets, if they are available?','Y'),
	(128,'Activities','disableExternalProviderSignup','Disable External Provider Signup','Should we turn off the option to sign up for activities provided by an outside agency?','N'),
	(129,'Activities','hideExternalProviderCost','Hide External Provider Cost','Should we hide the cost of activities provided by an outside agency from the Activities View?','N'),
	(130,'System','cuttingEdgeCode','Cutting Edge Code','Are you running cutting edge code, instead of stable versions?','N'),
	(131,'System','cuttingEdgeCodeLine','Cutting Edge Code Line','What line of SQL code did the last cutting edge update hit?',''),
	(132,'System','pupilsighteduComOrganisationName','pupilsightedu.com Organisation Name','Name of organisation, as registered with pupilsightedu.com, for access to value-added services.',''),
	(133,'System','pupilsighteduComOrganisationKey','pupilsightedu.com Organisation Key','Organisation\'s private key, as registered with pupilsightedu.com, for access to value-added services.',''),
	(134,'Application Form','studentDefaultEmail','Student Default Email','Set default email for students on acceptance, using [username] to insert username.',''),
	(135,'Application Form','studentDefaultWebsite','Student Default Website','Set default website for students on acceptance, using [username] to insert username.',''),
	(136,'School Admin','studentAgreementOptions','Student Agreement Options','Comma-separated list of agreements that students might be asked to sign in school (e.g. ICT Policy).',''),
	(137,'Markbook','attainmentAlternativeName','Attainment Alternative Name','A name to use isntead of \"Attainment\" in the first grade column of the markbook.',''),
	(138,'Markbook','effortAlternativeName','Effort Alternative Name','A name to use isntead of \"Effort\" in the second grade column of the markbook.',''),
	(139,'Markbook','attainmentAlternativeNameAbrev','Attainment Alternative Name Abbreviation','A short name to use isntead of \"Attainment\" in the first grade column of the markbook.',''),
	(140,'Markbook','effortAlternativeNameAbrev','Effort Alternative Name Abbreviation','A short name to use isntead of \"Effort\" in the second grade column of the markbook.',''),
	(141,'Planner','parentWeeklyEmailSummaryIncludeBehaviour','Parent Weekly Email Summary Include Behaviour','Should behaviour information be included in the weekly planner email summary that goes out to parents?','Y'),
	(142,'Finance','financeOnlinePaymentEnabled','Enable Online Payment','Should invoices be payable online, via an encrypted link in the invoice? Requires correctly configured payment gateway in System Settings.','Y'),
	(143,'Finance','financeOnlinePaymentThreshold','Online Payment Threshold','If invoices are payable online, what is the maximum payment allowed? Useful for controlling payment fees. No value means unlimited.',''),
	(144,'Departments','makeDepartmentsPublic','Make Departments Public','Should department information be made available to the public, via the Pupilsight homepage?','Y'),
	(145,'System','sessionDuration','Session Duration','Time, in seconds, before system logs a user out. Should be less than PHP\'s session.gc_maxlifetime option.','6400'),
	(146,'Planner','makeUnitsPublic','Make Units Public','Enables a public listing of units, with teachers able to opt in to share units.','Y'),
	(147,'Messenger','messageBubbleWidthType','Message Bubble Width Type','Should the message bubble be regular or wide?','Regular'),
	(148,'Messenger','messageBubbleBGColor','Message Bubble Background Color','Message bubble background color in RGBA (e.g. 100,100,100,0.50). If blank, theme default will be used.','50,50,50,50'),
	(149,'Messenger','messageBubbleAutoHide','Message Bubble Auto Hide','Should message bubble fade out automatically?','Y'),
	(150,'Students','enableStudentNotes','Enable Student Notes','Should student notes be turned on?','Y'),
	(151,'Finance','budgetCategories','Budget Categories','Comma-separated list of budget categories.','Academic, Administration,Extra Curiculum'),
	(153,'Finance','expenseApprovalType','Expense Approval Type','How should expense approval be dealt with?','One Of'),
	(154,'Finance','budgetLevelExpenseApproval','Budget Level Expense Approval','Should approval from a budget member with Full access be required?','Y'),
	(155,'Finance','expenseRequestTemplate','Expense Request Template','An HTML template to be used in the description field of expense requests.',''),
	(156,'Finance','purchasingOfficer','Purchasing Officer','User responsible for purchasing for the school.','0000000001'),
	(157,'Finance','reimbursementOfficer','Reimbursement Officer','User responsible for reimbursing expenses.','0000000001'),
	(158,'Messenger','enableHomeScreenWidget','Enable Home Screen Widget','Adds a Message Wall widget to the home page, hihglighting current messages.','Y'),
	(159,'User Admin','enablePublicRegistration','Enable Public Registration','Allows members of the public to register to use the system.','Y'),
	(160,'User Admin','publicRegistrationMinimumAge','Public Registration Minimum Age','The minimum age, in years, permitted to register.','20'),
	(161,'User Admin','publicRegistrationDefaultStatus','Public Registration Default Status','Should new users be \'Full\' or \'Pending Approval\'?','Pending Approval'),
	(162,'User Admin','publicRegistrationDefaultRole','Public Registration Default Role','System role to be assigned to registering members of the public.','003'),
	(163,'User Admin','publicRegistrationIntro','Public Registration Introductory Text','HTML text that will appear above the public registration form.',''),
	(164,'User Admin','publicRegistrationPrivacyStatement','Public Registration Privacy Statement','HTML text that will appear above the Submit button, explaining privacy policy.','By registering for this site you are giving permission for your personal data to be used and shared within this organisation and its websites. We will not share your personal data outside our organisation.'),
	(165,'User Admin','publicRegistrationAgreement','Public Registration Agreement','Agreement that user must confirm before joining. Blank for no agreement.','In joining this site, and checking the box below, I agree to act lawfully, ethically and with respect for others. I agree to use this site for learning purposes only, and understand that access may be withdrawn at any time, at the discretion of the site\'s administrators.'),
	(166,'User Admin','publicRegistrationPostscript','Public Registration Postscript','HTML text that will appear underneath the public registration form.',''),
	(167,'System','alarm','Alarm','Sound a system wide alarm to all staff.','None'),
	(168,'Behaviour','enableDescriptors','Enable Descriptors','Setting to No reduces complexity of behaviour tracking.','Y'),
	(169,'Behaviour','enableLevels','Enable Levels','Setting to No reduces complexity of behaviour tracking.','Y'),
	(170,'Formal Assessment','internalAssessmentTypes','Internal Assessment Types','Comma-separated list of types to make available in Internal Assessments.','Expected Grade,Predicted Grade,Target Grade'),
	(171,'System Admin','customAlarmSound','Custom Alarm Sound','A custom alarm sound file.',''),
	(172,'School Admin','facilityTypes','FacilityTypes','A comma-separated list of types for facilities.','Classroom,Hall,Laboratory,Library,Office,Outdoor,Performance,Staffroom,Storage,Study,Undercover,Play ground,Other.'),
	(173,'Finance','allowExpenseAdd','Allow Expense Add','Allows privileged users to add expenses without going through request process.','Y'),
	(174,'System','organisationAdministrator','System Administrator','The staff member who receives notifications for system events.','0000000001'),
	(175,'System','organisationDBA','Database Administrator','The staff member who receives notifications for data events.','0000000001'),
	(176,'System','organisationAdmissions','Admissions Administrator','The staff member who receives notifications for admissions events.','0000000001'),
	(177,'Finance','hideItemisation','Hide Itemisation','Hide fee and payment details in receipts?','N'),
	(178,'Application Form','autoHouseAssign','Auto House Assign','Attempt to automatically place student in a house?','N'),
	(179,'Tracking','externalAssessmentDataPoints','External Assessment Data Points','Stores the external assessment choices for data points output in tracking.','a:8:{i:0;a:3:{s:30:\"pupilsightExternalAssessmentID\";s:4:\"0001\";s:8:\"category\";s:8:\"1_Scores\";s:25:\"pupilsightYearGroupIDList\";s:19:\"001,002,003,004,008\";}i:1;a:3:{s:30:\"pupilsightExternalAssessmentID\";s:4:\"0001\";s:8:\"category\";s:19:\"2_KS3 Target Grades\";s:25:\"pupilsightYearGroupIDList\";s:3:\"008\";}i:2;a:3:{s:30:\"pupilsightExternalAssessmentID\";s:4:\"0001\";s:8:\"category\";s:20:\"3_GCSE Target Grades\";s:25:\"pupilsightYearGroupIDList\";s:3:\"008\";}i:3;a:2:{s:30:\"pupilsightExternalAssessmentID\";s:4:\"0002\";s:8:\"category\";s:14:\"0_Target Grade\";}i:4;a:2:{s:30:\"pupilsightExternalAssessmentID\";s:4:\"0002\";s:8:\"category\";s:13:\"1_Final Grade\";}i:5;a:2:{s:30:\"pupilsightExternalAssessmentID\";s:4:\"0003\";s:8:\"category\";s:14:\"0_Target Grade\";}i:6;a:2:{s:30:\"pupilsightExternalAssessmentID\";s:4:\"0003\";s:8:\"category\";s:13:\"1_Final Grade\";}i:7;a:3:{s:30:\"pupilsightExternalAssessmentID\";s:4:\"0006\";s:8:\"category\";s:5:\"Test1\";s:25:\"pupilsightYearGroupIDList\";s:47:\"001,002,003,004,005,006,007,008,009,010,011,012\";}}'),
	(180,'Tracking','internalAssessmentDataPoints','Internal Assessment Data Points','Stores the internal assessment choices for data points output in tracking.','a:3:{i:0;a:1:{s:4:\"type\";s:14:\"Expected Grade\";}i:1;a:1:{s:4:\"type\";s:15:\"Predicted Grade\";}i:2;a:1:{s:4:\"type\";s:12:\"Target Grade\";}}'),
	(181,'Behaviour','enableBehaviourLetters','Enable Behaviour Letters','Should automated behaviour letter functionality be enabled?','Y'),
	(182,'Behaviour','behaviourLettersLetter1Count','Letter 1 Count','After how many negative records should letter 1 be sent?','3'),
	(183,'Behaviour','behaviourLettersLetter1Text','Letter 1 Text','The contents of letter 1, as HTML.','Dear Parent/Guardian,<br/><br/>This letter has been automatically generated to alert you to the fact that your child, [studentName], has reached [behaviourCount] negative behaviour incidents. Please see the list below for the details of these incidents:<br/><br/>[behaviourRecord]<br/><br/>This letter represents the first communication in a sequence of 3 potential alerts, each of which is more critical than the last.<br/><br/>If you would like more information on this matter, please contact your child\'s tutor.'),
	(184,'Behaviour','behaviourLettersLetter2Count','Letter 2 Count','After how many negative records should letter 2 be sent?','6'),
	(185,'Behaviour','behaviourLettersLetter2Text','Letter 2 Text','The contents of letter 2, as HTML.','Dear Parent/Guardian,<br/><br/>This letter has been automatically generated to alert you to the fact that your child, [studentName], has reached [behaviourCount] negative behaviour incidents. Please see the list below for the details of these incidents:<br/><br/>[behaviourRecord]<br/><br/>This letter represents the second communication in a sequence of 3 potential alerts, each of which is more critical than the last.<br/><br/>If you would like more information on this matter, please contact your child\'s tutor.'),
	(186,'Behaviour','behaviourLettersLetter3Count','Letter 3 Count','After how many negative records should letter 3 be sent?','9'),
	(187,'Behaviour','behaviourLettersLetter3Text','Letter 3 Text','The contents of letter 3, as HTML.','Dear Parent/Guardian,<br/><br/>This letter has been automatically generated to alert you to the fact that your child, [studentName], has reached [behaviourCount] negative behaviour incidents. Please see the list below for the details of these incidents:<br/><br/>[behaviourRecord]<br/><br/>This letter represents the final communication in a sequence of 3 potential alerts, each of which is more critical than the last.<br/><br/>If you would like more information on this matter, please contact your child\'s tutor.'),
	(188,'Markbook','enableColumnWeighting','Enable Column Weighting','Should column weighting and total scores be enabled in the Markbook?','Y'),
	(189,'System','firstDayOfTheWeek','First Day Of The Week','On which day should the week begin?','Monday'),
	(190,'Application Form','usernameFormat','Username Format','How should usernames be formated? Choose from [preferredName], [preferredNameInitial], [surname].','[preferredNameInitial][surname]'),
	(191,'Staff','jobOpeningDescriptionTemplate','Job Opening Description Template','Default HTML contents for the Job Opening Description field.','<table style=\'width: 100%\'>\r\n	<tr>\r\n		<td colspan=2 style=\'vertical-align: top\'>\r\n			<span style=\'text-decoration: underline; font-weight: bold\'>Job Description</span><br/>\r\n			<br/>\r\n		</td>\r\n	</tr>\r\n	<tr>\r\n		<td style=\'width: 50%; vertical-align: top\'>\r\n			<span style=\'text-decoration: underline; font-weight: bold\'>Responsibilities</span><br/>\r\n			<ul style=\'margin-top:0px\'>\r\n				<li></li>\r\n				<li></li>\r\n			</ul>\r\n		</td>\r\n		<td style=\'width: 50%; vertical-align: top\'>\r\n			<span style=\'text-decoration: underline; font-weight: bold\'>Required Skills/Characteristics</span><br/>\r\n			<ul style=\'margin-top:0px\'>\r\n				<li></li>\r\n				<li></li>\r\n			</ul>\r\n		</td>\r\n	</tr>\r\n	<tr>\r\n		<td style=\'width: 50%; vertical-align: top\'>\r\n			<span style=\'text-decoration: underline; font-weight: bold\'>Remuneration</span><br/>\r\n			<ul style=\'margin-top:0px\'>\r\n				<li></li>\r\n				<li></li>\r\n			</ul>\r\n		</td>\r\n		<td style=\'width: 50%; vertical-align: top\'>\r\n			<span style=\'text-decoration: underline; font-weight: bold\'>Other Details </span><br/>\r\n			<ul style=\'margin-top:0px\'>\r\n				<li></li>\r\n				<li></li>\r\n			</ul>\r\n		</td>\r\n	</tr>\r\n</table>'),
	(192,'Staff','staffApplicationFormIntroduction','Introduction','Information to display before the form',''),
	(193,'Staff','staffApplicationFormPostscript','Postscript','Information to display at the end of the form',''),
	(194,'Staff','staffApplicationFormAgreement','Agreement','Without this text, which is displayed above the agreement, users will not be asked to agree to anything','In submitting this form, I confirm that all information provided above is accurate and complete to the best of my knowledge.'),
	(195,'Staff','staffApplicationFormMilestones','Milestones','Comma-separated list of the major steps in the application process. Applicants can be tracked through the various stages.','Short List, First Interview, Second Interview, Offer Made, Offer Accepted, Contact Issued, Contact Signed'),
	(196,'Staff','staffApplicationFormRequiredDocuments','Required Documents','Comma-separated list of documents which must be submitted electronically with the application form.','Curriculum Vitae'),
	(197,'Staff','staffApplicationFormRequiredDocumentsCompulsory','Required Documents Compulsory?','Are the required documents compulsory?','Y'),
	(198,'Staff','staffApplicationFormRequiredDocumentsText','Required Documents Text','Explanatory text to appear with the required documents?','Please submit the following document(s) to ensure your application can be processed without delay.'),
	(199,'Staff','staffApplicationFormNotificationDefault','Notification Default','Should acceptance email be turned on or off by default.','Y'),
	(200,'Staff','staffApplicationFormNotificationMessage','Notification Message','A custom message to add to the standard email on acceptance.',''),
	(201,'Staff','staffApplicationFormDefaultEmail','Default Email','Set default email on acceptance, using [username] to insert username.',''),
	(202,'Staff','staffApplicationFormDefaultWebsite','Default Website','Set default website on acceptance, using [username] to insert username.',''),
	(203,'Staff','staffApplicationFormUsernameFormat','Username Format','How should usernames be formated? Choose from [preferredName], [preferredNameInitial], [surname].','[preferredNameInitial].[surname]'),
	(204,'System','organisationHR','Human Resources Administrator','The staff member who receives notifications for staffing events.','0000000001'),
	(205,'Staff','staffApplicationFormQuestions','Application Questions','HTML text that will appear as questions for the applicant to answer.','<span style=\'text-decoration: underline; font-weight: bold\'>Why are you applying for this role?</span><br/><p></p>'),
	(206,'Staff','salaryScalePositions','Salary Scale Positions','Comma-separated list of salary scale positions, from lowest to highest.','1,2,3,4,5,6,7,8,9,10'),
	(207,'Staff','responsibilityPosts','Responsibility Posts','Comma-separated list of posts carrying extra responsibilities.',''),
	(208,'Students','applicationFormSENText','Application Form SEN Text','Text to appear with the Special Educational Needs section of the student application form.','Please indicate whether or not your child has any known, or suspected, special educational needs, or whether they have been assessed for any such needs in the past. Provide any comments or information concerning your child\'s development that may be relevant to your child\'s performance in the classroom or elsewhere? Incorrect or withheld information may affect continued enrolment.'),
	(209,'Students','applicationFormRefereeLink','Application Form Referee Link','Link to an external form that will be emailed to a referee of the applicant\'s choosing.','http://core.pupiltalk.com/index.php?q=/modules/Students/applicationForm.php'),
	(210,'User Admin','religions','Religions','Comma-separated list of ethnicities available in system',',Nonreligious/Agnostic/Atheist,Buddhism,Christianity,Hinduism,Islam,Judaism,Other'),
	(211,'Staff','applicationFormRefereeLink','Application Form Referee Link','Link to an external form that will be emailed to a referee of the applicant\'s choosing.',''),
	(212,'Markbook','enableRawAttainment','Enable Raw Attainment Marks','Should recording of raw marks be enabled in the Markbook?','Y'),
	(213,'Markbook','enableGroupByTerm','Group Columns by Term','Should columns and total scores be grouped by term?','Y'),
	(214,'Markbook','enableEffort','Enable Effort','Should columns have the Effort section enabled?','Y'),
	(215,'Markbook','enableRubrics','Enable Rubrics','Should columns have Rubrics section enabled?','Y'),
	(216,'School Admin','staffDashboardDefaultTab','Staff Dashboard Default Tab','The default landing tab for the staff dashboard.','Planner'),
	(217,'School Admin','studentDashboardDefaultTab','Student Dashboard Default Tab','The default landing tab for the student dashboard.','Planner'),
	(218,'School Admin','parentDashboardDefaultTab','Parent Dashboard Default Tab','The default landing tab for the parent dashboard.','Activities'),
	(219,'System','enableMailerSMTP','Enable SMTP Mail','Adds PHPMailer settings for servers with an SMTP connection.','Y'),
	(220,'System','mailerSMTPHost','SMTP Host','Set the hostname of the mail server.','smtp.google.com'),
	(221,'System','mailerSMTPPort','SMTP Port','Set the SMTP port number - likely to be 25, 465 or 587.','465'),
	(222,'System','mailerSMTPUsername','SMTP Username','Username to use for SMTP authentication. Leave blank for no authentication.','support@pupilpod.in'),
	(223,'System','mailerSMTPPassword','SMTP Password','Password to use for SMTP authentication. Leave blank for no authentication.','Support@Pupilpod'),
	(229,'System','mainMenuCategoryOrder','Main Menu Category Order','A comma separated list of module categories in display order.','Admin,Assess,Learn,People,Other'),
	(232,'Attendance','attendanceReasons','Attendance Reasons','Comma-separated list of reasons which are available when taking attendance.','Late Come,Medical,Family Function,Education,Emmergency,Other'),
	(233,'Attendance','attendanceMedicalReasons','Medical Reasons','Comma-separated list of allowable medical reasons.','Medical'),
	(234,'Attendance','attendanceEnableMedicalTracking','Enable Symptom Tracking','Attach a symptom report to attendance logs with a medical reason.','N'),
	(235,'Students','medicalIllnessSymptoms','Predefined Illness Symptoms','Comma-separated list of illness symptoms.','Fever,Cough,Cold,Vomiting,Diarrhea'),
	(236,'Staff Application Form','staffApplicationFormPublicApplications','Public Applications?','If yes, members of the public can submit staff applications','Y'),
	(237,'Individual Needs','targetsTemplate','Targets Template','An HTML template to be used in the targets field.',''),
	(238,'Individual Needs','teachingStrategiesTemplate','Teaching Strategies Template','An HTML template to be used in the teaching strategies field.',''),
	(239,'Individual Needs','notesReviewTemplate','Notes & Review Template','An HTML template to be used in the notes and review field.',''),
	(240,'Attendance','attendanceCLINotifyByRollGroup','Enable Notifications by Roll Group','','Y'),
	(241,'Attendance','attendanceCLINotifyByClass','Enable Notifications by Class','','Y'),
	(242,'Attendance','attendanceCLIAdditionalUsers','Additional Users to Notify','Send the school-wide daily attendance report to additional users. Restricted to roles with permission to access Roll Groups Not Registered or Classes Not Registered.',''),
	(243,'Students','noteCreationNotification','Note Creation Notification','Determines who to notify when a new student note is created.','Tutors'),
	(244,'Finance','invoiceeNameStyle','Invoicee Name Style','Determines how invoicee name appears on invoices and receipts.','Surname, Preferred Name'),
	(245,'Planner','shareUnitOutline','Share Unit Outline','Allow users who do not have access to the unit planner to see Unit Outlines via the lesson planner?','Y'),
	(246,'Attendance','studentSelfRegistrationIPAddresses','Student Self Registration IP Addresses','Comma-separated list of IP addresses within which students can self register.',''),
	(247,'Application Form','internalDocuments','Internal Documents','Comma-separated list of documents for internal upload and use.',''),
	(248,'Attendance','countClassAsSchool','Count Class Attendance as School Attendance','Should attendance from the class context be used to prefill and inform school attendance?','N'),
	(251,'Attendance','defaultRollGroupAttendanceType','Default Roll Group Attendance Type','The default selection for attendance type when taking Roll Group attendance','Present'),
	(252,'Attendance','defaultClassAttendanceType','Default Class Attendance Type','The default selection for attendance type when taking Class attendance','Present'),
	(253,'Students','academicAlertLowThreshold','Low Academic Alert Threshold','The number of Markbook concerns needed in the past 60 days to raise a low level academic alert on a student.','3'),
	(254,'Students','academicAlertMediumThreshold','Medium Academic Alert Threshold','The number of Markbook concerns needed in the past 60 days to raise a medium level academic alert on a student.','5'),
	(255,'Students','academicAlertHighThreshold','High Academic Alert Threshold','The number of Markbook concerns needed in the past 60 days to raise a high level academic alert on a student.','9'),
	(256,'Students','behaviourAlertLowThreshold','Low Behaviour Alert Threshold','The number of Behaviour concerns needed in the past 60 days to raise a low level alert on a student.','3'),
	(257,'Students','behaviourAlertMediumThreshold','Medium Behaviour Alert Threshold','The number of Behaviour concerns needed in the past 60 days to raise a medium level alert on a student.','5'),
	(258,'Students','behaviourAlertHighThreshold','High Behaviour Alert Threshold','The number of Behaviour concerns needed in the past 60 days to raise a high level alert on a student.','9'),
	(259,'Markbook','enableDisplayCumulativeMarks','Enable Display Cumulative Marks','Should cumulative marks be displayed on the View Markbook page for Students and Parents and in Student Profiles?','Y'),
	(260,'Application Form','scholarshipOptionsActive','Scholarship Options Active','Should the Scholarship Options section be turned on?','Y'),
	(261,'Application Form','paymentOptionsActive','Payment Options Active','Should the Payment section be turned on?','Y'),
	(262,'Application Form','senOptionsActive','Special Education Needs Active','Should the Special Education Needs section be turned on?','Y'),
	(263,'Timetable Admin','autoEnrolCourses','Auto-Enrol Courses Default','Should auto-enrolment of new students into courses be turned on or off by default?','Y'),
	(264,'Application Form','availableYearsOfEntry','Available Years of Entry','Which school years should be available to apply to?',''),
	(265,'Application Form','enableLimitedYearsOfEntry','Enable Limited Years of Entry','If yes, applicants choices for Year of Entry can be limited to specific school years.','N'),
	(266,'User Admin','uniqueEmailAddress','Unique Email Address','Are primary email addresses required to be unique?','N'),
	(267,'Planner','parentWeeklyEmailSummaryIncludeMarkbook','Parent Weekly Email Summary Include Markbook','Should Markbook information be included in the weekly planner email summary that goes out to parents?','Y'),
	(268,'System','nameFormatStaffFormal','Formal Name Format','','[title] [preferredName:1]'),
	(269,'System','nameFormatStaffFormalReversed','Formal Name Reversed','','[title] [preferredName:1].'),
	(270,'System','nameFormatStaffInformal','Informal Name Format','','[preferredName] '),
	(271,'System','nameFormatStaffInformalReversed','Informal Name Reversed','','[preferredName]'),
	(272,'Attendance','selfRegistrationRedirect','Self Registration Redirect','Should self registration redirect to Message Wall?','N'),
	(273,'Data Updater','cutoffDate','Cutoff Date','Earliest acceptable date when checking if data updates are required.',''),
	(274,'Data Updater','redirectByRoleCategory','Data Updater Redirect','Which types of users should be redirected to the Data Updater if updates are required.','Parent'),
	(275,'Data Updater','requiredUpdates','Required Updates?','Should the data updater highlight updates that are required?','N'),
	(276,'Data Updater','requiredUpdatesByType','Required Update Types','Which type of data updates should be required.','Personal,Family'),
	(277,'Markbook','enableModifiedAssessment','Enable Modified Assessment','Allows teachers to specify \"Modified Assessment\" for students with individual needs.','Y'),
	(278,'Messenger','messageBcc','Message Bcc','Comma-separated list of recipients to bcc all messenger emails to.',''),
	(279,'System','organisationBackground','Background','Relative path to background image. Overrides theme background.',''),
	(280,'Messenger','smsGateway','SMS Gateway','','Pupilpod'),
	(281,'Messenger','smsSenderID','SMS Sender ID','The sender name or phone number. Depends on the gateway used.','pupilpod'),
	(282,'System Admin','exportDefaultFileType','Default Export File Type','','Excel2007'),
	(283,'System','mailerSMTPSecure','SMTP Encryption','Automatically sets the encryption based on the port, otherwise select one manually.','ssl'),
	(284,'Staff','substituteTypes','Substitute Types','A comma-separated list.','Internal Substitute,External Substitute'),
	(285,'Staff','urgencyThreshold','Urgency Threshold','Notifications in this time-span are sent immediately, day or night.',''),
	(286,'Staff','urgentNotifications','Urgent Notifications','If enabled, urgent notifications will be sent by SMS as well as email.','N'),
	(287,'Staff','absenceApprovers','Absence Approvers','Users who can approve staff absences. Leave this blank if approval is not used.','0000000001'),
	(288,'Staff','absenceFullDayThreshold','Full Day Absence','The minumum number of hours for an absence to count as a full day (1.0)','6.0'),
	(289,'Staff','absenceHalfDayThreshold','Half Day Absence','The minumum number of hours for an absence to count as a half day (0.5). Absences less than this count as 0','2.0'),
	(290,'Staff','absenceNotificationGroups','Notification Groups','Which messenger groups can staff members send absence notifications to?',''),
	(291,'Attendance','crossFillClasses','Cross-Fill Classes','Should classes prefill with data from other classes?','N'),
	(309,'Alumni','showPublicRegistration','Show Public Registration','Should the alumni registration form be displayed on the school\'s Pupilsight homepage, or available via a link only?.','Y'),
	(310,'Alumni','facebookLink','Facebook Link','A URL pointing to a Facebook page for the school\'s alumni group.',''),
	(321,'Badges','badgeCategories','Badge Categories','Comma-separated list of available choices for badge category.','Academic,Athletic,Social,Other'),
	(322,'Help Desk','issuePriority','Issue Priority','Different priority levels for the issues.',''),
	(323,'Help Desk','issuePriorityName','Issue Priority Name','Different name for the Issue Priority','Priority'),
	(324,'Help Desk','issueCategory','Issue Category','Different categories for the issues.','Network,Hardware,Software,Application'),
	(325,'Help Desk','resolvedIssuePrivacy','Default Resolved Issue Privacy','Default privacy setting for resolved issues.','Related'),
	(326,'Messenger','smsCopy','SMS Copy','Comma-separated list of recipients to copy all sms mobile to.',''),
	(327,'Messenger','send_sms_to','SEND SMS TO','','yes'),
	(328,'System','smsCredits','SMS Credits','','74000'),
	(329,'System','pupilsightSchoolYearID','Academic Year','Credits Academic Year','025');

/*!40000 ALTER TABLE `pupilsightSetting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightSpace
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightSpace`;

CREATE TABLE `pupilsightSpace` (
  `pupilsightSpaceID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `type` varchar(50) NOT NULL,
  `capacity` int(5) NOT NULL,
  `computer` enum('N','Y') NOT NULL,
  `computerStudent` int(3) NOT NULL DEFAULT '0',
  `projector` enum('N','Y') NOT NULL,
  `tv` enum('N','Y') NOT NULL,
  `dvd` enum('N','Y') NOT NULL,
  `hifi` enum('N','Y') NOT NULL,
  `speakers` enum('N','Y') NOT NULL,
  `iwb` enum('N','Y') NOT NULL,
  `phoneInternal` varchar(5) NOT NULL,
  `phoneExternal` varchar(20) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`pupilsightSpaceID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightSpacePerson
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightSpacePerson`;

CREATE TABLE `pupilsightSpacePerson` (
  `pupilsightSpacePersonID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSpaceID` int(10) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `usageType` enum('','Teaching','Office','Other') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pupilsightSpacePersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table pupilsightStaff
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStaff`;

CREATE TABLE `pupilsightStaff` (
  `pupilsightStaffID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  `initials` varchar(4) DEFAULT NULL,
  `jobTitle` varchar(100) DEFAULT '',
  `smartWorkflowHelp` enum('N','Y') DEFAULT 'Y',
  `firstAidQualified` enum('','N','Y') DEFAULT '',
  `firstAidExpiry` date DEFAULT NULL,
  `countryOfOrigin` varchar(80) DEFAULT '',
  `qualifications` varchar(255) DEFAULT '',
  `biography` text,
  `biographicalGrouping` varchar(100) DEFAULT '' COMMENT 'Used for group staff when creating a staff directory.',
  `biographicalGroupingPriority` int(3) DEFAULT NULL,
  `signature_path` text,
  `is_principle` tinyint(1) DEFAULT '0',
  `staff_status` varchar(20) DEFAULT NULL,
  `inactive_reason` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`pupilsightStaffID`),
  UNIQUE KEY `pupilsightPersonID` (`pupilsightPersonID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightStaff` WRITE;
/*!40000 ALTER TABLE `pupilsightStaff` DISABLE KEYS */;

INSERT INTO `pupilsightStaff` (`pupilsightStaffID`, `pupilsightPersonID`, `type`, `initials`, `jobTitle`, `smartWorkflowHelp`, `firstAidQualified`, `firstAidExpiry`, `countryOfOrigin`, `qualifications`, `biography`, `biographicalGrouping`, `biographicalGroupingPriority`, `signature_path`, `is_principle`, `staff_status`, `inactive_reason`)
VALUES
	(1,1,'Teaching',NULL,'Test','N','Y','2020-08-31','India','Test','Teaching','',0,'',0,NULL,NULL);

/*!40000 ALTER TABLE `pupilsightStaff` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightStaffAbsence
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStaffAbsence`;

CREATE TABLE `pupilsightStaffAbsence` (
  `pupilsightStaffAbsenceID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightStaffAbsenceTypeID` int(6) unsigned NOT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `reason` varchar(60) DEFAULT NULL,
  `comment` text,
  `commentConfidential` text,
  `status` enum('Pending Approval','Approved','Declined') DEFAULT 'Approved',
  `coverageRequired` enum('N','Y') DEFAULT 'N',
  `pupilsightPersonIDApproval` int(10) unsigned DEFAULT NULL,
  `timestampApproval` timestamp NULL DEFAULT NULL,
  `notesApproval` text,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notificationSent` enum('N','Y') DEFAULT 'N',
  `notificationList` text,
  `pupilsightGroupID` int(8) unsigned DEFAULT NULL,
  `googleCalendarEventID` text,
  PRIMARY KEY (`pupilsightStaffAbsenceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightStaffAbsenceDate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStaffAbsenceDate`;

CREATE TABLE `pupilsightStaffAbsenceDate` (
  `pupilsightStaffAbsenceDateID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightStaffAbsenceID` int(14) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `allDay` enum('N','Y') DEFAULT 'Y',
  `timeStart` time DEFAULT NULL,
  `timeEnd` time DEFAULT NULL,
  `value` decimal(2,1) NOT NULL DEFAULT '1.0',
  PRIMARY KEY (`pupilsightStaffAbsenceDateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightStaffAbsenceType
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStaffAbsenceType`;

CREATE TABLE `pupilsightStaffAbsenceType` (
  `pupilsightStaffAbsenceTypeID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `nameShort` varchar(10) DEFAULT NULL,
  `active` enum('N','Y') DEFAULT 'Y',
  `requiresApproval` enum('N','Y') DEFAULT 'N',
  `reasons` text,
  `sequenceNumber` int(3) NOT NULL,
  PRIMARY KEY (`pupilsightStaffAbsenceTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightStaffApplicationForm
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStaffApplicationForm`;

CREATE TABLE `pupilsightStaffApplicationForm` (
  `pupilsightStaffApplicationFormID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightStaffJobOpeningID` int(10) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned DEFAULT NULL,
  `surname` varchar(60) DEFAULT NULL,
  `firstName` varchar(60) DEFAULT NULL,
  `preferredName` varchar(60) DEFAULT NULL,
  `officialName` varchar(150) DEFAULT NULL,
  `nameInCharacters` varchar(60) DEFAULT NULL,
  `gender` enum('M','F') DEFAULT NULL,
  `status` enum('Pending','Accepted','Rejected','Withdrawn') NOT NULL DEFAULT 'Pending',
  `dob` date DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `homeAddress` mediumtext,
  `homeAddressDistrict` varchar(255) DEFAULT NULL,
  `homeAddressCountry` varchar(255) DEFAULT NULL,
  `phone1Type` enum('','Mobile','Home','Work','Fax','Pager','Other') DEFAULT NULL,
  `phone1CountryCode` varchar(7) DEFAULT NULL,
  `phone1` varchar(20) DEFAULT NULL,
  `countryOfBirth` varchar(30) DEFAULT NULL,
  `citizenship1` varchar(255) DEFAULT NULL,
  `citizenship1Passport` varchar(30) DEFAULT NULL,
  `nationalIDCardNumber` varchar(30) DEFAULT NULL,
  `residencyStatus` varchar(255) DEFAULT NULL,
  `visaExpiryDate` date DEFAULT NULL,
  `languageFirst` varchar(30) DEFAULT NULL,
  `languageSecond` varchar(30) DEFAULT NULL,
  `languageThird` varchar(30) DEFAULT NULL,
  `agreement` enum('N','Y') DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `priority` int(1) NOT NULL DEFAULT '0',
  `milestones` text NOT NULL,
  `notes` text NOT NULL,
  `dateStart` date DEFAULT NULL,
  `questions` text NOT NULL,
  `fields` text NOT NULL COMMENT 'Serialised array of custom field values',
  `referenceEmail1` varchar(100) NOT NULL,
  `referenceEmail2` varchar(100) NOT NULL,
  PRIMARY KEY (`pupilsightStaffApplicationFormID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightStaffApplicationFormFile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStaffApplicationFormFile`;

CREATE TABLE `pupilsightStaffApplicationFormFile` (
  `pupilsightStaffApplicationFormFileID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightStaffApplicationFormID` int(12) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`pupilsightStaffApplicationFormFileID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightStaffContract
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStaffContract`;

CREATE TABLE `pupilsightStaffContract` (
  `pupilsightStaffContractID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightStaffID` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `status` enum('','Pending','Active','Expired') NOT NULL DEFAULT '',
  `dateStart` date NOT NULL,
  `dateEnd` date DEFAULT NULL,
  `salaryScale` varchar(255) DEFAULT NULL,
  `salaryAmount` decimal(12,2) DEFAULT NULL,
  `salaryPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `responsibility` varchar(255) DEFAULT NULL,
  `responsibilityAmount` decimal(12,2) DEFAULT NULL,
  `responsibilityPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `housingAmount` decimal(12,2) DEFAULT NULL,
  `housingPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `travelAmount` decimal(12,2) DEFAULT NULL,
  `travelPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `retirementAmount` decimal(12,2) DEFAULT NULL,
  `retirementPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `bonusAmount` decimal(12,2) DEFAULT NULL,
  `bonusPeriod` enum('','Week','Month','Year','Contract') DEFAULT NULL,
  `education` text NOT NULL,
  `notes` text NOT NULL,
  `contractUpload` varchar(255) DEFAULT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightStaffContractID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightStaffCoverage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStaffCoverage`;

CREATE TABLE `pupilsightStaffCoverage` (
  `pupilsightStaffCoverageID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightStaffAbsenceID` int(14) unsigned DEFAULT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `status` enum('Requested','Accepted','Declined','Cancelled') DEFAULT 'Requested',
  `requestType` enum('Individual','Broadcast','Assigned') DEFAULT 'Broadcast',
  `substituteTypes` varchar(255) DEFAULT NULL,
  `pupilsightPersonIDStatus` int(10) unsigned NOT NULL,
  `timestampStatus` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `notesStatus` text,
  `pupilsightPersonIDCoverage` int(10) unsigned DEFAULT NULL,
  `timestampCoverage` timestamp NULL DEFAULT NULL,
  `notesCoverage` text,
  `attachmentType` enum('File','HTML','Link') DEFAULT NULL,
  `attachmentContent` text,
  `notificationSent` enum('N','Y') DEFAULT 'N',
  `notificationList` text,
  PRIMARY KEY (`pupilsightStaffCoverageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightStaffCoverageDate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStaffCoverageDate`;

CREATE TABLE `pupilsightStaffCoverageDate` (
  `pupilsightStaffCoverageDateID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightStaffCoverageID` int(14) unsigned DEFAULT NULL,
  `pupilsightStaffAbsenceDateID` int(14) unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `allDay` enum('N','Y') DEFAULT 'Y',
  `timeStart` time DEFAULT NULL,
  `timeEnd` time DEFAULT NULL,
  `value` decimal(2,1) NOT NULL DEFAULT '1.0',
  `pupilsightPersonIDUnavailable` int(10) unsigned DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pupilsightStaffCoverageDateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightStaffJobOpening
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStaffJobOpening`;

CREATE TABLE `pupilsightStaffJobOpening` (
  `pupilsightStaffJobOpeningID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `jobTitle` varchar(100) NOT NULL,
  `dateOpen` date NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `description` text NOT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestampCreator` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightStaffJobOpeningID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightString
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightString`;

CREATE TABLE `pupilsightString` (
  `pupilsightStringID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `original` varchar(100) NOT NULL,
  `replacement` varchar(100) NOT NULL,
  `mode` enum('Whole','Partial') NOT NULL,
  `caseSensitive` enum('Y','N') NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pupilsightStringID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightstudent_transfer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightstudent_transfer`;

CREATE TABLE `pupilsightstudent_transfer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `pupilsightStudentEnrolmentID` int(10) NOT NULL,
  `remarks` varchar(256) CHARACTER SET latin1 NOT NULL,
  `updated_by` int(11) NOT NULL,
  `cdt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table pupilsightStudentEnrolment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStudentEnrolment`;

CREATE TABLE `pupilsightStudentEnrolment` (
  `pupilsightStudentEnrolmentID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `pupilsightMappingID` int(3) DEFAULT NULL,
  `pupilsightProgramID` int(3) DEFAULT NULL,
  `pupilsightYearGroupID` int(3) unsigned NOT NULL,
  `pupilsightRollGroupID` int(5) unsigned DEFAULT NULL,
  `rollOrder` int(10) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pupilsightStudentEnrolmentID`),
  KEY `pupilsightSchoolYearID` (`pupilsightSchoolYearID`),
  KEY `pupilsightYearGroupID` (`pupilsightYearGroupID`),
  KEY `pupilsightRollGroupID` (`pupilsightRollGroupID`),
  KEY `pupilsightPersonIndex` (`pupilsightPersonID`,`pupilsightSchoolYearID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightStudentNote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStudentNote`;

CREATE TABLE `pupilsightStudentNote` (
  `pupilsightStudentNoteID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `pupilsightStudentNoteCategoryID` int(5) unsigned DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `note` text NOT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`pupilsightStudentNoteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightStudentNoteCategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightStudentNoteCategory`;

CREATE TABLE `pupilsightStudentNoteCategory` (
  `pupilsightStudentNoteCategoryID` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `template` text NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`pupilsightStudentNoteCategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightSubstitute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightSubstitute`;

CREATE TABLE `pupilsightSubstitute` (
  `pupilsightSubstituteID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `active` enum('Y','N') DEFAULT 'Y',
  `type` varchar(60) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `priority` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pupilsightSubstituteID`),
  UNIQUE KEY `pupilsightPersonID` (`pupilsightPersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightTemplate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTemplate`;

CREATE TABLE `pupilsightTemplate` (
  `pupilsightTemplateID` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('Email','Sms') NOT NULL,
  `name` varchar(256) NOT NULL,
  `subject` varchar(256) DEFAULT NULL,
  `description` text NOT NULL,
  `entities` text NOT NULL,
  `attach_file` varchar(256) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1: Active',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1: In Use',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pupilsightTemplateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table pupilsightTemplateForAttendance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTemplateForAttendance`;

CREATE TABLE `pupilsightTemplateForAttendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('Email','Sms') NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `entities` text NOT NULL,
  `attach_file` varchar(255) NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1: Active',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1: In Use',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table pupilsightTheme
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTheme`;

CREATE TABLE `pupilsightTheme` (
  `pupilsightThemeID` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `active` enum('N','Y') NOT NULL DEFAULT 'N',
  `version` varchar(6) NOT NULL,
  `author` varchar(40) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`pupilsightThemeID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

LOCK TABLES `pupilsightTheme` WRITE;
/*!40000 ALTER TABLE `pupilsightTheme` DISABLE KEYS */;

INSERT INTO `pupilsightTheme` (`pupilsightThemeID`, `name`, `description`, `active`, `version`, `author`, `url`)
VALUES
	(13,'Default','Pupilsight\'s 2015 look and feel.','Y','1.0.00','Pupilsight','http://www.pupilsight.in');

/*!40000 ALTER TABLE `pupilsightTheme` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pupilsightTT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTT`;

CREATE TABLE `pupilsightTT` (
  `pupilsightTTID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightProgramID` int(20) unsigned NOT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(12) NOT NULL,
  `nameShortDisplay` enum('Day Of The Week','Timetable Day Short Name','') NOT NULL DEFAULT 'Day Of The Week',
  `pupilsightYearGroupIDList` varchar(255) NOT NULL,
  `pupilsightRollGroupIDList` varchar(256) DEFAULT NULL,
  `active` enum('Y','N') NOT NULL,
  PRIMARY KEY (`pupilsightTTID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightTTColumn
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTTColumn`;

CREATE TABLE `pupilsightTTColumn` (
  `pupilsightTTColumnID` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `nameShort` varchar(12) NOT NULL,
  PRIMARY KEY (`pupilsightTTColumnID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightTTColumnRow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTTColumnRow`;

CREATE TABLE `pupilsightTTColumnRow` (
  `pupilsightTTColumnRowID` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightTTColumnID` int(6) unsigned NOT NULL,
  `name` varchar(12) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL,
  `type` enum('Lesson','Pastoral','Sport','Break','Service','Other') NOT NULL,
  PRIMARY KEY (`pupilsightTTColumnRowID`),
  KEY `pupilsightTTColumnID` (`pupilsightTTColumnID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightTTDay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTTDay`;

CREATE TABLE `pupilsightTTDay` (
  `pupilsightTTDayID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightTTID` int(8) unsigned NOT NULL,
  `pupilsightTTColumnID` int(6) unsigned NOT NULL,
  `name` varchar(12) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `color` varchar(6) NOT NULL,
  `fontColor` varchar(6) NOT NULL,
  PRIMARY KEY (`pupilsightTTDayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightTTDayDate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTTDayDate`;

CREATE TABLE `pupilsightTTDayDate` (
  `pupilsightTTDayDateID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightTTDayID` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`pupilsightTTDayDateID`),
  KEY `pupilsightTTDayID` (`pupilsightTTDayID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightTTDayRowClass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTTDayRowClass`;

CREATE TABLE `pupilsightTTDayRowClass` (
  `pupilsightTTDayRowClassID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightTTColumnRowID` int(8) unsigned NOT NULL,
  `pupilsightTTDayID` int(10) unsigned NOT NULL,
  `pupilsightCourseClassID` int(8) unsigned NOT NULL,
  `pupilsightDepartmentID` int(20) NOT NULL,
  `pupilsightStaffID` varchar(50) NOT NULL,
  `pupilsightSpaceID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pupilsightTTDayRowClassID`),
  KEY `pupilsightCourseClassID` (`pupilsightCourseClassID`),
  KEY `pupilsightSpaceID` (`pupilsightSpaceID`),
  KEY `pupilsightTTColumnRowID` (`pupilsightTTColumnRowID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightTTDayRowClassException
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTTDayRowClassException`;

CREATE TABLE `pupilsightTTDayRowClassException` (
  `pupilsightTTDayRowClassExceptionID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightTTDayRowClassID` int(12) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightTTDayRowClassExceptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightTTImport
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTTImport`;

CREATE TABLE `pupilsightTTImport` (
  `pupilsightTTImportID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `courseNameShort` varchar(6) NOT NULL,
  `classNameShort` varchar(5) NOT NULL,
  `dayName` varchar(12) NOT NULL,
  `rowName` varchar(12) NOT NULL,
  `teacherUsernameList` text NOT NULL,
  `spaceName` varchar(30) NOT NULL,
  PRIMARY KEY (`pupilsightTTImportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightTTSpaceBooking
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTTSpaceBooking`;

CREATE TABLE `pupilsightTTSpaceBooking` (
  `pupilsightTTSpaceBookingID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `foreignKey` enum('pupilsightSpaceID','pupilsightLibraryItemID') NOT NULL DEFAULT 'pupilsightSpaceID',
  `foreignKeyID` int(10) unsigned NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  `date` date NOT NULL,
  `timeStart` time NOT NULL,
  `timeEnd` time NOT NULL,
  PRIMARY KEY (`pupilsightTTSpaceBookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightTTSpaceChange
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightTTSpaceChange`;

CREATE TABLE `pupilsightTTSpaceChange` (
  `pupilsightTTSpaceChangeID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightTTDayRowClassID` int(12) unsigned NOT NULL,
  `pupilsightSpaceID` int(10) unsigned DEFAULT NULL,
  `date` date NOT NULL,
  `pupilsightPersonID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightTTSpaceChangeID`),
  KEY `pupilsightTTDayRowClassID` (`pupilsightTTDayRowClassID`),
  KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightUnit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightUnit`;

CREATE TABLE `pupilsightUnit` (
  `pupilsightUnitID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightCourseID` int(8) unsigned NOT NULL,
  `name` varchar(40) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `description` text NOT NULL,
  `tags` text NOT NULL,
  `map` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT 'Should this unit be included in curriculum maps and other summaries?',
  `ordering` int(2) NOT NULL DEFAULT '0',
  `attachment` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `license` varchar(50) DEFAULT NULL,
  `sharedPublic` enum('Y','N') DEFAULT NULL,
  `pupilsightPersonIDCreator` int(10) unsigned NOT NULL,
  `pupilsightPersonIDLastEdit` int(10) unsigned NOT NULL,
  PRIMARY KEY (`pupilsightUnitID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightUnitBlock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightUnitBlock`;

CREATE TABLE `pupilsightUnitBlock` (
  `pupilsightUnitBlockID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightUnitID` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `length` varchar(3) NOT NULL,
  `contents` text NOT NULL,
  `teachersNotes` text NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  PRIMARY KEY (`pupilsightUnitBlockID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightUnitClass
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightUnitClass`;

CREATE TABLE `pupilsightUnitClass` (
  `pupilsightUnitClassID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightUnitID` int(10) unsigned NOT NULL,
  `pupilsightCourseClassID` int(8) unsigned NOT NULL,
  `running` enum('N','Y') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`pupilsightUnitClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightUnitClassBlock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightUnitClassBlock`;

CREATE TABLE `pupilsightUnitClassBlock` (
  `pupilsightUnitClassBlockID` int(14) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightUnitClassID` int(12) unsigned NOT NULL,
  `pupilsightPlannerEntryID` int(14) unsigned NOT NULL,
  `pupilsightUnitBlockID` int(12) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `length` varchar(3) NOT NULL,
  `contents` text NOT NULL,
  `teachersNotes` text NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  `complete` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`pupilsightUnitClassBlockID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightUnitOutcome
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightUnitOutcome`;

CREATE TABLE `pupilsightUnitOutcome` (
  `pupilsightUnitOutcomeID` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightUnitID` int(10) unsigned NOT NULL,
  `pupilsightOutcomeID` int(8) unsigned NOT NULL,
  `sequenceNumber` int(4) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`pupilsightUnitOutcomeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table pupilsightUsernameFormat
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightUsernameFormat`;

CREATE TABLE `pupilsightUsernameFormat` (
  `pupilsightUsernameFormatID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightRoleIDList` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDefault` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `isNumeric` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `numericValue` int(12) unsigned NOT NULL DEFAULT '0',
  `numericIncrement` int(3) unsigned NOT NULL DEFAULT '1',
  `numericSize` int(3) unsigned NOT NULL DEFAULT '4',
  PRIMARY KEY (`pupilsightUsernameFormatID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table pupilsightYearGroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pupilsightYearGroup`;

CREATE TABLE `pupilsightYearGroup` (
  `pupilsightYearGroupID` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `nameShort` varchar(4) NOT NULL,
  `sequenceNumber` int(3) NOT NULL,
  `pupilsightPersonIDHOY` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`pupilsightYearGroupID`),
  UNIQUE KEY `name` (`name`,`nameShort`,`sequenceNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table seatmatrix
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seatmatrix`;

CREATE TABLE `seatmatrix` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaignid` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `seats` int(10) unsigned NOT NULL,
  `cuid` bigint(20) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table smsCreditsHistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `smsCreditsHistory`;

CREATE TABLE `smsCreditsHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `credits` int(11) NOT NULL DEFAULT '0',
  `added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table subject_skill_descriptive_indicator_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subject_skill_descriptive_indicator_config`;

CREATE TABLE `subject_skill_descriptive_indicator_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `di_mode` varchar(50) NOT NULL,
  `remark_id` int(11) NOT NULL,
  `remarkcode` varchar(50) NOT NULL,
  `remark_description` varchar(256) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `pupilsightDepartmentID` int(50) NOT NULL,
  `skill_id` int(20) NOT NULL,
  `pupilsightProgramID` int(20) NOT NULL,
  `pupilsightYearGroupID` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table subjectSkillMapping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subjectSkillMapping`;

CREATE TABLE `subjectSkillMapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) NOT NULL,
  `pupilsightProgramID` int(3) NOT NULL,
  `pupilsightYearGroupID` int(3) NOT NULL,
  `pupilsightDepartmentID` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `skill_display_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table subjectToClassCurriculum
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subjectToClassCurriculum`;

CREATE TABLE `subjectToClassCurriculum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) NOT NULL,
  `pupilsightProgramID` int(3) NOT NULL,
  `pupilsightYearGroupID` int(3) NOT NULL,
  `pupilsightDepartmentID` int(11) NOT NULL,
  `subject_code` varchar(255) NOT NULL,
  `subject_display_name` varchar(255) DEFAULT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `di_mode` varchar(255) DEFAULT NULL,
  `pos` int(11) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table trans_bus_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trans_bus_details`;

CREATE TABLE `trans_bus_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vehicle_number` varchar(64) NOT NULL,
  `name` varchar(256) NOT NULL,
  `model` varchar(128) DEFAULT NULL,
  `vtype` varchar(128) DEFAULT NULL,
  `capacity` int(10) unsigned DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `insurance_exp` date DEFAULT NULL,
  `fc_expiry` date DEFAULT NULL,
  `driver_name` varchar(128) DEFAULT NULL,
  `driver_mobile` varchar(16) DEFAULT NULL,
  `coordinator_name` varchar(256) DEFAULT NULL,
  `coordinator_mobile` varchar(16) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`vehicle_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table trans_communicate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trans_communicate`;

CREATE TABLE `trans_communicate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '{1 - sms | 2 - email}',
  `route_id` int(10) unsigned NOT NULL,
  `body` text NOT NULL,
  `subject` varchar(256) DEFAULT NULL,
  `cdt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table trans_route_assign
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trans_route_assign`;

CREATE TABLE `trans_route_assign` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `route_id` int(10) unsigned NOT NULL,
  `bus_id` int(10) unsigned NOT NULL,
  `pupilsightPersonID` int(11) NOT NULL,
  `route_stop_id` int(10) unsigned NOT NULL,
  `type` enum('onward','return','both') NOT NULL,
  `transport_type` varchar(128) DEFAULT NULL,
  `status` tinyint(4) NOT NULL COMMENT '{1-active | 2 - inactive | 3- deactive}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table trans_route_price
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trans_route_price`;

CREATE TABLE `trans_route_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `stop_id` int(11) DEFAULT NULL,
  `oneway_price` decimal(10,2) DEFAULT NULL,
  `twoway_price` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `oneway_total_price` decimal(10,2) DEFAULT NULL,
  `twoway_total_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table trans_route_stops
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trans_route_stops`;

CREATE TABLE `trans_route_stops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `route_id` int(10) unsigned NOT NULL,
  `bus_id` int(10) unsigned NOT NULL,
  `stop_name` varchar(256) NOT NULL,
  `oneway_price` decimal(10,2) DEFAULT NULL,
  `twoway_price` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) NOT NULL,
  `pickup_time` time DEFAULT NULL,
  `drop_time` time DEFAULT NULL,
  `stop_no` int(10) unsigned DEFAULT NULL,
  `lat` double(11,8) DEFAULT NULL,
  `lng` double(11,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table trans_routes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trans_routes`;

CREATE TABLE `trans_routes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `route_name` varchar(128) NOT NULL,
  `bus_id` int(10) unsigned NOT NULL,
  `start_point` varchar(128) NOT NULL,
  `end_point` varchar(128) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `num_stops` int(10) unsigned DEFAULT NULL,
  `type` enum('pickup','drop','both') NOT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table trans_schedule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trans_schedule`;

CREATE TABLE `trans_schedule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_name` varchar(128) DEFAULT NULL,
  `fee_item_id` int(10) unsigned NOT NULL,
  `pupilsightSchoolYearID` int(3) unsigned NOT NULL,
  `route_id` int(10) unsigned NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '{yearly - 12 | half yearly - 6 | quarter -3 | monthly - 1}',
  `start_month` varchar(16) NOT NULL,
  `end_month` varchar(16) NOT NULL,
  `start_year` year(4) NOT NULL,
  `end_year` year(4) NOT NULL,
  `due_date` date NOT NULL,
  `fee_head_id` int(10) unsigned NOT NULL,
  `invoice_series_id` int(10) unsigned NOT NULL,
  `receipt_series_id` int(10) unsigned NOT NULL,
  `total_invoice_generate` int(11) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table trans_schedule_assign_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trans_schedule_assign_class`;

CREATE TABLE `trans_schedule_assign_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) NOT NULL,
  `pupilsightProgramID` int(11) NOT NULL,
  `pupilsightYearGroupID` int(11) NOT NULL COMMENT 'class id',
  `pupilsightRollGroupID` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table trans_schedule_assign_student
# ------------------------------------------------------------

DROP TABLE IF EXISTS `trans_schedule_assign_student`;

CREATE TABLE `trans_schedule_assign_student` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pupilsightPersonID` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table workflow
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow`;

CREATE TABLE `workflow` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `academic_year` varchar(256) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `code` varchar(256) NOT NULL,
  `cuid` bigint(20) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table workflow_map
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_map`;

CREATE TABLE `workflow_map` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `cuid` bigint(20) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table workflow_state
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_state`;

CREATE TABLE `workflow_state` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `workflowid` int(10) unsigned NOT NULL,
  `order_wise` int(11) NOT NULL,
  `name` varchar(256) NOT NULL COMMENT 'state name',
  `code` varchar(256) NOT NULL,
  `display_name` varchar(256) DEFAULT NULL,
  `notification` tinyint(4) NOT NULL COMMENT '{1 - Email | 2 - SMS | 3 - Email+SMS}',
  `pupilsightTemplateIDs` varchar(100) DEFAULT NULL,
  `cuid` bigint(20) NOT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



# Dump of table workflow_transition
# ------------------------------------------------------------

DROP TABLE IF EXISTS `workflow_transition`;

CREATE TABLE `workflow_transition` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `from_state` varchar(256) NOT NULL,
  `to_state` varchar(256) NOT NULL,
  `transition_display_name` varchar(512) DEFAULT NULL,
  `auto_gen_inv` varchar(256) NOT NULL,
  `tansition_action` varchar(256) NOT NULL,
  `screen_tab_def` varchar(256) DEFAULT NULL,
  `user_permission` text,
  `fn_fee_admission_setting_ids` varchar(100) DEFAULT NULL,
  `cuid` bigint(20) DEFAULT NULL,
  `cdt` datetime NOT NULL,
  `udt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table wp_commentmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_commentmeta`;

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_comments`;

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime DEFAULT NULL,
  `comment_date_gmt` datetime DEFAULT NULL,
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_ff_scheduled_actions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_ff_scheduled_actions`;

CREATE TABLE `wp_ff_scheduled_actions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `form_id` bigint(20) unsigned DEFAULT NULL,
  `origin_id` bigint(20) unsigned DEFAULT NULL,
  `feed_id` bigint(20) unsigned DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT 'submission_action',
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `data` longtext COLLATE utf8mb4_unicode_520_ci,
  `note` tinytext COLLATE utf8mb4_unicode_520_ci,
  `retry_count` int(10) unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_fluentform_entry_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_fluentform_entry_details`;

CREATE TABLE `wp_fluentform_entry_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` bigint(20) unsigned DEFAULT NULL,
  `submission_id` bigint(20) unsigned DEFAULT NULL,
  `field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_field_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field_value` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_fluentform_form_analytics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_fluentform_form_analytics`;

CREATE TABLE `wp_fluentform_form_analytics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `source_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_fluentform_form_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_fluentform_form_meta`;

CREATE TABLE `wp_fluentform_form_meta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_fluentform_forms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_fluentform_forms`;

CREATE TABLE `wp_fluentform_forms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'Draft',
  `appearance_settings` text COLLATE utf8mb4_unicode_ci,
  `form_fields` longtext COLLATE utf8mb4_unicode_ci,
  `has_payment` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `conditions` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_fluentform_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_fluentform_logs`;

CREATE TABLE `wp_fluentform_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_source_id` int(10) unsigned DEFAULT NULL,
  `source_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_id` int(10) unsigned DEFAULT NULL,
  `component` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` char(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_fluentform_order_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_fluentform_order_items`;

CREATE TABLE `wp_fluentform_order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `submission_id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT 'single',
  `parent_holder` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `billing_interval` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `item_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT '1',
  `item_price` int(11) DEFAULT NULL,
  `line_total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_fluentform_submission_meta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_fluentform_submission_meta`;

CREATE TABLE `wp_fluentform_submission_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `response_id` bigint(20) unsigned DEFAULT NULL,
  `form_id` int(10) unsigned DEFAULT NULL,
  `meta_key` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_fluentform_submissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_fluentform_submissions`;

CREATE TABLE `wp_fluentform_submissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(10) unsigned DEFAULT NULL,
  `serial_number` int(10) unsigned DEFAULT NULL,
  `response` longtext COLLATE utf8mb4_unicode_ci,
  `source_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT 'unread' COMMENT 'possible values: read, unread, trashed',
  `is_favourite` tinyint(1) NOT NULL DEFAULT '0',
  `browser` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `device` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_paid` float DEFAULT NULL,
  `pupilsightPersonID` int(11) DEFAULT NULL,
  `pupilsightProgramID` int(11) DEFAULT NULL,
  `pupilsightYearGroupID` int(11) DEFAULT NULL,
  `fn_fee_invoice_id` int(11) DEFAULT NULL,
  `invoice_no` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_total` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_fluentform_subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_fluentform_subscriptions`;

CREATE TABLE `wp_fluentform_subscriptions` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `submission_id` int(11) DEFAULT NULL,
  `form_id` int(11) DEFAULT NULL,
  `payment_total` int(11) DEFAULT '0',
  `item_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `plan_name` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `parent_transaction_id` int(11) DEFAULT NULL,
  `billing_interval` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `trial_days` int(11) DEFAULT NULL,
  `initial_amount` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT '1',
  `recurring_amount` int(11) DEFAULT NULL,
  `bill_times` int(11) DEFAULT NULL,
  `bill_count` int(11) DEFAULT '0',
  `vendor_customer_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vendor_subscription_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `vendor_plan_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT 'pending',
  `initial_tax_label` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `initial_tax` int(11) DEFAULT NULL,
  `recurring_tax_label` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `recurring_tax` int(11) DEFAULT NULL,
  `element_id` varchar(255) COLLATE utf8mb4_unicode_520_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_520_ci,
  `original_plan` text COLLATE utf8mb4_unicode_520_ci,
  `vendor_response` longtext COLLATE utf8mb4_unicode_520_ci,
  `expiration_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;



# Dump of table wp_fluentform_transactions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_fluentform_transactions`;

CREATE TABLE `wp_fluentform_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `response_id` bigint(20) unsigned DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `submission_id` int(11) DEFAULT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `transaction_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'onetime',
  `card_last_4` int(4) DEFAULT NULL,
  `card_brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_total` int(11) DEFAULT '1',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_note` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_links`;

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL,
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_options`;

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`),
  KEY `autoload` (`autoload`)
) ENGINE=InnoDB AUTO_INCREMENT=3041 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_options` WRITE;
/*!40000 ALTER TABLE `wp_options` DISABLE KEYS */;

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`)
VALUES
	(1,'siteurl','http://testoxygen.pupilpod.net/wp','yes'),
	(2,'home','http://testoxygen.pupilpod.net/wp','yes'),
	(3,'blogname','Pupilsight','yes'),
	(4,'blogdescription','Pupilsight','yes'),
	(5,'users_can_register','0','yes'),
	(6,'admin_email','admin@thoughtnet.in','yes'),
	(7,'start_of_week','1','yes'),
	(8,'use_balanceTags','0','yes'),
	(9,'use_smilies','1','yes'),
	(10,'require_name_email','1','yes'),
	(11,'comments_notify','1','yes'),
	(12,'posts_per_rss','10','yes'),
	(13,'rss_use_excerpt','0','yes'),
	(14,'mailserver_url','mail.example.com','yes'),
	(15,'mailserver_login','login@example.com','yes'),
	(16,'mailserver_pass','password','yes'),
	(17,'mailserver_port','110','yes'),
	(18,'default_category','1','yes'),
	(19,'default_comment_status','open','yes'),
	(20,'default_ping_status','open','yes'),
	(21,'default_pingback_flag','1','yes'),
	(22,'posts_per_page','10','yes'),
	(23,'date_format','F j, Y','yes'),
	(24,'time_format','g:i a','yes'),
	(25,'links_updated_date_format','F j, Y g:i a','yes'),
	(26,'comment_moderation','0','yes'),
	(27,'moderation_notify','1','yes'),
	(28,'permalink_structure','','yes'),
	(29,'rewrite_rules','','yes'),
	(30,'hack_file','0','yes'),
	(31,'blog_charset','UTF-8','yes'),
	(32,'moderation_keys','','no'),
	(33,'active_plugins','a:5:{i:0;s:35:\"enhanced-blocks/enhanced-blocks.php\";i:1;s:25:\"fluentform/fluentform.php\";i:2;s:31:\"fluentformpro/fluentformpro.php\";i:3;s:31:\"reportbuilder/reportbuilder.php\";i:4;s:29:\"wpdatatables/wpdatatables.php\";}','yes'),
	(34,'category_base','','yes'),
	(35,'ping_sites','http://rpc.pingomatic.com/','yes'),
	(36,'comment_max_links','2','yes'),
	(37,'gmt_offset','5.5','yes'),
	(38,'default_email_category','1','yes'),
	(39,'recently_edited','','no'),
	(40,'template','twentytwenty','yes'),
	(41,'stylesheet','twentytwenty','yes'),
	(42,'comment_whitelist','1','yes'),
	(43,'blacklist_keys','','no'),
	(44,'comment_registration','0','yes'),
	(45,'html_type','text/html','yes'),
	(46,'use_trackback','0','yes'),
	(47,'default_role','subscriber','yes'),
	(48,'db_version','47018','yes'),
	(49,'uploads_use_yearmonth_folders','1','yes'),
	(50,'upload_path','','yes'),
	(51,'blog_public','1','yes'),
	(52,'default_link_category','2','yes'),
	(53,'show_on_front','posts','yes'),
	(54,'tag_base','','yes'),
	(55,'show_avatars','1','yes'),
	(56,'avatar_rating','G','yes'),
	(57,'upload_url_path','','yes'),
	(58,'thumbnail_size_w','150','yes'),
	(59,'thumbnail_size_h','150','yes'),
	(60,'thumbnail_crop','1','yes'),
	(61,'medium_size_w','300','yes'),
	(62,'medium_size_h','300','yes'),
	(63,'avatar_default','mystery','yes'),
	(64,'large_size_w','1024','yes'),
	(65,'large_size_h','1024','yes'),
	(66,'image_default_link_type','none','yes'),
	(67,'image_default_size','','yes'),
	(68,'image_default_align','','yes'),
	(69,'close_comments_for_old_posts','0','yes'),
	(70,'close_comments_days_old','14','yes'),
	(71,'thread_comments','1','yes'),
	(72,'thread_comments_depth','5','yes'),
	(73,'page_comments','0','yes'),
	(74,'comments_per_page','50','yes'),
	(75,'default_comments_page','newest','yes'),
	(76,'comment_order','asc','yes'),
	(77,'sticky_posts','a:0:{}','yes'),
	(78,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(79,'widget_text','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(80,'widget_rss','a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(81,'uninstall_plugins','a:2:{s:31:\"reportbuilder/reportbuilder.php\";a:2:{i:0;s:23:\"WDTReportBuilder\\Plugin\";i:1;s:13:\"uninstallHook\";}s:29:\"wpdatatables/wpdatatables.php\";s:12:\"wdtUninstall\";}','no'),
	(82,'timezone_string','','yes'),
	(83,'page_for_posts','0','yes'),
	(84,'page_on_front','0','yes'),
	(85,'default_post_format','0','yes'),
	(86,'link_manager_enabled','0','yes'),
	(87,'finished_splitting_shared_terms','1','yes'),
	(88,'site_icon','0','yes'),
	(89,'medium_large_size_w','768','yes'),
	(90,'medium_large_size_h','0','yes'),
	(91,'wp_page_for_privacy_policy','3','yes'),
	(92,'show_comments_cookies_opt_in','1','yes'),
	(93,'admin_email_lifespan','1613473882','yes'),
	(94,'initial_db_version','45805','yes'),
	(95,'wp_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:66:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:22:\"fluentform_full_access\";b:1;s:27:\"fluentform_settings_manager\";b:1;s:27:\"fluentform_dashboard_access\";b:1;s:24:\"fluentform_forms_manager\";b:1;s:25:\"fluentform_entries_viewer\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),
	(96,'fresh_site','0','yes'),
	(97,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(98,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(99,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(100,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(101,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(102,'sidebars_widgets','a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}','yes'),
	(103,'cron','a:9:{i:1600060076;a:1:{s:29:\"fluentform_do_scheduled_tasks\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:21:\"ff_every_five_minutes\";s:4:\"args\";a:0:{}s:8:\"interval\";i:300;}}}i:1600060577;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1600074976;a:1:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600074977;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1600074978;a:2:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1600074999;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600075008;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1600494946;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}s:7:\"version\";i:2;}','yes'),
	(104,'widget_pages','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(105,'widget_calendar','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(106,'widget_media_audio','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(107,'widget_media_image','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(108,'widget_media_gallery','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(109,'widget_media_video','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(110,'widget_tag_cloud','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(111,'widget_nav_menu','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(112,'widget_custom_html','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(114,'recovery_keys','a:0:{}','yes'),
	(116,'theme_mods_twentytwenty','a:1:{s:18:\"custom_css_post_id\";i:-1;}','yes'),
	(142,'recently_activated','a:0:{}','yes'),
	(147,'fluentform_entry_details_migrated','yes','no'),
	(148,'fluentform_db_fluentform_logs_added','1','no'),
	(149,'__fluentform_global_form_settings','a:1:{s:6:\"layout\";a:5:{s:14:\"labelPlacement\";s:3:\"top\";s:17:\"asteriskPlacement\";s:13:\"asterisk-left\";s:20:\"helpMessagePlacement\";s:10:\"with_label\";s:21:\"errorMessagePlacement\";s:6:\"inline\";s:12:\"cssClassName\";s:0:\"\";}}','no'),
	(150,'_fluentform_installed_version','3.5.6','no'),
	(151,'fluentform_global_modules_status','a:9:{s:9:\"mailchimp\";s:2:\"no\";s:14:\"activecampaign\";s:2:\"no\";s:16:\"campaign_monitor\";s:2:\"no\";s:17:\"constatantcontact\";s:2:\"no\";s:11:\"getresponse\";s:2:\"no\";s:8:\"icontact\";s:2:\"no\";s:7:\"webhook\";s:2:\"no\";s:6:\"zapier\";s:2:\"no\";s:5:\"slack\";s:2:\"no\";}','no'),
	(152,'widget_fluentform_widget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(153,'_fluentform_form_permission','a:0:{}','no'),
	(634,'wdtRenderCharts','below','yes'),
	(635,'wdtRenderFilter','footer','yes'),
	(636,'wdtLeftOffset','0','yes'),
	(637,'wdtBaseSkin','skin1','yes'),
	(638,'wdtTimeFormat','h:i A','yes'),
	(639,'wdtInterfaceLanguage','','yes'),
	(640,'wdtTablesPerPage','10','yes'),
	(641,'wdtNumberFormat','1','yes'),
	(642,'wdtDecimalPlaces','2','yes'),
	(643,'wdtCSVDelimiter',',','yes'),
	(644,'wdtDateFormat','d/m/Y','yes'),
	(645,'wdtNumbersAlign','1','yes'),
	(646,'wdtBorderRemoval','0','yes'),
	(647,'wdtBorderRemovalHeader','0','yes'),
	(648,'wdtFontColorSettings','','yes'),
	(649,'wdtCustomJs','','yes'),
	(650,'wdtCustomCss','','yes'),
	(651,'wdtMinifiedJs','1','yes'),
	(652,'wdtTabletWidth','1024','yes'),
	(653,'wdtMobileWidth','480','yes'),
	(654,'wdtIncludeBootstrap','1','yes'),
	(655,'wdtIncludeBootstrapBackEnd','1','yes'),
	(656,'wdtPreventDeletingTables','1','yes'),
	(657,'wdtActivated','0','yes'),
	(658,'wdtPurchaseCodeStore','','yes'),
	(659,'wdtEnvatoTokenEmail','','yes'),
	(660,'wdtActivatedPowerful','0','yes'),
	(661,'wdtPurchaseCodeStorePowerful','','yes'),
	(662,'wdtEnvatoTokenEmailPowerful','','yes'),
	(663,'wdtActivatedReport','0','yes'),
	(664,'wdtActivatedMasterDetail','0','yes'),
	(665,'wdtPurchaseCodeStoreMasterDetail','','yes'),
	(666,'wdtPurchaseCodeStoreReport','','yes'),
	(667,'wdtEnvatoTokenEmailReport','','yes'),
	(668,'wdtActivatedGravity','0','yes'),
	(669,'wdtPurchaseCodeStoreGravity','','yes'),
	(670,'wdtEnvatoTokenEmailGravity','','yes'),
	(671,'wdtActivatedFormidable','0','yes'),
	(672,'wdtPurchaseCodeStoreFormidable','','yes'),
	(673,'wdtEnvatoTokenEmailFormidable','','yes'),
	(674,'wdtInstallDate','2020-05-01','yes'),
	(675,'wdtRatingDiv','no','yes'),
	(676,'wdtMDNewsDiv','yes','yes'),
	(677,'wdtTempFutureDate','2020-09-11','yes'),
	(678,'wdtVersion','2.8.1','yes'),
	(679,'wdtSeparateCon','[{\"id\":\"abcdefghijk\",\"host\":\"\",\"database\":\"\",\"user\":\"\",\"password\":\"\",\"port\":\"\",\"vendor\":\"mysql\",\"driver\":\"dblib\",\"name\":\"MYSQL\",\"default\":\"\"}]','yes'),
	(680,'widget_wdtfilterwidget','a:1:{s:12:\"_multiwidget\";i:1;}','yes'),
	(687,'db_upgraded','','yes'),
	(688,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.5.1.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.5.1-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.5.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"5.5.1\";s:7:\"version\";s:5:\"5.5.1\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.4.2-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-5.4.2-partial-1.zip\";s:8:\"rollback\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.4.2-rollback-1.zip\";}s:7:\"current\";s:5:\"5.4.2\";s:7:\"version\";s:5:\"5.4.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.3\";s:15:\"partial_version\";s:5:\"5.4.1\";s:9:\"new_files\";s:0:\"\";}}s:12:\"last_checked\";i:1600059811;s:15:\"version_checked\";s:5:\"5.4.1\";s:12:\"translations\";a:0:{}}','no'),
	(689,'can_compress_scripts','1','no'),
	(691,'recovery_mode_email_last_sent','1588312780','yes'),
	(692,'fluentform_scheduled_actions_migrated','yes','no'),
	(694,'wdtParseShortcodes','0','yes'),
	(695,'wdtUseSeparateCon','','yes'),
	(696,'wdtSumFunctionsLabel','','yes'),
	(697,'wdtAvgFunctionsLabel','','yes'),
	(698,'wdtMinFunctionsLabel','','yes'),
	(699,'wdtMaxFunctionsLabel','','yes'),
	(708,'_transient_health-check-site-status-result','{\"good\":9,\"recommended\":6,\"critical\":2}','yes'),
	(727,'category_children','a:0:{}','yes'),
	(1184,'_ff_fluentform_pro_license_status','site_inactive','yes'),
	(1187,'_ff_fluentform_pro_license_key','fb3c4f997c76ab4e6b82156a2e44e206','yes'),
	(2337,'WPLANG','','yes'),
	(2338,'new_admin_email','admin@thoughtnet.in','yes'),
	(2812,'wdtGettingStartedPageStatus','0','yes'),
	(2813,'wdtLiteVSPremiumPageStatus','0','yes'),
	(2847,'_site_transient_timeout_browser_0d7547ea912e3ce2a35572c8b9a755b1','1600062478','no'),
	(2848,'_site_transient_browser_0d7547ea912e3ce2a35572c8b9a755b1','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"85.0.4183.83\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),
	(2948,'_site_transient_timeout_browser_c479a0f01a88ef7345b58f2d727289da','1600254531','no'),
	(2949,'_site_transient_browser_c479a0f01a88ef7345b58f2d727289da','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"85.0.4183.83\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),
	(2958,'_site_transient_timeout_browser_4243c5bad934d66f978f6ee6e569fdad','1600264014','no'),
	(2959,'_site_transient_browser_4243c5bad934d66f978f6ee6e569fdad','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"85.0.4183.102\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),
	(2988,'_site_transient_timeout_php_check_df4f44b43899f077bce743b554958099','1600445386','no'),
	(2989,'_site_transient_php_check_df4f44b43899f077bce743b554958099','a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:0;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}','no'),
	(2996,'_site_transient_timeout_browser_dcc77110dea38e3cff8b12436648706c','1600448239','no'),
	(2997,'_site_transient_browser_dcc77110dea38e3cff8b12436648706c','a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"85.0.4183.83\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}','no'),
	(3037,'_site_transient_timeout_theme_roots','1600061616','no'),
	(3038,'_site_transient_theme_roots','a:4:{s:14:\"twentynineteen\";s:7:\"/themes\";s:15:\"twentyseventeen\";s:7:\"/themes\";s:13:\"twentysixteen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";}','no'),
	(3039,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1600059817;s:7:\"checked\";a:4:{s:14:\"twentynineteen\";s:3:\"1.4\";s:15:\"twentyseventeen\";s:3:\"2.2\";s:13:\"twentysixteen\";s:3:\"2.0\";s:12:\"twentytwenty\";s:3:\"1.1\";}s:8:\"response\";a:4:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.1.7.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentyseventeen\";a:6:{s:5:\"theme\";s:15:\"twentyseventeen\";s:11:\"new_version\";s:3:\"2.4\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentyseventeen/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentyseventeen.2.4.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:13:\"twentysixteen\";a:6:{s:5:\"theme\";s:13:\"twentysixteen\";s:11:\"new_version\";s:3:\"2.2\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentysixteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentysixteen.2.2.zip\";s:8:\"requires\";s:3:\"4.4\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.5\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.5.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}}s:12:\"translations\";a:0:{}}','no'),
	(3040,'_site_transient_update_plugins','O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1600059818;s:7:\"checked\";a:5:{s:35:\"enhanced-blocks/enhanced-blocks.php\";s:5:\"1.4.1\";s:25:\"fluentform/fluentform.php\";s:5:\"3.5.6\";s:31:\"fluentformpro/fluentformpro.php\";s:5:\"3.5.6\";s:31:\"reportbuilder/reportbuilder.php\";s:5:\"1.1.7\";s:29:\"wpdatatables/wpdatatables.php\";s:5:\"2.8.1\";}s:8:\"response\";a:3:{s:25:\"fluentform/fluentform.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:24:\"w.org/plugins/fluentform\";s:4:\"slug\";s:10:\"fluentform\";s:6:\"plugin\";s:25:\"fluentform/fluentform.php\";s:11:\"new_version\";s:6:\"3.6.51\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/fluentform/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/fluentform.3.6.51.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:63:\"https://ps.w.org/fluentform/assets/icon-256x256.png?rev=1794277\";s:2:\"1x\";s:63:\"https://ps.w.org/fluentform/assets/icon-128x128.png?rev=1794277\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:66:\"https://ps.w.org/fluentform/assets/banner-1544x500.png?rev=2172250\";s:2:\"1x\";s:65:\"https://ps.w.org/fluentform/assets/banner-772x250.png?rev=2172250\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.5.0\";s:12:\"requires_php\";s:3:\"5.6\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}s:31:\"reportbuilder/reportbuilder.php\";O:8:\"stdClass\":20:{s:6:\"author\";s:3:\"TMS\";s:5:\"icons\";a:2:{s:2:\"1x\";s:71:\"https://store.tms-plugins.com/static/img/plugins/reportbuilder/logo.png\";s:2:\"2x\";s:71:\"https://store.tms-plugins.com/static/img/plugins/reportbuilder/logo.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:70:\"https://store.tms-plugins.com/static/img/plugins/reportbuilder/low.png\";s:4:\"high\";s:71:\"https://store.tms-plugins.com/static/img/plugins/reportbuilder/high.png\";}s:7:\"version\";s:3:\"1.2\";s:11:\"new_version\";s:3:\"1.2\";s:12:\"last_updated\";s:25:\"2020-06-29T22:19:55+10:00\";s:15:\"active_installs\";i:909;s:11:\"num_ratings\";i:28;s:6:\"rating\";d:94.2;s:6:\"tested\";s:5:\"5.5.1\";s:14:\"upgrade_notice\";s:78:\"After updating, make sure to clear any caching / CDN plugins you may be using.\";s:8:\"requires\";b:0;s:7:\"package\";N;s:13:\"download_link\";N;s:11:\"description\";s:65:\"Generate DOCX and XLSX with realtime data from your wpDataTables.\";s:8:\"homepage\";s:27:\"http://wpreportbuilder.com/\";s:11:\"plugin_name\";s:14:\"Report Builder\";s:4:\"name\";s:14:\"Report Builder\";s:8:\"sections\";a:2:{s:11:\"description\";s:4516:\"<p>Report Builder is and add-on for wpDataTables that instantly creates documents and spreadsheets filling your templates with actual data.</p>\n\n    <p><strong>Please note that Report Builder is an add-on for wpDataTables and requires its FULL version to run!\n You can purchase the full version of wpDataTables <a href=\"https://wpdatatables.com/\" rel=\"nofollow\">here</a>.</strong></p>\n\n    <p><a href=\"http://wpreportbuilder.com/\" rel=\"nofollow\"><img class=\"widefat\" src=\"http://wpreportbuilder.com/cc_images/Report-builder_01.jpg?1\" alt=\"Report Builder add-on for wpDataTables - Generate Word DOCX and Excel XLSX documents - 1\" /></a>\n<a href=\"https://www.youtube.com/watch?v=sSQZa1gwTDA\" rel=\"nofollow\"><img class=\"widefat\" src=\"http://wpreportbuilder.com/cc_images/Report-builder_03.jpg?21\" alt=\"Report Builder add-on for wpDataTables - Generate Word DOCX and Excel XLSX documents - 2\" /></a>\n<a href=\"http://wpreportbuilder.com/\" rel=\"nofollow\"><img class=\"widefat\" src=\"http://wpreportbuilder.com/cc_images/Report-builder_04.jpg?21\" alt=\"Report Builder add-on for wpDataTables - Generate Word DOCX and Excel XLSX documents - 3\" /></a>\n<a href=\"http://wpreportbuilder.com/\" rel=\"nofollow\"><img class=\"widefat\" src=\"http://wpreportbuilder.com/cc_images/Report-builder_05.jpg?21\" alt=\"Report Builder add-on for wpDataTables - Generate Word DOCX and Excel XLSX documents - 4\" /></a>\n<a href=\"http://wpreportbuilder.com/\" rel=\"nofollow\"><img class=\"widefat\" src=\"http://wpreportbuilder.com/cc_images/Report-builder_06.jpg?21\" alt=\"Report Builder add-on for wpDataTables - Generate Word DOCX and Excel XLSX documents - 5\" /></a>\n<a href=\"http://wpreportbuilder.com/\" rel=\"nofollow\"><img class=\"widefat\" src=\"http://wpreportbuilder.com/cc_images/Report-builder_07.jpg?21\" alt=\"Report Builder add-on for wpDataTables - Generate Word DOCX and Excel XLSX documents - 6\" /></a>\n<a href=\"http://wpreportbuilder.com/\" rel=\"nofollow\"><img class=\"widefat\" src=\"http://wpreportbuilder.com/cc_images/Report-builder_08.jpg?21\" alt=\"Report Builder add-on for wpDataTables - Generate Word DOCX and Excel XLSX documents - 7\" /></a>\n<a href=\"http://wpreportbuilder.com/\" rel=\"nofollow\"><img class=\"widefat\" src=\"http://wpreportbuilder.com/cc_images/Report-builder_09.jpg?21\" alt=\"Report Builder add-on for wpDataTables - Generate Word DOCX and Excel XLSX documents - 8\" /></a>\n<a href=\"http://tmsplugins.ticksy.com/\" rel=\"nofollow\"><img class=\"widefat\" src=\"http://wpreportbuilder.com/cc_images/Report-builder_10.jpg?21\" alt=\"Report Builder add-on for wpDataTables - Generate Word DOCX and Excel XLSX documents - 9\" /></a></p>\n\n    <p>If you have a need to generate Word DOCX or Excel XLSX documents on your website filling them with actual data from database &#8211; Report Builder can automate this process for you. It uses wpDataTables as a data provider, and generates the documents on the fly.</p>\n\n    <p>Report Builder can be used to generate invoices, contracts, different stats and reports, transaction lists, welcome letters, commercial offers, statements, task trackers, exam lists, catalogs, and many more. See our <a href=\"http://wpreportbuilder.com/examples/\" rel=\"nofollow\">examples gallery here</a>.</p>\n\n    <ul>\n    <li>Do not waste time on any configuration or coding.</li>\n        <li>Use your standard Word DOCX or Excel XLSX files, prepare templates in several minutes. <a href=\"http://wpreportbuilder.com/documentation/create-template-for-wordpress-report-builder/\" rel=\"nofollow\">See how</a></li>\n        <li>Get documents generated with realtime always filled in with actual data</li>\n        <li>Use data from front-end inputs in the generated documents.</li>\n        <li>Bulk generation of multiple documents in one click. <a href=\"http://wpreportbuilder.com/documentation/word-docx-report-multiple-files/\" rel=\"nofollow\">See example</a></li>\n        <li>Allow downloads to local computer (from WordPress front-end and from admin panel) or save to Media library</li>\n        <li>Insert front-end inputs or download button using <a href=\"http://wpreportbuilder.com/documentation/insert-report-builder-controls-visual-editor/\" rel=\"nofollow\">WordPress&#8217; Visual Editor</a> or <a href=\"http://wpreportbuilder.com/documentation/insert-report-builder-controls-visual-composer/\" rel=\"nofollow\">WPBakery Visual Composer</a>.</li>\n    </ul>\n\n    <p>All features are explained in detail in our <a href=\"http://wpreportbuilder.com\" rel=\"nofollow\">demo site with online documentation with live examples</a>.</p>\n\n\";s:9:\"changelog\";s:4180:\"<strong>Version 1.2 (released 29.06.2020)</strong>\nA regular update with a couple of small bugfixes:\n</p><ul>\n<li><strong>Improvement:</strong> Adopt back-end based on new wpDataTables admin UI.</li>\n<li><strong>Improvement:</strong> Browse reports in the backend (live search).</li>\n<li><strong>Bugfix:</strong> Fixed issue with multisite.</li>\n<li><strong> Compatibility with WordPress 5.4.2 confirmed.</strong></li>\n<li><strong>Other small bug fixes and stability improvements.</strong></li>\n</ul>\n<strong>Please note: Versions 1.2+ of Report Builder add-on require the latest version of wpDataTables (version 3.0+)</strong>\n\n\n	<p><strong>Version 1.1.8 (released 19.03.2020)</strong>\nA minor update with a couple of small bugfixes:\n</p><ul>\n<li><strong>BugFix:</strong> Fixed issue with deactivating license</li>\n<li><strong>Other small bug fixes and stability improvements.</strong></li>\n</ul>\n\n\n	<p><strong>Version 1.1.7 (released 28.11.2019)</strong>\nA minor update with a couple of small bugfixes:\n</p><ul>\n<li><strong> BugFix:</strong> Addon is now compatible with jQuery 3.x.</li>\n<li><strong> BugFix:</strong> Fixed PHP notice for update of addon.</li>\n<li>Compatibility with WordPress 5.3 confirmed.</li>\n<li>Small bug fixes and stability improvements.</li>\n</ul>\n\n\n	<p><strong>Version 1.1.6 (released 15.04.2019)</strong>\n</p><ul>\n<li><strong>Feature:</strong> New auto-update and plugin activation system. Make sure to re-acivate your purchase once again to make it work.</li>\n<li>Small bug fixes and stability improvements.</li>\n</ul>\n\n\n	<p><strong>Version 1.1.5 (released 12.12.2018)</strong>\n</p><ul>\n<li>Small bug fixes and stability improvements.</li>\n<li>Compatibility with WordPress 5.0 confirmed.</li>\n</ul>\n<strong>Version 1.1.4 &#8211; 23 Oct 2018</strong>\n<ul>\n<li><strong>BugFix:</strong> Allowed non-accented characters to be used as a filename</li>\n<li>Small bug fixes and stability improvements.</li>\n</ul>\n<strong>Version 1.1.3 &#8211; 30 Aug 2018</strong>\n<strong>Please note: as of version 1.1.3 (and version 2.3 of wpDataTables), the minimum required PHP version is 5.6!</strong>\n<ul>\n     <li>Small bug fixes and stability improvements;</li>\n</ul>\n<strong>Version 1.1.2 &#8211; 17 May 2018</strong>\n<ul>\n     <li>Fixes for special characters;</li>\n     <li>Fixes for new lines in the reports;</li>\n</ul>\n<strong>Important! Please use this version only with wpDataTables 2.0 &#8211; 2.0.2!</strong>\n<ul>\n     <li>Bug with &#8220;Follow table filtering&#8221; always on resolved;</li>\n     <li>Compatibility with WordPress 4.8.1 approved;</li>\n     <li>Compatibility with wpDataTables 2.0.1, 2.0.2 approved;</li>\n     <li>Stability improvements and bugfixes;</li>\n</ul>\n<strong>Important! Please use this version only with wpDataTables 2.0!</strong>\n<ul>\n     <li>Major UI update &#8211; Material design for admin interface</li>\n     <li>Implemented compatibility with wpDataTables 2.0</li>\n     <li>Compatibility with WordPress 4.8 confirmed</li>\n</ul>\n<ul>\n     <li>Fix for follow table filtering.</li>\n     <li>Fix for HTML special characters.</li>\n     <li>Fix for &#8220;neverending&#8221; preloader.</li>\n</ul>\n\n\n<p><strong>Version 1.0.2 &#8211; 20 Jan 2017</strong></p>\n\n<ul>\n     <li>Fix for PHP7 compatibility.</li>\n     <li>Fix for follow table filtering (was always limiting to 10 entries).</li>\n     <li>Removed the CSSLoader (preloader script) as it was causing problems, fixed preloader problems.</li>\n     <li>Minor patches for special chars usage in templates.</li>\n     <li>WP 4.7.1 compatibility confirmed.</li>\n</ul>\n\n    <p><strong>Version 1.0.1 &#8211; 25 July 2016</strong></p>\n\n<ul>\n     <li>Fix for large tables on front-end (caused 500 Server Error).</li>\n     <li>Fix for PHP versions which do not allow mime_content_type() method (caused 500 Server Error).</li>\n     <li>Fix for download button not working on some of front-end pages (caused infinite loader spinning).</li>\n     <li>Fix for empty cells in Excel (caused the variable placeholders to appear in the file).</li>\n     <li>Fix for row limit in large tables.</li>\n</ul>\n<strong>Version 1.0 &#8211; 12 May 2016</strong>\n\n    <p>Launch of Report Builder.</p>\n\n\";}s:4:\"slug\";s:31:\"reportbuilder/reportbuilder.php\";}s:29:\"wpdatatables/wpdatatables.php\";O:8:\"stdClass\":15:{s:6:\"author\";s:3:\"TMS\";s:5:\"icons\";a:2:{s:2:\"1x\";s:70:\"https://store.tms-plugins.com/static/img/plugins/wpdatatables/logo.png\";s:2:\"2x\";s:70:\"https://store.tms-plugins.com/static/img/plugins/wpdatatables/logo.png\";}s:7:\"banners\";a:2:{s:3:\"low\";s:69:\"https://store.tms-plugins.com/static/img/plugins/wpdatatables/low.png\";s:4:\"high\";s:70:\"https://store.tms-plugins.com/static/img/plugins/wpdatatables/high.png\";}s:7:\"version\";s:5:\"3.0.4\";s:11:\"new_version\";s:5:\"3.0.4\";s:6:\"tested\";s:5:\"5.5.1\";s:14:\"upgrade_notice\";s:78:\"After updating, make sure to clear any caching / CDN plugins you may be using.\";s:8:\"requires\";b:0;s:7:\"package\";N;s:13:\"download_link\";N;s:11:\"description\";s:115:\"wpDataTables is a best-selling WordPress plugin which makes your work with tables, charts and data management easy.\";s:8:\"homepage\";s:25:\"https://wpdatatables.com/\";s:11:\"plugin_name\";s:12:\"wpDataTables\";s:4:\"name\";s:12:\"wpDataTables\";s:4:\"slug\";s:29:\"wpdatatables/wpdatatables.php\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:2:{s:35:\"enhanced-blocks/enhanced-blocks.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:29:\"w.org/plugins/enhanced-blocks\";s:4:\"slug\";s:15:\"enhanced-blocks\";s:6:\"plugin\";s:35:\"enhanced-blocks/enhanced-blocks.php\";s:11:\"new_version\";s:5:\"1.4.1\";s:3:\"url\";s:46:\"https://wordpress.org/plugins/enhanced-blocks/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/enhanced-blocks.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:68:\"https://ps.w.org/enhanced-blocks/assets/icon-256x256.png?rev=2031076\";s:2:\"1x\";s:68:\"https://ps.w.org/enhanced-blocks/assets/icon-128x128.png?rev=2031076\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:71:\"https://ps.w.org/enhanced-blocks/assets/banner-1544x500.png?rev=2093669\";s:2:\"1x\";s:70:\"https://ps.w.org/enhanced-blocks/assets/banner-772x250.png?rev=2093669\";}s:11:\"banners_rtl\";a:0:{}}s:29:\"wpdatatables/wpdatatables.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:26:\"w.org/plugins/wpdatatables\";s:4:\"slug\";s:12:\"wpdatatables\";s:6:\"plugin\";s:29:\"wpdatatables/wpdatatables.php\";s:11:\"new_version\";s:5:\"2.1.2\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/wpdatatables/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/plugin/wpdatatables.2.1.2.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/wpdatatables/assets/icon-128x128.png?rev=2070743\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:67:\"https://ps.w.org/wpdatatables/assets/banner-772x250.jpg?rev=2215254\";}s:11:\"banners_rtl\";a:0:{}}}}','no');

/*!40000 ALTER TABLE `wp_options` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_postmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_postmeta`;

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`)
VALUES
	(1,2,'_wp_page_template','default'),
	(2,3,'_wp_page_template','default'),
	(5,2,'_edit_lock','1579858410:1'),
	(13,82,'_edit_lock','1591686476:1'),
	(14,86,'_edit_lock','1591683652:1'),
	(15,86,'_has_fluentform','a:1:{i:81;s:2:\"81\";}'),
	(16,90,'_edit_lock','1590492263:1'),
	(17,83,'_edit_lock','1591167370:1'),
	(18,83,'_has_fluentform','a:1:{i:80;s:2:\"80\";}'),
	(19,108,'_edit_lock','1591168149:1'),
	(20,119,'_edit_lock','1591599838:1'),
	(21,128,'_edit_lock','1591619766:1'),
	(22,128,'_has_fluentform','a:1:{i:134;s:3:\"134\";}'),
	(23,127,'_edit_lock','1591704451:1'),
	(24,129,'_edit_lock','1591623467:1'),
	(25,127,'_has_fluentform','a:2:{i:133;s:3:\"133\";i:137;s:3:\"137\";}'),
	(26,144,'_edit_lock','1591937781:1'),
	(27,143,'_edit_lock','1591937800:1'),
	(28,145,'_edit_lock','1591960364:1'),
	(29,145,'_has_fluentform','a:1:{i:144;s:3:\"144\";}'),
	(30,176,'_wp_attached_file','2020/06/e1f09b912d2480d7d711298ea210149e.jpg'),
	(31,176,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:318;s:6:\"height\";i:159;s:4:\"file\";s:44:\"2020/06/e1f09b912d2480d7d711298ea210149e.jpg\";s:5:\"sizes\";a:2:{s:6:\"medium\";a:4:{s:4:\"file\";s:44:\"e1f09b912d2480d7d711298ea210149e-300x150.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:44:\"e1f09b912d2480d7d711298ea210149e-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
	(32,3,'_wp_attached_file','2020/08/R1.csv'),
	(38,9,'_wp_attached_file','2020/08/Test-Report.docx'),
	(39,10,'_wp_attached_file','2020/08/Student-Basic-Report.docx'),
	(47,19,'_wp_attached_file','2020/08/Report_Grade_Invoice.docx'),
	(49,21,'_wp_attached_file','2020/08/invoice_trans_detail_report.docx'),
	(51,25,'_wp_attached_file','2020/09/INVOICE-TRANSACTION-DETAILS-REPORT_JSON.docx'),
	(53,27,'_wp_attached_file','2020/09/JSON_INVOICE-TRANSACTION-DETAILS-REPORT.xlsx'),
	(54,28,'_wp_attached_file','2020/09/student_strenght.xlsx'),
	(56,30,'_wp_attached_file','2020/09/daily_report.xlsx');

/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_posts`;

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL,
  `post_date_gmt` datetime NOT NULL,
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL,
  `post_modified_gmt` datetime NOT NULL,
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`)
VALUES
	(2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','[fluentform id=\"189\"]','','','publish','closed','closed','','form-5','','','0000-00-00 00:00:00','0000-00-00 00:00:00','',0,'http://testoxygen.pupilpod.net/wp/?page_id=2',0,'page','',0),
	(3,1,'2020-08-26 15:26:58','2020-08-26 09:56:58','','R1','','inherit','open','closed','','r1','','','2020-08-26 15:26:58','2020-08-26 09:56:58','',0,'http://testoxygen.pupilpod.net/wp/wp-content/uploads/2020/08/R1.csv',0,'attachment','text/csv',0),
	(9,1,'2020-08-28 13:41:31','2020-08-28 08:11:31','','Fee Report','','inherit','open','closed','','test-report','','','2020-08-28 13:41:43','2020-08-28 08:11:43','',0,'http://testoxygen.pupilpod.net/wp/wp-content/uploads/2020/08/Test-Report.docx',0,'attachment','application/vnd.openxmlformats-officedocument.wordprocessingml.document',0),
	(10,1,'2020-08-28 13:57:59','2020-08-28 08:27:59','','Student Basic Report','','inherit','open','closed','','student-basic-report','','','2020-08-28 13:57:59','2020-08-28 08:27:59','',0,'http://testoxygen.pupilpod.net/wp/wp-content/uploads/2020/08/Student-Basic-Report.docx',0,'attachment','application/vnd.openxmlformats-officedocument.wordprocessingml.document',0),
	(19,1,'2020-08-29 11:22:39','2020-08-29 05:52:39','','Report_Grade_Invoice','','inherit','open','closed','','report_grade_invoice','','','2020-08-29 11:22:39','2020-08-29 05:52:39','',0,'http://testoxygen.pupilpod.net/wp/wp-content/uploads/2020/08/Report_Grade_Invoice.docx',0,'attachment','application/vnd.openxmlformats-officedocument.wordprocessingml.document',0),
	(21,1,'2020-08-29 18:11:24','2020-08-29 12:41:24','','invoice_trans_detail_report','','inherit','open','closed','','invoice_trans_detail_report','','','2020-08-29 18:11:24','2020-08-29 12:41:24','',0,'http://testoxygen.pupilpod.net/wp/wp-content/uploads/2020/08/invoice_trans_detail_report.docx',0,'attachment','application/vnd.openxmlformats-officedocument.wordprocessingml.document',0),
	(22,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','[fluentform id=\"191\"]','','','publish','closed','closed','','form-9','','','0000-00-00 00:00:00','0000-00-00 00:00:00','',0,'http://testoxygen.pupilpod.net/wp/?page_id=22',0,'page','',0),
	(23,1,'2020-09-07 13:35:02','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2020-09-07 13:35:02','0000-00-00 00:00:00','',0,'http://testoxygen.pupilpod.net/wp/?p=23',0,'post','',0),
	(25,1,'2020-09-07 13:58:34','2020-09-07 08:28:34','','INVOICE-TRANSACTION DETAILS REPORT_JSON','','inherit','open','closed','','invoice-transaction-details-report_json','','','2020-09-07 13:58:34','2020-09-07 08:28:34','',0,'http://testoxygen.pupilpod.net/wp/wp-content/uploads/2020/09/INVOICE-TRANSACTION-DETAILS-REPORT_JSON.docx',0,'attachment','application/vnd.openxmlformats-officedocument.wordprocessingml.document',0),
	(27,1,'2020-09-07 14:13:54','2020-09-07 08:43:54','','_JSON_INVOICE-TRANSACTION DETAILS REPORT','','inherit','open','closed','','_json_invoice-transaction-details-report','','','2020-09-07 14:13:54','2020-09-07 08:43:54','',0,'http://testoxygen.pupilpod.net/wp/wp-content/uploads/2020/09/JSON_INVOICE-TRANSACTION-DETAILS-REPORT.xlsx',0,'attachment','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',0),
	(28,1,'2020-09-08 16:02:26','2020-09-08 10:32:26','','student_strenght','','inherit','open','closed','','student_strenght','','','2020-09-08 16:02:26','2020-09-08 10:32:26','',0,'http://testoxygen.pupilpod.net/wp/wp-content/uploads/2020/09/student_strenght.xlsx',0,'attachment','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',0),
	(30,1,'2020-09-08 17:16:31','2020-09-08 11:46:31','','daily_report','','inherit','open','closed','','daily_report','','','2020-09-08 17:16:31','2020-09-08 11:46:31','',0,'http://testoxygen.pupilpod.net/wp/wp-content/uploads/2020/09/daily_report.xlsx',0,'attachment','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',0),
	(31,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','[fluentform id=\"192\"]','','','publish','closed','closed','','form-10','','','0000-00-00 00:00:00','0000-00-00 00:00:00','',0,'http://testoxygen.pupilpod.net/wp/?page_id=31',0,'page','',0),
	(32,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','[fluentform id=\"189\"]','','','publish','closed','closed','','form-12','','','0000-00-00 00:00:00','0000-00-00 00:00:00','',0,'http://testoxygen.pupilpod.net/wp/?page_id=32',0,'page','',0),
	(33,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','[fluentform id=\"193\"]','','','publish','closed','closed','','form-13','','','0000-00-00 00:00:00','0000-00-00 00:00:00','',0,'http://testoxygen.pupilpod.net/wp/?page_id=33',0,'page','',0);

/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_term_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_relationships`;

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_term_taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_term_taxonomy`;

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`)
VALUES
	(1,1,'category','',0,0);

/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_termmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_termmeta`;

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table wp_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_terms`;

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`)
VALUES
	(1,'Uncategorized','uncategorized',0);

/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_usermeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_usermeta`;

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`)
VALUES
	(1,1,'nickname','rakesh@thoughtnet.in'),
	(2,1,'first_name',''),
	(3,1,'last_name',''),
	(4,1,'description',''),
	(5,1,'rich_editing','true'),
	(6,1,'syntax_highlighting','true'),
	(7,1,'comment_shortcuts','false'),
	(8,1,'admin_color','fresh'),
	(9,1,'use_ssl','0'),
	(10,1,'show_admin_bar_front','true'),
	(11,1,'locale',''),
	(12,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),
	(13,1,'wp_user_level','10'),
	(14,1,'dismissed_wp_pointers',''),
	(15,1,'show_welcome_panel','0'),
	(17,1,'wp_user-settings','libraryContent=browse&editor=tinymce&mfold=o&widgets_access=off&align=right&unfold=1'),
	(18,1,'wp_user-settings-time','1598436282'),
	(19,1,'wp_dashboard_quick_press_last_post_id','23'),
	(20,1,'community-events-location','a:1:{s:2:\"ip\";s:12:\"106.201.44.0\";}'),
	(26,1,'session_tokens','a:24:{s:64:\"38a01caed0d4e2301872308456b4bec41fb14d4e79dbf583bf462d20054ac776\";a:4:{s:10:\"expiration\";i:1600012013;s:2:\"ip\";s:12:\"157.45.26.74\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599839213;}s:64:\"ef8501e5f4c013f2ac3dcffbb2779bc961be32ecdf5d45ff80039948c8bb1be3\";a:4:{s:10:\"expiration\";i:1600012374;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599839574;}s:64:\"338be9e849dd252daadeaf78323203c3b63757ed43db02a2e60ee8a346ed88de\";a:4:{s:10:\"expiration\";i:1600013385;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599840585;}s:64:\"810599978c6b09a301d1e7f701266d081f2ef1aeca9456fbc0e461e0b9b9d38f\";a:4:{s:10:\"expiration\";i:1600013871;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599841071;}s:64:\"f32dc83d704b4d3aefdcb7dac757a1b5db117d11bc1ce9a05ba537640547b5a9\";a:4:{s:10:\"expiration\";i:1600014097;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599841297;}s:64:\"47e7def8034768adf38baa37eda301adbf25b8d6ff751fba1b7b165b76399eb2\";a:4:{s:10:\"expiration\";i:1600016238;s:2:\"ip\";s:14:\"157.49.116.144\";s:2:\"ua\";s:113:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599843438;}s:64:\"f97746ead9008f93aba01e53069f3416ffcbf98bf82595ae98946aa339e72fac\";a:4:{s:10:\"expiration\";i:1600017802;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599845002;}s:64:\"97ed312dcbed368eeddbc36f09efd6ec9cff985867e9784bef5b3c43a9b8b590\";a:4:{s:10:\"expiration\";i:1600017928;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599845128;}s:64:\"62395c3640d9cf684b28582da084ca3516c399e886f0d69b38773aefcb64ee9d\";a:4:{s:10:\"expiration\";i:1600017969;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599845169;}s:64:\"4a3485a812081b31e1b7c9b17a10bf5dab0345412c6b73e83145c7e1f3336d07\";a:4:{s:10:\"expiration\";i:1600018011;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599845211;}s:64:\"40a6527301fdb8cc0ee966d6808a56081ae77dddadd9664f93b5eea418750a06\";a:4:{s:10:\"expiration\";i:1600058309;s:2:\"ip\";s:13:\"157.49.105.19\";s:2:\"ua\";s:113:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599885509;}s:64:\"12c3447488beeb772ee7535bc950b083c15c6c19e02087d767e86b25a1a8a944\";a:4:{s:10:\"expiration\";i:1600058504;s:2:\"ip\";s:13:\"157.49.105.19\";s:2:\"ua\";s:113:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599885704;}s:64:\"cb8372a46ab504176cb3829af2de61560021d31a61daf7c9557a691e4739ccb9\";a:4:{s:10:\"expiration\";i:1600058662;s:2:\"ip\";s:13:\"157.49.105.19\";s:2:\"ua\";s:113:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599885862;}s:64:\"883bb2d04882d7de1735f3e0271238ca6c21c138a5f2411a7221113778a806d8\";a:4:{s:10:\"expiration\";i:1600059327;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599886527;}s:64:\"3dd3cb583a72ea37c3319782efa3f4f4a57c65610b625a83f8fcc56ed840302e\";a:4:{s:10:\"expiration\";i:1600059351;s:2:\"ip\";s:13:\"157.49.105.19\";s:2:\"ua\";s:113:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599886551;}s:64:\"85bc6d5b3893c8d1bcd0c9e16753c22eced20583649fda1a7ef2c3b459c7a6d1\";a:4:{s:10:\"expiration\";i:1600059929;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599887129;}s:64:\"21685e9c2403f86333fbb20272f827dcf40629d0d11764c71392a733adb7e9d8\";a:4:{s:10:\"expiration\";i:1600059996;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599887196;}s:64:\"4493c0d9fab4e373716180e64c923b70920ac3901aa09ff3092d2687ce924342\";a:4:{s:10:\"expiration\";i:1600060444;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599887644;}s:64:\"608ff88350bb5a6dfd7087925a025e1eeb433b4fee2dbdbe7bbd193681530fed\";a:4:{s:10:\"expiration\";i:1600060477;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599887677;}s:64:\"f5a7664dc44ea48b5c45a85c7dd6f9f52b757c7060456b09f7028680cc7eb4a2\";a:4:{s:10:\"expiration\";i:1600061061;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599888261;}s:64:\"9232890ef417acd1b8b4504ea1825e82a150392a6e502b5cdb0f466254f02799\";a:4:{s:10:\"expiration\";i:1600061164;s:2:\"ip\";s:14:\"106.201.44.202\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599888364;}s:64:\"a3eba81eea33a984238b8527b5d1bc15d9039f4050bca304a7a75b1cfeb5279a\";a:4:{s:10:\"expiration\";i:1600061264;s:2:\"ip\";s:13:\"157.49.105.19\";s:2:\"ua\";s:113:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599888464;}s:64:\"531507f9ef1087f054c51d074fe6fff496383f1b4f3d6f2f0997279546b68bb2\";a:4:{s:10:\"expiration\";i:1600061711;s:2:\"ip\";s:13:\"157.49.105.19\";s:2:\"ua\";s:113:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599888911;}s:64:\"96c4ef8f4ba84e56fa602d2b2577fca97471fc183831e083ea9ae43c098a32ee\";a:4:{s:10:\"expiration\";i:1600061769;s:2:\"ip\";s:13:\"157.49.105.19\";s:2:\"ua\";s:113:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36\";s:5:\"login\";i:1599888969;}}'),
	(27,1,'_new_email','a:2:{s:4:\"hash\";s:32:\"a6fd396bd5ebe34dfde5380a14cdd297\";s:8:\"newemail\";s:20:\"rakesh@thoughtnet.in\";}'),
	(28,1,'closedpostboxes_dashboard','a:0:{}'),
	(29,1,'metaboxhidden_dashboard','a:5:{i:0;s:21:\"dashboard_site_health\";i:1;s:19:\"dashboard_right_now\";i:2;s:18:\"dashboard_activity\";i:3;s:21:\"dashboard_quick_press\";i:4;s:17:\"dashboard_primary\";}');

/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_users`;

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL,
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `wp_users` WRITE;
/*!40000 ALTER TABLE `wp_users` DISABLE KEYS */;

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`)
VALUES
	(1,'admin','$P$BBZk/9wLqnhVMWmjD6u6.htfX8GR7M/','rakeshthoughtnet-in','rakesh@thoughtnet.in','','2020-01-24 09:16:08','',0,'rakesh@thoughtnet.in');

/*!40000 ALTER TABLE `wp_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_wpdatacharts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wpdatacharts`;

CREATE TABLE `wp_wpdatacharts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wpdatatable_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `engine` enum('google','highcharts','chartjs') NOT NULL,
  `type` varchar(255) NOT NULL,
  `json_render_data` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table wp_wpdatareports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wpdatareports`;

CREATE TABLE `wp_wpdatareports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `report_config` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

LOCK TABLES `wp_wpdatareports` WRITE;
/*!40000 ALTER TABLE `wp_wpdatareports` DISABLE KEYS */;

INSERT INTO `wp_wpdatareports` (`id`, `table_id`, `name`, `report_config`)
VALUES
	(1,6,'Fee Report','{\"templateFile\":\"\\/var\\/www\\/testoxygen\\/public\\/wp\\/wp-content\\/uploads\\/2020\\/08\\/Test-Report.docx\",\"generationLogic\":\"single\",\"additionalVars\":[],\"followFiltering\":false}'),
	(2,9,'Student Basic Information','{\"templateFile\":\"\\/var\\/www\\/testoxygen\\/public\\/wp\\/wp-content\\/uploads\\/2020\\/08\\/Student-Basic-Report.docx\",\"generationLogic\":\"single\",\"additionalVars\":[],\"followFiltering\":false}'),
	(4,14,'New Report_Invoice_Grade','{\"templateFile\":\"\\/var\\/www\\/testoxygen\\/public\\/wp\\/wp-content\\/uploads\\/2020\\/08\\/Report_Grade_Invoice.docx\",\"generationLogic\":\"single\",\"additionalVars\":[],\"followFiltering\":false}'),
	(5,11,'INVOICE_TRANSACTION_DETAIL','{\"templateFile\":\"\\/var\\/www\\/testoxygen\\/public\\/wp\\/wp-content\\/uploads\\/2020\\/08\\/invoice_trans_detail_report.docx\",\"generationLogic\":\"single\",\"additionalVars\":[],\"followFiltering\":false}'),
	(6,17,'JSON_INVOICE-TRANSACTION DETAILS REPORT','{\"templateFile\":\"\\/var\\/www\\/testoxygen\\/public\\/wp\\/wp-content\\/uploads\\/2020\\/09\\/JSON_INVOICE-TRANSACTION-DETAILS-REPORT.xlsx\",\"generationLogic\":\"single\",\"additionalVars\":[],\"followFiltering\":false}'),
	(7,23,'STUDENT STRENGTH REPORT','{\"templateFile\":\"\\/var\\/www\\/testoxygen\\/public\\/wp\\/wp-content\\/uploads\\/2020\\/09\\/student_strenght.xlsx\",\"generationLogic\":\"single\",\"additionalVars\":[],\"followFiltering\":false}'),
	(8,26,'DAILY COLLECTION REPORT','{\"templateFile\":\"\\/var\\/www\\/testoxygen\\/public\\/wp\\/wp-content\\/uploads\\/2020\\/09\\/daily_report.xlsx\",\"generationLogic\":\"single\",\"additionalVars\":[],\"followFiltering\":false}');

/*!40000 ALTER TABLE `wp_wpdatareports` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_wpdatatables
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wpdatatables`;

CREATE TABLE `wp_wpdatatables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `show_title` tinyint(1) NOT NULL DEFAULT '1',
  `table_type` varchar(55) NOT NULL,
  `connection` varchar(55) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `filtering` tinyint(1) NOT NULL DEFAULT '1',
  `filtering_form` tinyint(1) NOT NULL DEFAULT '0',
  `sorting` tinyint(1) NOT NULL DEFAULT '1',
  `tools` tinyint(1) NOT NULL DEFAULT '1',
  `server_side` tinyint(1) NOT NULL DEFAULT '0',
  `editable` tinyint(1) NOT NULL DEFAULT '0',
  `inline_editing` tinyint(1) NOT NULL DEFAULT '0',
  `popover_tools` tinyint(1) NOT NULL DEFAULT '0',
  `editor_roles` varchar(255) NOT NULL DEFAULT '',
  `mysql_table_name` varchar(255) NOT NULL DEFAULT '',
  `edit_only_own_rows` tinyint(1) NOT NULL DEFAULT '0',
  `userid_column_id` int(11) NOT NULL DEFAULT '0',
  `display_length` int(3) NOT NULL DEFAULT '10',
  `auto_refresh` int(3) NOT NULL DEFAULT '0',
  `fixed_columns` tinyint(1) NOT NULL DEFAULT '-1',
  `fixed_layout` tinyint(1) NOT NULL DEFAULT '0',
  `responsive` tinyint(1) NOT NULL DEFAULT '0',
  `scrollable` tinyint(1) NOT NULL DEFAULT '0',
  `word_wrap` tinyint(1) NOT NULL DEFAULT '0',
  `hide_before_load` tinyint(1) NOT NULL DEFAULT '0',
  `var1` varchar(255) NOT NULL DEFAULT '',
  `var2` varchar(255) NOT NULL DEFAULT '',
  `var3` varchar(255) NOT NULL DEFAULT '',
  `tabletools_config` varchar(255) NOT NULL DEFAULT '',
  `advanced_settings` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

LOCK TABLES `wp_wpdatatables` WRITE;
/*!40000 ALTER TABLE `wp_wpdatatables` DISABLE KEYS */;

INSERT INTO `wp_wpdatatables` (`id`, `title`, `show_title`, `table_type`, `connection`, `content`, `filtering`, `filtering_form`, `sorting`, `tools`, `server_side`, `editable`, `inline_editing`, `popover_tools`, `editor_roles`, `mysql_table_name`, `edit_only_own_rows`, `userid_column_id`, `display_length`, `auto_refresh`, `fixed_columns`, `fixed_layout`, `responsive`, `scrollable`, `word_wrap`, `hide_before_load`, `var1`, `var2`, `var3`, `tabletools_config`, `advanced_settings`)
VALUES
	(1,'',1,'mysql','','SELECT acRemarks.`id`,\n       ac_elective_group.`pupilsightSchoolYearID`,\n       ac_elective_group.`pupilsightYearGroupID`,\n       ac_elective_group.`name`,\n       ac_elective_group.`max_selection`,\n       ac_elective_group.`min_selection`\nFROM acRemarks\n  LEFT JOIN ac_elective_group\n     ON acRemarks.`remarkcode` = ac_elective_group.`pupilsightSchoolYearID`\n',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,0,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}',''),
	(2,'',1,'mysql','','SELECT fn_fee_structure.`invoice_title`,\n       fn_fee_structure_item.`fn_fee_structure_id`\nFROM fn_fee_structure, fn_fee_structure_item\n',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,0,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}',''),
	(3,'',1,'mysql','','SELECT fn_fee_invoice.`title`,\n       fn_fee_invoice_class_assign.`pupilsightYearGroupID`,\n       fn_fee_invoice_item.`amount`\nFROM fn_fee_invoice_class_assign\n  LEFT JOIN fn_fee_invoice_item\n     ON fn_fee_invoice_class_assign.`fn_fee_invoice_id` = fn_fee_invoice_item.`fn_fee_invoice_id`\n  LEFT JOIN fn_fee_invoice\n     ON fn_fee_invoice_item.`fn_fee_invoice_id` = fn_fee_invoice.`id`\n  ',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,0,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}',''),
	(4,'',1,'mysql','','SELECT fn_fee_invoice.`title`,\n       fn_fee_invoice_class_assign.`pupilsightYearGroupID`,\n       fn_fee_invoice_item.`total_amount`\nFROM fn_fee_invoice\n  LEFT JOIN fn_fee_invoice_item\n     ON fn_fee_invoice.`id` = fn_fee_invoice_item.`fn_fee_invoice_id`\n  LEFT JOIN fn_fee_invoice_class_assign\n     ON fn_fee_invoice_item.`fn_fee_invoice_id` = fn_fee_invoice_class_assign.`fn_fee_invoice_id`\n\nGROUP BY fn_fee_invoice.`title`',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,0,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}',''),
	(5,'',1,'mysql','','SELECT fn_fee_invoice.`title`,\n       fn_fee_invoice_class_assign.`pupilsightYearGroupID`,\n       fn_fee_invoice_item.`total_amount`\nFROM fn_fee_invoice\n  LEFT JOIN fn_fee_invoice_item\n     ON fn_fee_invoice.`id` = fn_fee_invoice_item.`fn_fee_invoice_id`\n  LEFT JOIN fn_fee_invoice_class_assign\n     ON fn_fee_invoice_item.`fn_fee_invoice_id` = fn_fee_invoice_class_assign.`fn_fee_invoice_id`\n',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,0,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}',''),
	(6,'Fee Report',1,'mysql','','SELECT fn_fee_invoice.`title`,\n       fn_fee_invoice.`id`,\n       fn_fee_invoice_class_assign.`pupilsightYearGroupID`,\n       fn_fee_invoice_item.`amount`\nFROM fn_fee_invoice\n  LEFT JOIN fn_fee_invoice_item\n     ON fn_fee_invoice.`id` = fn_fee_invoice_item.`fn_fee_invoice_id`\n  LEFT JOIN fn_fee_invoice_class_assign\n     ON fn_fee_invoice_item.`fn_fee_invoice_id` = fn_fee_invoice_class_assign.`fn_fee_invoice_id`\n\nGROUP BY fn_fee_invoice.`id`',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,0,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}'),
	(7,'Student Class Section',1,'mysql','','SELECT a.pupilsightPersonID, \na.admission_no as admission, \na.officialName as name, \nc.name as class_name, \nd.name as section \nFROM pupilsightPerson AS a \nLEFT JOIN pupilsightStudentEnrolment AS b ON a.pupilsightPersonID = b.pupilsightPersonID \nLEFT JOIN pupilsightYearGroup AS c ON b.pupilsightYearGroupID = c.pupilsightYearGroupID \nLEFT JOIN pupilsightRollGroup AS d ON b.pupilsightRollGroupID = d.pupilsightRollGroupID \nWHERE a.pupilsightRoleIDPrimary = 003 \nAND b.pupilsightPersonID != \'\'',1,0,1,1,1,0,0,0,'','',0,0,10,0,-1,0,1,0,0,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}'),
	(9,'Student Basic Information',1,'mysql','','select officialName as name, \ngender, username, dob, admission_no \nfrom pupilsightPerson \nwhere pupilsightRoleIDPrimary = 003;',1,0,1,1,1,0,0,0,'','',0,0,10,0,-1,0,1,0,0,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}'),
	(10,'GRADE_WISE_INVOICE',1,'mysql','','SELECT fn_fee_invoice.`title`,\n       fn_fee_invoice.`id`,\n       fn_fee_invoice_class_assign.`pupilsightYearGroupID`,\n       Sum(fn_fee_invoice_item.`total_amount`) as amount\nFROM fn_fee_invoice\n  LEFT JOIN fn_fee_invoice_item\n     ON fn_fee_invoice.`id` = fn_fee_invoice_item.`fn_fee_invoice_id`\n  LEFT JOIN fn_fee_invoice_class_assign\n     ON fn_fee_invoice_item.`fn_fee_invoice_id` = fn_fee_invoice_class_assign.`fn_fee_invoice_id`\n\nwhere pupilsightYearGroupID=\'6\' GROUP BY fn_fee_invoice.`id`',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,0,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}'),
	(11,'INVOICE-TRANSACTION DETAILS REPORT',1,'mysql','','SELECT pupilsightPerson.`preferredName` as name,\n       pupilsightPerson.`pupilsightPersonID` as sid,\n       fn_fee_invoice_class_assign.`pupilsightYearGroupID` as class,\n       fn_fee_invoice.`invoice_no`,\n       fn_fee_invoice.`title`,\n       sum(fn_fee_invoice_item.`amount`) as amount,\n       sum(fn_fee_invoice_item.`total_amount`) as total,\n       fn_fee_invoice_item.`id`\nFROM pupilsightPerson\n  LEFT JOIN fn_fee_invoice_student_assign\n     ON pupilsightPerson.`pupilsightPersonID` = fn_fee_invoice_student_assign.`pupilsightPersonID`\n  LEFT JOIN fn_fee_invoice\n     ON fn_fee_invoice_student_assign.`fn_fee_invoice_id` = fn_fee_invoice.`id`\n  LEFT JOIN fn_fee_invoice_item\n     ON fn_fee_invoice.`id` = fn_fee_invoice_item.`fn_fee_invoice_id`\n  LEFT JOIN fn_fee_invoice_class_assign\n     ON fn_fee_invoice_item.`fn_fee_invoice_id` = fn_fee_invoice_class_assign.`fn_fee_invoice_id`\n\nGROUP BY fn_fee_invoice_student_assign.`id`',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,0,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}'),
	(12,'New wpDataTable',1,'mysql','','select p.preferredName as name,p.pupilsightRoleIDAll as sid,yg.name as class,fc.receipt_number,co.name as counter,p.preferredName as staff,fm.name as Paymentmode,fc.payment_date as date,transcation_amount from pupilsightPerson as p\njoin fn_fees_collection fc on fc.pupilsightPersonID=p.pupilsightPersonID\njoin fn_fee_invoice_class_assign ca on ca.fn_fee_invoice_id=fc.id\njoin pupilsightYearGroup yg on yg.pupilsightYearGroupID=ca.pupilsightYearGroupID\njoin fn_fees_counter co on co.id=fc.fn_fees_counter_id\njoin fn_masters fm on fm.id=fc.payment_mode_id',1,0,1,1,1,0,0,0,'','',0,0,10,0,-1,0,1,0,0,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}'),
	(14,'new_grade_wise',1,'mysql','','SELECT fn_fee_invoice_item.`id`,\n       fn_fee_invoice_item.`total_amount`,\n       fn_fee_invoice.`title`,\n       fn_fee_invoice.`id`,\n       pupilsightYearGroup.`name`\nFROM fn_fee_invoice\n  LEFT JOIN fn_fee_invoice_item\n     ON fn_fee_invoice.`id` = fn_fee_invoice_item.`fn_fee_invoice_id`\n  LEFT JOIN fn_fee_invoice_class_assign\n     ON fn_fee_invoice_item.`fn_fee_invoice_id` = fn_fee_invoice_class_assign.`fn_fee_invoice_id`\n  LEFT JOIN pupilsightYearGroup\n     ON fn_fee_invoice_class_assign.`pupilsightYearGroupID` = pupilsightYearGroup.`pupilsightYearGroupID`\n\nGROUP BY fn_fee_invoice.`id`',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,0,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}'),
	(15,'New wpDataTable',1,'json','','http://testoxygen.pupilpod.net/modules/Campaign/reports.php',1,0,1,1,0,0,0,0,'','',0,0,10,0,-1,0,1,0,0,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}'),
	(16,'Json Datatables',1,'json','','http://testoxygen.pupilpod.net/modules/Campaign/reports.php',1,0,1,1,0,0,0,0,'','',0,0,10,0,-1,0,1,0,0,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}'),
	(17,'INVOICE-TRANSACTION DETAILS REPORT_JSON',1,'json','','http://testoxygen.pupilpod.net/modules/Campaign/reports.php',1,0,1,1,0,0,0,0,'','',0,0,10,0,-1,0,1,0,0,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}'),
	(24,'',1,'mysql','','SELECT COUNT(pupilsightStudentEnrolment.`pupilsightPersonID`) AS TOTAL,\n       pupilsightPerson.`gender`,\n       pupilsightYearGroup.`name` as class,\n       pupilsightYearGroup.`pupilsightYearGroupID`,\n       pupilsightRollGroup.`name` as section,\n       pupilsightRollGroup.`pupilsightRollGroupID`\nFROM (pupilsightPerson, pupilsightYearGroup, pupilsightRollGroup)\n  INNER JOIN pupilsightStudentEnrolment\n     ON pupilsightPerson.`pupilsightPersonID` = pupilsightStudentEnrolment.`pupilsightPersonID`\n     AND pupilsightYearGroup.`pupilsightYearGroupID` = pupilsightStudentEnrolment.`pupilsightYearGroupID`\n     AND pupilsightRollGroup.`pupilsightRollGroupID` = pupilsightStudentEnrolment.`pupilsightRollGroupID`\n\nGROUP BY pupilsightYearGroup.`pupilsightYearGroupID`, pupilsightRollGroup.`pupilsightRollGroupID`, pupilsightPerson.`gender`',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,0,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:4:\"copy\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:3:\"pdf\";i:0;}',''),
	(25,'STUDENT STRENGTH REPORT',1,'mysql','','SELECT COUNT(pupilsightPerson.`pupilsightPersonID`) AS TOTAL,\n       pupilsightPerson.`gender`,\n       pupilsightYearGroup.`name` as class,\n       pupilsightYearGroup.`pupilsightYearGroupID`,\n       pupilsightRollGroup.`name` as section,\n       pupilsightRollGroup.`pupilsightRollGroupID`\nFROM (pupilsightPerson, pupilsightYearGroup, pupilsightRollGroup)\n  INNER JOIN pupilsightStudentEnrolment\n     ON pupilsightPerson.`pupilsightPersonID` = pupilsightStudentEnrolment.`pupilsightPersonID`\n     AND pupilsightYearGroup.`pupilsightYearGroupID` = pupilsightStudentEnrolment.`pupilsightYearGroupID`\n     AND pupilsightRollGroup.`pupilsightRollGroupID` = pupilsightStudentEnrolment.`pupilsightRollGroupID`\n\nGROUP BY pupilsightYearGroup.`pupilsightYearGroupID`, pupilsightRollGroup.`pupilsightRollGroupID`, pupilsightPerson.`gender`',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,0,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:4:\"copy\";i:1;s:3:\"pdf\";i:1;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}'),
	(26,'Daily Collection Report',1,'mysql','','SELECT pupilsightPerson.`preferredName`,\n       pupilsightPerson.`pupilsightPersonID`,\n       pupilsightYearGroup.`name` AS CLASS,\n       pupilsightRollGroup.`name` as section,\n       fn_fees_collection.`receipt_number`,\n       fn_fees_collection.`payment_date`,\n       fn_fees_collection.`transcation_amount`,\n       fn_fees_counter.`name` AS COUNTER,\n       fn_masters.`name` AS PM\nFROM pupilsightPerson\n  LEFT JOIN fn_fees_collection\n     ON pupilsightPerson.`pupilsightPersonID` = fn_fees_collection.`pupilsightPersonID`\n     LEFT JOIN fn_fees_counter\n     ON fn_fees_counter.`id` = fn_fees_collection.`fn_fees_counter_id`\n     LEFT JOIN fn_masters\n     ON fn_masters.`id` = fn_fees_collection.`payment_mode_id`\n     LEFT JOIN fn_fee_invoice_class_assign \n     ON fn_fee_invoice_class_assign.`fn_fee_invoice_id` = fn_fees_collection.`fn_fees_invoice_id`\n     JOIN pupilsightStudentEnrolment\n         ON pupilsightPerson.`pupilsightPersonID` = pupilsightStudentEnrolment.`pupilsightPersonID`\n       JOIN pupilsightYearGroup\n         ON pupilsightStudentEnrolment.`pupilsightYearGroupID` = pupilsightYearGroup.`pupilsightYearGroupID`\n    \n       JOIN pupilsightRollGroup\n         ON pupilsightRollGroup.`pupilsightRollGroupID` = pupilsightStudentEnrolment.`pupilsightRollGroupID`\n         where fn_fees_collection.receipt_number is not null and pupilsightPerson.`pupilsightPersonID` NOT LIKE \'%257%\'\n         order by pupilsightPerson.`pupilsightPersonID`;',1,0,1,1,1,0,0,0,'','',0,0,10,0,0,1,0,0,1,1,'','','','a:5:{s:5:\"print\";i:1;s:5:\"excel\";i:1;s:3:\"csv\";i:1;s:4:\"copy\";i:1;s:3:\"pdf\";i:1;}','{\"info_block\":1,\"global_search\":1,\"showRowsPerPage\":1,\"showAllRows\":0,\"clearFilters\":0}');

/*!40000 ALTER TABLE `wp_wpdatatables` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table wp_wpdatatables_columns
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wp_wpdatatables_columns`;

CREATE TABLE `wp_wpdatatables_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) NOT NULL,
  `orig_header` varchar(255) NOT NULL,
  `display_header` varchar(255) NOT NULL,
  `filter_type` enum('none','null_str','text','number','number-range','date-range','datetime-range','time-range','select','multiselect','checkbox') NOT NULL,
  `column_type` enum('autodetect','string','int','float','date','link','email','image','formula','datetime','time') NOT NULL,
  `input_type` enum('none','text','textarea','mce-editor','date','datetime','time','link','email','selectbox','multi-selectbox','attachment') NOT NULL DEFAULT 'text',
  `input_mandatory` tinyint(1) NOT NULL DEFAULT '0',
  `id_column` tinyint(1) NOT NULL DEFAULT '0',
  `group_column` tinyint(1) NOT NULL DEFAULT '0',
  `sort_column` tinyint(1) NOT NULL DEFAULT '0',
  `hide_on_phones` tinyint(1) NOT NULL DEFAULT '0',
  `hide_on_tablets` tinyint(1) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `sum_column` tinyint(1) NOT NULL DEFAULT '0',
  `skip_thousands_separator` tinyint(1) NOT NULL DEFAULT '0',
  `width` varchar(4) NOT NULL DEFAULT '',
  `possible_values` text NOT NULL,
  `default_value` varchar(100) NOT NULL DEFAULT '',
  `css_class` varchar(255) NOT NULL DEFAULT '',
  `text_before` varchar(255) NOT NULL DEFAULT '',
  `text_after` varchar(255) NOT NULL DEFAULT '',
  `formatting_rules` text NOT NULL,
  `calc_formula` text NOT NULL,
  `color` varchar(255) NOT NULL DEFAULT '',
  `advanced_settings` text NOT NULL,
  `pos` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

LOCK TABLES `wp_wpdatatables_columns` WRITE;
/*!40000 ALTER TABLE `wp_wpdatatables_columns` DISABLE KEYS */;

INSERT INTO `wp_wpdatatables_columns` (`id`, `table_id`, `orig_header`, `display_header`, `filter_type`, `column_type`, `input_type`, `input_mandatory`, `id_column`, `group_column`, `sort_column`, `hide_on_phones`, `hide_on_tablets`, `visible`, `sum_column`, `skip_thousands_separator`, `width`, `possible_values`, `default_value`, `css_class`, `text_before`, `text_after`, `formatting_rules`, `calc_formula`, `color`, `advanced_settings`, `pos`)
VALUES
	(1,1,'id','id','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(2,1,'pupilsightSchoolYearID','pupilsightSchoolYearID','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(3,1,'pupilsightYearGroupID','pupilsightYearGroupID','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(4,1,'name','name','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(5,1,'max_selection','max_selection','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',4),
	(6,1,'min_selection','min_selection','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',5),
	(7,2,'invoice_title','invoice_title','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(8,2,'fn_fee_structure_id','fn_fee_structure_id','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(9,3,'title','title','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(10,3,'pupilsightYearGroupID','pupilsightYearGroupID','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(11,3,'amount','amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(12,4,'title','title','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(13,4,'pupilsightYearGroupID','pupilsightYearGroupID','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(14,4,'total_amount','total_amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(15,5,'title','title','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(16,5,'pupilsightYearGroupID','pupilsightYearGroupID','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(17,5,'total_amount','total_amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(18,6,'title','title','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(19,6,'id','id','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(20,6,'pupilsightYearGroupID','pupilsightYearGroupID','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(21,6,'amount','amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(28,7,'pupilsightPersonID','pupilsightPersonID','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(40,7,'name','name','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(42,7,'section','section','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',4),
	(43,7,'admission','admission','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(44,7,'class_name','class_name','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(49,9,'name','name','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(50,9,'gender','gender','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(51,9,'username','username','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(52,9,'dob','dob','text','date','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(53,9,'admission_no','admission_no','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',4),
	(61,10,'title','title','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(62,10,'id','id','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(63,10,'pupilsightYearGroupID','pupilsightYearGroupID','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(66,10,'amount','amount','number','float','none',0,0,0,0,0,0,1,1,0,'','','','','','','[{\"ifClause\":\"eq\",\"cellVal\":null,\"action\":\"setCellColor\",\"setVal\":\"\"}]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(67,11,'name','name','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(68,11,'sid','sid','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(69,11,'class','class','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(70,11,'invoice_no','invoice_no','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(71,11,'title','title','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',4),
	(72,11,'amount','amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',5),
	(73,11,'total','total','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',6),
	(74,11,'id','id','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',7),
	(75,12,'name','name','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(76,12,'sid','sid','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(77,12,'class','class','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(78,12,'receipt_number','receipt_number','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(79,12,'counter','counter','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',4),
	(80,12,'staff','staff','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',5),
	(81,12,'Paymentmode','Paymentmode','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',6),
	(82,12,'date','date','text','date','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',7),
	(83,12,'transcation_amount','transcation_amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',8),
	(89,14,'id','id','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(90,14,'total_amount','total_amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(91,14,'title','title','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(92,14,'name','name','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(98,15,'student_id','student_id','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(99,15,'invoice_no','invoice_no','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(100,15,'invoice_title','invoice_title','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(101,15,'invoice_amount','invoice_amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',4),
	(102,15,'final_amount','final_amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',5),
	(103,15,'amount_paid','amount_paid','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',6),
	(104,15,'amount_pending','amount_pending','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',7),
	(105,15,'invoice_status','invoice_status','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',8),
	(106,15,'due_date','due_date','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',9),
	(107,15,'invoice_genrated_date','invoice_genrated_date','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',10),
	(108,15,'class','class','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',11),
	(109,15,'section','section','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',12),
	(110,15,'payment_mode','payment_mode','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',13),
	(111,16,'name','name','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(112,16,'student_id','student_id','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(113,16,'invoice_no','invoice_no','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(114,16,'invoice_title','invoice_title','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(115,16,'invoice_amount','invoice_amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',4),
	(116,16,'final_amount','final_amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',5),
	(117,16,'amount_paid','amount_paid','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',6),
	(118,16,'amount_pending','amount_pending','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',7),
	(119,16,'invoice_status','invoice_status','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',8),
	(120,16,'due_date','due_date','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',9),
	(121,16,'invoice_genrated_date','invoice_genrated_date','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',10),
	(122,16,'class','class','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',11),
	(123,16,'section','section','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',12),
	(124,16,'payment_mode','payment_mode','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',13),
	(125,17,'name','name','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(126,17,'student_id','student_id','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(127,17,'invoice_no','invoice_no','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(128,17,'invoice_title','invoice_title','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(129,17,'invoice_amount','invoice_amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',4),
	(130,17,'final_amount','final_amount','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',5),
	(131,17,'amount_paid','amount_paid','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',6),
	(132,17,'amount_pending','amount_pending','number','float','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',7),
	(133,17,'invoice_status','invoice_status','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',8),
	(134,17,'due_date','due_date','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',9),
	(135,17,'invoice_genrated_date','invoice_genrated_date','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',10),
	(136,17,'class','class','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',11),
	(137,17,'section','section','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',12),
	(138,17,'payment_mode','payment_mode','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',13),
	(175,24,'TOTAL','TOTAL','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(176,24,'gender','gender','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(177,24,'class','class','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(178,24,'pupilsightYearGroupID','pupilsightYearGroupID','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(179,24,'section','section','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',4),
	(180,24,'pupilsightRollGroupID','pupilsightRollGroupID','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',5),
	(182,25,'gender','gender','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(183,25,'class','class','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(184,25,'pupilsightYearGroupID','pupilsightYearGroupID','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3),
	(185,25,'section','section','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',4),
	(186,25,'pupilsightRollGroupID','pupilsightRollGroupID','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',5),
	(187,25,'TOTAL','TOTAL','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','0','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":null,\"checkboxesInModal\":null,\"editingDefaultValue\":null,\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"\",\"linkButtonAttribute\":0,\"linkButtonLabel\":null,\"linkButtonClass\":null,\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(192,26,'preferredName','preferredName','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',0),
	(193,26,'pupilsightPersonID','pupilsightPersonID','number','int','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',1),
	(194,26,'CLASS','CLASS','text','string','none',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',2),
	(195,26,'receipt_number','receipt_number','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',4),
	(196,26,'payment_date','payment_date','text','date','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',5),
	(197,26,'transcation_amount','transcation_amount','number','float','none',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":-1,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',6),
	(198,26,'COUNTER','COUNTER','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',7),
	(199,26,'PM','PM','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',8),
	(200,26,'section','section','text','string','text',0,0,0,0,0,0,1,0,0,'','','','','','','[]','','','{\"decimalPlaces\":-1,\"possibleValuesAddEmpty\":0,\"possibleValuesAjax\":10,\"calculateAvg\":0,\"calculateMax\":0,\"calculateMin\":0,\"sorting\":1,\"exactFiltering\":0,\"filterLabel\":\"\",\"checkboxesInModal\":0,\"editingDefaultValue\":\"\",\"dateInputFormat\":\"\",\"linkTargetAttribute\":\"_self\",\"linkButtonAttribute\":0,\"linkButtonLabel\":\"\",\"linkButtonClass\":\"\",\"rangeSlider\":0,\"possibleValuesType\":\"read\"}',3);

/*!40000 ALTER TABLE `wp_wpdatatables_columns` ENABLE KEYS */;
UNLOCK TABLES;




# Replace placeholder table for moodleuser with correct view syntax
# ------------------------------------------------------------

DROP TABLE `moodleuser`;

CREATE ALGORITHM=UNDEFINED DEFINER=`pupiltalk`@`localhost` SQL SECURITY DEFINER VIEW `moodleuser`
AS SELECT
   lcase(`pupilpod_master_clean`.`pupilsightperson`.`username`) AS `username`,lcase(`pupilpod_master_clean`.`pupilsightperson`.`preferredName`) AS `preferredName`,lcase(`pupilpod_master_clean`.`pupilsightperson`.`surname`) AS `surname`,lcase(`pupilpod_master_clean`.`pupilsightperson`.`email`) AS `email`,lcase(`pupilpod_master_clean`.`pupilsightperson`.`username`) AS `password`,lcase(`pupilpod_master_clean`.`pupilsightperson`.`website`) AS `website`
FROM (`pupilsightperson` join `pupilsightrole` on((`pupilpod_master_clean`.`pupilsightrole`.`pupilsightRoleID` = `pupilpod_master_clean`.`pupilsightperson`.`pupilsightRoleIDPrimary`))) where (((`pupilpod_master_clean`.`pupilsightrole`.`category` = 'Student') or (`pupilpod_master_clean`.`pupilsightrole`.`category` = 'Staff')) and (`pupilpod_master_clean`.`pupilsightperson`.`status` = 'Full'));


# Replace placeholder table for moodleenrolment with correct view syntax
# ------------------------------------------------------------

DROP TABLE `moodleenrolment`;

CREATE ALGORITHM=UNDEFINED DEFINER=`pupiltalk`@`localhost` SQL SECURITY DEFINER VIEW `moodleenrolment`
AS SELECT
   distinct `pupilpod_master_clean`.`pupilsightcourse`.`pupilsightCourseID` AS `pupilsightCourseID`,
   `pupilpod_master_clean`.`pupilsightcourse`.`name` AS `name`,
   `pupilpod_master_clean`.`pupilsightperson`.`username` AS `username`,
   `pupilpod_master_clean`.`pupilsightcourseclassperson`.`role` AS `role`
FROM (((`pupilsightcourse` join `pupilsightcourseclass` on((`pupilpod_master_clean`.`pupilsightcourseclass`.`pupilsightCourseID` = `pupilpod_master_clean`.`pupilsightcourse`.`pupilsightCourseID`))) join `pupilsightcourseclassperson` on((`pupilpod_master_clean`.`pupilsightcourseclassperson`.`pupilsightCourseClassID` = `pupilpod_master_clean`.`pupilsightcourseclass`.`pupilsightCourseClassID`))) join `pupilsightperson` on((`pupilpod_master_clean`.`pupilsightcourseclassperson`.`pupilsightPersonID` = `pupilpod_master_clean`.`pupilsightperson`.`pupilsightPersonID`))) where ((`pupilpod_master_clean`.`pupilsightperson`.`status` = 'Full') and (`pupilpod_master_clean`.`pupilsightcourse`.`pupilsightSchoolYearID` = (select `pupilpod_master_clean`.`pupilsightschoolyear`.`pupilsightSchoolYearID` from `pupilsightschoolyear` where (`pupilpod_master_clean`.`pupilsightschoolyear`.`status` = 'Current'))));


# Replace placeholder table for moodlecourse with correct view syntax
# ------------------------------------------------------------

DROP TABLE `moodlecourse`;

CREATE ALGORITHM=UNDEFINED DEFINER=`pupiltalk`@`localhost` SQL SECURITY DEFINER VIEW `moodlecourse`
AS SELECT
   `pupilpod_master_clean`.`pupilsightcourse`.`pupilsightCourseID` AS `pupilsightCourseID`,
   `pupilpod_master_clean`.`pupilsightcourse`.`pupilsightSchoolYearID` AS `pupilsightSchoolYearID`,
   `pupilpod_master_clean`.`pupilsightcourse`.`pupilsightDepartmentID` AS `pupilsightDepartmentID`,
   `pupilpod_master_clean`.`pupilsightcourse`.`name` AS `name`,
   `pupilpod_master_clean`.`pupilsightcourse`.`nameShort` AS `nameShort`,
   `pupilpod_master_clean`.`pupilsightcourse`.`description` AS `description`,
   `pupilpod_master_clean`.`pupilsightcourse`.`map` AS `map`,
   `pupilpod_master_clean`.`pupilsightcourse`.`pupilsightYearGroupIDList` AS `pupilsightYearGroupIDList`,
   `pupilpod_master_clean`.`pupilsightcourse`.`orderBy` AS `orderBy`
FROM `pupilsightcourse` where (`pupilpod_master_clean`.`pupilsightcourse`.`pupilsightSchoolYearID` = (select `pupilpod_master_clean`.`pupilsightschoolyear`.`pupilsightSchoolYearID` from `pupilsightschoolyear` where (`pupilpod_master_clean`.`pupilsightschoolyear`.`status` = 'Current')));

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
