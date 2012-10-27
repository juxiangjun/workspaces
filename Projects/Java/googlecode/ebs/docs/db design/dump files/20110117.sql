-- MySQL dump 10.11
--
-- Host: localhost    Database: ebs
-- ------------------------------------------------------
-- Server version	5.1.51-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` varchar(36) NOT NULL,
  `address_line` varchar(200) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `sys_city_id` varchar(36) DEFAULT NULL,
  `sys_city_code` varchar(8) DEFAULT NULL,
  `sys_city_name` varchar(32) DEFAULT NULL,
  `sys_province_id` varchar(36) DEFAULT NULL,
  `sys_province_code` varchar(8) DEFAULT NULL,
  `sys_province_name` varchar(32) DEFAULT NULL,
  `sys_country_id` varchar(36) DEFAULT NULL,
  `sys_country_code` varchar(8) DEFAULT NULL,
  `sys_country_name` varchar(32) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` varchar(36) NOT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `mobile` varchar(24) DEFAULT NULL,
  `instance_type` varchar(64) DEFAULT NULL,
  `instance_message` varchar(64) DEFAULT NULL,
  `company_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_transaction`
--

DROP TABLE IF EXISTS `model_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_transaction` (
  `id` varchar(36) NOT NULL,
  `app_model_id` varchar(36) DEFAULT NULL,
  `company_id` varchar(36) DEFAULT NULL,
  `bought_date` varchar(20) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `unit_price` decimal(18,4) DEFAULT NULL,
  `sub_total` decimal(18,0) DEFAULT NULL,
  `discount` decimal(18,4) DEFAULT NULL,
  `actually_paid` decimal(18,4) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `trans_status` varchar(1) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_transaction`
--

LOCK TABLES `model_transaction` WRITE;
/*!40000 ALTER TABLE `model_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_bank`
--

DROP TABLE IF EXISTS `org_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_bank` (
  `id` varchar(36) NOT NULL,
  `org_company_id` varchar(36) DEFAULT NULL,
  `org_company_code` varchar(100) DEFAULT NULL,
  `org_company_name` varchar(100) DEFAULT NULL,
  `principal` varchar(100) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `bank_code` varchar(50) DEFAULT NULL,
  `bank_account` varchar(100) DEFAULT NULL,
  `bank_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_bank`
--

LOCK TABLES `org_bank` WRITE;
/*!40000 ALTER TABLE `org_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_company`
--

DROP TABLE IF EXISTS `org_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_company` (
  `id` varchar(36) NOT NULL,
  `code` varchar(12) DEFAULT NULL,
  `short_name` varchar(50) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `fax` varchar(21) DEFAULT NULL,
  `email` varchar(21) DEFAULT NULL,
  `phone` varchar(21) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `principal` varchar(16) DEFAULT NULL,
  `head_count` int(11) DEFAULT NULL,
  `sale_item` text,
  `comment` text,
  `sys_registration_id` varchar(36) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_company`
--

LOCK TABLES `org_company` WRITE;
/*!40000 ALTER TABLE `org_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_company_address`
--

DROP TABLE IF EXISTS `org_company_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_company_address` (
  `id` varchar(36) NOT NULL,
  `org_company_id` varchar(36) DEFAULT NULL,
  `org_company_name` varchar(50) DEFAULT NULL,
  `address_id` varchar(36) DEFAULT NULL,
  `address_type` tinyint(4) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_company_address`
--

LOCK TABLES `org_company_address` WRITE;
/*!40000 ALTER TABLE `org_company_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_company_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_company_model`
--

DROP TABLE IF EXISTS `org_company_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_company_model` (
  `id` varchar(36) NOT NULL,
  `model_id` varchar(36) DEFAULT NULL,
  `company_id` varchar(36) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `start_date` varchar(24) DEFAULT NULL,
  `end_date` varchar(24) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_company_model`
--

LOCK TABLES `org_company_model` WRITE;
/*!40000 ALTER TABLE `org_company_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_company_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_company_param`
--

DROP TABLE IF EXISTS `org_company_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_company_param` (
  `id` varchar(36) NOT NULL,
  `org_company_id` varchar(36) DEFAULT NULL,
  `org_company_name` varchar(50) DEFAULT NULL,
  `param_category` varchar(100) DEFAULT NULL,
  `sequence` smallint(6) DEFAULT NULL,
  `param_key` varchar(50) DEFAULT NULL,
  `param_value` varchar(50) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_company_param`
--

LOCK TABLES `org_company_param` WRITE;
/*!40000 ALTER TABLE `org_company_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_company_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_department`
--

DROP TABLE IF EXISTS `org_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_department` (
  `id` varchar(36) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `org_company_id` varchar(36) DEFAULT NULL,
  `org_company_name` varchar(50) DEFAULT NULL,
  `function_type` varchar(50) DEFAULT NULL,
  `start_date` varchar(24) DEFAULT NULL,
  `end_date` varchar(24) DEFAULT NULL,
  `comments` text,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_code` varchar(20) DEFAULT NULL,
  `parent_name` varchar(100) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  `leader_name` varchar(60) DEFAULT NULL,
  `is_leaf` tinyint(4) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_department`
--

LOCK TABLES `org_department` WRITE;
/*!40000 ALTER TABLE `org_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_employee`
--

DROP TABLE IF EXISTS `org_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_employee` (
  `id` varchar(36) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `person_id` varchar(36) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `job_title` varchar(100) DEFAULT NULL,
  `grade` char(10) DEFAULT NULL,
  `hire_date` varchar(20) DEFAULT NULL,
  `resignation_date` varchar(20) DEFAULT NULL,
  `org_company_id` varchar(36) DEFAULT NULL,
  `org_company_name` varchar(100) DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_employee`
--

LOCK TABLES `org_employee` WRITE;
/*!40000 ALTER TABLE `org_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_employee_department`
--

DROP TABLE IF EXISTS `org_employee_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_employee_department` (
  `id` varchar(36) NOT NULL,
  `org_employee_id` varchar(36) DEFAULT NULL,
  `org_employee_code` varchar(20) DEFAULT NULL,
  `org_employee_full_name` varchar(50) DEFAULT NULL,
  `org_department_id` varchar(36) DEFAULT NULL,
  `org_department_code` varchar(20) DEFAULT NULL,
  `org_department_name` varchar(100) DEFAULT NULL,
  `org_department_property` varchar(50) DEFAULT NULL,
  `org_position_id` varchar(36) DEFAULT NULL,
  `org_position_code` varchar(20) DEFAULT NULL,
  `org_position_name` varchar(100) DEFAULT NULL,
  `start_date` varchar(24) DEFAULT NULL,
  `end_date` varchar(24) DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  `is_default_name` varchar(10) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_employee_department`
--

LOCK TABLES `org_employee_department` WRITE;
/*!40000 ALTER TABLE `org_employee_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_employee_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_employee_occupation`
--

DROP TABLE IF EXISTS `org_employee_occupation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_employee_occupation` (
  `id` varchar(36) NOT NULL,
  `org_employee_id` varchar(36) DEFAULT NULL,
  `org_employee_name` varchar(50) DEFAULT NULL,
  `org_occupation_id` varchar(36) DEFAULT NULL,
  `org_occupation_name` varchar(50) DEFAULT NULL,
  `start_date` varchar(24) DEFAULT NULL,
  `end_date` varchar(24) DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_employee_occupation`
--

LOCK TABLES `org_employee_occupation` WRITE;
/*!40000 ALTER TABLE `org_employee_occupation` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_employee_occupation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_employee_position`
--

DROP TABLE IF EXISTS `org_employee_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_employee_position` (
  `id` varchar(36) NOT NULL,
  `org_employee_id` varchar(36) DEFAULT NULL,
  `org_employee_name` varchar(50) DEFAULT NULL,
  `org_position_id` varchar(36) DEFAULT NULL,
  `org_position_name` varchar(50) DEFAULT NULL,
  `start_date` varchar(24) DEFAULT NULL,
  `end_date` varchar(24) DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_employee_position`
--

LOCK TABLES `org_employee_position` WRITE;
/*!40000 ALTER TABLE `org_employee_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_employee_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_occupation`
--

DROP TABLE IF EXISTS `org_occupation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_occupation` (
  `id` varchar(36) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `org_company_id` varchar(36) DEFAULT NULL,
  `org_company_name` varchar(50) DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `start_date` varchar(24) DEFAULT NULL,
  `end_date` varchar(24) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_occupation`
--

LOCK TABLES `org_occupation` WRITE;
/*!40000 ALTER TABLE `org_occupation` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_occupation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_person`
--

DROP TABLE IF EXISTS `org_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_person` (
  `id` varchar(36) NOT NULL,
  `identity_number` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `born_date` varchar(20) DEFAULT NULL,
  `edu_level` tinyint(4) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `skype` varchar(20) DEFAULT NULL,
  `msn` varchar(100) DEFAULT NULL,
  `qq` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(20) DEFAULT NULL,
  `address_id` varchar(36) DEFAULT NULL,
  `address_line` varchar(100) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_person`
--

LOCK TABLES `org_person` WRITE;
/*!40000 ALTER TABLE `org_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_position`
--

DROP TABLE IF EXISTS `org_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_position` (
  `id` varchar(36) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `org_company_id` varchar(36) DEFAULT NULL,
  `org_company_name` varchar(100) DEFAULT NULL,
  `position_level_id` char(10) DEFAULT NULL,
  `position_level_name` varchar(20) DEFAULT NULL,
  `comments` varchar(100) DEFAULT NULL,
  `start_date` varchar(24) DEFAULT NULL,
  `end_date` varchar(24) DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_position`
--

LOCK TABLES `org_position` WRITE;
/*!40000 ALTER TABLE `org_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_city`
--

DROP TABLE IF EXISTS `sys_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_city` (
  `id` varchar(36) NOT NULL,
  `code` varchar(8) DEFAULT NULL,
  `short_name` varchar(32) DEFAULT NULL,
  `postal_code` char(10) DEFAULT NULL,
  `province_id` varchar(36) DEFAULT NULL,
  `province_code` varchar(8) DEFAULT NULL,
  `province_name` varchar(32) DEFAULT NULL,
  `country_id` varchar(36) DEFAULT NULL,
  `country_code` varchar(50) DEFAULT NULL,
  `country_name` varchar(50) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_city`
--

LOCK TABLES `sys_city` WRITE;
/*!40000 ALTER TABLE `sys_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_country`
--

DROP TABLE IF EXISTS `sys_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_country` (
  `id` varchar(36) NOT NULL,
  `code` varchar(50) NOT NULL,
  `short_name` varchar(32) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `iso_code` varchar(8) DEFAULT NULL,
  `label_code` varchar(8) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_country`
--

LOCK TABLES `sys_country` WRITE;
/*!40000 ALTER TABLE `sys_country` DISABLE KEYS */;
INSERT INTO `sys_country` VALUES ('00426f66-de0a-11df-9c53-000c29e14327','20','AD ','AND ','安道尔 ','Andorra ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14328','784','AE ','ARE ','阿联酋 ','United A','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14329','4','AF ','AFG ','阿富汗 ','Afghanis','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14330','28','AG ','ATG ','安提瓜和巴布达 ','Antigua ','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14331','660','AI ','AIA ','安圭拉 ','Anguilla','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14332','8','AL ','ALB ','阿尔巴尼亚 ','Albania ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14333','51','AM ','ARM ','亚美尼亚 ','Armenia ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14334','530','AN ','ANT ','荷属安的列斯 ','Netherla','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14335','24','AO ','AGO ','安哥拉 ','Angola ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14336','10','AQ ','ATA ','南极洲 ','Antarcti','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14337','32','AR ','ARG ','阿根廷 ','Argentin','-3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14338','16','AS ','ASM ','美属萨摩亚 ','American','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14339','40','AT ','AUT ','奥地利 ','Austria ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14340','36','AU ','AUS ','澳大利亚 ','Australi','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14341','533','AW ','ABW ','阿鲁巴 ','Aruba ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14342','248','AX ','ALA ','奥兰群岛 ','臿land Is','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14343','31','AZ ','AZE ','阿塞拜疆 ','Azerbaij','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14344','70','BA ','BIH ','波黑 ','Bosnia &','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14345','52','BB ','BRB ','巴巴多斯 ','Barbados','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14346','50','BD ','BGD ','孟加拉 ','Banglade','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14347','56','BE ','BEL ','比利时 ','Belgium ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14348','854','BF ','BFA ','布基纳法索 ','Burkina ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14349','100','BG ','BGR ','保加利亚 ','Bulgaria','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14350','48','BH ','BHR ','巴林 ','Bahrain ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14351','108','BI ','BDI ','布隆迪 ','Burundi ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14352','204','BJ ','BEN ','贝宁 ','Benin ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14353','652','BL ','BLM ','圣巴泰勒米岛 ','Saint Ba','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14354','60','BM ','BMU ','百慕大 ','Bermuda ','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14355','96','BN ','BRN ','文莱 ','Brunei ','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14356','68','BO ','BOL ','玻利维亚 ','Bolivia ','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14357','76','BR ','BRA ','巴西 ','Brazil ','-3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14358','44','BS ','BHS ','巴哈马 ','The Baha','-5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14359','64','BT ','BTN ','不丹 ','Bhutan ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14360','74','BV ','BVT ','布韦岛 ','Bouvet I','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14361','72','BW ','BWA ','博茨瓦纳 ','Botswana','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14362','112','BY ','BLR ','白俄罗斯 ','Belarus ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14363','84','BZ ','BLZ ','伯利兹 ','Belize ','-6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14364','124','CA ','CAN ','加拿大 ','Canada ','-5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14365','166','CC ','CCK ','科科斯群岛 ','Cocos (K','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14366','180','CD ','COD ','刚果（金） ','Democrat','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14367','140','CF ','CAF ','中非 ','Central ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14368','178','CG ','COG ','刚果（布） ','Republic','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14369','756','CH ','CHE ','瑞士 ','Switzerl','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14370','384','CI ','CIV ','科特迪瓦 ','C魌e d\'Iv','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14371','184','CK ','COK ','库克群岛 ','Cook Isl','-10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14372','152','CL ','CHL ','智利 ','Chile ','-5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14373','120','CM ','CMR ','喀麦隆 ','Cameroon','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14374','156','CN ','CHN ','中国；','China ','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14375','170','CO ','COL ','哥伦比亚 ','Colombia','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14376','188','CR ','CRI ','哥斯达黎加 ','Costa Ri','-6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14377','192','CU ','CUB ','古巴 ','Cuba ','-5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14378','132','CV ','CPV ','佛得角 ','Cape Ver','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14379','162','CX ','CXR ','圣诞岛 ','Christma','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14380','196','CY ','CYP ','塞浦路斯 ','Cyprus ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14381','203','CZ ','CZE ','捷克 ','Czech Re','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14382','276','DE ','DEU ','德国 ','Germany ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14383','262','DJ ','DJI ','吉布提 ','Djibouti','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14384','208','DK ','DNK ','丹麦 ','Denmark ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14385','212','DM ','DMA ','多米尼克 ','Dominica','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14386','214','DO ','DOM ','多米尼加 ','Dominica','-5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14387','12','DZ ','DZA ','阿尔及利亚 ','Algeria ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14388','218','EC ','ECU ','厄瓜多尔 ','Ecuador ','-5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14389','233','EE ','EST ','爱沙尼亚 ','Estonia ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14390','818','EG ','EGY ','埃及 ','Egypt ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14391','732','EH ','ESH ','西撒哈拉 ','Western ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14392','232','ER ','ERI ','厄立特里亚 ','Eritrea ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14393','724','ES ','ESP ','西班牙 ','Spain ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14394','231','ET ','ETH ','埃塞俄比亚 ','Ethiopia','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14395','246','FI ','FIN ','芬兰 ','Finland ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14396','242','FJ ','FJI ','斐济群岛 ','Fiji ','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14397','238','FK ','FLK ','马尔维纳斯群岛（','Falkland','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14398','583','FM ','FSM ','密克罗尼西亚联邦','Federate','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14399','234','FO ','FRO ','法罗群岛 ','Faroe Is','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14400','250','FR ','FRA ','法国 ','France ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14401','266','GA ','GAB ','加蓬 ','Gabon ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14402','826','GB ','GBR ','英国 ','Great Br','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14403','308','GD ','GRD ','格林纳达 ','Grenada ','-6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14404','268','GE ','GEO ','格鲁吉亚 ','Georgia ','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14405','254','GF ','GUF ','法属圭亚那 ','French G','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14406','831','GG ','GGY ','根西岛 ','Guernsey','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14407','288','GH ','GHA ','加纳 ','Ghana ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14408','292','GI ','GIB ','直布罗陀 ','Gibralta','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14409','304','GL ','GRL ','格陵兰 ','Greenlan','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14410','270','GM ','GMB ','冈比亚 ','Gambia ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14411','324','GN ','GIN ','几内亚 ','Guinea ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14412','312','GP ','GLP ','瓜德罗普 ','Guadelou','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14413','226','GQ ','GNQ ','赤道几内亚 ','Equatori','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14414','300','GR ','GRC ','希腊 ','Greece ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14415','239','GS ','SGS ','南乔治亚岛和南桑','South Ge','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14416','320','GT ','GTM ','危地马拉 ','Guatemal','-6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14417','316','GU ','GUM ','关岛 ','Guam ','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14418','624','GW ','GNB ','几内亚比绍 ','Guinea-B','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14419','328','GY ','GUY ','圭亚那 ','Guyana ','-3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14420','344','HK ','HKG ','香港 ','Hong Kon','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14421','334','HM ','HMD ','赫德岛和麦克唐纳','Heard Is','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14422','340','HN ','HND ','洪都拉斯 ','Honduras','-6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14423','191','HR ','HRV ','克罗地亚 ','Croatia ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14424','332','HT ','HTI ','海地 ','Haiti ','-5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14425','348','HU ','HUN ','匈牙利 ','Hungary ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14426','360','ID ','IDN ','印尼 ','Indonesi','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14427','372','IE ','IRL ','爱尔兰 ','Ireland ','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14428','376','IL ','ISR ','以色列 ','Israel ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14429','833','IM ','IMN ','马恩岛 ','Isle of ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14430','356','IN ','IND ','印度 ','India ','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14431','86','IO ','IOT ','英属印度洋领地 ','British ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14432','368','IQ ','IRQ ','伊拉克 ','Iraq ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14433','364','IR ','IRN ','伊朗 ','Iran ','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14434','352','IS ','ISL ','冰岛 ','Iceland ','-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14435','380','IT ','ITA ','意大利 ','Italy ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14436','832','JE ','JEY ','泽西岛 ','Jersey ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14437','388','JM ','JAM ','牙买加 ','Jamaica ','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14438','400','JO ','JOR ','约旦 ','Jordan ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14439','392','JP ','JPN ','日本 ','Japan ','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14440','404','KE ','KEN ','肯尼亚 ','Kenya ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14441','417','KG ','KGZ ','吉尔吉斯斯坦 ','Kyrgyzst','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14442','116','KH ','KHM ','柬埔寨 ','Cambodia','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14443','296','KI ','KIR ','基里巴斯 ','Kiribati','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14444','174','KM ','COM ','科摩罗 ','The Como','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14445','659','KN ','KNA ','圣基茨和尼维斯 ','St. Kitt','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14446','408','KP ','PRK ','朝鲜；','North Ko','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14447','410','KR ','KOR ','韩国；','South Ko','9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14448','414','KW ','KWT ','科威特 ','Kuwait ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14449','136','KY ','CYM ','开曼群岛 ','Cayman I','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14450','398','KZ ','KAZ ','哈萨克斯坦 ','Kazakhst','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14451','418','LA ','LAO ','老挝 ','Laos ','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14452','422','LB ','LBN ','黎巴嫩 ','Lebanon ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14453','662','LC ','LCA ','圣卢西亚 ','St. Luci','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14454','438','LI ','LIE ','列支敦士登 ','Liechten','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14455','144','LK ','LKA ','斯里兰卡 ','Sri Lank','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14456','430','LR ','LBR ','利比里亚 ','Liberia ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14457','426','LS ','LSO ','莱索托 ','Lesotho ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14458','440','LT ','LTU ','立陶宛 ','Lithuani','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14459','442','LU ','LUX ','卢森堡 ','Luxembou','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14460','428','LV ','LVA ','拉脱维亚 ','Latvia ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14461','434','LY ','LBY ','利比亚 ','Libya ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14462','504','MA ','MAR ','摩洛哥 ','Morocco ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14463','492','MC ','MCO ','摩纳哥 ','Monaco ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14464','498','MD ','MDA ','摩尔多瓦 ','Moldova ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14465','499','ME ','MNE ','黑山 ','Monteneg','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14466','663','MF ','MAF ','法属圣马丁 ','Saint Ma','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14467','450','MG ','MDG ','马达加斯加 ','Madagasc','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14468','584','MH ','MHL ','马绍尔群岛 ','Marshall','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14469','807','MK ','MKD ','马其顿 ','Republic','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14470','466','ML ','MLI ','马里 ','Mali ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14471','104','MM ','MMR ','缅甸 ','Myanmar ','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14472','496','MN ','MNG ','蒙古国；蒙古 ','Mongolia','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14473','446','MO ','MAC ','澳门 ','Macao ','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14474','580','MP ','MNP ','北马里亚纳群岛 ','Northern','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14475','474','MQ ','MTQ ','马提尼克 ','Martiniq','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14476','478','MR ','MRT ','毛里塔尼亚 ','Mauritan','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14477','500','MS ','MSR ','蒙塞拉特岛 ','Montserr','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14478','470','MT ','MLT ','马耳他 ','Malta ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14479','480','MU ','MUS ','毛里求斯 ','Mauritiu','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14480','462','MV ','MDV ','马尔代夫 ','Maldives','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14481','454','MW ','MWI ','马拉维 ','Malawi ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14482','484','MX ','MEX ','墨西哥 ','Mexico ','-7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14483','458','MY ','MYS ','马来西亚 ','Malaysia','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14484','508','MZ ','MOZ ','莫桑比克 ','Mozambiq','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14485','516','NA ','NAM ','纳米比亚 ','Namibia ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14486','540','NC ','NCL ','新喀里多尼亚 ','New Cale','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14487','562','NE ','NER ','尼日尔 ','Niger ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14488','574','NF ','NFK ','诺福克岛 ','Norfolk ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14489','566','NG ','NGA ','尼日利亚 ','Nigeria ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14490','558','NI ','NIC ','尼加拉瓜 ','Nicaragu','-6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14491','528','NL ','NLD ','荷兰 ','Netherla','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14492','578','NO ','NOR ','挪威 ','Norway ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14493','524','NP ','NPL ','尼泊尔 ','Nepal ','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14494','520','NR ','NRU ','瑙鲁 ','Nauru ','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14495','570','NU ','NIU ','纽埃 ','Niue ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14496','554','NZ ','NZL ','新西兰 ','New Zeal','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14497','512','OM ','OMN ','阿曼 ','Oman ','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14498','591','PA ','PAN ','巴拿马 ','Panama ','-5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14499','604','PE ','PER ','秘鲁 ','Peru ','-5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14500','258','PF ','PYF ','法属波利尼西亚 ','French p','11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14501','598','PG ','PNG ','巴布亚新几内亚 ','Papua Ne','10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14502','608','PH ','PHL ','菲律宾 ','The Phil','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14503','586','PK ','PAK ','巴基斯坦 ','Pakistan','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14504','616','PL ','POL ','波兰 ','Poland ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14505','666','PM ','SPM ','圣皮埃尔和密克隆','Saint-Pi','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14506','612','PN ','PCN ','皮特凯恩群岛 ','Pitcairn','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14507','630','PR ','PRI ','波多黎各 ','Puerto R','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14508','275','PS ','PSE ','巴勒斯坦 ','Palestin','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14509','620','PT ','PRT ','葡萄牙 ','Portugal','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14510','585','PW ','PLW ','帕劳 ','Palau ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14511','600','PY ','PRY ','巴拉圭 ','Paraguay','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14512','634','QA ','QAT ','卡塔尔 ','Qatar ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14513','638','RE ','REU ','留尼汪 ','R閡nion ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14514','642','RO ','ROU ','罗马尼亚 ','Romania ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14515','688','RS ','SRB ','塞尔维亚 ','Serbia ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14516','643','RU ','RUS ','俄罗斯 ','Russian ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14517','646','RW ','RWA ','卢旺达 ','Rwanda ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14518','682','SA ','SAU ','沙特阿拉伯 ','Saudi Ar','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14519','90','SB ','SLB ','所罗门群岛 ','Solomon ','11',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14520','690','SC ','SYC ','塞舌尔 ','Seychell','4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14521','736','SD ','SDN ','苏丹 ','Sudan ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14522','752','SE ','SWE ','瑞典 ','Sweden ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14523','702','SG ','SGP ','新加坡 ','Singapor','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14524','654','SH ','SHN ','圣赫勒拿 ','St. Hele','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14525','705','SI ','SVN ','斯洛文尼亚 ','Slovenia','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14526','744','SJ ','SJM ','斯瓦尔巴群岛和扬','Svalbard','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14527','703','SK ','SVK ','斯洛伐克 ','Slovakia','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14528','694','SL ','SLE ','塞拉利昂 ','Sierra L','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14529','674','SM ','SMR ','圣马力诺 ','San Mari','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14530','686','SN ','SEN ','塞内加尔 ','Senegal ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14531','706','SO ','SOM ','索马里 ','Somalia ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14532','740','SR ','SUR ','苏里南 ','Suriname','-3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14533','678','ST ','STP ','圣多美和普林西比','Sao Tome','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14534','222','SV ','SLV ','萨尔瓦多 ','El Salva','-6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14535','760','SY ','SYR ','叙利亚 ','Syria ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14536','748','SZ ','SWZ ','斯威士兰 ','Swazilan','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14537','796','TC ','TCA ','特克斯和凯科斯群','Turks & ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14538','148','TD ','TCD ','乍得 ','Chad ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14539','260','TF ','ATF ','法属南部领地 ','French S','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14540','768','TG ','TGO ','多哥 ','Togo ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14541','764','TH ','THA ','泰国 ','Thailand','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14542','762','TJ ','TJK ','塔吉克斯坦 ','Tajikist','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14543','772','TK ','TKL ','托克劳 ','Tokelau ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14544','626','TL ','TLS ','东帝汶 ','Timor-Le','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14545','795','TM ','TKM ','土库曼斯坦 ','Turkmeni','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14546','788','TN ','TUN ','突尼斯 ','Tunisia ','1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14547','776','TO ','TON ','汤加 ','Tonga ','12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14548','792','TR ','TUR ','土耳其 ','Turkey ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14549','780','TT ','TTO ','特立尼达和多巴哥','Trinidad','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14550','798','TV ','TUV ','图瓦卢 ','Tuvalu ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14551','158','TW ','TWN ','台湾 ','Taiwan, ','8',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14552','834','TZ ','TZA ','坦桑尼亚 ','Tanzania','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14553','804','UA ','UKR ','乌克兰 ','Ukraine ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14554','800','UG ','UGA ','乌干达 ','Uganda ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14555','581','UM ','UMI ','美国本土外小岛屿','United S','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14556','840','US ','USA ','美国 ','United S','-5',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14557','858','UY ','URY ','乌拉圭 ','Uruguay ','-2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14558','860','UZ ','UZB ','乌兹别克斯坦 ','Uzbekist','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14559','336','VA ','VAT ','梵蒂冈 ','Vatican ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14560','670','VC ','VCT ','圣文森特和格林纳','St. Vinc','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14561','862','VE ','VEN ','委内瑞拉 ','Venezuel','-4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14562','92','VG ','VGB ','英属维尔京群岛 ','British ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14563','850','VI ','VIR ','美属维尔京群岛 ','United S','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14564','704','VN ','VNM ','越南 ','Vietnam ','7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14565','548','VU ','VUT ','瓦努阿图 ','Vanuatu ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14566','876','WF ','WLF ','瓦利斯和富图纳 ','Wallis a','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14567','882','WS ','WSM ','萨摩亚 ','Samoa ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14568','887','YE ','YEM ','也门 ','Yemen ','3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14569','175','YT ','MYT ','马约特 ','Mayotte ','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14570','710','ZA ','ZAF ','南非 ','South Af','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14571','894','ZM ','ZMB ','赞比亚 ','Zambia ','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL),('00426f66-de0a-11df-9c53-000c29e14572','716','ZW ','ZWE ','津巴布韦 ','Zimbabwe','2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0',NULL);
/*!40000 ALTER TABLE `sys_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_currency`
--

DROP TABLE IF EXISTS `sys_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_currency` (
  `id` varchar(36) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `country_id` varchar(36) NOT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_currency`
--

LOCK TABLES `sys_currency` WRITE;
/*!40000 ALTER TABLE `sys_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_currency_exchange`
--

DROP TABLE IF EXISTS `sys_currency_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_currency_exchange` (
  `id` varchar(36) NOT NULL,
  `publish_date` varchar(20) DEFAULT NULL,
  `main_currency_id` varchar(36) DEFAULT NULL,
  `target_currency_id` varchar(36) DEFAULT NULL,
  `exchange_rate` decimal(18,4) DEFAULT NULL,
  `buying_rate` decimal(18,4) DEFAULT NULL,
  `cash_buying_rate` decimal(18,4) DEFAULT NULL,
  `selling_rate` decimal(18,4) DEFAULT NULL,
  `middle_rate` decimal(18,4) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_currency_exchange`
--

LOCK TABLES `sys_currency_exchange` WRITE;
/*!40000 ALTER TABLE `sys_currency_exchange` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_currency_exchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_group`
--

DROP TABLE IF EXISTS `sys_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_group` (
  `id` varchar(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `start_date` varchar(22) DEFAULT NULL,
  `end_date` varchar(22) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `company_model_id` varchar(36) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_group`
--

LOCK TABLES `sys_group` WRITE;
/*!40000 ALTER TABLE `sys_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_group_menu`
--

DROP TABLE IF EXISTS `sys_group_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_group_menu` (
  `id` varchar(36) NOT NULL,
  `sys_menu_id` varchar(36) DEFAULT NULL,
  `sys_menu_code` varchar(50) DEFAULT NULL,
  `sys_menu_label` varchar(100) DEFAULT NULL,
  `sys_group_id` varchar(36) DEFAULT NULL,
  `sys_group_name` varchar(100) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_group_menu`
--

LOCK TABLES `sys_group_menu` WRITE;
/*!40000 ALTER TABLE `sys_group_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_group_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_group_user`
--

DROP TABLE IF EXISTS `sys_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_group_user` (
  `id` varchar(36) NOT NULL,
  `sys_group_id` varchar(36) DEFAULT NULL,
  `sys_group_name` varchar(50) DEFAULT NULL,
  `org_employee_id` varchar(36) DEFAULT NULL,
  `org_employee_name` varchar(50) DEFAULT NULL,
  `start_date` varchar(10) DEFAULT NULL,
  `end_date` varchar(10) DEFAULT NULL,
  `status` char(10) DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_group_user`
--

LOCK TABLES `sys_group_user` WRITE;
/*!40000 ALTER TABLE `sys_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_help`
--

DROP TABLE IF EXISTS `sys_help`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_help` (
  `id` varchar(36) NOT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `action_code` varchar(50) DEFAULT NULL,
  `action_name` varchar(50) DEFAULT NULL,
  `namespace` varchar(50) DEFAULT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `help_info` text,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_help`
--

LOCK TABLES `sys_help` WRITE;
/*!40000 ALTER TABLE `sys_help` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_help` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` varchar(36) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_code` varchar(36) DEFAULT NULL,
  `parent_name` varchar(50) DEFAULT NULL,
  `model_id` varchar(36) DEFAULT NULL,
  `model_name` varchar(20) DEFAULT NULL,
  `img_file` varchar(50) DEFAULT NULL,
  `panel` varchar(100) DEFAULT NULL,
  `leaf` tinyint(4) NOT NULL,
  `is_user_menu` tinyint(4) NOT NULL DEFAULT '1',
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('3fa2e64d-2057-434a-966a-4239ddece607','0','整个系统',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('8051672a-459f-425d-b95e-4c9fefe8b39f','01','采购','3fa2e64d-2057-434a-966a-4239ddece607',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('972a453f-1bb7-475f-9bb8-a4d510b11ea8','0101','供应商','8051672a-459f-425d-b95e-4c9fefe8b39f',NULL,'采购',NULL,NULL,NULL,'Supplier',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('d3a71a4a-9750-4109-87e0-cd3591c5a381','0102','采购计划','8051672a-459f-425d-b95e-4c9fefe8b39f',NULL,'采购',NULL,NULL,NULL,'PurchasePlan',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('ffe4d3bd-8b4a-48ec-8800-5f3540db16cc','0103','采购订单','8051672a-459f-425d-b95e-4c9fefe8b39f',NULL,'采购',NULL,NULL,NULL,'PurchaseOrder',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('de959007-64db-4b0d-b9f0-d0b03723e53e','0104','采购入库','8051672a-459f-425d-b95e-4c9fefe8b39f',NULL,'采购',NULL,NULL,NULL,'PurchaseIn',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('576c022c-00a5-48b7-9fa0-cc57ec7d2f85','0105','采购退出','8051672a-459f-425d-b95e-4c9fefe8b39f',NULL,'采购',NULL,NULL,NULL,'PurchaseReturn',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('faf165e0-aecc-41da-84ef-ec3553cace31','0106','采购报表','8051672a-459f-425d-b95e-4c9fefe8b39f',NULL,'采购',NULL,NULL,NULL,'PurchaseReport',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('068c8d16-231d-487d-b63e-0444c47c050f','02','销售','3fa2e64d-2057-434a-966a-4239ddece607',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('66461952-6aa2-4f23-8fa2-acb849140b4b','0201','客户','068c8d16-231d-487d-b63e-0444c47c050f',NULL,'销售',NULL,NULL,NULL,'Customer',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('b5dbd481-3f49-47e6-a800-92de384f5118','0202','销售计划','068c8d16-231d-487d-b63e-0444c47c050f',NULL,'销售',NULL,NULL,NULL,'SalePlan',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('c6da4348-0a03-47cd-828e-895ae48819f5','0203','销售订单','068c8d16-231d-487d-b63e-0444c47c050f',NULL,'销售',NULL,NULL,NULL,'SaleOrder',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('fedaca58-bfcb-40f0-8d6c-ebd765e998db','0204','销售出库','068c8d16-231d-487d-b63e-0444c47c050f',NULL,'销售',NULL,NULL,NULL,'SaleOut',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('9ad0d390-c204-42db-a520-1cc905c270e5','0205','销售退回','068c8d16-231d-487d-b63e-0444c47c050f',NULL,'销售',NULL,NULL,NULL,'SaleReturn',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('37dc27f6-3667-4d61-b2ae-3b610e56a4a7','0206','销售报表','068c8d16-231d-487d-b63e-0444c47c050f',NULL,'销售',NULL,NULL,NULL,'SaleReport',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('ecf397bd-05bb-467f-914d-2ee2ff2a8c49','03','库存','3fa2e64d-2057-434a-966a-4239ddece607',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('68b68740-77c6-47e7-9611-f1873a1b22c9','0301','仓库设置','ecf397bd-05bb-467f-914d-2ee2ff2a8c49',NULL,'库存',NULL,NULL,NULL,'InventorySetting',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('427c1d9e-8a2f-4ac8-b93e-36670823138c','0302','存储方案','ecf397bd-05bb-467f-914d-2ee2ff2a8c49',NULL,'库存',NULL,NULL,NULL,'InventorySolution',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('3544ee5f-9b53-48e7-a2ef-92878c422269','0303','库存状态','ecf397bd-05bb-467f-914d-2ee2ff2a8c49',NULL,'库存',NULL,NULL,NULL,'InventoryState',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('6d8fd6ce-dbb2-4861-b0ac-83afdda63dce','0304','入库单','ecf397bd-05bb-467f-914d-2ee2ff2a8c49',NULL,'库存',NULL,NULL,NULL,'WarehouseIn',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('2daf8542-c80a-459e-aef5-cead5ba84eac','0305','出库单','ecf397bd-05bb-467f-914d-2ee2ff2a8c49',NULL,'库存',NULL,NULL,NULL,'WarehouseOut',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('a1c258e9-a7e5-4c74-a2bc-8d3df4d32640','0306','调拨单','ecf397bd-05bb-467f-914d-2ee2ff2a8c49',NULL,'库存',NULL,NULL,NULL,'InternalTransfer',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('0f148560-8ffc-49c4-9c28-0cc2adeba4da','0307','盘点单','ecf397bd-05bb-467f-914d-2ee2ff2a8c49',NULL,'库存',NULL,NULL,NULL,'CheckInventory',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('659375bd-4e1c-40dd-95ae-e9a315427b0f','0308','损益单','ecf397bd-05bb-467f-914d-2ee2ff2a8c49',NULL,'库存',NULL,NULL,NULL,'InventoryDifference',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('94d757c9-2d09-4317-9104-04099937436b','04','门店','3fa2e64d-2057-434a-966a-4239ddece607',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('b83470ac-e042-400d-915c-072d90f48da4','0401','零售业务','94d757c9-2d09-4317-9104-04099937436b',NULL,NULL,NULL,NULL,NULL,'Retail',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('c3a0cdf2-075f-40f6-80e1-da606385dd31','0402','顾客退货','94d757c9-2d09-4317-9104-04099937436b',NULL,NULL,NULL,NULL,NULL,'MemberReturn',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('ff8f9cb4-b434-4432-adca-e32e1e5a1cbe','0403','收货确认','94d757c9-2d09-4317-9104-04099937436b',NULL,NULL,NULL,NULL,NULL,'StoreReceived',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('d6152dbf-494c-46be-86bd-7a9ac240da17','0404','货品退库','94d757c9-2d09-4317-9104-04099937436b',NULL,NULL,NULL,NULL,NULL,'StoreReturn',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('6642a212-b160-402e-a505-ee1dac4674b4','0405','盘点损益','94d757c9-2d09-4317-9104-04099937436b',NULL,NULL,NULL,NULL,NULL,'StoreDifference',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('b7197d9e-6347-4fa9-abe0-85a4f10d2fc1','0406','补货申请','94d757c9-2d09-4317-9104-04099937436b',NULL,NULL,NULL,NULL,NULL,'StoreApply',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('4eac0a0a-01dc-4e4b-ae1a-0d4d3e6c1532','0407','门店设置','94d757c9-2d09-4317-9104-04099937436b',NULL,NULL,NULL,NULL,NULL,'StoreSetting',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('b91e903f-9bbc-40c5-8095-3153869baf8c','05','会员','3fa2e64d-2057-434a-966a-4239ddece607',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('a03be504-1086-4400-a523-e83afd7a5ae8','0501','会员档案','b91e903f-9bbc-40c5-8095-3153869baf8c',NULL,NULL,NULL,NULL,NULL,'Member',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('952c5a8a-38a9-4d50-b769-723f769acd15','0502','等级分类','b91e903f-9bbc-40c5-8095-3153869baf8c',NULL,NULL,NULL,NULL,NULL,'MemberSetting',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('31c6159c-b08b-476d-8642-6a31780b135c','0503','促销方案','b91e903f-9bbc-40c5-8095-3153869baf8c',NULL,NULL,NULL,NULL,NULL,'MemberPromotion',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('d8bf9c79-0135-4f64-a701-ee5194bd6c9b','06','财务','3fa2e64d-2057-434a-966a-4239ddece607',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('4c4c9b3f-d9ba-4b30-a938-34ea15fdadde','0601','应付帐款','d8bf9c79-0135-4f64-a701-ee5194bd6c9b',NULL,NULL,NULL,NULL,NULL,'AccountPayable',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('7582d273-4550-49f3-8f4c-6ba757ae4c0b','0602','应收帐款','d8bf9c79-0135-4f64-a701-ee5194bd6c9b',NULL,NULL,NULL,NULL,NULL,'AccountReceivable',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('80c3f2df-b288-455d-8b79-402d82597ea3','0603','预付帐款','d8bf9c79-0135-4f64-a701-ee5194bd6c9b',NULL,NULL,NULL,NULL,NULL,'AccountsPrepayment',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('a809df0f-e991-487d-83c4-44c3a05434be','0604','薪资设定','d8bf9c79-0135-4f64-a701-ee5194bd6c9b',NULL,NULL,NULL,NULL,NULL,'SalarySetting',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('6b0df58f-5a20-4134-aecf-638a42d4e9ec','0605','薪资发放','d8bf9c79-0135-4f64-a701-ee5194bd6c9b',NULL,NULL,NULL,NULL,NULL,'SalaryPayment',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('1b453c71-f3db-419e-94f4-e0046c0bd78a','07','报表','3fa2e64d-2057-434a-966a-4239ddece607',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('4bfad62c-a535-4574-b3ad-c158f77fbf29','0701','采购分析','1b453c71-f3db-419e-94f4-e0046c0bd78a',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('0760e8f9-9e35-482c-bdbe-95b60291f44e','0702','销售分析','1b453c71-f3db-419e-94f4-e0046c0bd78a',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('e3d05892-45ec-48aa-a26f-ad48d572be75','0703','库存分析','1b453c71-f3db-419e-94f4-e0046c0bd78a',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('ab3de268-d153-46af-a243-6d0a97946905','0704','枢纽分析','1b453c71-f3db-419e-94f4-e0046c0bd78a',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('c0300eca-5a2c-46e7-b8a7-36283bf03650','0706','财务报表','1b453c71-f3db-419e-94f4-e0046c0bd78a',NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('c195e61a-b306-4e9d-89ca-20a39b125352','08','设置','3fa2e64d-2057-434a-966a-4239ddece607',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('f44b5657-9535-4adc-a749-0be4d6a4e7ea','0801','制造商简档','c2bcc157-b1f3-4bd1-8ccd-72517088d903',NULL,'设置',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('c2bcc157-b1f3-4bd1-8ccd-72517088d903','081','商品维护','c195e61a-b306-4e9d-89ca-20a39b125352',NULL,'设置',NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('6a617ec7-5abd-460d-9079-faf8e68eace7','0811','品牌维护','c2bcc157-b1f3-4bd1-8ccd-72517088d903',NULL,'设置',NULL,NULL,NULL,'Brand',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('a649c591-eaaf-4b3c-9278-76cadd22664d','0812','计量单位','c2bcc157-b1f3-4bd1-8ccd-72517088d903',NULL,'设置',NULL,NULL,NULL,'Unit',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('027d9f6c-7153-4caa-970e-f9a9ba610725','0813','商品类别','c2bcc157-b1f3-4bd1-8ccd-72517088d903',NULL,'设置',NULL,NULL,NULL,'Category',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('d61192db-b684-4f38-98f4-73d4ef5f6269','0816','属性定义','c2bcc157-b1f3-4bd1-8ccd-72517088d903',NULL,'商品',NULL,NULL,NULL,'Property',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('3be246bf-76c7-46fc-94ab-b8c3e0e71a02','0819','商品组合','c2bcc157-b1f3-4bd1-8ccd-72517088d903',NULL,'设置',NULL,NULL,NULL,'Combine',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('d27a705e-0815-4305-8f59-3addd7af60ed','082','组织定义','c195e61a-b306-4e9d-89ca-20a39b125352',NULL,'设置',NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('595501a6-fd2c-4573-83c0-38c011715637','0821','组织设定','d27a705e-0815-4305-8f59-3addd7af60ed',NULL,'组织',NULL,NULL,NULL,'Client',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('7818809e-1644-4c7a-8027-3eb981cda142','0822','部门资料','d27a705e-0815-4305-8f59-3addd7af60ed',NULL,'组织',NULL,NULL,NULL,'Department',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('b3884dff-ec45-451f-9159-7de338777fae','0823','员工资料','d27a705e-0815-4305-8f59-3addd7af60ed',NULL,'组织',NULL,NULL,NULL,'Employee',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ef7a7eb2-b4d7-4d1f-a6b0-84df6fab0b59','0824','专业职称','d27a705e-0815-4305-8f59-3addd7af60ed',NULL,'组织',NULL,NULL,NULL,'Occupation',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('cadeaa10-b675-4977-972c-fe3ea05027e0','0825\r\n','管理职位','d27a705e-0815-4305-8f59-3addd7af60ed',NULL,'组织',NULL,NULL,NULL,'Position',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('f1f5a586-80a7-42bf-b83d-384308aa2909','084','工作流','c195e61a-b306-4e9d-89ca-20a39b125352',NULL,'设置',NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('b48a1f8b-f149-4efc-981c-731ec4bb6371','0841','表单类型','f1f5a586-80a7-42bf-b83d-384308aa2909',NULL,'考勤',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('d57e60b8-7321-4274-8d4f-ba376007ea74','0842','审核角色','f1f5a586-80a7-42bf-b83d-384308aa2909',NULL,'工作流',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('23f7c86e-be80-4838-a9a0-94ebeb287a78','0843','审核步骤','f1f5a586-80a7-42bf-b83d-384308aa2909',NULL,'工作流',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('c7503826-f2cb-4613-b5b1-6df814306e68','0844','审核条件','f1f5a586-80a7-42bf-b83d-384308aa2909',NULL,'工作流',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('17da94db-992a-41b2-b7ea-845226f91c29','0845','默认字段','f1f5a586-80a7-42bf-b83d-384308aa2909',NULL,'工作流',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('1a875bab-8306-44f6-8628-e427e213515c','0846','审核字段','f1f5a586-80a7-42bf-b83d-384308aa2909',NULL,'工作流',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('36bebc39-4863-4290-80e1-db0402cb5f9c','0847','审核记录','f1f5a586-80a7-42bf-b83d-384308aa2909',NULL,'工作流',NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('4ebca9f5-2993-40f0-87cf-a15cb478d564','09','系统','3fa2e64d-2057-434a-966a-4239ddece607',NULL,NULL,NULL,NULL,NULL,NULL,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('6fb02a75-4d66-4144-bc60-8e3d78543ae5','0901','用户及组','4ebca9f5-2993-40f0-87cf-a15cb478d564',NULL,'系统',NULL,NULL,NULL,'SysUser',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('90608120-cecf-4934-8810-c2555c615016','0903','权限设定','4ebca9f5-2993-40f0-87cf-a15cb478d564',NULL,'系统',NULL,NULL,NULL,'UserMenu',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('7bd40ab5-dfe0-4a3a-8192-235585691921','0904','用户视图','4ebca9f5-2993-40f0-87cf-a15cb478d564',NULL,'系统',NULL,NULL,NULL,'UserView',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_model`
--

DROP TABLE IF EXISTS `sys_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_model` (
  `id` varchar(36) NOT NULL,
  `code` char(10) NOT NULL,
  `model_name` varchar(100) DEFAULT NULL,
  `list_price` decimal(18,4) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_model`
--

LOCK TABLES `sys_model` WRITE;
/*!40000 ALTER TABLE `sys_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_object`
--

DROP TABLE IF EXISTS `sys_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_object` (
  `id` varchar(36) NOT NULL,
  `code` varchar(30) DEFAULT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `form_name` varchar(50) DEFAULT NULL,
  `action_namespace` varchar(50) DEFAULT NULL,
  `action_name` varchar(50) DEFAULT NULL,
  `form_theme` varchar(50) DEFAULT NULL,
  `form_method` varchar(50) NOT NULL,
  `form_validation` varchar(50) NOT NULL,
  `form_targets` varchar(50) DEFAULT NULL,
  `form_js` text,
  `obj_name_property` varchar(50) DEFAULT NULL,
  `is_system_object` tinyint(4) DEFAULT NULL,
  `app_model_id` varchar(36) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_object`
--

LOCK TABLES `sys_object` WRITE;
/*!40000 ALTER TABLE `sys_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_object_property`
--

DROP TABLE IF EXISTS `sys_object_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_object_property` (
  `id` varchar(36) NOT NULL,
  `group_id` smallint(6) DEFAULT NULL,
  `group_name` varchar(20) DEFAULT NULL,
  `sequence` smallint(6) DEFAULT NULL,
  `form_field_id` varchar(50) DEFAULT NULL,
  `form_field_code` varchar(50) DEFAULT NULL,
  `field_hint` varchar(200) DEFAULT NULL,
  `field_input_type` varchar(20) DEFAULT NULL,
  `form_css_style` varchar(100) DEFAULT NULL,
  `on_focus` varchar(50) DEFAULT NULL,
  `on_change` varchar(50) DEFAULT NULL,
  `list_name` varchar(50) DEFAULT NULL,
  `list_key` varchar(50) DEFAULT NULL,
  `list_value` varchar(50) DEFAULT NULL,
  `required` tinyint(4) NOT NULL,
  `readonly` tinyint(4) NOT NULL,
  `field_name` varchar(50) DEFAULT NULL,
  `data_type` varchar(20) DEFAULT NULL,
  `min_value` smallint(6) DEFAULT NULL,
  `max_value` smallint(6) DEFAULT NULL,
  `rows` smallint(6) NOT NULL,
  `cols` smallint(6) NOT NULL,
  `line` tinyint(4) NOT NULL,
  `visible` tinyint(4) NOT NULL,
  `super_obj_name` varchar(50) DEFAULT NULL,
  `property_name` varchar(50) DEFAULT NULL,
  `is_view_link` tinyint(4) DEFAULT NULL,
  `is_view_item` tinyint(4) DEFAULT NULL,
  `is_lookup_field` tinyint(4) DEFAULT NULL,
  `is_home_item` tinyint(4) DEFAULT NULL,
  `redirect_link` varchar(100) DEFAULT NULL,
  `param_name` varchar(50) DEFAULT NULL,
  `param_value_property_name` varchar(50) DEFAULT NULL,
  `lookup_script` text,
  `sys_object_id` varchar(36) DEFAULT NULL,
  `sys_object_name` varchar(100) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_object_property`
--

LOCK TABLES `sys_object_property` WRITE;
/*!40000 ALTER TABLE `sys_object_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_object_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_object_related`
--

DROP TABLE IF EXISTS `sys_object_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_object_related` (
  `id` varchar(36) NOT NULL,
  `sys_object_id` varchar(36) DEFAULT NULL,
  `sys_object_code` varchar(50) DEFAULT NULL,
  `sys_object_name` varchar(50) DEFAULT NULL,
  `sequence` smallint(6) DEFAULT NULL,
  `related_object_id` varchar(36) DEFAULT NULL,
  `related_object_code` varchar(50) DEFAULT NULL,
  `related_object_name` varchar(50) DEFAULT NULL,
  `related_namespace` varchar(50) DEFAULT NULL,
  `related_property_name` varchar(100) DEFAULT NULL,
  `order_by` varchar(50) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_object_related`
--

LOCK TABLES `sys_object_related` WRITE;
/*!40000 ALTER TABLE `sys_object_related` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_object_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_param`
--

DROP TABLE IF EXISTS `sys_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_param` (
  `id` varchar(36) NOT NULL,
  `param_category` varchar(100) DEFAULT NULL,
  `param_key` varchar(100) DEFAULT NULL,
  `param_value` varchar(100) DEFAULT NULL,
  `sequence` smallint(6) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_param`
--

LOCK TABLES `sys_param` WRITE;
/*!40000 ALTER TABLE `sys_param` DISABLE KEYS */;
INSERT INTO `sys_param` VALUES ('1','gender','0','female',1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('2','gender','1','male',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('3','edu_level','1','elementarySchool',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('4','edu_level','2','middle school',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('5','edu_level','3','college',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('6','edu_level','4','master',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),('7','edu_level','5','phD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_province`
--

DROP TABLE IF EXISTS `sys_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_province` (
  `id` varchar(36) NOT NULL,
  `code` varchar(8) NOT NULL,
  `short_name` varchar(8) NOT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `country_id` varchar(36) DEFAULT NULL,
  `country_code` varchar(8) DEFAULT NULL,
  `country_short_name` varchar(8) DEFAULT NULL,
  `label_code` varchar(8) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_province`
--

LOCK TABLES `sys_province` WRITE;
/*!40000 ALTER TABLE `sys_province` DISABLE KEYS */;
INSERT INTO `sys_province` VALUES ('95402c74-ee70-42a0-836c-b8d299da4d37','01','北京',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('310f4d61-e923-4d4c-b503-d2299221ba93','02','天津',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b9b347a1-a4f5-46b3-ae83-3a23712d8972','03','江苏',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('0573b62d-061c-4b86-8ee6-f0040b0d29b8','04','浙江',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('704427ea-8110-4830-96a5-0829480d59cf','05','上海',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('6945189e-e24f-4419-8244-a1ac824416a6','06','安徽',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('3bbc98df-8978-4822-9d44-80a1bef62886','07','山东',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('9a22d517-50ce-4c81-aa2f-7acf19d8a80b','08','广东',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('e9eda292-9746-48a6-b12a-64b247d0133a','09','广西',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('9c706214-60bd-4f83-a24d-953c48002f2f','10','福建',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('00ccb6af-c280-45ce-82c5-1e740f092365','11','海南',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('f38323d7-2049-4687-b724-72e203ebaf1b','12','湖北',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('71931a39-84b2-46a1-9b50-9240f884c9c3','13','湖南',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('797523ea-9fe8-45c9-945e-6f4c8a1654fc','14','江西',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('51a9f256-9c3f-485d-946f-481efdeb75a0','15','黑龙江',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('9b30d171-5f26-4513-be97-a763572be7df','16','吉林',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('f527f1f9-af37-4b63-88cc-7a25951baf28','17','辽宁',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b5e0188e-dd3b-4b21-b41f-b277a0446e84','18','云南',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('d04e2963-23bb-412d-b5c6-ce9cdca4c65c','19','贵州',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('6f25c922-0b75-402c-870c-ab9e07ac815b','20','四川',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('80822b64-6d6a-405e-a2b3-531a5d38a5e6','21','重庆',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('67595757-775b-4283-a6fb-b552fab70eef','22','山西',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('28f2d64a-69d7-40fd-807b-6ec6080932f1','23','陕西',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1d3bd3a1-09e8-4402-9e7e-6bc86bd26f8b','24','河北',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('4d399917-01d9-4899-8801-bdbd95f5bee4','25','河南',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2831ad23-9e82-44fd-aeb7-7971d189863e','26','内蒙古',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('2322a1b5-72dc-41f0-9829-8ef407cef535','27','宁夏',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('becb9a98-5bcd-4dd1-9cb0-85345c2c339e','28','青海',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('042623d9-18be-401f-91ef-e3761c2e3f9a','29','甘肃',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5c76463c-5023-4d54-8824-fd862a1a2c05','30','西藏',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('faddd487-3c45-47bf-9aa4-6efc1915d784','31','新疆',NULL,'00426f66-de0a-11df-9c53-000c29e14374','156','中国',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_registration`
--

DROP TABLE IF EXISTS `sys_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_registration` (
  `id` varchar(36) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `industry` varchar(30) DEFAULT NULL,
  `ip` varchar(36) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `applying_date` varchar(24) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_registration`
--

LOCK TABLES `sys_registration` WRITE;
/*!40000 ALTER TABLE `sys_registration` DISABLE KEYS */;
INSERT INTO `sys_registration` VALUES ('66c5138e-fcbc-47d5-8b37-6e9d8199d067','tony.ju@163.com','Tony','Ju','Mr.','Break Shanghai','Game','127.0.0.1',1,NULL,'2011-01-04 11:05:28',NULL,'2011-01-04 11:05:28',NULL,'2011-01-04 11:05:28',NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `sys_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL,
  `login_name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `employee_id` varchar(36) DEFAULT NULL,
  `employee_code` varchar(50) DEFAULT NULL,
  `employee_full_name` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `login_times` int(11) DEFAULT NULL,
  `org_company_id` varchar(36) DEFAULT NULL,
  `org_company_code` varchar(50) DEFAULT NULL,
  `org_company_name` varchar(100) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_view`
--

DROP TABLE IF EXISTS `sys_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_view` (
  `id` varchar(36) NOT NULL,
  `view_code` varchar(50) DEFAULT NULL,
  `view_name` varchar(100) DEFAULT NULL,
  `view_comment` text,
  `view_script` text,
  `sys_object_id` varchar(36) DEFAULT NULL,
  `sys_object_code` varchar(50) DEFAULT NULL,
  `sys_object_short_name` varchar(50) DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  `owner_id` varchar(50) DEFAULT NULL,
  `owner_code` varchar(50) DEFAULT NULL,
  `owner_full_name` varchar(100) DEFAULT NULL,
  `combine_type` varchar(100) DEFAULT NULL,
  `limited` tinyint(4) DEFAULT NULL,
  `shared` tinyint(4) DEFAULT NULL,
  `hql` text,
  `position` tinyint(4) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_view`
--

LOCK TABLES `sys_view` WRITE;
/*!40000 ALTER TABLE `sys_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_view_detail`
--

DROP TABLE IF EXISTS `sys_view_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_view_detail` (
  `id` varchar(36) NOT NULL,
  `sys_view_id` varchar(36) NOT NULL,
  `sys_view_code` varchar(50) DEFAULT NULL,
  `sys_view_name` varchar(100) DEFAULT NULL,
  `sys_object_property_code` varchar(50) DEFAULT NULL,
  `sys_object_property_name` varchar(50) DEFAULT NULL,
  `sys_operator_code` varchar(50) DEFAULT NULL,
  `sys_operator_name` varchar(50) DEFAULT NULL,
  `input_type` varchar(100) DEFAULT NULL,
  `data_type` varchar(50) DEFAULT NULL,
  `value_range` varchar(50) DEFAULT NULL,
  `sys_view_value_list` varchar(50) DEFAULT NULL,
  `sys_view_value_name` varchar(200) DEFAULT NULL,
  `sys_view_value_1` varchar(200) DEFAULT NULL,
  `sys_view_value_2` varchar(200) DEFAULT NULL,
  `parent_object_id` varchar(50) DEFAULT NULL,
  `parent_object_name` varchar(50) DEFAULT NULL,
  `parent_object_property` varchar(50) DEFAULT NULL,
  `sequence` smallint(6) DEFAULT NULL,
  `created_date` varchar(24) DEFAULT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `last_viewed_date` varchar(24) DEFAULT NULL,
  `last_viewed_by` varchar(50) DEFAULT NULL,
  `last_updated_date` varchar(24) DEFAULT NULL,
  `last_updated_by` varchar(50) DEFAULT NULL,
  `deleted_date` varchar(24) DEFAULT NULL,
  `deleted_by` varchar(50) DEFAULT NULL,
  `curr_viewed_date` varchar(24) DEFAULT NULL,
  `curr_viewed_by` varchar(50) DEFAULT NULL,
  `deleted_flag` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_view_detail`
--

LOCK TABLES `sys_view_detail` WRITE;
/*!40000 ALTER TABLE `sys_view_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_view_detail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-01-17 11:01:38
