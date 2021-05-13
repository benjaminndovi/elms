-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: elms
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.18.04.1

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3','2020-11-03 05:55:30');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldepartments`
--

DROP TABLE IF EXISTS `tbldepartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `DepartmentCode` varchar(50) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldepartments`
--

LOCK TABLES `tbldepartments` WRITE;
/*!40000 ALTER TABLE `tbldepartments` DISABLE KEYS */;
INSERT INTO `tbldepartments` VALUES (1,'Human Resource','HR','HR001','2017-11-01 07:16:25'),(2,'Information Technology','IT','IT001','2017-11-01 07:19:37'),(3,'Finanace & Admin','FAD','FAD1','2017-12-02 21:28:56'),(5,'Monitoring Eval & Research','MER','MER01','2021-01-21 14:15:29'),(6,'CoE Clinic','Clinic','CoE1','2021-01-21 14:18:44');
/*!40000 ALTER TABLE `tbldepartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemployees`
--

DROP TABLE IF EXISTS `tblemployees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblemployees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `EmpId` varchar(100) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Country` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblemployees`
--

LOCK TABLES `tblemployees` WRITE;
/*!40000 ALTER TABLE `tblemployees` DISABLE KEYS */;
INSERT INTO `tblemployees` VALUES (1,'EMP10806121','Janobe','Sourcecode','janobe@janobe.com','36d59e2369f00c4d9f336acf4408bae9','Male','3 February, 1990','Human Resource','N NEPO','NEPO','IRE','9857555555',1,'2017-11-10 11:29:59'),(2,'DEMP2132','James','doe','james@gmail.com','f925916e2754e5e03f75dd58a5733251','Male','3 February, 1990','Information Technology','N NEPO','NEPO','IRE','8587944255',1,'2017-11-10 13:40:02'),(3,'amwenitete','Alfred','Mwenitete','amwenitete@baylor-malawi.org','bae9c79d6cdad68455ea4a287587d438','Male','1 December, 1999','Information Technology','P/Bag B397','Lilongwe','Malawi','0999575744',1,'2021-01-21 14:31:39');
/*!40000 ALTER TABLE `tblemployees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblleaves`
--

DROP TABLE IF EXISTS `tblleaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `AdminRemark` mediumtext,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UserEmail` (`empid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblleaves`
--

LOCK TABLES `tblleaves` WRITE;
/*!40000 ALTER TABLE `tblleaves` DISABLE KEYS */;
INSERT INTO `tblleaves` VALUES (7,'Casual Leave','30/11/2017','29/10/2017','test description test descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest description','2017-11-19 13:11:21','Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.\r\n','2017-12-02 23:26:27 ',2,1,1),(8,'Medical Leave test','21/10/2017','25/10/2017','test description test descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest descriptiontest description','2017-11-20 11:14:14','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','2017-12-02 23:24:39 ',1,1,1),(9,'Medical Leave test','08/12/2017','12/12/2017','Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.\r\n','2017-12-02 18:26:01',NULL,NULL,0,1,2),(10,'Restricted Holiday(RH)','25/12/2017','25/12/2017','Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.','2017-12-03 08:29:07','Lorem Ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups.','2017-12-03 14:06:12 ',1,1,1),(11,'Casual Leave','22/02/2022','22/02/2022','sad','2020-11-03 05:20:58',NULL,NULL,0,0,1),(12,'Casual Leave','22/02/2022','22/02/2022','sad','2020-11-03 05:52:49',NULL,NULL,0,0,1),(13,'Casual Leave','22/01/2021','26/01/2021','I am testing to see if its possible to apply for leave these days','2021-01-21 14:34:54','The leave has been approved','2021-01-21 20:06:57 ',1,1,3);
/*!40000 ALTER TABLE `tblleaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblleavetype`
--

DROP TABLE IF EXISTS `tblleavetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblleavetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LeaveType` varchar(200) DEFAULT NULL,
  `Description` mediumtext,
  `CreationDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblleavetype`
--

LOCK TABLES `tblleavetype` WRITE;
/*!40000 ALTER TABLE `tblleavetype` DISABLE KEYS */;
INSERT INTO `tblleavetype` VALUES (1,'Casual Leave','Casual Leave ','2017-11-01 12:07:56'),(2,'Medical Leave test','Medical Leave  test','2017-11-06 13:16:09'),(3,'Restricted Holiday(RH)','Restricted Holiday(RH)','2017-11-06 13:16:38');
/*!40000 ALTER TABLE `tblleavetype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-18  8:23:41
