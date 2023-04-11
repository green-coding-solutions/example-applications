-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nextcloud
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-1:10.6.12+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `oc_accounts`
--

DROP TABLE IF EXISTS `oc_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts`
--

LOCK TABLES `oc_accounts` WRITE;
/*!40000 ALTER TABLE `oc_accounts` DISABLE KEYS */;
INSERT INTO `oc_accounts` VALUES ('admin','{\"displayname\":{\"value\":\"admin\",\"scope\":\"v2-federated\",\"verified\":\"0\"},\"address\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"website\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"email\":{\"value\":null,\"scope\":\"v2-federated\",\"verified\":\"0\"},\"avatar\":{\"scope\":\"v2-federated\"},\"phone\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"twitter\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"fediverse\":{\"value\":\"\",\"scope\":\"v2-local\",\"verified\":\"0\"},\"organisation\":{\"value\":\"\",\"scope\":\"v2-local\"},\"role\":{\"value\":\"\",\"scope\":\"v2-local\"},\"headline\":{\"value\":\"\",\"scope\":\"v2-local\"},\"biography\":{\"value\":\"\",\"scope\":\"v2-local\"},\"profile_enabled\":{\"value\":\"1\"}}');
/*!40000 ALTER TABLE `oc_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_accounts_data`
--

DROP TABLE IF EXISTS `oc_accounts_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_accounts_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `accounts_data_uid` (`uid`),
  KEY `accounts_data_name` (`name`),
  KEY `accounts_data_value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_accounts_data`
--

LOCK TABLES `oc_accounts_data` WRITE;
/*!40000 ALTER TABLE `oc_accounts_data` DISABLE KEYS */;
INSERT INTO `oc_accounts_data` VALUES (1,'admin','displayname','admin'),(2,'admin','address',''),(3,'admin','website',''),(4,'admin','email',''),(5,'admin','phone',''),(6,'admin','twitter',''),(7,'admin','fediverse',''),(8,'admin','organisation',''),(9,'admin','role',''),(10,'admin','headline',''),(11,'admin','biography',''),(12,'admin','profile_enabled','1');
/*!40000 ALTER TABLE `oc_accounts_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity`
--

DROP TABLE IF EXISTS `oc_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity` (
  `activity_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `user` varchar(64) DEFAULT NULL,
  `affecteduser` varchar(64) NOT NULL,
  `app` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `subjectparams` longtext NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `messageparams` longtext DEFAULT NULL,
  `file` varchar(4000) DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`activity_id`),
  KEY `activity_user_time` (`affecteduser`,`timestamp`),
  KEY `activity_filter_by` (`affecteduser`,`user`,`timestamp`),
  KEY `activity_filter` (`affecteduser`,`type`,`app`,`timestamp`),
  KEY `activity_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity`
--

LOCK TABLES `oc_activity` WRITE;
/*!40000 ALTER TABLE `oc_activity` DISABLE KEYS */;
INSERT INTO `oc_activity` VALUES (1,1680772763,30,'file_created','admin','admin','files','created_self','[{\"7\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://localhost:8080/index.php/apps/files/?dir=/','files',7),(2,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"7\":\"\\/Nextcloud Manual.pdf\"}]','','[]','/Nextcloud Manual.pdf','http://localhost:8080/index.php/apps/files/?dir=/','files',7),(3,1680772764,30,'file_created','admin','admin','files','created_self','[{\"8\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://localhost:8080/index.php/apps/files/?dir=/','files',8),(4,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"8\":\"\\/Nextcloud intro.mp4\"}]','','[]','/Nextcloud intro.mp4','http://localhost:8080/index.php/apps/files/?dir=/','files',8),(5,1680772764,30,'file_created','admin','admin','files','created_self','[{\"9\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://localhost:8080/index.php/apps/files/?dir=/','files',9),(6,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"9\":\"\\/Readme.md\"}]','','[]','/Readme.md','http://localhost:8080/index.php/apps/files/?dir=/','files',9),(7,1680772764,30,'file_created','admin','admin','files','created_self','[{\"10\":\"\\/Photos\"}]','','[]','/Photos','http://localhost:8080/index.php/apps/files/?dir=/','files',10),(8,1680772764,30,'file_created','admin','admin','files','created_self','[{\"11\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',11),(9,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"11\":\"\\/Photos\\/Library.jpg\"}]','','[]','/Photos/Library.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',11),(10,1680772764,30,'file_created','admin','admin','files','created_self','[{\"12\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',12),(11,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"12\":\"\\/Photos\\/Toucan.jpg\"}]','','[]','/Photos/Toucan.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',12),(12,1680772764,30,'file_created','admin','admin','files','created_self','[{\"13\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',13),(13,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"13\":\"\\/Photos\\/Birdie.jpg\"}]','','[]','/Photos/Birdie.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',13),(14,1680772764,30,'file_created','admin','admin','files','created_self','[{\"14\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',14),(15,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"14\":\"\\/Photos\\/Frog.jpg\"}]','','[]','/Photos/Frog.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',14),(16,1680772764,30,'file_created','admin','admin','files','created_self','[{\"15\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',15),(17,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"15\":\"\\/Photos\\/Readme.md\"}]','','[]','/Photos/Readme.md','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',15),(18,1680772764,30,'file_created','admin','admin','files','created_self','[{\"16\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',16),(19,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"16\":\"\\/Photos\\/Gorilla.jpg\"}]','','[]','/Photos/Gorilla.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',16),(20,1680772764,30,'file_created','admin','admin','files','created_self','[{\"17\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',17),(21,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"17\":\"\\/Photos\\/Nextcloud community.jpg\"}]','','[]','/Photos/Nextcloud community.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',17),(22,1680772764,30,'file_created','admin','admin','files','created_self','[{\"18\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',18),(23,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"18\":\"\\/Photos\\/Steps.jpg\"}]','','[]','/Photos/Steps.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',18),(24,1680772764,30,'file_created','admin','admin','files','created_self','[{\"19\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',19),(25,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"19\":\"\\/Photos\\/Vineyard.jpg\"}]','','[]','/Photos/Vineyard.jpg','http://localhost:8080/index.php/apps/files/?dir=/Photos','files',19),(26,1680772764,30,'file_created','admin','admin','files','created_self','[{\"20\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://localhost:8080/index.php/apps/files/?dir=/','files',20),(27,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"20\":\"\\/Nextcloud.png\"}]','','[]','/Nextcloud.png','http://localhost:8080/index.php/apps/files/?dir=/','files',20),(28,1680772764,30,'file_created','admin','admin','files','created_self','[{\"21\":\"\\/Templates\"}]','','[]','/Templates','http://localhost:8080/index.php/apps/files/?dir=/','files',21),(29,1680772764,30,'file_created','admin','admin','files','created_self','[{\"22\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',22),(30,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"22\":\"\\/Templates\\/Meeting notes.md\"}]','','[]','/Templates/Meeting notes.md','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',22),(31,1680772764,30,'file_created','admin','admin','files','created_self','[{\"23\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',23),(32,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"23\":\"\\/Templates\\/Expense report.ods\"}]','','[]','/Templates/Expense report.ods','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',23),(33,1680772764,30,'file_created','admin','admin','files','created_self','[{\"24\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',24),(34,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"24\":\"\\/Templates\\/Diagram & table.ods\"}]','','[]','/Templates/Diagram & table.ods','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',24),(35,1680772764,30,'file_created','admin','admin','files','created_self','[{\"25\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',25),(36,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"25\":\"\\/Templates\\/Mindmap.odg\"}]','','[]','/Templates/Mindmap.odg','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',25),(37,1680772764,30,'file_created','admin','admin','files','created_self','[{\"26\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',26),(38,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"26\":\"\\/Templates\\/Readme.md\"}]','','[]','/Templates/Readme.md','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',26),(39,1680772764,30,'file_created','admin','admin','files','created_self','[{\"27\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',27),(40,1680772764,30,'file_changed','admin','admin','files','changed_self','[{\"27\":\"\\/Templates\\/Org chart.odg\"}]','','[]','/Templates/Org chart.odg','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',27),(41,1680772764,30,'file_created','admin','admin','files','created_self','[{\"28\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',28),(42,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"28\":\"\\/Templates\\/Invoice.odt\"}]','','[]','/Templates/Invoice.odt','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',28),(43,1680772765,30,'file_created','admin','admin','files','created_self','[{\"29\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',29),(44,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"29\":\"\\/Templates\\/Business model canvas.odg\"}]','','[]','/Templates/Business model canvas.odg','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',29),(45,1680772765,30,'file_created','admin','admin','files','created_self','[{\"30\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',30),(46,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"30\":\"\\/Templates\\/Simple.odp\"}]','','[]','/Templates/Simple.odp','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',30),(47,1680772765,30,'file_created','admin','admin','files','created_self','[{\"31\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',31),(48,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"31\":\"\\/Templates\\/Elegant.odp\"}]','','[]','/Templates/Elegant.odp','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',31),(49,1680772765,30,'file_created','admin','admin','files','created_self','[{\"32\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',32),(50,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"32\":\"\\/Templates\\/Letter.odt\"}]','','[]','/Templates/Letter.odt','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',32),(51,1680772765,30,'file_created','admin','admin','files','created_self','[{\"33\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',33),(52,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"33\":\"\\/Templates\\/Impact effort matrix.whiteboard\"}]','','[]','/Templates/Impact effort matrix.whiteboard','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',33),(53,1680772765,30,'file_created','admin','admin','files','created_self','[{\"34\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',34),(54,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"34\":\"\\/Templates\\/Product plan.md\"}]','','[]','/Templates/Product plan.md','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',34),(55,1680772765,30,'file_created','admin','admin','files','created_self','[{\"35\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',35),(56,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"35\":\"\\/Templates\\/Flowchart.odg\"}]','','[]','/Templates/Flowchart.odg','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',35),(57,1680772765,30,'file_created','admin','admin','files','created_self','[{\"36\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',36),(58,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"36\":\"\\/Templates\\/SWOT analysis.whiteboard\"}]','','[]','/Templates/SWOT analysis.whiteboard','http://localhost:8080/index.php/apps/files/?dir=/Templates','files',36),(59,1680772765,30,'file_created','admin','admin','files','created_self','[{\"37\":\"\\/Documents\"}]','','[]','/Documents','http://localhost:8080/index.php/apps/files/?dir=/','files',37),(60,1680772765,30,'file_created','admin','admin','files','created_self','[{\"38\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://localhost:8080/index.php/apps/files/?dir=/Documents','files',38),(61,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"38\":\"\\/Documents\\/Readme.md\"}]','','[]','/Documents/Readme.md','http://localhost:8080/index.php/apps/files/?dir=/Documents','files',38),(62,1680772765,30,'file_created','admin','admin','files','created_self','[{\"39\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://localhost:8080/index.php/apps/files/?dir=/Documents','files',39),(63,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"39\":\"\\/Documents\\/Nextcloud flyer.pdf\"}]','','[]','/Documents/Nextcloud flyer.pdf','http://localhost:8080/index.php/apps/files/?dir=/Documents','files',39),(64,1680772765,30,'file_created','admin','admin','files','created_self','[{\"40\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://localhost:8080/index.php/apps/files/?dir=/Documents','files',40),(65,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"40\":\"\\/Documents\\/Welcome to Nextcloud Hub.docx\"}]','','[]','/Documents/Welcome to Nextcloud Hub.docx','http://localhost:8080/index.php/apps/files/?dir=/Documents','files',40),(66,1680772765,30,'file_created','admin','admin','files','created_self','[{\"41\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://localhost:8080/index.php/apps/files/?dir=/Documents','files',41),(67,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"41\":\"\\/Documents\\/Example.md\"}]','','[]','/Documents/Example.md','http://localhost:8080/index.php/apps/files/?dir=/Documents','files',41),(68,1680772765,30,'file_created','admin','admin','files','created_self','[{\"42\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://localhost:8080/index.php/apps/files/?dir=/','files',42),(69,1680772765,30,'file_changed','admin','admin','files','changed_self','[{\"42\":\"\\/Reasons to use Nextcloud.pdf\"}]','','[]','/Reasons to use Nextcloud.pdf','http://localhost:8080/index.php/apps/files/?dir=/','files',42),(70,1680772765,30,'calendar','admin','admin','dav','calendar_add_self','{\"actor\":\"admin\",\"calendar\":{\"id\":1,\"uri\":\"personal\",\"name\":\"Personal\"}}','','[]','','','calendar',1),(71,1680772765,30,'contacts','admin','admin','dav','addressbook_add_self','{\"actor\":\"admin\",\"addressbook\":{\"id\":1,\"uri\":\"contacts\",\"name\":\"Contacts\"}}','','[]','','','addressbook',1),(72,1680772848,30,'file_created','admin','admin','files','created_self','[{\"55\":\"\\/Talk\"}]','','[]','/Talk','http://localhost:8080/apps/files/?dir=/','files',55);
/*!40000 ALTER TABLE `oc_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_activity_mq`
--

DROP TABLE IF EXISTS `oc_activity_mq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_activity_mq` (
  `mail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `amq_timestamp` int(11) NOT NULL DEFAULT 0,
  `amq_latest_send` int(11) NOT NULL DEFAULT 0,
  `amq_type` varchar(255) NOT NULL,
  `amq_affecteduser` varchar(64) NOT NULL,
  `amq_appid` varchar(32) NOT NULL,
  `amq_subject` varchar(255) NOT NULL,
  `amq_subjectparams` longtext DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mail_id`),
  KEY `amp_user` (`amq_affecteduser`),
  KEY `amp_latest_send_time` (`amq_latest_send`),
  KEY `amp_timestamp_time` (`amq_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_activity_mq`
--

LOCK TABLES `oc_activity_mq` WRITE;
/*!40000 ALTER TABLE `oc_activity_mq` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_activity_mq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbookchanges`
--

DROP TABLE IF EXISTS `oc_addressbookchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbookchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `addressbookid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addressbookid_synctoken` (`addressbookid`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbookchanges`
--

LOCK TABLES `oc_addressbookchanges` WRITE;
/*!40000 ALTER TABLE `oc_addressbookchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_addressbookchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_addressbooks`
--

DROP TABLE IF EXISTS `oc_addressbooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_addressbooks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addressbook_index` (`principaluri`,`uri`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_addressbooks`
--

LOCK TABLES `oc_addressbooks` WRITE;
/*!40000 ALTER TABLE `oc_addressbooks` DISABLE KEYS */;
INSERT INTO `oc_addressbooks` VALUES (1,'principals/users/admin','Contacts','contacts',NULL,1);
/*!40000 ALTER TABLE `oc_addressbooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_appconfig`
--

DROP TABLE IF EXISTS `oc_appconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_appconfig` (
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`appid`,`configkey`),
  KEY `appconfig_config_key_index` (`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_appconfig`
--

LOCK TABLES `oc_appconfig` WRITE;
/*!40000 ALTER TABLE `oc_appconfig` DISABLE KEYS */;
INSERT INTO `oc_appconfig` VALUES ('activity','enabled','yes'),('activity','installed_version','2.18.0'),('activity','types','filesystem'),('backgroundjob','lastjob','2'),('calendar','enabled','yes'),('calendar','installed_version','4.3.1'),('calendar','types',''),('circles','enabled','yes'),('circles','installed_version','26.0.0'),('circles','loopback_tmp_scheme','http'),('circles','types','filesystem,dav'),('cloud_federation_api','enabled','yes'),('cloud_federation_api','installed_version','1.9.0'),('cloud_federation_api','types','filesystem'),('comments','enabled','yes'),('comments','installed_version','1.16.0'),('comments','types','logging'),('contacts','enabled','yes'),('contacts','installed_version','5.2.0'),('contacts','types','dav'),('contactsinteraction','enabled','yes'),('contactsinteraction','installed_version','1.7.0'),('contactsinteraction','types','dav'),('core','installedat','1680772750.8881'),('core','lastcron','1680772855'),('core','lastupdatedat','1680772750.8916'),('core','oc.integritycheck.checker','[]'),('core','public_files','files_sharing/public.php'),('core','public_webdav','dav/appinfo/v1/publicwebdav.php'),('core','vendor','nextcloud'),('dashboard','enabled','yes'),('dashboard','installed_version','7.6.0'),('dashboard','types',''),('dav','enabled','yes'),('dav','installed_version','1.25.0'),('dav','types','filesystem'),('federatedfilesharing','enabled','yes'),('federatedfilesharing','installed_version','1.16.0'),('federatedfilesharing','types',''),('federation','enabled','yes'),('federation','installed_version','1.16.0'),('federation','types','authentication'),('files','enabled','yes'),('files','installed_version','1.21.1'),('files','types','filesystem'),('files_pdfviewer','enabled','yes'),('files_pdfviewer','installed_version','2.7.0'),('files_pdfviewer','types',''),('files_rightclick','enabled','yes'),('files_rightclick','installed_version','1.5.0'),('files_rightclick','types',''),('files_sharing','enabled','yes'),('files_sharing','installed_version','1.18.0'),('files_sharing','types','filesystem'),('files_trashbin','enabled','yes'),('files_trashbin','installed_version','1.16.0'),('files_trashbin','types','filesystem,dav'),('files_versions','enabled','yes'),('files_versions','installed_version','1.19.1'),('files_versions','types','filesystem,dav'),('firstrunwizard','enabled','yes'),('firstrunwizard','installed_version','2.15.0'),('firstrunwizard','types','logging'),('logreader','enabled','yes'),('logreader','installed_version','2.11.0'),('logreader','types',''),('lookup_server_connector','enabled','yes'),('lookup_server_connector','installed_version','1.14.0'),('lookup_server_connector','types','authentication'),('mail','enabled','yes'),('mail','installed_version','3.1.0'),('mail','types',''),('nextcloud_announcements','enabled','yes'),('nextcloud_announcements','installed_version','1.15.0'),('nextcloud_announcements','pub_date','Thu, 24 Oct 2019 00:00:00 +0200'),('nextcloud_announcements','types','logging'),('notes','enabled','yes'),('notes','installed_version','4.7.2'),('notes','types',''),('notifications','enabled','yes'),('notifications','installed_version','2.14.0'),('notifications','types','logging'),('oauth2','enabled','yes'),('oauth2','installed_version','1.14.0'),('oauth2','types','authentication'),('password_policy','enabled','yes'),('password_policy','installed_version','1.16.0'),('password_policy','types','authentication'),('photos','enabled','yes'),('photos','installed_version','2.2.0'),('photos','types','dav,authentication'),('privacy','enabled','yes'),('privacy','installed_version','1.10.0'),('privacy','types',''),('provisioning_api','enabled','yes'),('provisioning_api','installed_version','1.16.0'),('provisioning_api','types','prevent_group_restriction'),('recommendations','enabled','yes'),('recommendations','installed_version','1.5.0'),('recommendations','types',''),('related_resources','enabled','yes'),('related_resources','installed_version','1.1.0-alpha1'),('related_resources','types',''),('richdocuments','enabled','yes'),('richdocuments','installed_version','8.0.0'),('richdocuments','types','prevent_group_restriction'),('serverinfo','enabled','yes'),('serverinfo','installed_version','1.16.0'),('serverinfo','types',''),('settings','enabled','yes'),('settings','installed_version','1.8.0'),('settings','types',''),('sharebymail','enabled','yes'),('sharebymail','installed_version','1.16.0'),('sharebymail','types','filesystem'),('spreed','enabled','yes'),('spreed','installed_version','16.0.2'),('spreed','signaling_token_privkey_es256','-----BEGIN PRIVATE KEY-----\nMIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQgNQqnA2q1oAiRC7gu\nRcJajeWmC/yvIHYzncQqFBCJVVehRANCAARQQfD/y7SjKBlIJLE+oSoFlTgldBDc\neNPVEbeJCdi7JhhSkAqDaeMYG10uT6Vbcl6weuQsqjutkbRX1+4ipzEp\n-----END PRIVATE KEY-----\n'),('spreed','signaling_token_pubkey_es256','-----BEGIN PUBLIC KEY-----\nMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEUEHw/8u0oygZSCSxPqEqBZU4JXQQ\n3HjT1RG3iQnYuyYYUpAKg2njGBtdLk+lW3JesHrkLKo7rZG0V9fuIqcxKQ==\n-----END PUBLIC KEY-----\n'),('spreed','types','dav,prevent_group_restriction'),('support','enabled','yes'),('support','installed_version','1.9.0'),('support','types','session'),('survey_client','enabled','yes'),('survey_client','installed_version','1.14.0'),('survey_client','types',''),('systemtags','enabled','yes'),('systemtags','installed_version','1.16.0'),('systemtags','types','logging'),('text','enabled','yes'),('text','installed_version','3.7.2'),('text','types','dav'),('theming','enabled','yes'),('theming','installed_version','2.1.1'),('theming','types','logging'),('twofactor_backupcodes','enabled','yes'),('twofactor_backupcodes','installed_version','1.15.0'),('twofactor_backupcodes','types',''),('updatenotification','enabled','yes'),('updatenotification','installed_version','1.16.0'),('updatenotification','types',''),('user_status','enabled','yes'),('user_status','installed_version','1.6.0'),('user_status','types',''),('viewer','enabled','yes'),('viewer','installed_version','1.10.0'),('viewer','types',''),('weather_status','enabled','yes'),('weather_status','installed_version','1.6.0'),('weather_status','types',''),('workflowengine','enabled','yes'),('workflowengine','installed_version','2.8.0'),('workflowengine','types','filesystem');
/*!40000 ALTER TABLE `oc_appconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authorized_groups`
--

DROP TABLE IF EXISTS `oc_authorized_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authorized_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` varchar(200) NOT NULL,
  `class` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `admindel_groupid_idx` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authorized_groups`
--

LOCK TABLES `oc_authorized_groups` WRITE;
/*!40000 ALTER TABLE `oc_authorized_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_authorized_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_authtoken`
--

DROP TABLE IF EXISTS `oc_authtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_authtoken` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `login_name` varchar(255) NOT NULL DEFAULT '',
  `password` longtext DEFAULT NULL,
  `name` longtext NOT NULL,
  `token` varchar(200) NOT NULL DEFAULT '',
  `type` smallint(5) unsigned DEFAULT 0,
  `remember` smallint(5) unsigned DEFAULT 0,
  `last_activity` int(10) unsigned DEFAULT 0,
  `last_check` int(10) unsigned DEFAULT 0,
  `scope` longtext DEFAULT NULL,
  `expires` int(10) unsigned DEFAULT NULL,
  `private_key` longtext DEFAULT NULL,
  `public_key` longtext DEFAULT NULL,
  `version` smallint(5) unsigned NOT NULL DEFAULT 1,
  `password_invalid` tinyint(1) DEFAULT 0,
  `password_hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authtoken_token_index` (`token`),
  KEY `authtoken_last_activity_idx` (`last_activity`),
  KEY `authtoken_uid_index` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_authtoken`
--

LOCK TABLES `oc_authtoken` WRITE;
/*!40000 ALTER TABLE `oc_authtoken` DISABLE KEYS */;
INSERT INTO `oc_authtoken` VALUES (1,'admin','admin','euJb2bh/SystdqlFyhuE8DyOlX5NIlBlp4ZEOSddlgeh8kPQf6BN28dsgVC11E92GPHFf5212QF6Qz9+EZCe9f+PhnCD4ez29dbR6ZgARa1l8jdsK3Qi0YDMyUJew5RDQEupS6Y3US1+Uz8MTTfZSqZPBmcWTbzcIC8H6H9SdgWuZ3w1Wiml8l4BhG1k+O3KfUrBn3/g8/qwkIxNKXtLc9WfmXKDtF0vHzufI3dlWpfhYIUksEFFlUPk3t/7Oljx6GpZ4Gd+Q/upt4ISK4eirMarVyy66SXxGWZmb9nO2doLyS5YENegP+OJfpP+P49PkT+QH8BS/HofEd1dq+QN2g==','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36','9989585d03bb185d27615307744c40dcb5512acad6680734292201c40d7f38218c3d0803c575639f7fedb1bf607487d1a35bc3e798e6cb395d3b6ef1dfe3c389',0,0,1680772914,1680772766,NULL,NULL,'f2371584073fc36f4faa8fe94e32f9e3e62866302c313563e5949b2e4062fda9c24c6d92606e9c691171e790fd423297f21beaec29dc4747ebf9747cee30e29876c5692cc98797f5881f670caa5baeb8a13aa428c3ab8bd56425ba12227e4f8302a041c1f81a92676f74161743179d8145a4a62119fde1298a71caab4d0644ce5d432a0e830e229dc8e1c99ee23bf250e6a96b6ef89e3a524ffd3fb0c5cb55708989fb020a3eb6ceb22d8dbf7278e63c463813c65f4b12c28dceda59db55f7d6abb81c3ff95e6cbd20a7e45d259a4002f16f2069fdb54ab70dffa44491a89d95e1e8497914d43755aeb201d4100e4c100076152c3631fb3f222bd7416323dd91fb1878803d629c0f6c67dc11742de2d7a0462ba5c7e57269fcba8d06c8b26346428ac274d9879ba91436ceb55a691d503bae35355c5f920390f8b726327dcf137e152b147c8c2089b3ce67722d1b76b93faf38f02e0d4098140a33e54a85c9ae2dbebe604dea7a8d7cb0aebea5be33a8b136a2fc83e76163b07e8dade94579d24442811dd216f756c333454cf1647853b7afce34ad25c757cfcf35e6424b3c7c0ab956b22d3804229eafc6d9a0507adb7f6b9ccf0c7cbf640d8cb132195421289d83bddc1853ed92cb78942ae5f40285478c368f0c4c76cf857f22ec216bd9ed97aae6ab229625ad967c44361d8aeb878dce1674687706816d87edfaae0de26c5455c5be9e2660b257fe5b9e060ee56010130e1f5894819a18e8a40f2d48745a83d3801d9905100d4dd3bf0af5e8ad6863aeae748888e4e9ef0d3eb208b8d716185515a60bb0e9819f7d04e47b8b0f438111f6b055afaaffe9d7f8fb0cd77ba625a92599abb2263d11868f2270445a89dcea9a1d054f9b18e356f36aee0671e9a98a6ffac3221fd69de99de945f4d0c6685f065eda8063bb7a11b5c9ce44d7b079179e9f561e11e214cdcd827540ab2359a85daf64ef3dbf28c215f42689d24001935929c11c9e2932cd4548068a66e855df0564774986d2bd6e67a0541b6c6b366bccd348381666e45bb6be486dcd4ee45e240d810203aafa20b4bc545e53238aa587a659817dcff0d127b9f997844ec22b62188c1d01977094c829b7350c24d01db286eb11386e79fc94622b444b24dc3eb9a6494cbfea5a19396372b2961c51a5a2616b66c9751e723114fb9b5f4f3473b3369c18b314e2aaaa27f9791123ec0495c4773ca9191b6a6a790b709e39d87cc506855a4c61f399471cc13eb43581c72842ddebb11a0c8813b28ec7634b4974c3ded2b7741d3637094c29a466955c2f3bff470c6644c242897592d4b66fa5e55761b4729acdeaeabee399e870e3c70a05cf91a0eb74fd774351e971c554a92333509198b5857373300fb236c373b2b9332c2f2fbdc582679fbd5c77201b9abee306cf1ac4ba944d2ea2d8b21ec2ec5c53054adda910ee912557663ef43a53fe070f0af17661753f7d4b6b3bf6206e291bfb632c557d431f0f5949cdde5aad119a1b17738ec8ea63e3c8db7275146b565fd82b75368be3b9de5d4d6d76564d78b131d4b75d37a65036712e26061378ab336a38670e558635545f495528462d4f29bb097bc446093bba99685699211fcf1e461272c5ce6feaa506f0ef67b8494967697e955139a7ea8c8bb3fff3e7d8f1ab3f37117bed7eaabe9ee92d12f0781c25c7cf0a50ab3ec1c02a4ff74ae0875c1f8b7e247326d3e6cfe35783f59db586fa01045011e63236276f298642187ddd28075d8e681fd00be6538fc483b631de61e9fb37a2c9d5c91a99c9a3598d80b776c5daec55e3506a2996d107298ed6354ff58092c277fbce28320bb6e2ac3808bdc0de2af2336e7931fe7b6f3a86aef70b3bf52de0ee69b3e51f237657536f87b28879e39e14ce5e23d4bcc3da32cc74fd0b609a268897846dacdb391a7904e94b3ec1a1c78d933c8e68bd97088134a1ad57115a8b16ad894afb587cec538197f4f2270a5eb960f251a7531b1c2c4dfc6e5f1f799ab351b0504011aec3b9205eb917daabf3290a62708258b3fd1483b10783a8518c5468f0d67d433f7f5870f58bcdfdbd866fbda411380449f8381688a2140ce54f68f74c7df7666f404ba4498aef85992f48454fc6e995734b73a10d68002960a03841d567cd69edb4a2e96cfbdf5eeb209c3e352f9c023d8aa718e5f19ce72e5aa31a6726488de7369b0b1592e80ac7fd19920b8ac64909e6c9282c57c7df05f5965622d59e0195da2ad5db9195e1d0e18dfdc1cd363c40f0cf221927326cebe90ec4218c096b03847698e54e1652a534d1904bb8cf1c9952387849533a7a8153c73a2655765c0b8e62ffc9898942ee9a53f4d8e79e079590d99804fd1b4331710d1f316d424e82093701a691a7d7926cafcb31cfb6f6c65c7e|fa4efaeb6612843c421d8831e1f558bf|180222817f674563579bf0fb007bd62468e9f6aedcdea22972ad51f7290ee8e9e3172693e862c46acbb6b4234e7976a22974cbd3bf9a120f88b860e1489432e7|3','-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0O32ZmZs9O/y0ExqQ/Bo\nI5yTI7lYeRlA+ZuyqNuUy+u9ScmfGfryoweacrOMa81pnWxfoWED8tffnRILZBDt\nQcTODR4Bjvd9zMmceCEc7yq3b8TMauAFJwyWIy64lWJqjUrzffoCnBd162hwuMLi\nUQNMLK5K9lkmRrOVEwhCB8g2GdikKDBY5EHMvTBz5685JL8QZGI4FCAqYxO5ObLt\n/N6s55SAHazHn+2cF9+h76OBhnMqd09KPSURBSiQjH5dpOp3u1NAPHH8W5NpDgD6\nnrx4swAR/tqnUzlVBxiTVaf7ZuJG9HgCjSJfEcnoVwIP5dvt7Fnd2cHA9IGfa3xv\nMQIDAQAB\n-----END PUBLIC KEY-----\n',2,0,'3|$argon2id$v=19$m=65536,t=4,p=1$OUJSd3NtM2cudDRuV0pHOA$RUwBbk82V+FY5LbZzlokE4ovj8uFcNIuTbYZEj5c4pI');
/*!40000 ALTER TABLE `oc_authtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_bruteforce_attempts`
--

DROP TABLE IF EXISTS `oc_bruteforce_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_bruteforce_attempts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL DEFAULT '',
  `occurred` int(10) unsigned NOT NULL DEFAULT 0,
  `ip` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `metadata` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `bruteforce_attempts_ip` (`ip`),
  KEY `bruteforce_attempts_subnet` (`subnet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_bruteforce_attempts`
--

LOCK TABLES `oc_bruteforce_attempts` WRITE;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_bruteforce_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_appt_bookings`
--

DROP TABLE IF EXISTS `oc_calendar_appt_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_appt_bookings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `appt_config_id` bigint(20) unsigned NOT NULL,
  `created_at` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `display_name` varchar(128) NOT NULL,
  `description` longtext DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `start` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  `timezone` varchar(32) NOT NULL,
  `confirmed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cal_appt_bk_token_uniq_idx` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_appt_bookings`
--

LOCK TABLES `oc_calendar_appt_bookings` WRITE;
/*!40000 ALTER TABLE `oc_calendar_appt_bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_appt_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_appt_configs`
--

DROP TABLE IF EXISTS `oc_calendar_appt_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_appt_configs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` longtext DEFAULT NULL,
  `location` longtext DEFAULT NULL,
  `visibility` varchar(10) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `target_calendar_uri` varchar(255) NOT NULL,
  `calendar_freebusy_uris` longtext DEFAULT NULL,
  `availability` longtext DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `end` int(11) DEFAULT NULL,
  `length` int(11) NOT NULL,
  `increment` int(11) NOT NULL,
  `preparation_duration` int(11) NOT NULL DEFAULT 0,
  `followup_duration` int(11) NOT NULL DEFAULT 0,
  `time_before_next_slot` int(11) DEFAULT NULL,
  `daily_max` int(11) DEFAULT NULL,
  `future_limit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cal_appt_token_uniq_idx` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_appt_configs`
--

LOCK TABLES `oc_calendar_appt_configs` WRITE;
/*!40000 ALTER TABLE `oc_calendar_appt_configs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_appt_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_invitations`
--

DROP TABLE IF EXISTS `oc_calendar_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) NOT NULL,
  `recurrenceid` varchar(255) DEFAULT NULL,
  `attendee` varchar(255) NOT NULL,
  `organizer` varchar(255) NOT NULL,
  `sequence` bigint(20) unsigned DEFAULT NULL,
  `token` varchar(60) NOT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_invitation_tokens` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_invitations`
--

LOCK TABLES `oc_calendar_invitations` WRITE;
/*!40000 ALTER TABLE `oc_calendar_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_reminders`
--

DROP TABLE IF EXISTS `oc_calendar_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_reminders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendar_id` bigint(20) NOT NULL,
  `object_id` bigint(20) NOT NULL,
  `is_recurring` smallint(6) DEFAULT NULL,
  `uid` varchar(255) NOT NULL,
  `recurrence_id` bigint(20) unsigned DEFAULT NULL,
  `is_recurrence_exception` smallint(6) NOT NULL,
  `event_hash` varchar(255) NOT NULL,
  `alarm_hash` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `is_relative` smallint(6) NOT NULL,
  `notification_date` bigint(20) unsigned NOT NULL,
  `is_repeat_based` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_reminder_objid` (`object_id`),
  KEY `calendar_reminder_uidrec` (`uid`,`recurrence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_reminders`
--

LOCK TABLES `oc_calendar_reminders` WRITE;
/*!40000 ALTER TABLE `oc_calendar_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources`
--

DROP TABLE IF EXISTS `oc_calendar_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_resources_email` (`email`),
  KEY `calendar_resources_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources`
--

LOCK TABLES `oc_calendar_resources` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_resources_md`
--

DROP TABLE IF EXISTS `oc_calendar_resources_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_resources_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_resources_md_idk` (`resource_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_resources_md`
--

LOCK TABLES `oc_calendar_resources_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_resources_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_resources_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms`
--

DROP TABLE IF EXISTS `oc_calendar_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `backend_id` varchar(64) DEFAULT NULL,
  `resource_id` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `group_restrictions` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_bkdrsc` (`backend_id`,`resource_id`),
  KEY `calendar_rooms_email` (`email`),
  KEY `calendar_rooms_name` (`displayname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms`
--

LOCK TABLES `oc_calendar_rooms` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendar_rooms_md`
--

DROP TABLE IF EXISTS `oc_calendar_rooms_md`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendar_rooms_md` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calendar_rooms_md_idk` (`room_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendar_rooms_md`
--

LOCK TABLES `oc_calendar_rooms_md` WRITE;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendar_rooms_md` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarchanges`
--

DROP TABLE IF EXISTS `oc_calendarchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarchanges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `calendarid` bigint(20) NOT NULL,
  `operation` smallint(6) NOT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calid_type_synctoken` (`calendarid`,`calendartype`,`synctoken`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarchanges`
--

LOCK TABLES `oc_calendarchanges` WRITE;
/*!40000 ALTER TABLE `oc_calendarchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects`
--

DROP TABLE IF EXISTS `oc_calendarobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `calendarid` bigint(20) unsigned NOT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `componenttype` varchar(8) DEFAULT NULL,
  `firstoccurence` bigint(20) unsigned DEFAULT NULL,
  `lastoccurence` bigint(20) unsigned DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `classification` int(11) DEFAULT 0,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calobjects_index` (`calendarid`,`calendartype`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects`
--

LOCK TABLES `oc_calendarobjects` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarobjects_props`
--

DROP TABLE IF EXISTS `oc_calendarobjects_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarobjects_props` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `calendarid` bigint(20) NOT NULL DEFAULT 0,
  `objectid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `parameter` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `calendartype` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `calendarobject_index` (`objectid`,`calendartype`),
  KEY `calendarobject_name_index` (`name`,`calendartype`),
  KEY `calendarobject_value_index` (`value`,`calendartype`),
  KEY `calendarobject_calid_index` (`calendarid`,`calendartype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarobjects_props`
--

LOCK TABLES `oc_calendarobjects_props` WRITE;
/*!40000 ALTER TABLE `oc_calendarobjects_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarobjects_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendars`
--

DROP TABLE IF EXISTS `oc_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendars` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `description` varchar(255) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `timezone` longtext DEFAULT NULL,
  `components` varchar(64) DEFAULT NULL,
  `transparent` smallint(6) NOT NULL DEFAULT 0,
  `deleted_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calendars_index` (`principaluri`,`uri`),
  KEY `cals_princ_del_idx` (`principaluri`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendars`
--

LOCK TABLES `oc_calendars` WRITE;
/*!40000 ALTER TABLE `oc_calendars` DISABLE KEYS */;
INSERT INTO `oc_calendars` VALUES (1,'principals/users/admin','Personal','personal',1,NULL,0,'#0082c9',NULL,'VEVENT',0,NULL);
/*!40000 ALTER TABLE `oc_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_calendarsubscriptions`
--

DROP TABLE IF EXISTS `oc_calendarsubscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_calendarsubscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) DEFAULT NULL,
  `principaluri` varchar(255) DEFAULT NULL,
  `displayname` varchar(100) DEFAULT NULL,
  `refreshrate` varchar(10) DEFAULT NULL,
  `calendarorder` int(10) unsigned NOT NULL DEFAULT 0,
  `calendarcolor` varchar(255) DEFAULT NULL,
  `striptodos` smallint(6) DEFAULT NULL,
  `stripalarms` smallint(6) DEFAULT NULL,
  `stripattachments` smallint(6) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `synctoken` int(10) unsigned NOT NULL DEFAULT 1,
  `source` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calsub_index` (`principaluri`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_calendarsubscriptions`
--

LOCK TABLES `oc_calendarsubscriptions` WRITE;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_calendarsubscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards`
--

DROP TABLE IF EXISTS `oc_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `carddata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` bigint(20) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cards_abid` (`addressbookid`),
  KEY `cards_abiduri` (`addressbookid`,`uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards`
--

LOCK TABLES `oc_cards` WRITE;
/*!40000 ALTER TABLE `oc_cards` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cards_properties`
--

DROP TABLE IF EXISTS `oc_cards_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cards_properties` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `addressbookid` bigint(20) NOT NULL DEFAULT 0,
  `cardid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `name` varchar(64) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `preferred` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `card_contactid_index` (`cardid`),
  KEY `card_name_index` (`name`),
  KEY `card_value_index` (`value`),
  KEY `cards_prop_abid` (`addressbookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cards_properties`
--

LOCK TABLES `oc_cards_properties` WRITE;
/*!40000 ALTER TABLE `oc_cards_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cards_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_circle`
--

DROP TABLE IF EXISTS `oc_circles_circle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_circle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_id` varchar(31) NOT NULL,
  `name` varchar(127) NOT NULL,
  `display_name` varchar(255) DEFAULT '',
  `sanitized_name` varchar(127) DEFAULT '',
  `instance` varchar(255) DEFAULT '',
  `config` int(10) unsigned DEFAULT NULL,
  `source` int(10) unsigned DEFAULT NULL,
  `settings` longtext DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  `contact_addressbook` int(10) unsigned DEFAULT NULL,
  `contact_groupname` varchar(127) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8195F548E3C68343` (`unique_id`),
  KEY `IDX_8195F548D48A2F7C` (`config`),
  KEY `IDX_8195F5484230B1DE` (`instance`),
  KEY `IDX_8195F5485F8A7F73` (`source`),
  KEY `IDX_8195F548C317B362` (`sanitized_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_circle`
--

LOCK TABLES `oc_circles_circle` WRITE;
/*!40000 ALTER TABLE `oc_circles_circle` DISABLE KEYS */;
INSERT INTO `oc_circles_circle` VALUES (1,'GrMlp65Wl4gl9SCY7p94NjMve9Q7dTZ','user:admin:GrMlp65Wl4gl9SCY7p94NjMve9Q7dTZ','admin','','',1,1,'[]','','2023-04-06 09:19:23',0,''),(2,'qTqQ3pd2TpwNAimtqIaEeehTQhY4sXZ','app:circles:qTqQ3pd2TpwNAimtqIaEeehTQhY4sXZ','Circles','','',8193,10001,'[]','','2023-04-06 09:19:23',0,'');
/*!40000 ALTER TABLE `oc_circles_circle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_event`
--

DROP TABLE IF EXISTS `oc_circles_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_event` (
  `token` varchar(63) NOT NULL,
  `instance` varchar(255) NOT NULL,
  `event` longtext DEFAULT NULL,
  `result` longtext DEFAULT NULL,
  `interface` int(11) NOT NULL DEFAULT 0,
  `severity` int(11) DEFAULT NULL,
  `retry` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `creation` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`token`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_event`
--

LOCK TABLES `oc_circles_event` WRITE;
/*!40000 ALTER TABLE `oc_circles_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_member`
--

DROP TABLE IF EXISTS `oc_circles_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `single_id` varchar(31) DEFAULT NULL,
  `circle_id` varchar(31) NOT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `user_id` varchar(127) NOT NULL,
  `user_type` smallint(6) NOT NULL DEFAULT 1,
  `instance` varchar(255) DEFAULT '',
  `invited_by` varchar(31) DEFAULT NULL,
  `level` smallint(6) NOT NULL,
  `status` varchar(15) DEFAULT NULL,
  `note` longtext DEFAULT NULL,
  `cached_name` varchar(255) DEFAULT '',
  `cached_update` datetime DEFAULT NULL,
  `contact_id` varchar(127) DEFAULT NULL,
  `contact_meta` longtext DEFAULT NULL,
  `joined` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_member_cisiuiutil` (`circle_id`,`single_id`,`user_id`,`user_type`,`instance`,`level`),
  KEY `circles_member_cisi` (`circle_id`,`single_id`),
  KEY `IDX_25C66A49E7A1254A` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_member`
--

LOCK TABLES `oc_circles_member` WRITE;
/*!40000 ALTER TABLE `oc_circles_member` DISABLE KEYS */;
INSERT INTO `oc_circles_member` VALUES (1,'qTqQ3pd2TpwNAimtqIaEeehTQhY4sXZ','qTqQ3pd2TpwNAimtqIaEeehTQhY4sXZ','qTqQ3pd2TpwNAimtqIaEeehTQhY4sXZ','circles',10000,'',NULL,9,'Member','[]','Circles','2023-04-06 09:19:23','',NULL,'2023-04-06 09:19:23'),(2,'GrMlp65Wl4gl9SCY7p94NjMve9Q7dTZ','GrMlp65Wl4gl9SCY7p94NjMve9Q7dTZ','GrMlp65Wl4gl9SCY7p94NjMve9Q7dTZ','admin',1,'','qTqQ3pd2TpwNAimtqIaEeehTQhY4sXZ',9,'Member','[]','admin','2023-04-06 09:19:23','',NULL,'2023-04-06 09:19:23');
/*!40000 ALTER TABLE `oc_circles_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_membership`
--

DROP TABLE IF EXISTS `oc_circles_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_membership` (
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `inheritance_first` varchar(31) NOT NULL,
  `inheritance_last` varchar(31) NOT NULL,
  `inheritance_depth` int(10) unsigned NOT NULL,
  `inheritance_path` longtext NOT NULL,
  PRIMARY KEY (`single_id`,`circle_id`),
  KEY `IDX_8FC816EAE7C1D92B` (`single_id`),
  KEY `circles_membership_ifilci` (`inheritance_first`,`inheritance_last`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_membership`
--

LOCK TABLES `oc_circles_membership` WRITE;
/*!40000 ALTER TABLE `oc_circles_membership` DISABLE KEYS */;
INSERT INTO `oc_circles_membership` VALUES ('GrMlp65Wl4gl9SCY7p94NjMve9Q7dTZ','GrMlp65Wl4gl9SCY7p94NjMve9Q7dTZ',9,'GrMlp65Wl4gl9SCY7p94NjMve9Q7dTZ','GrMlp65Wl4gl9SCY7p94NjMve9Q7dTZ',1,'[\"GrMlp65Wl4gl9SCY7p94NjMve9Q7dTZ\"]'),('qTqQ3pd2TpwNAimtqIaEeehTQhY4sXZ','qTqQ3pd2TpwNAimtqIaEeehTQhY4sXZ',9,'qTqQ3pd2TpwNAimtqIaEeehTQhY4sXZ','qTqQ3pd2TpwNAimtqIaEeehTQhY4sXZ',1,'[\"qTqQ3pd2TpwNAimtqIaEeehTQhY4sXZ\"]');
/*!40000 ALTER TABLE `oc_circles_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mount`
--

DROP TABLE IF EXISTS `oc_circles_mount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mount` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `token` varchar(63) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mount_cimipt` (`circle_id`,`mount_id`,`parent`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mount`
--

LOCK TABLES `oc_circles_mount` WRITE;
/*!40000 ALTER TABLE `oc_circles_mount` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_mountpoint`
--

DROP TABLE IF EXISTS `oc_circles_mountpoint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_mountpoint` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mount_id` varchar(31) NOT NULL,
  `single_id` varchar(31) NOT NULL,
  `mountpoint` longtext DEFAULT NULL,
  `mountpoint_hash` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `circles_mountpoint_ms` (`mount_id`,`single_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_mountpoint`
--

LOCK TABLES `oc_circles_mountpoint` WRITE;
/*!40000 ALTER TABLE `oc_circles_mountpoint` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_mountpoint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_remote`
--

DROP TABLE IF EXISTS `oc_circles_remote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_remote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT 'Unknown',
  `interface` int(11) NOT NULL DEFAULT 0,
  `uid` varchar(20) DEFAULT NULL,
  `instance` varchar(127) DEFAULT NULL,
  `href` varchar(254) DEFAULT NULL,
  `item` longtext DEFAULT NULL,
  `creation` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_F94EF834230B1DE` (`instance`),
  KEY `IDX_F94EF83539B0606` (`uid`),
  KEY `IDX_F94EF8334F8E741` (`href`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_remote`
--

LOCK TABLES `oc_circles_remote` WRITE;
/*!40000 ALTER TABLE `oc_circles_remote` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_remote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_share_lock`
--

DROP TABLE IF EXISTS `oc_circles_share_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_share_lock` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` varchar(31) NOT NULL,
  `circle_id` varchar(31) NOT NULL,
  `instance` varchar(127) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_337F52F8126F525E70EE2FF6` (`item_id`,`circle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_share_lock`
--

LOCK TABLES `oc_circles_share_lock` WRITE;
/*!40000 ALTER TABLE `oc_circles_share_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_share_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_circles_token`
--

DROP TABLE IF EXISTS `oc_circles_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_circles_token` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `share_id` int(11) DEFAULT NULL,
  `circle_id` varchar(31) DEFAULT NULL,
  `single_id` varchar(31) DEFAULT NULL,
  `member_id` varchar(31) DEFAULT NULL,
  `token` varchar(31) DEFAULT NULL,
  `password` varchar(127) DEFAULT NULL,
  `accepted` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sicisimit` (`share_id`,`circle_id`,`single_id`,`member_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_circles_token`
--

LOCK TABLES `oc_circles_token` WRITE;
/*!40000 ALTER TABLE `oc_circles_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_circles_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_accesscache`
--

DROP TABLE IF EXISTS `oc_collres_accesscache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_accesscache` (
  `user_id` varchar(64) NOT NULL,
  `collection_id` bigint(20) NOT NULL DEFAULT 0,
  `resource_type` varchar(64) NOT NULL DEFAULT '',
  `resource_id` varchar(64) NOT NULL DEFAULT '',
  `access` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`user_id`,`collection_id`,`resource_type`,`resource_id`),
  KEY `collres_user_res` (`user_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_accesscache`
--

LOCK TABLES `oc_collres_accesscache` WRITE;
/*!40000 ALTER TABLE `oc_collres_accesscache` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_accesscache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_collections`
--

DROP TABLE IF EXISTS `oc_collres_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_collections` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_collections`
--

LOCK TABLES `oc_collres_collections` WRITE;
/*!40000 ALTER TABLE `oc_collres_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_collres_resources`
--

DROP TABLE IF EXISTS `oc_collres_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_collres_resources` (
  `collection_id` bigint(20) NOT NULL,
  `resource_type` varchar(64) NOT NULL,
  `resource_id` varchar(64) NOT NULL,
  PRIMARY KEY (`collection_id`,`resource_type`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_collres_resources`
--

LOCK TABLES `oc_collres_resources` WRITE;
/*!40000 ALTER TABLE `oc_collres_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_collres_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments`
--

DROP TABLE IF EXISTS `oc_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `topmost_parent_id` bigint(20) unsigned NOT NULL DEFAULT 0,
  `children_count` int(10) unsigned NOT NULL DEFAULT 0,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `message` longtext DEFAULT NULL,
  `verb` varchar(64) DEFAULT NULL,
  `creation_timestamp` datetime DEFAULT NULL,
  `latest_child_timestamp` datetime DEFAULT NULL,
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `reference_id` varchar(64) DEFAULT NULL,
  `reactions` varchar(4000) DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_parent_id_index` (`parent_id`),
  KEY `comments_topmost_parent_id_idx` (`topmost_parent_id`),
  KEY `comments_object_index` (`object_type`,`object_id`,`creation_timestamp`),
  KEY `comments_actor_index` (`actor_type`,`actor_id`),
  KEY `expire_date` (`expire_date`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments`
--

LOCK TABLES `oc_comments` WRITE;
/*!40000 ALTER TABLE `oc_comments` DISABLE KEYS */;
INSERT INTO `oc_comments` VALUES (1,0,0,0,'users','admin','{\"message\":\"conversation_created\",\"parameters\":[]}','system','2023-04-06 09:20:54',NULL,'chat','1',NULL,NULL,NULL),(2,0,0,0,'guests','changelog','Welcome to Nextcloud Talk!\nIn this conversation you will be informed about new features available in Nextcloud Talk.','comment','2023-04-06 09:20:54',NULL,'chat','1',NULL,NULL,NULL),(3,0,0,0,'guests','changelog','New in Talk 6','comment','2023-04-06 09:20:54',NULL,'chat','1',NULL,NULL,NULL),(4,0,0,0,'guests','changelog','- Microsoft Edge and Safari can now be used to participate in audio and video calls','comment','2023-04-06 09:20:54',NULL,'chat','1',NULL,NULL,NULL),(5,0,0,0,'guests','changelog','- One-to-one conversations are now persistent and cannot be turned into group conversations by accident anymore. Also when one of the participants leaves the conversation, the conversation is not automatically deleted anymore. Only if both participants leave, the conversation is deleted from the server','comment','2023-04-06 09:20:54',NULL,'chat','1',NULL,NULL,NULL),(6,0,0,0,'guests','changelog','- You can now notify all participants by posting \"@all\" into the chat','comment','2023-04-06 09:20:54',NULL,'chat','1',NULL,NULL,NULL),(7,0,0,0,'guests','changelog','- With the \"arrow-up\" key you can repost your last message','comment','2023-04-06 09:20:54',NULL,'chat','1',NULL,NULL,NULL),(8,0,0,0,'guests','changelog','- Talk can now have commands, send \"/help\" as a chat message to see if your administrator configured some','comment','2023-04-06 09:20:54',NULL,'chat','1',NULL,NULL,NULL),(9,0,0,0,'guests','changelog','- With projects you can create quick links between conversations, files and other items','comment','2023-04-06 09:20:54',NULL,'chat','1',NULL,NULL,NULL),(10,0,0,0,'guests','changelog','New in Talk 7','comment','2023-04-06 09:20:54',NULL,'chat','1',NULL,NULL,NULL),(11,0,0,0,'guests','changelog','- You can now mention guests in the chat','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(12,0,0,0,'guests','changelog','- Conversations can now have a lobby. This will allow moderators to join the chat and call already to prepare the meeting, while users and guests have to wait','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(13,0,0,0,'guests','changelog','New in Talk 8','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(14,0,0,0,'guests','changelog','- You can now directly reply to messages giving the other users more context what your message is about','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(15,0,0,0,'guests','changelog','- Searching for conversations and participants will now also filter your existing conversations, making it much easier to find previous conversations','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(16,0,0,0,'guests','changelog','- You can now add custom user groups to conversations when the circles app is installed','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(17,0,0,0,'guests','changelog','New in Talk 9','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(18,0,0,0,'guests','changelog','- Check out the new grid and call view','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(19,0,0,0,'guests','changelog','- You can now upload and drag\'n\'drop files directly from your device into the chat','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(20,0,0,0,'guests','changelog','- Shared files are now opened directly inside the chat view with the viewer apps','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(21,0,0,0,'guests','changelog','New in Talk 10','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(22,0,0,0,'guests','changelog','- You can now search for chats and messages in the unified search in the top bar','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(23,0,0,0,'guests','changelog','- Spice up your messages with emojis from the emoji picker','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(24,0,0,0,'guests','changelog','- You can now change your camera and microphone while being in a call','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(25,0,0,0,'guests','changelog','New in Talk 11','comment','2023-04-06 09:20:55',NULL,'chat','1',NULL,NULL,NULL),(26,0,0,0,'guests','changelog','- Give your conversations some context with a description and open it up so logged in users can find it and join themselves','comment','2023-04-06 09:20:56',NULL,'chat','1',NULL,NULL,NULL),(27,0,0,0,'guests','changelog','- See a read status and send failed messages again','comment','2023-04-06 09:20:56',NULL,'chat','1',NULL,NULL,NULL),(28,0,0,0,'guests','changelog','- Raise your hand in a call with the R key','comment','2023-04-06 09:20:56',NULL,'chat','1',NULL,NULL,NULL),(29,0,0,0,'guests','changelog','New in Talk 12','comment','2023-04-06 09:20:56',NULL,'chat','1',NULL,NULL,NULL),(30,0,0,0,'guests','changelog','- Join the same conversation and call from multiple devices','comment','2023-04-06 09:20:56',NULL,'chat','1',NULL,NULL,NULL),(31,0,0,0,'guests','changelog','- Send voice messages, share your location or contact details','comment','2023-04-06 09:20:56',NULL,'chat','1',NULL,NULL,NULL),(32,0,0,0,'guests','changelog','- Add groups to a conversation and new group members will automatically be added as participants','comment','2023-04-06 09:20:56',NULL,'chat','1',NULL,NULL,NULL),(33,0,0,0,'guests','changelog','New in Talk 13','comment','2023-04-06 09:20:56',NULL,'chat','1',NULL,NULL,NULL),(34,0,0,0,'guests','changelog','- A preview of your audio and video is shown before joining a call','comment','2023-04-06 09:20:56',NULL,'chat','1',NULL,NULL,NULL),(35,0,0,0,'guests','changelog','- You can now blur your background in the newly designed call view','comment','2023-04-06 09:20:56',NULL,'chat','1',NULL,NULL,NULL),(36,0,0,0,'guests','changelog','- Moderators can now assign general and individual permissions to participants','comment','2023-04-06 09:20:56',NULL,'chat','1',NULL,NULL,NULL),(37,0,0,0,'guests','changelog','New in Talk 14','comment','2023-04-06 09:20:57',NULL,'chat','1',NULL,NULL,NULL),(38,0,0,0,'guests','changelog','- You can now react to chat message','comment','2023-04-06 09:20:57',NULL,'chat','1',NULL,NULL,NULL),(39,0,0,0,'guests','changelog','- In the sidebar you can now find an overview of the latest shared items','comment','2023-04-06 09:20:57',NULL,'chat','1',NULL,NULL,NULL),(40,0,0,0,'guests','changelog','New in Talk 15','comment','2023-04-06 09:20:57',NULL,'chat','1',NULL,NULL,NULL),(41,0,0,0,'guests','changelog','- Use a poll to collect the opinions of others or settle on a date','comment','2023-04-06 09:20:57',NULL,'chat','1',NULL,NULL,NULL),(42,0,0,0,'guests','changelog','- Configure an expiration time for chat messages','comment','2023-04-06 09:20:57',NULL,'chat','1',NULL,NULL,NULL),(43,0,0,0,'guests','changelog','- Start calls without notifying others in big conversations. You can send individual call notifications once the call has started.','comment','2023-04-06 09:20:57',NULL,'chat','1',NULL,NULL,NULL),(44,0,0,0,'guests','changelog','- Send chat messages without notifying the recipients in case it is not urgent','comment','2023-04-06 09:20:57',NULL,'chat','1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `oc_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_comments_read_markers`
--

DROP TABLE IF EXISTS `oc_comments_read_markers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_comments_read_markers` (
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `object_type` varchar(64) NOT NULL DEFAULT '',
  `object_id` varchar(64) NOT NULL DEFAULT '',
  `marker_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`object_type`,`object_id`),
  KEY `comments_marker_object_index` (`object_type`,`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_comments_read_markers`
--

LOCK TABLES `oc_comments_read_markers` WRITE;
/*!40000 ALTER TABLE `oc_comments_read_markers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_comments_read_markers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_cal_proxy`
--

DROP TABLE IF EXISTS `oc_dav_cal_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_cal_proxy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_id` varchar(64) NOT NULL,
  `proxy_id` varchar(64) NOT NULL,
  `permissions` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_cal_proxy_uidx` (`owner_id`,`proxy_id`,`permissions`),
  KEY `dav_cal_proxy_ipid` (`proxy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_cal_proxy`
--

LOCK TABLES `oc_dav_cal_proxy` WRITE;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_cal_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_dav_shares`
--

DROP TABLE IF EXISTS `oc_dav_shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_dav_shares` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `access` smallint(6) DEFAULT NULL,
  `resourceid` bigint(20) unsigned NOT NULL,
  `publicuri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dav_shares_index` (`principaluri`,`resourceid`,`type`,`publicuri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_dav_shares`
--

LOCK TABLES `oc_dav_shares` WRITE;
/*!40000 ALTER TABLE `oc_dav_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_dav_shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_direct_edit`
--

DROP TABLE IF EXISTS `oc_direct_edit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_direct_edit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `editor_id` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL,
  `share_id` bigint(20) DEFAULT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  `accessed` tinyint(1) DEFAULT 0,
  `file_path` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4D5AFECA5F37A13B` (`token`),
  KEY `direct_edit_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_direct_edit`
--

LOCK TABLES `oc_direct_edit` WRITE;
/*!40000 ALTER TABLE `oc_direct_edit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_direct_edit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_directlink`
--

DROP TABLE IF EXISTS `oc_directlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_directlink` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `file_id` bigint(20) unsigned NOT NULL,
  `token` varchar(60) DEFAULT NULL,
  `expiration` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `directlink_token_idx` (`token`),
  KEY `directlink_expiration_idx` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_directlink`
--

LOCK TABLES `oc_directlink` WRITE;
/*!40000 ALTER TABLE `oc_directlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_directlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_federated_reshares`
--

DROP TABLE IF EXISTS `oc_federated_reshares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_federated_reshares` (
  `share_id` bigint(20) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  PRIMARY KEY (`share_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_federated_reshares`
--

LOCK TABLES `oc_federated_reshares` WRITE;
/*!40000 ALTER TABLE `oc_federated_reshares` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_federated_reshares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_locks`
--

DROP TABLE IF EXISTS `oc_file_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_locks` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lock` int(11) NOT NULL DEFAULT 0,
  `key` varchar(64) NOT NULL,
  `ttl` int(11) NOT NULL DEFAULT -1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lock_key_index` (`key`),
  KEY `lock_ttl_index` (`ttl`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_locks`
--

LOCK TABLES `oc_file_locks` WRITE;
/*!40000 ALTER TABLE `oc_file_locks` DISABLE KEYS */;
INSERT INTO `oc_file_locks` VALUES (1,0,'files/0bcf776322b017bc4dd9e9ec9c78aa73',1680776372),(2,0,'files/38d3fc13a505a341da34815c5ccc8b3d',1680776457),(3,0,'files/6828fbc3ff4f7529a868dc166a6a4cb7',1680776447),(5,0,'files/b6ef755cfc70b5eb94f5d3aad8ba833d',1680776457),(6,0,'files/43e66b2112f4bb49c201750677829699',1680776455),(8,0,'files/124c8ccbad07de2d6c479c5933ed494b',1680776455),(9,0,'files/f19148ef040fb30251a0c4fa375e7c63',1680776455),(10,0,'files/09c39e9e361e5ef16950ef1e94fb1b8c',1680776455),(11,0,'files/df84fa8cdac72afe4fc9732df0618d1f',1680776455),(12,0,'files/b759adeef23608e88a970810262bad77',1680776455),(13,0,'files/c2d5387fd5449e19b48f64d4e29ea1a8',1680776455),(14,0,'files/70730c324a074a759f58870744d7af71',1680776455),(15,0,'files/827f846d744fcad92f18f1071fa44904',1680776455),(16,0,'files/7169929d36a986efa6cb45782f7fcf8e',1680776455),(17,0,'files/951fa9f3d23f5704468c11f32d3e7eeb',1680776455),(18,0,'files/a0f518c55dc98703b8a2f884e590ddad',1680776455),(19,0,'files/712eb3aeb0f647fccb7695655850081e',1680776455),(20,0,'files/ffb1696f67fea3ac68cdc525a480ee60',1680776455),(21,0,'files/2f8fd6977ca316afa90e29daf9c942a9',1680776455),(22,0,'files/4404f3e9c4f0bd1d6fad2a5567c0fa96',1680776455),(23,0,'files/956c5e9c71375659875522593a72628b',1680776455),(24,0,'files/c795f759e2879765e2186e0c95661180',1680776455),(25,0,'files/7d44893a36f1f1d279354543d4f9bf67',1680776455),(26,0,'files/2e1fc7abfd49bc3564f9b5d768a20dc0',1680776455),(27,0,'files/7f186b56eb9aa6be4138def2f7aa9831',1680776456),(28,0,'files/6fdb8b31dfb86e59f0f7fdc3cace4b1c',1680776456),(29,0,'files/8e3e005ee8e564df1ac454c135dbd711',1680776456),(30,0,'files/fa8b49ccd03e69f7eaf9dda531a53e32',1680776456),(32,0,'files/d7f93e169178cf12e2d72f9d6f2f7631',1680776456),(35,0,'files/2b7e5de9afe8b3f7b056c0ba2a04af46',1680776457),(37,0,'files/a7cbbe2af620c21a0c8834e23b08d024',1680776456),(42,0,'files/619b7cb264c6e999cefefecb051e3fee',1680776456),(43,0,'files/620bb184d4873587885c965fe5033f8f',1680776457),(44,0,'files/57efda78244afaecf5da6cacb6da2dae',1680776457),(45,0,'files/80a4b1a5d79cc7a319af7cfaccda8a13',1680776457),(46,0,'files/c9901ecde41da5300d648a826c0717cd',1680776457),(47,0,'files/d5865a741d9684a076b871aba7513dcb',1680776457),(48,0,'files/8e47111e6d5cfc79489dc43098fc0dd8',1680776457),(49,0,'files/70e45c5922aeaf3fd4bc012830eec4db',1680776457);
/*!40000 ALTER TABLE `oc_file_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_file_metadata`
--

DROP TABLE IF EXISTS `oc_file_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_file_metadata` (
  `id` bigint(20) NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `metadata` longtext NOT NULL COMMENT '(DC2Type:json)',
  PRIMARY KEY (`id`,`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_file_metadata`
--

LOCK TABLES `oc_file_metadata` WRITE;
/*!40000 ALTER TABLE `oc_file_metadata` DISABLE KEYS */;
INSERT INTO `oc_file_metadata` VALUES (11,'size','{\"width\":1600,\"height\":1066}'),(12,'size','{\"width\":1600,\"height\":1067}'),(13,'size','{\"width\":1600,\"height\":1067}'),(14,'size','{\"width\":1600,\"height\":1067}'),(16,'size','{\"width\":1600,\"height\":1067}'),(17,'size','{\"width\":3000,\"height\":2000}'),(18,'size','{\"width\":1200,\"height\":1800}'),(19,'size','{\"width\":1920,\"height\":1281}'),(20,'size','{\"width\":500,\"height\":500}');
/*!40000 ALTER TABLE `oc_file_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache`
--

DROP TABLE IF EXISTS `oc_filecache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache` (
  `fileid` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage` bigint(20) NOT NULL DEFAULT 0,
  `path` varchar(4000) DEFAULT NULL,
  `path_hash` varchar(32) NOT NULL DEFAULT '',
  `parent` bigint(20) NOT NULL DEFAULT 0,
  `name` varchar(250) DEFAULT NULL,
  `mimetype` bigint(20) NOT NULL DEFAULT 0,
  `mimepart` bigint(20) NOT NULL DEFAULT 0,
  `size` bigint(20) NOT NULL DEFAULT 0,
  `mtime` bigint(20) NOT NULL DEFAULT 0,
  `storage_mtime` bigint(20) NOT NULL DEFAULT 0,
  `encrypted` int(11) NOT NULL DEFAULT 0,
  `unencrypted_size` bigint(20) NOT NULL DEFAULT 0,
  `etag` varchar(40) DEFAULT NULL,
  `permissions` int(11) DEFAULT 0,
  `checksum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`fileid`),
  UNIQUE KEY `fs_storage_path_hash` (`storage`,`path_hash`),
  KEY `fs_parent_name_hash` (`parent`,`name`),
  KEY `fs_storage_mimetype` (`storage`,`mimetype`),
  KEY `fs_storage_mimepart` (`storage`,`mimepart`),
  KEY `fs_storage_size` (`storage`,`size`,`fileid`),
  KEY `fs_id_storage_size` (`fileid`,`storage`,`size`),
  KEY `fs_mtime` (`mtime`),
  KEY `fs_size` (`size`),
  KEY `fs_storage_path_prefix` (`storage`,`path`(64))
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache`
--

LOCK TABLES `oc_filecache` WRITE;
/*!40000 ALTER TABLE `oc_filecache` DISABLE KEYS */;
INSERT INTO `oc_filecache` VALUES (1,1,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,25789374,1680772847,1680772763,0,0,'642e8eefeb595',23,''),(2,1,'files','45b963397aa40d4a0063e0d85e4fe7a1',1,'files',2,1,25789374,1680772847,1680772847,0,0,'642e8eefeb595',31,''),(3,2,'','d41d8cd98f00b204e9800998ecf8427e',-1,'',2,1,0,1680772772,1680772771,0,0,'642e8ea406d67',23,''),(4,2,'appdata_oceyr9gvy75u','af73184052b5e1cbdc7c91c34fe5c628',3,'appdata_oceyr9gvy75u',2,1,0,1680772855,1680772855,0,0,'642e8e9bd2321',31,''),(5,2,'appdata_oceyr9gvy75u/photos','99b9e279c51cc8e0c60cf1315c645ee4',4,'photos',2,1,0,1680772763,1680772763,0,0,'642e8e9bd4b8d',31,''),(6,2,'appdata_oceyr9gvy75u/photos/geonames','4b5e158aea629fd70e98ca04ea45f3e8',5,'geonames',2,1,0,1680772763,1680772763,0,0,'642e8e9bd6c2f',31,''),(7,1,'files/Nextcloud Manual.pdf','2bc58a43566a8edde804a4a97a9c7469',2,'Nextcloud Manual.pdf',4,3,13795312,1680772763,1680772763,0,0,'31ddb38c03a3aeb1a0d75c91c39ee153',27,''),(8,1,'files/Nextcloud intro.mp4','e4919345bcc87d4585a5525daaad99c0',2,'Nextcloud intro.mp4',6,5,3963036,1680772764,1680772764,0,0,'f9ff852e9a6f02eb62cab139bcbf01b7',27,''),(9,1,'files/Readme.md','49af83716f8dcbfa89aaf835241c0b9f',2,'Readme.md',8,7,206,1680772764,1680772764,0,0,'81dfc9cc74a3738223b4432033c4b5d1',27,''),(10,1,'files/Photos','d01bb67e7b71dd49fd06bad922f521c9',2,'Photos',2,1,5656463,1680772764,1680772764,0,0,'642e8e9ca1190',31,''),(11,1,'files/Photos/Library.jpg','0b785d02a19fc00979f82f6b54a05805',10,'Library.jpg',10,9,2170375,1680772764,1680772764,0,0,'638744ec41a462589c118a8c36c08180',27,''),(12,1,'files/Photos/Toucan.jpg','681d1e78f46a233e12ecfa722cbc2aef',10,'Toucan.jpg',10,9,167989,1680772764,1680772764,0,0,'156b189b59d767a5cfc57a1934262978',27,''),(13,1,'files/Photos/Birdie.jpg','cd31c7af3a0ec6e15782b5edd2774549',10,'Birdie.jpg',10,9,593508,1680772764,1680772764,0,0,'e889c88d24cbd29d655341c878a304b6',27,''),(14,1,'files/Photos/Frog.jpg','d6219add1a9129ed0c1513af985e2081',10,'Frog.jpg',10,9,457744,1680772764,1680772764,0,0,'8f2e58571f45cd8c619de8fe24aaf21c',27,''),(15,1,'files/Photos/Readme.md','2a4ac36bb841d25d06d164f291ee97db',10,'Readme.md',8,7,150,1680772764,1680772764,0,0,'ebbdbdac308de205099b97410aa055a3',27,''),(16,1,'files/Photos/Gorilla.jpg','6d5f5956d8ff76a5f290cebb56402789',10,'Gorilla.jpg',10,9,474653,1680772764,1680772764,0,0,'5ec69da97e620be679d0baa72ed1226d',27,''),(17,1,'files/Photos/Nextcloud community.jpg','b9b3caef83a2a1c20354b98df6bcd9d0',10,'Nextcloud community.jpg',10,9,797325,1680772764,1680772764,0,0,'0314bfa92924dd3b1affb3772a723348',27,''),(18,1,'files/Photos/Steps.jpg','7b2ca8d05bbad97e00cbf5833d43e912',10,'Steps.jpg',10,9,567689,1680772764,1680772764,0,0,'6fc311ebd6256be2e6b587e216a3ee58',27,''),(19,1,'files/Photos/Vineyard.jpg','14e5f2670b0817614acd52269d971db8',10,'Vineyard.jpg',10,9,427030,1680772764,1680772764,0,0,'dbfbafbae656670128c3c19fe01e19e4',27,''),(20,1,'files/Nextcloud.png','2bcc0ff06465ef1bfc4a868efde1e485',2,'Nextcloud.png',11,9,50598,1680772764,1680772764,0,0,'419da5fcea208c0e9a3fada062959dc6',27,''),(21,1,'files/Templates','530b342d0b8164ff3b4754c2273a453e',2,'Templates',2,1,238269,1680772765,1680772765,0,0,'642e8e9d5140c',31,''),(22,1,'files/Templates/Meeting notes.md','c0279758bb570afdcdbc2471b2f16285',21,'Meeting notes.md',8,7,326,1680772764,1680772764,0,0,'be7cf3085bf350dffe2271ffddf132de',27,''),(23,1,'files/Templates/Expense report.ods','d0a4025621279b95d2f94ff4ec09eab3',21,'Expense report.ods',12,3,13441,1680772764,1680772764,0,0,'3f3c0e70091e11a93225e94ca3d6bdb8',27,''),(24,1,'files/Templates/Diagram & table.ods','0a89f154655f6d4a0098bc4e6ca87367',21,'Diagram & table.ods',12,3,13378,1680772764,1680772764,0,0,'5e23def999881e68c64d2fbf444228c7',27,''),(25,1,'files/Templates/Mindmap.odg','74cff798fc1b9634ee45380599b2a6da',21,'Mindmap.odg',13,3,13653,1680772764,1680772764,0,0,'f9c61944e7eb92441af874b910d17d18',27,''),(26,1,'files/Templates/Readme.md','71fa2e74ab30f39eed525572ccc3bbec',21,'Readme.md',8,7,554,1680772764,1680772764,0,0,'b7e491118bbb5489f17e3376f130199b',27,''),(27,1,'files/Templates/Org chart.odg','fd846bc062b158abb99a75a5b33b53e7',21,'Org chart.odg',13,3,13878,1680772764,1680772764,0,0,'0c698d50b2ac593ccb07ce5c1aab2bfe',27,''),(28,1,'files/Templates/Invoice.odt','40fdccb51b6c3e3cf20532e06ed5016e',21,'Invoice.odt',14,3,17276,1680772764,1680772764,0,0,'0548ba481f3d1c42eb21348052ac2b11',27,''),(29,1,'files/Templates/Business model canvas.odg','6a8f3e02bdf45c8b0671967969393bcb',21,'Business model canvas.odg',13,3,16988,1680772765,1680772765,0,0,'0bf82175c407ca4b4f681e93495c7aad',27,''),(30,1,'files/Templates/Simple.odp','a2c90ff606d31419d699b0b437969c61',21,'Simple.odp',15,3,14810,1680772765,1680772765,0,0,'63d0c3b0abae22bfcfe72025ff0827b6',27,''),(31,1,'files/Templates/Elegant.odp','f3ec70ed694c0ca215f094b98eb046a7',21,'Elegant.odp',15,3,14316,1680772765,1680772765,0,0,'0ba1eb7df612e2295681cc58443eed1b',27,''),(32,1,'files/Templates/Letter.odt','15545ade0e9863c98f3a5cc0fbf2836a',21,'Letter.odt',14,3,15961,1680772765,1680772765,0,0,'e40c530c1fd58b2e08db4a2ff2896d61',27,''),(33,1,'files/Templates/Impact effort matrix.whiteboard','c5e3b589ec8f9dd6afdebe0ac6feeac8',21,'Impact effort matrix.whiteboard',16,3,52674,1680772765,1680772765,0,0,'ed1c5a768144fd2d2d9fceca83653ff1',27,''),(34,1,'files/Templates/Product plan.md','a9fbf58bf31cebb8143f7ad3a5205633',21,'Product plan.md',8,7,573,1680772765,1680772765,0,0,'c3cf34453254d9dbb22c5fc49feaf70a',27,''),(35,1,'files/Templates/Flowchart.odg','832942849155883ceddc6f3cede21867',21,'Flowchart.odg',13,3,11836,1680772765,1680772765,0,0,'273b4a830b2df1404662d01d4058ca5c',27,''),(36,1,'files/Templates/SWOT analysis.whiteboard','3fd0e44b3e6f0e7144442ef6fc71a663',21,'SWOT analysis.whiteboard',16,3,38605,1680772765,1680772765,0,0,'d175afb806fe472e7369c2850c38f7c7',27,''),(37,1,'files/Documents','0ad78ba05b6961d92f7970b2b3922eca',2,'Documents',2,1,1108865,1680772765,1680772765,0,0,'642e8e9d7ddfb',31,''),(38,1,'files/Documents/Readme.md','51ec9e44357d147dd5c212b850f6910f',37,'Readme.md',8,7,136,1680772765,1680772765,0,0,'17224ab205a86e2a2844cd8fe269072e',27,''),(39,1,'files/Documents/Nextcloud flyer.pdf','9c5b4dc7182a7435767708ac3e8d126c',37,'Nextcloud flyer.pdf',4,3,1083339,1680772765,1680772765,0,0,'6a5a0dfc9efdfc8e1f05099271a73ec5',27,''),(40,1,'files/Documents/Welcome to Nextcloud Hub.docx','b44cb84f22ceddc4ca2826e026038091',37,'Welcome to Nextcloud Hub.docx',17,3,24295,1680772765,1680772765,0,0,'f8dcde07b74919297961aba831d814b6',27,''),(41,1,'files/Documents/Example.md','efe0853470dd0663db34818b444328dd',37,'Example.md',8,7,1095,1680772765,1680772765,0,0,'af48569e304f0afac640ff8337999ecd',27,''),(42,1,'files/Reasons to use Nextcloud.pdf','418b19142a61c5bef296ea56ee144ca3',2,'Reasons to use Nextcloud.pdf',4,3,976625,1680772765,1680772765,0,0,'e51da54add7eb0707b33df925ed3d120',27,''),(43,2,'appdata_oceyr9gvy75u/js','d9c4e261469f444b7be8660268f8f33b',4,'js',2,1,0,1680772770,1680772770,0,0,'642e8ea252beb',31,''),(44,2,'appdata_oceyr9gvy75u/js/core','6776a17e1db5497dadd5526614b7f2cb',43,'core',2,1,0,1680772770,1680772770,0,0,'642e8ea254c34',31,''),(45,2,'appdata_oceyr9gvy75u/js/core/merged-template-prepend.js','c022493ab929d0c822e6918376aa16c2',44,'merged-template-prepend.js',18,3,12238,1680772770,1680772770,0,0,'f49b99a57a9d91c6e6a6e2df384e22d9',27,''),(46,2,'appdata_oceyr9gvy75u/js/core/merged-template-prepend.js.deps','e7d0525312da9749e0af14bffdf7daeb',44,'merged-template-prepend.js.deps',16,3,246,1680772770,1680772770,0,0,'dfc740c1b812d8e83b608feb47432305',27,''),(47,2,'appdata_oceyr9gvy75u/js/core/merged-template-prepend.js.gzip','e0573d265a4ae4ae296196da7932a54e',44,'merged-template-prepend.js.gzip',19,3,3098,1680772770,1680772770,0,0,'dd9e62ab4b0f8d81dbe8c42b7295d96c',27,''),(48,2,'appdata_oceyr9gvy75u/appstore','d71b246b06fbe3f6d22afa36adc1699e',4,'appstore',2,1,0,1680772773,1680772773,0,0,'642e8ea401b73',31,''),(49,2,'appdata_oceyr9gvy75u/theming','9907c5a15d80e2a07241b4c1e4f32268',4,'theming',2,1,0,1680772772,1680772772,0,0,'642e8ea41e792',31,''),(50,2,'appdata_oceyr9gvy75u/theming/global','6c40cfef922bda5a5227d96d0313f3de',49,'global',2,1,0,1680772772,1680772772,0,0,'642e8ea42227a',31,''),(51,2,'appdata_oceyr9gvy75u/theming/global/0','22e6aa6ab6cbe3cec6db8b69ff48b04c',50,'0',2,1,0,1680772859,1680772859,0,0,'642e8ea426678',31,''),(52,2,'appdata_oceyr9gvy75u/theming/global/0/favIcon-core','a3144d7950d62aed01a58897e634608e',51,'favIcon-core',16,3,90022,1680772772,1680772772,0,0,'6dff16549634160790d73c7a3ff5c5ec',27,''),(53,2,'appdata_oceyr9gvy75u/theming/global/0/touchIcon-core','cf82720ce473a31331a046a97876961e',51,'touchIcon-core',16,3,25247,1680772772,1680772772,0,0,'2ca939e7ebe3da63b47d9bc14a62da64',27,''),(54,2,'appdata_oceyr9gvy75u/appstore/apps.json','2d388b8e4884a52866d0e92dd5de9793',48,'apps.json',20,3,2273132,1680772773,1680772773,0,0,'daad5bfdab23df2960161d6af9fcbd3a',27,''),(55,1,'files/Talk','a12e821edb92901676dee9cfe1487de3',2,'Talk',2,1,0,1680772847,1680772847,0,0,'642e8eefd2326',31,''),(56,2,'appdata_oceyr9gvy75u/avatar','786f855fb5033205e00526c03d3dbfc8',4,'avatar',2,1,0,1680772855,1680772855,0,0,'642e8ef70235b',31,''),(57,2,'appdata_oceyr9gvy75u/avatar/admin','e8c86a5cfc438d3875feef063af72de4',56,'admin',2,1,0,1680772856,1680772856,0,0,'642e8ef722f8f',31,''),(58,2,'appdata_oceyr9gvy75u/preview','8868749bf4ed29b1c3765e7eeb13da9a',4,'preview',2,1,0,1680772855,1680772855,0,0,'642e8ef77083e',31,''),(59,2,'appdata_oceyr9gvy75u/theming/global/0/icon-core-#0082c9filetypes_folder.svg','94c0257d21e0cfb7b5129157d4348280',51,'icon-core-#0082c9filetypes_folder.svg',21,9,255,1680772855,1680772855,0,0,'4f56d969aa558b43bccbf7ba124b2209',27,''),(60,2,'appdata_oceyr9gvy75u/preview/c','62c5e0324bba58d44f5c46a8b48ce77c',58,'c',2,1,-1,1680772855,1680772855,0,0,'642e8ef7c2b3a',31,''),(61,2,'appdata_oceyr9gvy75u/preview/c/1','bef3de153448f969311fd773de4bf099',60,'1',2,1,-1,1680772855,1680772855,0,0,'642e8ef7b9e65',31,''),(62,2,'appdata_oceyr9gvy75u/preview/6','b4d9d9c2832cc7de6fa6124fa5b620fc',58,'6',2,1,-1,1680772855,1680772855,0,0,'642e8ef7cb6ee',31,''),(63,2,'appdata_oceyr9gvy75u/preview/c/1/6','1eb78c78764c3a3385b165f80be6b93c',61,'6',2,1,-1,1680772855,1680772855,0,0,'642e8ef7b2a4d',31,''),(64,2,'appdata_oceyr9gvy75u/preview/6/3','e70982849f8c54341a8fecfe339d9d42',62,'3',2,1,-1,1680772855,1680772855,0,0,'642e8ef7c289d',31,''),(65,2,'appdata_oceyr9gvy75u/preview/6/3/6','c8def4ce03e659d6fc22e0d6c63554fb',64,'6',2,1,-1,1680772855,1680772855,0,0,'642e8ef7b9e6b',31,''),(66,2,'appdata_oceyr9gvy75u/preview/c/1/6/a','b4453f8da5dd4c84847d758123d809ab',63,'a',2,1,-1,1680772855,1680772855,0,0,'642e8ef7aa644',31,''),(67,2,'appdata_oceyr9gvy75u/theming/global/0/icon-core-#0082c9filetypes_x-office-presentation.svg','3c9028bd7e101ff5d4d5aaa6710b6f6a',51,'icon-core-#0082c9filetypes_x-office-presentation.svg',21,9,261,1680772855,1680772855,0,0,'2c950622f19a63b92c079d7f66935ec8',27,''),(68,2,'appdata_oceyr9gvy75u/preview/c/1/6/a/5','03893c711f57bbf35d5343bc849ec9ae',66,'5',2,1,-1,1680772855,1680772855,0,0,'642e8ef7a2abb',31,''),(69,2,'appdata_oceyr9gvy75u/preview/6/3/6/4','0d8a4ea8f81aa7ddef8a3e8a2c4eef6b',65,'4',2,1,-1,1680772855,1680772855,0,0,'642e8ef7b2a4d',31,''),(70,2,'appdata_oceyr9gvy75u/preview/c/1/6/a/5/3','837d1c49b4086b6e70ef2a855bcf805b',68,'3',2,1,-1,1680772855,1680772855,0,0,'642e8ef793032',31,''),(71,2,'appdata_oceyr9gvy75u/preview/6/3/6/4/d','ab58582ee944564d31605b83880accc3',69,'d',2,1,-1,1680772855,1680772855,0,0,'642e8ef7aa644',31,''),(72,2,'appdata_oceyr9gvy75u/preview/c/1/6/a/5/3/2','9d95506a7ca84939572fe0c3e483015f',70,'2',2,1,-1,1680772855,1680772855,0,0,'642e8ef78ad97',31,''),(73,2,'appdata_oceyr9gvy75u/preview/6/3/6/4/d/3','358576278d1e3598970120b7ffda4618',71,'3',2,1,-1,1680772855,1680772855,0,0,'642e8ef7a2f74',31,''),(74,2,'appdata_oceyr9gvy75u/preview/c/1/6/a/5/3/2/31','02361150996262e9c1aef29ceeef3c40',72,'31',2,1,0,1680772856,1680772856,0,0,'642e8ef78245b',31,''),(75,2,'appdata_oceyr9gvy75u/theming/global/0/icon-core-#0082c9filetypes_x-office-drawing.svg','590be41231d4341b9ebae0b2558cd164',51,'icon-core-#0082c9filetypes_x-office-drawing.svg',21,9,291,1680772856,1680772856,0,0,'d8ab53dcff3428eb9b91b543ad366ff5',27,''),(76,2,'appdata_oceyr9gvy75u/preview/6/3/6/4/d/3/f','c01be8f6f995d3fdc387521568ea2ae4',73,'f',2,1,-1,1680772855,1680772855,0,0,'642e8ef792fcf',31,''),(77,2,'appdata_oceyr9gvy75u/preview/6/3/6/4/d/3/f/32','46c1f547f499d43bb1ab8d36275c09e5',76,'32',2,1,0,1680772856,1680772856,0,0,'642e8ef78b2d5',31,''),(78,2,'appdata_oceyr9gvy75u/preview/3','8f97ee02ac4a6643c2c8f293aad9f10d',58,'3',2,1,-1,1680772855,1680772855,0,0,'642e8ef83096f',31,''),(79,2,'appdata_oceyr9gvy75u/preview/3/4','244dfdcb66eac25a780f03be1f4c9975',78,'4',2,1,-1,1680772855,1680772855,0,0,'642e8ef815824',31,''),(80,2,'appdata_oceyr9gvy75u/preview/3/4/1','3a4f9fceea971cb46ce8441525e852d7',79,'1',2,1,-1,1680772855,1680772855,0,0,'642e8ef80dacf',31,''),(81,2,'appdata_oceyr9gvy75u/theming/global/0/icon-core-#0082c9filetypes_x-office-document.svg','19b9fdae666e30d8959db48d6a845b43',51,'icon-core-#0082c9filetypes_x-office-document.svg',21,9,295,1680772856,1680772856,0,0,'c2da0a3a460e1792bde6ac605a782eac',27,''),(82,2,'appdata_oceyr9gvy75u/preview/3/4/1/7','1debad5ecfa09c18e036a7521d70c973',80,'7',2,1,-1,1680772855,1680772855,0,0,'642e8ef800782',31,''),(83,2,'appdata_oceyr9gvy75u/preview/3/4/1/7/3','7ff80527c6f0743b69fa4df91e551434',82,'3',2,1,-1,1680772855,1680772855,0,0,'642e8ef7ecb0e',31,''),(84,2,'appdata_oceyr9gvy75u/preview/3/4/1/7/3/c','d8843a17c543729207e79e888ce65dfc',83,'c',2,1,-1,1680772855,1680772855,0,0,'642e8ef7e639b',31,''),(85,2,'appdata_oceyr9gvy75u/preview/3/4/1/7/3/c/b','4b0df5aacc21d587f8794b5275008470',84,'b',2,1,-1,1680772855,1680772855,0,0,'642e8ef7dd2fe',31,''),(86,2,'appdata_oceyr9gvy75u/preview/3/4/1/7/3/c/b/30','03b833328acc4ab3cd7a4e6e9cde6ebb',85,'30',2,1,0,1680772856,1680772856,0,0,'642e8ef7ced6c',31,''),(87,2,'appdata_oceyr9gvy75u/avatar/admin/avatar.png','7b1aa84a1baa2e76aa2d914aa455a687',57,'avatar.png',11,9,18276,1680772856,1680772856,0,0,'d25efc675a37874ad21ece21dcbc4c2e',27,''),(88,2,'appdata_oceyr9gvy75u/avatar/admin/generated','ac67937b58f3e9596be08aec2c16f28e',57,'generated',16,3,0,1680772856,1680772856,0,0,'62a49084bd8ef7cc4dd95f9277b95ed9',27,''),(89,2,'appdata_oceyr9gvy75u/preview/c/1/6/a/5/3/2/31/256-144-max.png','4566fc38359048726bf9c9647c4f42e2',74,'256-144-max.png',11,9,1898,1680772856,1680772856,0,0,'2b2a5e5c08cb6c2b459a2fb7adfc8422',27,''),(90,2,'appdata_oceyr9gvy75u/preview/6/3/6/4/d/3/f/32/181-256-max.png','9ca4b8340f534ff8cd18fa402de62d15',77,'181-256-max.png',11,9,4052,1680772856,1680772856,0,0,'f71569661a3900515d8da8c2132fd8fd',27,''),(91,2,'appdata_oceyr9gvy75u/avatar/admin/avatar.64.png','9c9c6c75499ac49449c054677d4ea9dd',57,'avatar.64.png',11,9,884,1680772856,1680772856,0,0,'4b8ee129cf9041797ddfd53b3e053b90',27,''),(92,2,'appdata_oceyr9gvy75u/preview/c/1/6/a/5/3/2/31/144-144-crop.png','548df37d0b4b3d36cd2e5cbc47e2b7fb',74,'144-144-crop.png',11,9,5337,1680772856,1680772856,0,0,'56faff69ae39cc3a66b0ee0198b0c6b2',27,''),(93,2,'appdata_oceyr9gvy75u/preview/3/4/1/7/3/c/b/30/256-144-max.png','77162cd270532673c009e783ec393847',86,'256-144-max.png',11,9,2197,1680772856,1680772856,0,0,'661b6031066c23a1e24cb6970a4f47e2',27,''),(94,2,'appdata_oceyr9gvy75u/preview/6/3/6/4/d/3/f/32/181-181-crop.png','3c6ca08883185355bfc8ffded7c12423',77,'181-181-crop.png',11,9,8626,1680772856,1680772856,0,0,'f1533518c0e2c6231a42457c0028b33f',27,''),(95,2,'appdata_oceyr9gvy75u/preview/3/4/1/7/3/c/b/30/144-144-crop.png','2a9772446acffef6ec7376a105d6476d',86,'144-144-crop.png',11,9,5409,1680772856,1680772856,0,0,'93f89b3a62b173965d16b4706f24a3e5',27,''),(96,2,'appdata_oceyr9gvy75u/theming/global/0/icon-core-#0082c9filetypes_file.svg','e16c4424ae57208877a3415d91cc65da',51,'icon-core-#0082c9filetypes_file.svg',21,9,228,1680772857,1680772857,0,0,'3047e753d2f2e6a116df8eaedbb82d4f',27,''),(97,2,'appdata_oceyr9gvy75u/theming/global/0/icon-core-#0082c9filetypes_text.svg','a8d264ea493938a776717e71da6f8a0e',51,'icon-core-#0082c9filetypes_text.svg',21,9,295,1680772857,1680772857,0,0,'52d96bcd55ced9983e217e8785b68513',27,''),(98,2,'appdata_oceyr9gvy75u/preview/e','fd71b01307245848ec5569a04f9c8987',58,'e',2,1,-1,1680772856,1680772856,0,0,'642e8ef92f06b',31,''),(99,2,'appdata_oceyr9gvy75u/preview/e/3','3583a199b054b2b219d0436157f89c38',98,'3',2,1,-1,1680772856,1680772856,0,0,'642e8ef926722',31,''),(100,2,'appdata_oceyr9gvy75u/preview/e/3/6','8cb8b7c46c8212d45a2b96f1421dae67',99,'6',2,1,-1,1680772856,1680772856,0,0,'642e8ef91f09c',31,''),(101,2,'appdata_oceyr9gvy75u/preview/e/3/6/9','fd9673b62c9c53d3d1df7f19a789dc09',100,'9',2,1,-1,1680772856,1680772856,0,0,'642e8ef917340',31,''),(102,2,'appdata_oceyr9gvy75u/preview/e/3/6/9/8','79fd4dc754be10276677bdd41c613882',101,'8',2,1,-1,1680772856,1680772856,0,0,'642e8ef90ef13',31,''),(103,2,'appdata_oceyr9gvy75u/preview/e/3/6/9/8/5','d7c6c0137864d004e71feff16a66ff99',102,'5',2,1,-1,1680772856,1680772856,0,0,'642e8ef9072cb',31,''),(104,2,'appdata_oceyr9gvy75u/preview/e/3/6/9/8/5/3','5432b5c467e1f8c68570c5d9a64874b5',103,'3',2,1,-1,1680772856,1680772856,0,0,'642e8ef8f3554',31,''),(105,2,'appdata_oceyr9gvy75u/preview/e/3/6/9/8/5/3/34','7a95a39eb0a74e1df5e5e5fee43b4abb',104,'34',2,1,0,1680772858,1680772858,0,0,'642e8ef8e915a',31,''),(106,2,'appdata_oceyr9gvy75u/preview/e/3/6/9/8/5/3/34/4096-4096-max.png','00537e7b171f080f79502b4eacd71d6c',105,'4096-4096-max.png',11,9,68696,1680772858,1680772858,0,0,'c6d88cf20b8ee81fc6ac34c5be100028',27,''),(107,2,'appdata_oceyr9gvy75u/preview/e/3/6/9/8/5/3/34/256-256-crop.png','134ca38e4bf4ebcf67cc5886165ba820',105,'256-256-crop.png',11,9,12062,1680772858,1680772858,0,0,'5b49d66fda519b123e2b4a0f77d4df4e',27,''),(108,2,'appdata_oceyr9gvy75u/theming/global/0/touchIcon-dashboard','ca7cf069b5b6539ebd2f50c9544dc73c',51,'touchIcon-dashboard',16,3,7556,1680772859,1680772859,0,0,'0b3848043172b82f2611d889a0b98c31',27,'');
/*!40000 ALTER TABLE `oc_filecache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filecache_extended`
--

DROP TABLE IF EXISTS `oc_filecache_extended`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filecache_extended` (
  `fileid` bigint(20) unsigned NOT NULL,
  `metadata_etag` varchar(40) DEFAULT NULL,
  `creation_time` bigint(20) NOT NULL DEFAULT 0,
  `upload_time` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`fileid`),
  KEY `fce_ctime_idx` (`creation_time`),
  KEY `fce_utime_idx` (`upload_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filecache_extended`
--

LOCK TABLES `oc_filecache_extended` WRITE;
/*!40000 ALTER TABLE `oc_filecache_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_filecache_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_trash`
--

DROP TABLE IF EXISTS `oc_files_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_trash` (
  `auto_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(250) NOT NULL DEFAULT '',
  `user` varchar(64) NOT NULL DEFAULT '',
  `timestamp` varchar(12) NOT NULL DEFAULT '',
  `location` varchar(512) NOT NULL DEFAULT '',
  `type` varchar(4) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `id_index` (`id`),
  KEY `timestamp_index` (`timestamp`),
  KEY `user_index` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_trash`
--

LOCK TABLES `oc_files_trash` WRITE;
/*!40000 ALTER TABLE `oc_files_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_files_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_files_versions`
--

DROP TABLE IF EXISTS `oc_files_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_files_versions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_id` bigint(20) NOT NULL,
  `timestamp` bigint(20) NOT NULL,
  `size` bigint(20) NOT NULL,
  `mimetype` bigint(20) NOT NULL,
  `metadata` longtext NOT NULL COMMENT '(DC2Type:json)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `files_versions_uniq_index` (`file_id`,`timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_files_versions`
--

LOCK TABLES `oc_files_versions` WRITE;
/*!40000 ALTER TABLE `oc_files_versions` DISABLE KEYS */;
INSERT INTO `oc_files_versions` VALUES (1,7,1680772763,13795312,4,'[]'),(2,8,1680772764,3963036,6,'[]'),(3,9,1680772764,206,8,'[]'),(4,11,1680772764,2170375,10,'[]'),(5,12,1680772764,167989,10,'[]'),(6,13,1680772764,593508,10,'[]'),(7,14,1680772764,457744,10,'[]'),(8,15,1680772764,150,8,'[]'),(9,16,1680772764,474653,10,'[]'),(10,17,1680772764,797325,10,'[]'),(11,18,1680772764,567689,10,'[]'),(12,19,1680772764,427030,10,'[]'),(13,20,1680772764,50598,11,'[]'),(14,22,1680772764,326,8,'[]'),(15,23,1680772764,13441,12,'[]'),(16,24,1680772764,13378,12,'[]'),(17,25,1680772764,13653,13,'[]'),(18,26,1680772764,554,8,'[]'),(19,27,1680772764,13878,13,'[]'),(20,28,1680772764,17276,14,'[]'),(21,29,1680772765,16988,13,'[]'),(22,30,1680772765,14810,15,'[]'),(23,31,1680772765,14316,15,'[]'),(24,32,1680772765,15961,14,'[]'),(25,33,1680772765,52674,16,'[]'),(26,34,1680772765,573,8,'[]'),(27,35,1680772765,11836,13,'[]'),(28,36,1680772765,38605,16,'[]'),(29,38,1680772765,136,8,'[]'),(30,39,1680772765,1083339,4,'[]'),(31,40,1680772765,24295,17,'[]'),(32,41,1680772765,1095,8,'[]'),(33,42,1680772765,976625,4,'[]');
/*!40000 ALTER TABLE `oc_files_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_checks`
--

DROP TABLE IF EXISTS `oc_flow_checks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `operator` varchar(16) NOT NULL DEFAULT '',
  `value` longtext DEFAULT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_checks`
--

LOCK TABLES `oc_flow_checks` WRITE;
/*!40000 ALTER TABLE `oc_flow_checks` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_checks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations`
--

DROP TABLE IF EXISTS `oc_flow_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(256) NOT NULL DEFAULT '',
  `name` varchar(256) DEFAULT '',
  `checks` longtext DEFAULT NULL,
  `operation` longtext DEFAULT NULL,
  `entity` varchar(256) NOT NULL DEFAULT 'OCA\\WorkflowEngine\\Entity\\File',
  `events` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations`
--

LOCK TABLES `oc_flow_operations` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_flow_operations_scope`
--

DROP TABLE IF EXISTS `oc_flow_operations_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_flow_operations_scope` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `operation_id` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `value` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flow_unique_scope` (`operation_id`,`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_flow_operations_scope`
--

LOCK TABLES `oc_flow_operations_scope` WRITE;
/*!40000 ALTER TABLE `oc_flow_operations_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_flow_operations_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_admin`
--

DROP TABLE IF EXISTS `oc_group_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_admin` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `group_admin_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_admin`
--

LOCK TABLES `oc_group_admin` WRITE;
/*!40000 ALTER TABLE `oc_group_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_group_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_group_user`
--

DROP TABLE IF EXISTS `oc_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_group_user` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `uid` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`gid`,`uid`),
  KEY `gu_uid_index` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_group_user`
--

LOCK TABLES `oc_group_user` WRITE;
/*!40000 ALTER TABLE `oc_group_user` DISABLE KEYS */;
INSERT INTO `oc_group_user` VALUES ('admin','admin');
/*!40000 ALTER TABLE `oc_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_groups`
--

DROP TABLE IF EXISTS `oc_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_groups` (
  `gid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(255) NOT NULL DEFAULT 'name',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_groups`
--

LOCK TABLES `oc_groups` WRITE;
/*!40000 ALTER TABLE `oc_groups` DISABLE KEYS */;
INSERT INTO `oc_groups` VALUES ('admin','admin');
/*!40000 ALTER TABLE `oc_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_jobs`
--

DROP TABLE IF EXISTS `oc_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(255) NOT NULL DEFAULT '',
  `argument` varchar(4000) NOT NULL DEFAULT '',
  `last_run` int(11) DEFAULT 0,
  `last_checked` int(11) DEFAULT 0,
  `reserved_at` int(11) DEFAULT 0,
  `execution_duration` int(11) DEFAULT 0,
  `argument_hash` varchar(32) DEFAULT NULL,
  `time_sensitive` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `job_class_index` (`class`),
  KEY `job_lastcheck_reserved` (`last_checked`,`reserved_at`),
  KEY `job_argument_hash` (`class`,`argument_hash`),
  KEY `jobs_time_sensitive` (`time_sensitive`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_jobs`
--

LOCK TABLES `oc_jobs` WRITE;
/*!40000 ALTER TABLE `oc_jobs` DISABLE KEYS */;
INSERT INTO `oc_jobs` VALUES (1,'OCA\\NextcloudAnnouncements\\Cron\\Crawler','null',1680772771,1680772771,0,1,'37a6259cc0c1dae299a7866489dff0bd',1),(2,'OCA\\ContactsInteraction\\BackgroundJob\\CleanupJob','null',1680772854,1680772854,0,0,'37a6259cc0c1dae299a7866489dff0bd',0),(3,'OCA\\Files\\BackgroundJob\\ScanFiles','null',0,1680772751,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(4,'OCA\\Files\\BackgroundJob\\DeleteOrphanedItems','null',0,1680772751,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(5,'OCA\\Files\\BackgroundJob\\CleanupFileLocks','null',0,1680772751,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(6,'OCA\\Files\\BackgroundJob\\CleanupDirectEditingTokens','null',0,1680772751,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(7,'OCA\\Files\\BackgroundJob\\DeleteExpiredOpenLocalEditor','null',0,1680772751,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(8,'OCA\\UpdateNotification\\Notification\\BackgroundJob','null',0,1680772751,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(9,'OCA\\Files_Sharing\\DeleteOrphanedSharesJob','null',0,1680772752,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(10,'OCA\\Files_Sharing\\ExpireSharesJob','null',0,1680772752,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(11,'OCA\\Files_Sharing\\BackgroundJob\\FederatedSharesDiscoverJob','null',0,1680772752,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(12,'OCA\\Circles\\Cron\\Maintenance','null',0,1680772752,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(13,'OCA\\Files_Versions\\BackgroundJob\\ExpireVersions','null',0,1680772754,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(14,'OCA\\Text\\Cron\\Cleanup','null',0,1680772754,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(15,'OCA\\Files_Trashbin\\BackgroundJob\\ExpireTrash','null',0,1680772755,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(16,'OCA\\Notifications\\BackgroundJob\\GenerateUserSettings','null',0,1680772755,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(17,'OCA\\Notifications\\BackgroundJob\\SendNotificationMails','null',0,1680772755,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(18,'OCA\\Support\\BackgroundJobs\\CheckSubscription','null',0,1680772755,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(19,'OCA\\UserStatus\\BackgroundJob\\ClearOldStatusesBackgroundJob','null',0,1680772757,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(20,'OCA\\Photos\\Jobs\\AutomaticPlaceMapperJob','null',0,1680772758,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(21,'OCA\\Activity\\BackgroundJob\\EmailNotification','null',0,1680772760,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(22,'OCA\\Activity\\BackgroundJob\\ExpireActivities','null',0,1680772760,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(23,'OCA\\Activity\\BackgroundJob\\DigestMail','null',0,1680772760,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(24,'OCA\\DAV\\BackgroundJob\\CleanupDirectLinksJob','null',0,1680772761,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(25,'OCA\\DAV\\BackgroundJob\\UpdateCalendarResourcesRoomsBackgroundJob','null',0,1680772761,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(26,'OCA\\DAV\\BackgroundJob\\CleanupInvitationTokenJob','null',0,1680772761,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(27,'OCA\\DAV\\BackgroundJob\\EventReminderJob','null',0,1680772761,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(28,'OCA\\DAV\\BackgroundJob\\CalendarRetentionJob','null',0,1680772761,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(29,'OCA\\DAV\\BackgroundJob\\PruneOutdatedSyncTokensJob','null',0,1680772761,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(30,'OCA\\WorkflowEngine\\BackgroundJobs\\Rotate','null',0,1680772762,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(31,'OCA\\Federation\\SyncJob','null',0,1680772763,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(32,'OCA\\ServerInfo\\Jobs\\UpdateStorageStats','null',0,1680772763,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(33,'OC\\Authentication\\Token\\TokenCleanupJob','null',0,1680772763,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(34,'OC\\Log\\Rotate','null',0,1680772763,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(35,'OC\\Preview\\BackgroundCleanupJob','null',0,1680772763,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(36,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[11]',0,1680772764,0,0,'08125771f76bc5a8b30ae86dc46559b9',1),(37,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[12]',0,1680772764,0,0,'d0d0c96e4d7b5e589fb4b259e6a1b548',1),(38,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[13]',0,1680772764,0,0,'15f019b4deb70b75c09cbc1ae50533a4',1),(39,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[14]',0,1680772764,0,0,'3e81ce73386e4533046fd31398e88dc5',1),(40,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[16]',0,1680772764,0,0,'862b1a80c2e208d065f30ab219e9d4ee',1),(41,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[17]',0,1680772764,0,0,'509256506b03a8cdb6c4d551ab925465',1),(42,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[18]',0,1680772764,0,0,'2b31d81be4acf04664cbf25a4eeefa4e',1),(43,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[19]',0,1680772764,0,0,'1a8444f464498dc6616af6a29f4ff6cd',1),(44,'OCA\\Photos\\Jobs\\MapMediaToPlaceJob','[20]',0,1680772764,0,0,'baa9a061c77c119b99e6a82b1e741fdc',1),(45,'OCA\\Calendar\\BackgroundJob\\CleanUpOutdatedBookingsJob','null',0,1680772802,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(46,'OCA\\Contacts\\Cron\\SocialUpdateRegistration','null',0,1680772805,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(47,'OCA\\Mail\\BackgroundJob\\CleanupJob','null',0,1680772820,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(48,'OCA\\Mail\\BackgroundJob\\OutboxWorkerJob','null',0,1680772820,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(49,'OCA\\Mail\\BackgroundJob\\IMipMessageJob','null',0,1680772820,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(50,'OCA\\Richdocuments\\Backgroundjobs\\ObtainCapabilities','null',0,1680772826,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(51,'OCA\\Richdocuments\\Backgroundjobs\\Cleanup','null',0,1680772826,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(52,'OCA\\Talk\\BackgroundJob\\ExpireSignalingMessage','null',0,1680772847,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(53,'OCA\\Talk\\BackgroundJob\\RemoveEmptyRooms','null',0,1680772847,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(54,'OCA\\Talk\\BackgroundJob\\ResetAssignedSignalingServer','null',0,1680772847,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(55,'OCA\\Talk\\BackgroundJob\\CheckReferenceIdColumn','null',0,1680772847,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(56,'OCA\\Talk\\BackgroundJob\\CheckHostedSignalingServer','null',0,1680772847,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(57,'OCA\\Talk\\BackgroundJob\\CheckMatterbridges','null',0,1680772847,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(58,'OCA\\Talk\\BackgroundJob\\ExpireChatMessages','null',0,1680772847,0,0,'37a6259cc0c1dae299a7866489dff0bd',1),(59,'OCA\\FirstRunWizard\\Notification\\BackgroundJob','{\"uid\":\"admin\"}',0,1680772848,0,0,'b974bbc90ef800c3b1539ac4f2aeddb7',1);
/*!40000 ALTER TABLE `oc_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_known_users`
--

DROP TABLE IF EXISTS `oc_known_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_known_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `known_to` varchar(255) NOT NULL,
  `known_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ku_known_to` (`known_to`),
  KEY `ku_known_user` (`known_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_known_users`
--

LOCK TABLES `oc_known_users` WRITE;
/*!40000 ALTER TABLE `oc_known_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_known_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_login_flow_v2`
--

DROP TABLE IF EXISTS `oc_login_flow_v2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_login_flow_v2` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) unsigned NOT NULL,
  `started` smallint(5) unsigned NOT NULL DEFAULT 0,
  `poll_token` varchar(255) NOT NULL,
  `login_token` varchar(255) NOT NULL,
  `public_key` text NOT NULL,
  `private_key` text NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `server` varchar(255) DEFAULT NULL,
  `app_password` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `poll_token` (`poll_token`),
  UNIQUE KEY `login_token` (`login_token`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_login_flow_v2`
--

LOCK TABLES `oc_login_flow_v2` WRITE;
/*!40000 ALTER TABLE `oc_login_flow_v2` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_login_flow_v2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_accounts`
--

DROP TABLE IF EXISTS `oc_mail_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `inbound_host` varchar(64) NOT NULL DEFAULT '',
  `inbound_port` varchar(6) NOT NULL DEFAULT '',
  `inbound_ssl_mode` varchar(10) NOT NULL DEFAULT '',
  `inbound_user` varchar(64) NOT NULL DEFAULT '',
  `inbound_password` varchar(2048) DEFAULT NULL,
  `outbound_host` varchar(64) DEFAULT NULL,
  `outbound_port` varchar(6) DEFAULT NULL,
  `outbound_ssl_mode` varchar(10) DEFAULT NULL,
  `outbound_user` varchar(64) DEFAULT NULL,
  `outbound_password` varchar(2048) DEFAULT NULL,
  `signature` text DEFAULT NULL,
  `last_mailbox_sync` int(11) NOT NULL DEFAULT 0,
  `editor_mode` varchar(64) NOT NULL DEFAULT 'plaintext',
  `order` int(11) NOT NULL DEFAULT 1,
  `show_subscribed_only` tinyint(1) DEFAULT 0,
  `personal_namespace` varchar(255) DEFAULT NULL,
  `drafts_mailbox_id` int(11) DEFAULT NULL,
  `sent_mailbox_id` int(11) DEFAULT NULL,
  `trash_mailbox_id` int(11) DEFAULT NULL,
  `sieve_enabled` tinyint(1) DEFAULT 0,
  `sieve_host` varchar(64) DEFAULT NULL,
  `sieve_port` varchar(6) DEFAULT NULL,
  `sieve_ssl_mode` varchar(10) DEFAULT NULL,
  `sieve_user` varchar(64) DEFAULT NULL,
  `sieve_password` varchar(2048) DEFAULT NULL,
  `provisioning_id` int(11) DEFAULT NULL,
  `signature_above_quote` tinyint(1) DEFAULT 0,
  `signature_mode` smallint(6) NOT NULL DEFAULT 0,
  `auth_method` varchar(255) NOT NULL DEFAULT 'password',
  `archive_mailbox_id` int(11) DEFAULT NULL,
  `oauth_refresh_token` varchar(3000) DEFAULT NULL,
  `oauth_token_ttl` int(11) DEFAULT NULL,
  `oauth_access_token` longtext DEFAULT NULL,
  `smime_certificate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_userid_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_accounts`
--

LOCK TABLES `oc_mail_accounts` WRITE;
/*!40000 ALTER TABLE `oc_mail_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_aliases`
--

DROP TABLE IF EXISTS `oc_mail_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL,
  `signature` text DEFAULT NULL,
  `signature_mode` smallint(6) NOT NULL DEFAULT 0,
  `smime_certificate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_aliases`
--

LOCK TABLES `oc_mail_aliases` WRITE;
/*!40000 ALTER TABLE `oc_mail_aliases` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_attachments`
--

DROP TABLE IF EXISTS `oc_mail_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_message_id` int(11) DEFAULT NULL,
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT 0,
  `mime_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_attach_userid_index` (`user_id`),
  KEY `IDX_6C63D3AD31594979` (`local_message_id`),
  CONSTRAINT `attachment_local_message` FOREIGN KEY (`local_message_id`) REFERENCES `oc_mail_local_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_attachments`
--

LOCK TABLES `oc_mail_attachments` WRITE;
/*!40000 ALTER TABLE `oc_mail_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_classifiers`
--

DROP TABLE IF EXISTS `oc_mail_classifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_classifiers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `estimator` varchar(255) NOT NULL,
  `app_version` varchar(31) NOT NULL,
  `training_set_size` int(11) NOT NULL,
  `validation_set_size` int(11) NOT NULL,
  `recall_important` decimal(10,5) NOT NULL,
  `precision_important` decimal(10,5) NOT NULL,
  `f1_score_important` decimal(10,5) NOT NULL,
  `duration` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT 0,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_clssfr_accnt_id_type` (`account_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_classifiers`
--

LOCK TABLES `oc_mail_classifiers` WRITE;
/*!40000 ALTER TABLE `oc_mail_classifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_classifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_coll_addresses`
--

DROP TABLE IF EXISTS `oc_mail_coll_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_coll_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_coll_addr_userid_index` (`user_id`),
  KEY `mail_coll_addr_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_coll_addresses`
--

LOCK TABLES `oc_mail_coll_addresses` WRITE;
/*!40000 ALTER TABLE `oc_mail_coll_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_coll_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_local_messages`
--

DROP TABLE IF EXISTS `oc_mail_local_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_local_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(10) unsigned NOT NULL,
  `account_id` int(11) NOT NULL,
  `alias_id` int(11) DEFAULT NULL,
  `send_at` int(11) DEFAULT NULL,
  `subject` tinytext NOT NULL,
  `body` longtext NOT NULL,
  `html` tinyint(1) DEFAULT 0,
  `in_reply_to_message_id` text DEFAULT NULL,
  `failed` tinyint(1) DEFAULT 0,
  `editor_body` longtext DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `smime_sign` tinyint(1) DEFAULT 0,
  `smime_certificate_id` int(11) DEFAULT NULL,
  `smime_encrypt` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_local_messages`
--

LOCK TABLES `oc_mail_local_messages` WRITE;
/*!40000 ALTER TABLE `oc_mail_local_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_local_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_mailboxes`
--

DROP TABLE IF EXISTS `oc_mail_mailboxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_mailboxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `account_id` int(11) NOT NULL,
  `attributes` varchar(255) NOT NULL DEFAULT '[]',
  `delimiter` varchar(1) DEFAULT NULL,
  `messages` int(11) NOT NULL,
  `unseen` int(11) NOT NULL,
  `selectable` tinyint(1) DEFAULT 0,
  `special_use` varchar(255) NOT NULL DEFAULT '[]',
  `sync_new_lock` int(11) DEFAULT NULL,
  `sync_changed_lock` int(11) DEFAULT NULL,
  `sync_vanished_lock` int(11) DEFAULT NULL,
  `sync_new_token` varchar(255) DEFAULT NULL,
  `sync_changed_token` varchar(255) DEFAULT NULL,
  `sync_vanished_token` varchar(255) DEFAULT NULL,
  `sync_in_background` tinyint(1) DEFAULT 0,
  `my_acls` varchar(32) DEFAULT NULL,
  `shared` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_22DEBD839B6B5FBA5E237E06` (`account_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_mailboxes`
--

LOCK TABLES `oc_mail_mailboxes` WRITE;
/*!40000 ALTER TABLE `oc_mail_mailboxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_mailboxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_message_tags`
--

DROP TABLE IF EXISTS `oc_mail_message_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_message_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imap_message_id` varchar(1023) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_msg_imap_id_idx` (`imap_message_id`(128))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_message_tags`
--

LOCK TABLES `oc_mail_message_tags` WRITE;
/*!40000 ALTER TABLE `oc_mail_message_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_message_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_messages`
--

DROP TABLE IF EXISTS `oc_mail_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `message_id` varchar(1023) DEFAULT NULL,
  `mailbox_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `sent_at` int(11) NOT NULL,
  `flag_answered` tinyint(1) DEFAULT 0,
  `flag_deleted` tinyint(1) DEFAULT 0,
  `flag_draft` tinyint(1) DEFAULT 0,
  `flag_flagged` tinyint(1) DEFAULT 0,
  `flag_seen` tinyint(1) DEFAULT 0,
  `flag_forwarded` tinyint(1) DEFAULT 0,
  `flag_junk` tinyint(1) DEFAULT 0,
  `flag_notjunk` tinyint(1) DEFAULT 0,
  `flag_attachments` tinyint(1) DEFAULT 0,
  `flag_important` tinyint(1) DEFAULT 0,
  `structure_analyzed` tinyint(1) DEFAULT 0,
  `preview_text` varchar(255) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `references` longtext DEFAULT NULL,
  `in_reply_to` varchar(1023) DEFAULT NULL,
  `thread_root_id` varchar(1023) DEFAULT NULL,
  `flag_mdnsent` tinyint(1) DEFAULT 0,
  `imip_message` tinyint(1) DEFAULT 0,
  `imip_processed` tinyint(1) DEFAULT 0,
  `imip_error` tinyint(1) DEFAULT 0,
  `encrypted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `mail_messages_id_flags` (`mailbox_id`,`flag_important`,`flag_deleted`,`flag_seen`),
  KEY `mail_messages_id_flags2` (`mailbox_id`,`flag_deleted`,`flag_flagged`),
  KEY `mail_messages_mailbox_id` (`mailbox_id`),
  KEY `mail_msg_thrd_root_snt_idx` (`mailbox_id`,`thread_root_id`(64),`sent_at`),
  KEY `mail_messages_mb_id_uid` (`mailbox_id`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_messages`
--

LOCK TABLES `oc_mail_messages` WRITE;
/*!40000 ALTER TABLE `oc_mail_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_provisionings`
--

DROP TABLE IF EXISTS `oc_mail_provisionings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_provisionings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provisioning_domain` varchar(63) NOT NULL DEFAULT '',
  `email_template` varchar(255) NOT NULL DEFAULT '',
  `imap_user` varchar(128) NOT NULL DEFAULT '',
  `imap_host` varchar(255) NOT NULL DEFAULT '',
  `imap_port` smallint(5) unsigned NOT NULL,
  `imap_ssl_mode` varchar(64) NOT NULL DEFAULT '',
  `smtp_user` varchar(128) NOT NULL DEFAULT '',
  `smtp_host` varchar(255) NOT NULL DEFAULT '',
  `smtp_port` smallint(5) unsigned NOT NULL,
  `smtp_ssl_mode` varchar(64) NOT NULL DEFAULT '',
  `sieve_enabled` tinyint(1) DEFAULT 0,
  `sieve_user` varchar(128) DEFAULT NULL,
  `sieve_host` varchar(128) DEFAULT NULL,
  `sieve_port` smallint(5) unsigned DEFAULT NULL,
  `sieve_ssl_mode` varchar(64) DEFAULT NULL,
  `ldap_aliases_provisioning` tinyint(1) DEFAULT 0,
  `ldap_aliases_attribute` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_provsng_dm_idx` (`provisioning_domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_provisionings`
--

LOCK TABLES `oc_mail_provisionings` WRITE;
/*!40000 ALTER TABLE `oc_mail_provisionings` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_provisionings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_recipients`
--

DROP TABLE IF EXISTS `oc_mail_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_recipients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `local_message_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_recipient_msg_id_idx` (`message_id`),
  KEY `mail_recipient_email_idx` (`email`),
  KEY `IDX_715DB7E31594979` (`local_message_id`),
  CONSTRAINT `recipient_local_message` FOREIGN KEY (`local_message_id`) REFERENCES `oc_mail_local_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_recipients`
--

LOCK TABLES `oc_mail_recipients` WRITE;
/*!40000 ALTER TABLE `oc_mail_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_smime_certificates`
--

DROP TABLE IF EXISTS `oc_mail_smime_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_smime_certificates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `email_address` varchar(255) NOT NULL,
  `certificate` longtext NOT NULL,
  `private_key` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_smime_certs_uid_idx` (`user_id`),
  KEY `mail_smime_certs_id_uid_idx` (`id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_smime_certificates`
--

LOCK TABLES `oc_mail_smime_certificates` WRITE;
/*!40000 ALTER TABLE `oc_mail_smime_certificates` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_smime_certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_tags`
--

DROP TABLE IF EXISTS `oc_mail_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `imap_label` varchar(64) NOT NULL,
  `display_name` varchar(128) NOT NULL,
  `color` varchar(9) DEFAULT '#fff',
  `is_default_tag` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_msg_tags_usr_lbl_idx` (`user_id`,`imap_label`),
  KEY `mail_msg_tags_usr_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_tags`
--

LOCK TABLES `oc_mail_tags` WRITE;
/*!40000 ALTER TABLE `oc_mail_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mail_trusted_senders`
--

DROP TABLE IF EXISTS `oc_mail_trusted_senders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mail_trusted_senders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'individual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail_trusted_sender_uniq` (`email`,`user_id`),
  KEY `mail_trusted_senders_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mail_trusted_senders`
--

LOCK TABLES `oc_mail_trusted_senders` WRITE;
/*!40000 ALTER TABLE `oc_mail_trusted_senders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_mail_trusted_senders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_migrations`
--

DROP TABLE IF EXISTS `oc_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_migrations` (
  `app` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`app`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_migrations`
--

LOCK TABLES `oc_migrations` WRITE;
/*!40000 ALTER TABLE `oc_migrations` DISABLE KEYS */;
INSERT INTO `oc_migrations` VALUES ('activity','2006Date20170808154933'),('activity','2006Date20170808155040'),('activity','2006Date20170919095939'),('activity','2007Date20181107114613'),('activity','2008Date20181011095117'),('activity','2010Date20190416112817'),('activity','2011Date20201006132544'),('activity','2011Date20201006132545'),('activity','2011Date20201006132546'),('activity','2011Date20201006132547'),('activity','2011Date20201207091915'),('calendar','2040Date20210908101001'),('calendar','3000Date20211109132439'),('calendar','3010Date20220111090252'),('circles','0022Date20220526111723'),('circles','0022Date20220526113601'),('circles','0022Date20220703115023'),('circles','0023Date20211216113101'),('circles','0024Date20220203123901'),('circles','0024Date20220203123902'),('circles','0024Date20220317190331'),('contactsinteraction','010000Date20200304152605'),('core','13000Date20170705121758'),('core','13000Date20170718121200'),('core','13000Date20170814074715'),('core','13000Date20170919121250'),('core','13000Date20170926101637'),('core','14000Date20180129121024'),('core','14000Date20180404140050'),('core','14000Date20180516101403'),('core','14000Date20180518120534'),('core','14000Date20180522074438'),('core','14000Date20180626223656'),('core','14000Date20180710092004'),('core','14000Date20180712153140'),('core','15000Date20180926101451'),('core','15000Date20181015062942'),('core','15000Date20181029084625'),('core','16000Date20190207141427'),('core','16000Date20190212081545'),('core','16000Date20190427105638'),('core','16000Date20190428150708'),('core','17000Date20190514105811'),('core','18000Date20190920085628'),('core','18000Date20191014105105'),('core','18000Date20191204114856'),('core','19000Date20200211083441'),('core','20000Date20201109081915'),('core','20000Date20201109081918'),('core','20000Date20201109081919'),('core','20000Date20201111081915'),('core','21000Date20201120141228'),('core','21000Date20201202095923'),('core','21000Date20210119195004'),('core','21000Date20210309185126'),('core','21000Date20210309185127'),('core','22000Date20210216080825'),('core','23000Date20210721100600'),('core','23000Date20210906132259'),('core','23000Date20210930122352'),('core','23000Date20211203110726'),('core','23000Date20211213203940'),('core','24000Date20211210141942'),('core','24000Date20211213081506'),('core','24000Date20211213081604'),('core','24000Date20211222112246'),('core','24000Date20211230140012'),('core','24000Date20220131153041'),('core','24000Date20220202150027'),('core','24000Date20220404230027'),('core','24000Date20220425072957'),('core','25000Date20220515204012'),('core','25000Date20220602190540'),('core','25000Date20220905140840'),('core','25000Date20221007010957'),('dav','1004Date20170825134824'),('dav','1004Date20170919104507'),('dav','1004Date20170924124212'),('dav','1004Date20170926103422'),('dav','1005Date20180413093149'),('dav','1005Date20180530124431'),('dav','1006Date20180619154313'),('dav','1006Date20180628111625'),('dav','1008Date20181030113700'),('dav','1008Date20181105104826'),('dav','1008Date20181105104833'),('dav','1008Date20181105110300'),('dav','1008Date20181105112049'),('dav','1008Date20181114084440'),('dav','1011Date20190725113607'),('dav','1011Date20190806104428'),('dav','1012Date20190808122342'),('dav','1016Date20201109085907'),('dav','1017Date20210216083742'),('dav','1018Date20210312100735'),('dav','1024Date20211221144219'),('federatedfilesharing','1010Date20200630191755'),('federatedfilesharing','1011Date20201120125158'),('federation','1010Date20200630191302'),('files','11301Date20191205150729'),('files','12101Date20221011153334'),('files_sharing','11300Date20201120141438'),('files_sharing','21000Date20201223143245'),('files_sharing','22000Date20210216084241'),('files_sharing','24000Date20220208195521'),('files_sharing','24000Date20220404142216'),('files_trashbin','1010Date20200630192639'),('files_versions','1020Date20221114144058'),('mail','0100Date20180825194217'),('mail','0110Date20180825195812'),('mail','0110Date20180825201241'),('mail','0130Date20190408134101'),('mail','0156Date20190828140357'),('mail','0161Date20190902103559'),('mail','0161Date20190902103701'),('mail','0161Date20190902114635'),('mail','0180Date20190927124207'),('mail','0190Date20191118160843'),('mail','0210Date20191212144925'),('mail','1020Date20191002091034'),('mail','1020Date20191002091035'),('mail','1020Date20200206134751'),('mail','1030Date20200228105714'),('mail','1040Date20200422130220'),('mail','1040Date20200422142920'),('mail','1040Date20200506111214'),('mail','1040Date20200515080614'),('mail','1040Date20200529124657'),('mail','1050Date20200624101359'),('mail','1050Date20200831124954'),('mail','1050Date20200921141700'),('mail','1050Date20200923180030'),('mail','1060Date20201015084952'),('mail','1080Date20201119084820'),('mail','1080Date20210108093802'),('mail','1090Date20210127160127'),('mail','1090Date20210216154409'),('mail','1096Date20210407150016'),('mail','1100Date20210304143008'),('mail','1100Date20210317164707'),('mail','1100Date20210326103929'),('mail','1100Date20210409091311'),('mail','1100Date20210419080523'),('mail','1100Date20210419121734'),('mail','1100Date20210421113423'),('mail','1100Date20210512142306'),('mail','1101Date20210616141806'),('mail','1105Date20210922104324'),('mail','1110Date20210908114229'),('mail','1115Date20211216144446'),('mail','1120Date20220223094709'),('mail','1124Date20220531094751'),('mail','1124Date20220601084530'),('mail','1130Date20220412111833'),('mail','1130Date20220520062301'),('mail','1140Date20220628174152'),('mail','1140Date20220701103556'),('mail','1140Date20220808203258'),('mail','1140Date20221027171138'),('mail','1140Date20221113205737'),('mail','1140Date20221206162029'),('mail','2000Date20220908130842'),('mail','2010Date20221002201527'),('mail','2020Date20221103140538'),('mail','2100Date20221013143851'),('mail','2300Date20221205160349'),('mail','2300Date20221215143450'),('mail','2300Date20221216115727'),('mail','2300Date20230120085320'),('mail','2300Date20230127093733'),('mail','2300Date20230214104736'),('mail','2300Date20230221170502'),('mail','3000Date20230301152454'),('notes','3005Date20200528204430'),('notes','3005Date20200528204431'),('notifications','2004Date20190107135757'),('notifications','2010Date20210218082811'),('notifications','2010Date20210218082855'),('notifications','2011Date20210930134607'),('notifications','2011Date20220826074907'),('oauth2','010401Date20181207190718'),('oauth2','010402Date20190107124745'),('photos','20000Date20220727125801'),('photos','20001Date20220830131446'),('photos','20003Date20221102170153'),('photos','20003Date20221103094628'),('privacy','100Date20190217131943'),('richdocuments','2060Date20200302131958'),('richdocuments','2060Date20200302132145'),('richdocuments','30704Date20200626072306'),('richdocuments','30709Date20201111104147'),('richdocuments','30717Date20210310164901'),('richdocuments','50200Date20211220212457'),('spreed','10000Date20200819121721'),('spreed','10000Date20201012144235'),('spreed','10000Date20201015134000'),('spreed','10000Date20201015143852'),('spreed','10000Date20201015150000'),('spreed','11000Date20200922161218'),('spreed','11000Date20201011082810'),('spreed','11000Date20201201102528'),('spreed','11000Date20201204110210'),('spreed','11000Date20201209142525'),('spreed','11000Date20201209142526'),('spreed','11001Date20210211111527'),('spreed','11001Date20210212105406'),('spreed','12000Date20210217134030'),('spreed','12000Date20210401124139'),('spreed','12000Date20210528100404'),('spreed','13000Date20210625232111'),('spreed','13000Date20210901164235'),('spreed','13000Date20210921142733'),('spreed','13000Date20211007192733'),('spreed','14000Date20211203132513'),('spreed','14000Date20220217115327'),('spreed','14000Date20220328153054'),('spreed','14000Date20220330141647'),('spreed','15000Date20220427183026'),('spreed','15000Date20220503121308'),('spreed','15000Date20220506005058'),('spreed','16000Date20221110151714'),('spreed','16000Date20221116163301'),('spreed','16000Date20221208013745'),('spreed','2000Date20170707093535'),('spreed','2000Date20171026140256'),('spreed','2000Date20171026140257'),('spreed','2001Date20170707115443'),('spreed','2001Date20170913104501'),('spreed','2001Date20170921145301'),('spreed','2001Date20170929092606'),('spreed','2001Date20171009132424'),('spreed','2001Date20171026134605'),('spreed','2001Date20171026141336'),('spreed','2001Date20171031102049'),('spreed','2001Date20180103144447'),('spreed','2001Date20180103150836'),('spreed','3002Date20180319104030'),('spreed','3003Date20180707222130'),('spreed','3003Date20180718112436'),('spreed','3003Date20180718133519'),('spreed','3003Date20180720162342'),('spreed','3003Date20180722152733'),('spreed','3003Date20180722152849'),('spreed','3003Date20180730080327'),('spreed','4099Date20181001123058'),('spreed','5099Date20190121102337'),('spreed','5099Date20190319134820'),('spreed','6099Date20190627172429'),('spreed','7000Date20190717141457'),('spreed','7000Date20190724121136'),('spreed','7000Date20190724121137'),('spreed','8000Date20200331144101'),('spreed','8000Date20200402124456'),('spreed','8000Date20200407073807'),('spreed','8000Date20200407115318'),('text','010000Date20190617184535'),('text','030001Date20200402075029'),('text','030201Date20201116110353'),('text','030201Date20201116123153'),('text','030501Date20220202101853'),('text','030701Date20230207131313'),('twofactor_backupcodes','1002Date20170607104347'),('twofactor_backupcodes','1002Date20170607113030'),('twofactor_backupcodes','1002Date20170919123342'),('twofactor_backupcodes','1002Date20170926101419'),('twofactor_backupcodes','1002Date20180821043638'),('user_status','0001Date20200602134824'),('user_status','0002Date20200902144824'),('user_status','1000Date20201111130204'),('user_status','2301Date20210809144824'),('workflowengine','2000Date20190808074233'),('workflowengine','2200Date20210805101925');
/*!40000 ALTER TABLE `oc_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mimetypes`
--

DROP TABLE IF EXISTS `oc_mimetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mimetypes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mimetype` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mimetype_id_index` (`mimetype`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mimetypes`
--

LOCK TABLES `oc_mimetypes` WRITE;
/*!40000 ALTER TABLE `oc_mimetypes` DISABLE KEYS */;
INSERT INTO `oc_mimetypes` VALUES (3,'application'),(19,'application/gzip'),(18,'application/javascript'),(20,'application/json'),(16,'application/octet-stream'),(4,'application/pdf'),(13,'application/vnd.oasis.opendocument.graphics'),(15,'application/vnd.oasis.opendocument.presentation'),(12,'application/vnd.oasis.opendocument.spreadsheet'),(14,'application/vnd.oasis.opendocument.text'),(17,'application/vnd.openxmlformats-officedocument.wordprocessingml.document'),(1,'httpd'),(2,'httpd/unix-directory'),(9,'image'),(10,'image/jpeg'),(11,'image/png'),(21,'image/svg+xml'),(7,'text'),(8,'text/markdown'),(5,'video'),(6,'video/mp4');
/*!40000 ALTER TABLE `oc_mimetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_mounts`
--

DROP TABLE IF EXISTS `oc_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_mounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `storage_id` bigint(20) NOT NULL,
  `root_id` bigint(20) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `mount_point` varchar(4000) NOT NULL,
  `mount_id` bigint(20) DEFAULT NULL,
  `mount_provider_class` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mounts_user_root_index` (`user_id`,`root_id`),
  KEY `mounts_storage_index` (`storage_id`),
  KEY `mounts_root_index` (`root_id`),
  KEY `mounts_mount_id_index` (`mount_id`),
  KEY `mounts_class_index` (`mount_provider_class`),
  KEY `mount_user_storage` (`storage_id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_mounts`
--

LOCK TABLES `oc_mounts` WRITE;
/*!40000 ALTER TABLE `oc_mounts` DISABLE KEYS */;
INSERT INTO `oc_mounts` VALUES (1,1,1,'admin','/admin/',NULL,'OC\\Files\\Mount\\LocalHomeMountProvider');
/*!40000 ALTER TABLE `oc_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notes_meta`
--

DROP TABLE IF EXISTS `oc_notes_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notes_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_id` int(11) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `last_update` int(11) NOT NULL,
  `etag` varchar(32) NOT NULL,
  `content_etag` varchar(32) NOT NULL,
  `file_etag` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notes_meta_file_user_index` (`file_id`,`user_id`),
  KEY `notes_meta_file_id_index` (`file_id`),
  KEY `notes_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notes_meta`
--

LOCK TABLES `oc_notes_meta` WRITE;
/*!40000 ALTER TABLE `oc_notes_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notes_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications`
--

DROP TABLE IF EXISTS `oc_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(32) NOT NULL,
  `user` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT 0,
  `object_type` varchar(64) NOT NULL,
  `object_id` varchar(64) NOT NULL,
  `subject` varchar(64) NOT NULL,
  `subject_parameters` longtext DEFAULT NULL,
  `message` varchar(64) DEFAULT NULL,
  `message_parameters` longtext DEFAULT NULL,
  `link` varchar(4000) DEFAULT NULL,
  `icon` varchar(4000) DEFAULT NULL,
  `actions` longtext DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `oc_notifications_app` (`app`),
  KEY `oc_notifications_user` (`user`),
  KEY `oc_notifications_timestamp` (`timestamp`),
  KEY `oc_notifications_object` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications`
--

LOCK TABLES `oc_notifications` WRITE;
/*!40000 ALTER TABLE `oc_notifications` DISABLE KEYS */;
INSERT INTO `oc_notifications` VALUES (1,'firstrunwizard','admin',1680772848,'app','recognize','apphint-recognize','[]','','[]','','','[]'),(2,'firstrunwizard','admin',1680772848,'app','groupfolders','apphint-groupfolders','[]','','[]','','','[]'),(3,'firstrunwizard','admin',1680772848,'app','forms','apphint-forms','[]','','[]','','','[]'),(4,'firstrunwizard','admin',1680772848,'app','deck','apphint-deck','[]','','[]','','','[]'),(5,'firstrunwizard','admin',1680772848,'app','tasks','apphint-tasks','[]','','[]','','','[]');
/*!40000 ALTER TABLE `oc_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_pushhash`
--

DROP TABLE IF EXISTS `oc_notifications_pushhash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_pushhash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `token` int(11) NOT NULL DEFAULT 0,
  `deviceidentifier` varchar(128) NOT NULL,
  `devicepublickey` varchar(512) NOT NULL,
  `devicepublickeyhash` varchar(128) NOT NULL,
  `pushtokenhash` varchar(128) NOT NULL,
  `proxyserver` varchar(256) NOT NULL,
  `apptype` varchar(32) NOT NULL DEFAULT 'unknown',
  PRIMARY KEY (`id`),
  UNIQUE KEY `oc_npushhash_uid` (`uid`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_pushhash`
--

LOCK TABLES `oc_notifications_pushhash` WRITE;
/*!40000 ALTER TABLE `oc_notifications_pushhash` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_notifications_pushhash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notifications_settings`
--

DROP TABLE IF EXISTS `oc_notifications_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notifications_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `batch_time` int(11) NOT NULL DEFAULT 0,
  `last_send_id` bigint(20) NOT NULL DEFAULT 0,
  `next_send_time` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `notset_user` (`user_id`),
  KEY `notset_nextsend` (`next_send_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notifications_settings`
--

LOCK TABLES `oc_notifications_settings` WRITE;
/*!40000 ALTER TABLE `oc_notifications_settings` DISABLE KEYS */;
INSERT INTO `oc_notifications_settings` VALUES (1,'admin',0,0,0);
/*!40000 ALTER TABLE `oc_notifications_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_access_tokens`
--

DROP TABLE IF EXISTS `oc_oauth2_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_access_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `hashed_code` varchar(128) NOT NULL,
  `encrypted_token` varchar(786) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_access_hash_idx` (`hashed_code`),
  KEY `oauth2_access_client_id_idx` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_access_tokens`
--

LOCK TABLES `oc_oauth2_access_tokens` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_oauth2_clients`
--

DROP TABLE IF EXISTS `oc_oauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_oauth2_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `client_identifier` varchar(64) NOT NULL,
  `secret` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_client_id_idx` (`client_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_oauth2_clients`
--

LOCK TABLES `oc_oauth2_clients` WRITE;
/*!40000 ALTER TABLE `oc_oauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_oauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_open_local_editor`
--

DROP TABLE IF EXISTS `oc_open_local_editor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_open_local_editor` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `path_hash` varchar(64) NOT NULL,
  `expiration_time` bigint(20) unsigned NOT NULL,
  `token` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openlocal_user_path_token` (`user_id`,`path_hash`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_open_local_editor`
--

LOCK TABLES `oc_open_local_editor` WRITE;
/*!40000 ALTER TABLE `oc_open_local_editor` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_open_local_editor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums`
--

DROP TABLE IF EXISTS `oc_photos_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums` (
  `album_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `created` bigint(20) NOT NULL,
  `location` varchar(255) NOT NULL,
  `last_added_photo` bigint(20) NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `pa_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums`
--

LOCK TABLES `oc_photos_albums` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_collabs`
--

DROP TABLE IF EXISTS `oc_photos_albums_collabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_collabs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `collaborator_id` varchar(64) NOT NULL,
  `collaborator_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album_collabs_uniq_collab` (`album_id`,`collaborator_id`,`collaborator_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_collabs`
--

LOCK TABLES `oc_photos_albums_collabs` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_collabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_photos_albums_files`
--

DROP TABLE IF EXISTS `oc_photos_albums_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_photos_albums_files` (
  `album_file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `added` bigint(20) NOT NULL,
  `owner` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`album_file_id`),
  UNIQUE KEY `paf_album_file` (`album_id`,`file_id`),
  KEY `paf_folder` (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_photos_albums_files`
--

LOCK TABLES `oc_photos_albums_files` WRITE;
/*!40000 ALTER TABLE `oc_photos_albums_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_photos_albums_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_preferences`
--

DROP TABLE IF EXISTS `oc_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_preferences` (
  `userid` varchar(64) NOT NULL DEFAULT '',
  `appid` varchar(32) NOT NULL DEFAULT '',
  `configkey` varchar(64) NOT NULL DEFAULT '',
  `configvalue` longtext DEFAULT NULL,
  PRIMARY KEY (`userid`,`appid`,`configkey`),
  KEY `preferences_app_key` (`appid`,`configkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_preferences`
--

LOCK TABLES `oc_preferences` WRITE;
/*!40000 ALTER TABLE `oc_preferences` DISABLE KEYS */;
INSERT INTO `oc_preferences` VALUES ('admin','activity','configured','yes'),('admin','avatar','generated','true'),('admin','core','lang','en'),('admin','core','templateDirectory','Templates/'),('admin','dashboard','firstRun','0'),('admin','firstrunwizard','apphint','18'),('admin','firstrunwizard','show','0'),('admin','login','lastLogin','1680772763'),('admin','notifications','sound_notification','no'),('admin','notifications','sound_talk','no'),('admin','password_policy','failedLoginAttempts','0'),('admin','spreed','changelog','43');
/*!40000 ALTER TABLE `oc_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_privacy_admins`
--

DROP TABLE IF EXISTS `oc_privacy_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_privacy_admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `displayname` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_privacy_admins`
--

LOCK TABLES `oc_privacy_admins` WRITE;
/*!40000 ALTER TABLE `oc_privacy_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_privacy_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_profile_config`
--

DROP TABLE IF EXISTS `oc_profile_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_profile_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL,
  `config` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_config_user_id_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_profile_config`
--

LOCK TABLES `oc_profile_config` WRITE;
/*!40000 ALTER TABLE `oc_profile_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_profile_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_properties`
--

DROP TABLE IF EXISTS `oc_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_properties` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) NOT NULL DEFAULT '',
  `propertypath` varchar(255) NOT NULL DEFAULT '',
  `propertyname` varchar(255) NOT NULL DEFAULT '',
  `propertyvalue` longtext NOT NULL,
  `valuetype` smallint(6) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `property_index` (`userid`),
  KEY `properties_path_index` (`userid`,`propertypath`),
  KEY `properties_pathonly_index` (`propertypath`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_properties`
--

LOCK TABLES `oc_properties` WRITE;
/*!40000 ALTER TABLE `oc_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_ratelimit_entries`
--

DROP TABLE IF EXISTS `oc_ratelimit_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_ratelimit_entries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hash` varchar(128) NOT NULL,
  `delete_after` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ratelimit_hash` (`hash`),
  KEY `ratelimit_delete_after` (`delete_after`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_ratelimit_entries`
--

LOCK TABLES `oc_ratelimit_entries` WRITE;
/*!40000 ALTER TABLE `oc_ratelimit_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_ratelimit_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_reactions`
--

DROP TABLE IF EXISTS `oc_reactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_reactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL,
  `message_id` bigint(20) unsigned NOT NULL,
  `actor_type` varchar(64) NOT NULL DEFAULT '',
  `actor_id` varchar(64) NOT NULL DEFAULT '',
  `reaction` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comment_reaction_unique` (`parent_id`,`actor_type`,`actor_id`,`reaction`),
  KEY `comment_reaction` (`reaction`),
  KEY `comment_reaction_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_reactions`
--

LOCK TABLES `oc_reactions` WRITE;
/*!40000 ALTER TABLE `oc_reactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_reactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_recent_contact`
--

DROP TABLE IF EXISTS `oc_recent_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_recent_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_uid` varchar(64) NOT NULL,
  `uid` varchar(64) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `federated_cloud_id` varchar(255) DEFAULT NULL,
  `card` longblob NOT NULL,
  `last_contact` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `recent_contact_actor_uid` (`actor_uid`),
  KEY `recent_contact_id_uid` (`id`,`actor_uid`),
  KEY `recent_contact_uid` (`uid`),
  KEY `recent_contact_email` (`email`),
  KEY `recent_contact_fed_id` (`federated_cloud_id`),
  KEY `recent_contact_last_contact` (`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_recent_contact`
--

LOCK TABLES `oc_recent_contact` WRITE;
/*!40000 ALTER TABLE `oc_recent_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_recent_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_richdocuments_assets`
--

DROP TABLE IF EXISTS `oc_richdocuments_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_richdocuments_assets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) DEFAULT NULL,
  `fileid` bigint(20) NOT NULL,
  `token` varchar(64) DEFAULT NULL,
  `timestamp` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd_assets_token_idx` (`token`),
  UNIQUE KEY `rd_assets_timestamp_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_richdocuments_assets`
--

LOCK TABLES `oc_richdocuments_assets` WRITE;
/*!40000 ALTER TABLE `oc_richdocuments_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_richdocuments_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_richdocuments_direct`
--

DROP TABLE IF EXISTS `oc_richdocuments_direct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_richdocuments_direct` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) DEFAULT NULL,
  `uid` varchar(64) DEFAULT NULL,
  `fileid` bigint(20) NOT NULL,
  `timestamp` bigint(20) unsigned DEFAULT 0,
  `template_destination` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `share` varchar(64) DEFAULT NULL,
  `initiator_host` varchar(255) DEFAULT NULL,
  `initiator_token` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd_direct_token_idx` (`token`),
  KEY `rd_direct_timestamp_idx` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_richdocuments_direct`
--

LOCK TABLES `oc_richdocuments_direct` WRITE;
/*!40000 ALTER TABLE `oc_richdocuments_direct` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_richdocuments_direct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_richdocuments_template`
--

DROP TABLE IF EXISTS `oc_richdocuments_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_richdocuments_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` varchar(64) DEFAULT NULL,
  `fileid` bigint(20) NOT NULL,
  `templateid` bigint(20) NOT NULL,
  `timestamp` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd_t_user_file` (`userid`,`fileid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_richdocuments_template`
--

LOCK TABLES `oc_richdocuments_template` WRITE;
/*!40000 ALTER TABLE `oc_richdocuments_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_richdocuments_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_richdocuments_wopi`
--

DROP TABLE IF EXISTS `oc_richdocuments_wopi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_richdocuments_wopi` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_uid` varchar(64) DEFAULT NULL,
  `editor_uid` varchar(64) DEFAULT NULL,
  `guest_displayname` varchar(64) DEFAULT NULL,
  `fileid` bigint(20) NOT NULL,
  `version` bigint(20) DEFAULT 0,
  `canwrite` tinyint(1) DEFAULT 0,
  `server_host` varchar(255) NOT NULL DEFAULT 'localhost',
  `token` varchar(32) DEFAULT '',
  `expiry` bigint(20) unsigned DEFAULT NULL,
  `template_destination` bigint(20) DEFAULT NULL,
  `template_id` bigint(20) DEFAULT NULL,
  `hide_download` tinyint(1) DEFAULT 0,
  `direct` tinyint(1) DEFAULT 0,
  `remote_server` varchar(255) DEFAULT '',
  `remote_server_token` varchar(32) DEFAULT '',
  `share` varchar(64) DEFAULT NULL,
  `token_type` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rd_wopi_token_idx` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_richdocuments_wopi`
--

LOCK TABLES `oc_richdocuments_wopi` WRITE;
/*!40000 ALTER TABLE `oc_richdocuments_wopi` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_richdocuments_wopi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_schedulingobjects`
--

DROP TABLE IF EXISTS `oc_schedulingobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_schedulingobjects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `principaluri` varchar(255) DEFAULT NULL,
  `calendardata` longblob DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `lastmodified` int(10) unsigned DEFAULT NULL,
  `etag` varchar(32) DEFAULT NULL,
  `size` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `schedulobj_principuri_index` (`principaluri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_schedulingobjects`
--

LOCK TABLES `oc_schedulingobjects` WRITE;
/*!40000 ALTER TABLE `oc_schedulingobjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_schedulingobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share`
--

DROP TABLE IF EXISTS `oc_share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `share_type` smallint(6) NOT NULL DEFAULT 0,
  `share_with` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `uid_owner` varchar(64) NOT NULL DEFAULT '',
  `uid_initiator` varchar(64) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `item_type` varchar(64) NOT NULL DEFAULT '',
  `item_source` varchar(255) DEFAULT NULL,
  `item_target` varchar(255) DEFAULT NULL,
  `file_source` bigint(20) DEFAULT NULL,
  `file_target` varchar(512) DEFAULT NULL,
  `permissions` smallint(6) NOT NULL DEFAULT 0,
  `stime` bigint(20) NOT NULL DEFAULT 0,
  `accepted` smallint(6) NOT NULL DEFAULT 0,
  `expiration` datetime DEFAULT NULL,
  `token` varchar(32) DEFAULT NULL,
  `mail_send` smallint(6) NOT NULL DEFAULT 0,
  `share_name` varchar(64) DEFAULT NULL,
  `password_by_talk` tinyint(1) DEFAULT 0,
  `note` longtext DEFAULT NULL,
  `hide_download` smallint(6) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL,
  `attributes` longtext DEFAULT NULL COMMENT '(DC2Type:json)',
  `password_expiration_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_share_type_index` (`item_type`,`share_type`),
  KEY `file_source_index` (`file_source`),
  KEY `token_index` (`token`),
  KEY `share_with_index` (`share_with`),
  KEY `parent_index` (`parent`),
  KEY `owner_index` (`uid_owner`),
  KEY `initiator_index` (`uid_initiator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share`
--

LOCK TABLES `oc_share` WRITE;
/*!40000 ALTER TABLE `oc_share` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_share_external`
--

DROP TABLE IF EXISTS `oc_share_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_share_external` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent` bigint(20) DEFAULT -1,
  `share_type` int(11) DEFAULT NULL,
  `remote` varchar(512) NOT NULL,
  `remote_id` varchar(255) DEFAULT '',
  `share_token` varchar(64) NOT NULL,
  `password` varchar(64) DEFAULT NULL,
  `name` varchar(4000) NOT NULL,
  `owner` varchar(64) NOT NULL,
  `user` varchar(64) NOT NULL,
  `mountpoint` varchar(4000) NOT NULL,
  `mountpoint_hash` varchar(32) NOT NULL,
  `accepted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sh_external_mp` (`user`,`mountpoint_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_share_external`
--

LOCK TABLES `oc_share_external` WRITE;
/*!40000 ALTER TABLE `oc_share_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_share_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages`
--

DROP TABLE IF EXISTS `oc_storages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages` (
  `numeric_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id` varchar(64) DEFAULT NULL,
  `available` int(11) NOT NULL DEFAULT 1,
  `last_checked` int(11) DEFAULT NULL,
  PRIMARY KEY (`numeric_id`),
  UNIQUE KEY `storages_id_index` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages`
--

LOCK TABLES `oc_storages` WRITE;
/*!40000 ALTER TABLE `oc_storages` DISABLE KEYS */;
INSERT INTO `oc_storages` VALUES (1,'home::admin',1,NULL),(2,'local::/var/www/html/data/',1,NULL);
/*!40000 ALTER TABLE `oc_storages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_storages_credentials`
--

DROP TABLE IF EXISTS `oc_storages_credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_storages_credentials` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(64) DEFAULT NULL,
  `identifier` varchar(64) NOT NULL,
  `credentials` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stocred_ui` (`user`,`identifier`),
  KEY `stocred_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_storages_credentials`
--

LOCK TABLES `oc_storages_credentials` WRITE;
/*!40000 ALTER TABLE `oc_storages_credentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_storages_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag`
--

DROP TABLE IF EXISTS `oc_systemtag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `visibility` smallint(6) NOT NULL DEFAULT 1,
  `editable` smallint(6) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_ident` (`name`,`visibility`,`editable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag`
--

LOCK TABLES `oc_systemtag` WRITE;
/*!40000 ALTER TABLE `oc_systemtag` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_group`
--

DROP TABLE IF EXISTS `oc_systemtag_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_group` (
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `gid` varchar(255) NOT NULL,
  PRIMARY KEY (`gid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_group`
--

LOCK TABLES `oc_systemtag_group` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_systemtag_object_mapping`
--

DROP TABLE IF EXISTS `oc_systemtag_object_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_systemtag_object_mapping` (
  `objectid` varchar(64) NOT NULL DEFAULT '',
  `objecttype` varchar(64) NOT NULL DEFAULT '',
  `systemtagid` bigint(20) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`objecttype`,`objectid`,`systemtagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_systemtag_object_mapping`
--

LOCK TABLES `oc_systemtag_object_mapping` WRITE;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_systemtag_object_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_attachments`
--

DROP TABLE IF EXISTS `oc_talk_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `message_id` bigint(20) unsigned NOT NULL,
  `message_time` bigint(20) unsigned NOT NULL,
  `object_type` varchar(64) NOT NULL,
  `actor_type` varchar(64) NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `objects_in_room` (`room_id`,`object_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_attachments`
--

LOCK TABLES `oc_talk_attachments` WRITE;
/*!40000 ALTER TABLE `oc_talk_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_attendees`
--

DROP TABLE IF EXISTS `oc_talk_attendees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_attendees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `actor_type` varchar(32) NOT NULL,
  `actor_id` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT '',
  `pin` varchar(32) DEFAULT NULL,
  `participant_type` smallint(5) unsigned NOT NULL DEFAULT 0,
  `favorite` tinyint(1) DEFAULT 0,
  `notification_level` int(11) DEFAULT 0,
  `last_joined_call` int(10) unsigned NOT NULL DEFAULT 0,
  `last_read_message` bigint(20) DEFAULT 0,
  `last_mention_message` bigint(20) DEFAULT 0,
  `read_privacy` smallint(5) unsigned DEFAULT 0,
  `access_token` varchar(64) DEFAULT NULL,
  `remote_id` varchar(255) DEFAULT NULL,
  `last_mention_direct` bigint(20) NOT NULL DEFAULT 0,
  `permissions` int(11) NOT NULL DEFAULT 0,
  `notification_calls` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ta_ident` (`room_id`,`actor_type`,`actor_id`),
  KEY `ta_roompin` (`room_id`,`pin`),
  KEY `ta_room` (`room_id`),
  KEY `ta_actor` (`actor_type`,`actor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_attendees`
--

LOCK TABLES `oc_talk_attendees` WRITE;
/*!40000 ALTER TABLE `oc_talk_attendees` DISABLE KEYS */;
INSERT INTO `oc_talk_attendees` VALUES (1,1,'users','admin','admin',NULL,3,0,0,0,1,0,0,NULL,NULL,0,0,1);
/*!40000 ALTER TABLE `oc_talk_attendees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_bridges`
--

DROP TABLE IF EXISTS `oc_talk_bridges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_bridges` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `json_values` longtext NOT NULL,
  `enabled` smallint(5) unsigned NOT NULL DEFAULT 0,
  `pid` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbr_room_id` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_bridges`
--

LOCK TABLES `oc_talk_bridges` WRITE;
/*!40000 ALTER TABLE `oc_talk_bridges` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_bridges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_commands`
--

DROP TABLE IF EXISTS `oc_talk_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(64) DEFAULT '',
  `name` varchar(64) NOT NULL,
  `command` varchar(64) NOT NULL,
  `script` longtext NOT NULL,
  `response` int(11) NOT NULL DEFAULT 1,
  `enabled` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_commands`
--

LOCK TABLES `oc_talk_commands` WRITE;
/*!40000 ALTER TABLE `oc_talk_commands` DISABLE KEYS */;
INSERT INTO `oc_talk_commands` VALUES (1,'','talk','help','help',1,3);
/*!40000 ALTER TABLE `oc_talk_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_internalsignaling`
--

DROP TABLE IF EXISTS `oc_talk_internalsignaling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_internalsignaling` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender` varchar(255) NOT NULL,
  `recipient` varchar(255) NOT NULL,
  `message` longtext NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tis_recipient_time` (`recipient`,`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_internalsignaling`
--

LOCK TABLES `oc_talk_internalsignaling` WRITE;
/*!40000 ALTER TABLE `oc_talk_internalsignaling` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_internalsignaling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_invitations`
--

DROP TABLE IF EXISTS `oc_talk_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_invitations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) unsigned NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `access_token` varchar(64) NOT NULL,
  `remote_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CA0C61A054177093` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_invitations`
--

LOCK TABLES `oc_talk_invitations` WRITE;
/*!40000 ALTER TABLE `oc_talk_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_poll_votes`
--

DROP TABLE IF EXISTS `oc_talk_poll_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_poll_votes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `poll_id` bigint(20) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `actor_type` varchar(64) NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `option_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `talk_poll_vote` (`poll_id`,`actor_type`,`actor_id`),
  KEY `talk_vote_room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_poll_votes`
--

LOCK TABLES `oc_talk_poll_votes` WRITE;
/*!40000 ALTER TABLE `oc_talk_poll_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_poll_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_polls`
--

DROP TABLE IF EXISTS `oc_talk_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_polls` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `room_id` bigint(20) NOT NULL,
  `question` longtext DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `votes` longtext DEFAULT NULL,
  `num_voters` bigint(20) DEFAULT 0,
  `actor_type` varchar(64) NOT NULL,
  `actor_id` varchar(64) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `status` smallint(6) DEFAULT 0,
  `result_mode` smallint(6) DEFAULT 0,
  `max_votes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `talk_poll_room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_polls`
--

LOCK TABLES `oc_talk_polls` WRITE;
/*!40000 ALTER TABLE `oc_talk_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_rooms`
--

DROP TABLE IF EXISTS `oc_talk_rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_rooms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `token` varchar(32) DEFAULT '',
  `type` int(11) NOT NULL,
  `password` varchar(255) DEFAULT '',
  `active_since` datetime DEFAULT NULL,
  `active_guests` int(10) unsigned NOT NULL DEFAULT 0,
  `last_activity` datetime DEFAULT NULL,
  `last_message` bigint(20) DEFAULT 0,
  `object_type` varchar(64) DEFAULT '',
  `object_id` varchar(64) DEFAULT '',
  `read_only` int(11) NOT NULL DEFAULT 0,
  `lobby_state` int(11) NOT NULL DEFAULT 0,
  `lobby_timer` datetime DEFAULT NULL,
  `assigned_hpb` int(11) DEFAULT NULL,
  `sip_enabled` smallint(5) unsigned NOT NULL DEFAULT 0,
  `description` longtext DEFAULT NULL,
  `listable` smallint(5) unsigned DEFAULT 0,
  `call_flag` int(11) NOT NULL DEFAULT 0,
  `default_permissions` int(11) NOT NULL DEFAULT 0,
  `call_permissions` int(11) NOT NULL DEFAULT 0,
  `remote_server` varchar(512) DEFAULT NULL,
  `remote_token` varchar(32) DEFAULT NULL,
  `message_expiration` int(11) NOT NULL DEFAULT 0,
  `breakout_room_mode` int(11) NOT NULL DEFAULT 0,
  `breakout_room_status` int(11) NOT NULL DEFAULT 0,
  `avatar` varchar(24) DEFAULT '',
  `call_recording` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tr_room_token` (`token`),
  KEY `last_active` (`last_activity`),
  KEY `tr_listable` (`listable`),
  KEY `remote_id` (`remote_server`,`remote_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_rooms`
--

LOCK TABLES `oc_talk_rooms` WRITE;
/*!40000 ALTER TABLE `oc_talk_rooms` DISABLE KEYS */;
INSERT INTO `oc_talk_rooms` VALUES (1,'admin','qjtbnymj',4,'',NULL,0,'2023-04-06 09:20:57',44,'','',1,0,NULL,NULL,0,NULL,0,0,0,0,NULL,NULL,0,0,0,'',0);
/*!40000 ALTER TABLE `oc_talk_rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_talk_sessions`
--

DROP TABLE IF EXISTS `oc_talk_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_talk_sessions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attendee_id` bigint(20) unsigned NOT NULL,
  `session_id` varchar(512) NOT NULL,
  `in_call` int(11) NOT NULL DEFAULT 0,
  `last_ping` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ts_session` (`session_id`),
  KEY `ts_in_call` (`in_call`),
  KEY `ts_last_ping` (`last_ping`),
  KEY `ts_attendee_id` (`attendee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_talk_sessions`
--

LOCK TABLES `oc_talk_sessions` WRITE;
/*!40000 ALTER TABLE `oc_talk_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_talk_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_documents`
--

DROP TABLE IF EXISTS `oc_text_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_documents` (
  `id` bigint(20) unsigned NOT NULL,
  `current_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version` bigint(20) unsigned DEFAULT 0,
  `last_saved_version_time` bigint(20) unsigned NOT NULL,
  `last_saved_version_etag` varchar(64) DEFAULT '',
  `base_version_etag` varchar(64) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_documents`
--

LOCK TABLES `oc_text_documents` WRITE;
/*!40000 ALTER TABLE `oc_text_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_sessions`
--

DROP TABLE IF EXISTS `oc_text_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_sessions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) DEFAULT NULL,
  `guest_name` varchar(64) DEFAULT NULL,
  `color` varchar(7) DEFAULT NULL,
  `token` varchar(64) NOT NULL,
  `document_id` bigint(20) NOT NULL,
  `last_contact` bigint(20) unsigned NOT NULL,
  `last_awareness_message` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rd_session_token_idx` (`token`),
  KEY `ts_lastcontact` (`last_contact`),
  KEY `ts_docid_lastcontact` (`document_id`,`last_contact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_sessions`
--

LOCK TABLES `oc_text_sessions` WRITE;
/*!40000 ALTER TABLE `oc_text_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_text_steps`
--

DROP TABLE IF EXISTS `oc_text_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_text_steps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `document_id` bigint(20) unsigned NOT NULL,
  `session_id` bigint(20) unsigned NOT NULL,
  `data` longtext NOT NULL,
  `version` bigint(20) unsigned DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `rd_steps_did_idx` (`document_id`),
  KEY `rd_steps_version_idx` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_text_steps`
--

LOCK TABLES `oc_text_steps` WRITE;
/*!40000 ALTER TABLE `oc_text_steps` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_text_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_trusted_servers`
--

DROP TABLE IF EXISTS `oc_trusted_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_trusted_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(512) NOT NULL,
  `url_hash` varchar(255) NOT NULL DEFAULT '',
  `token` varchar(128) DEFAULT NULL,
  `shared_secret` varchar(256) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 2,
  `sync_token` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `url_hash` (`url_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_trusted_servers`
--

LOCK TABLES `oc_trusted_servers` WRITE;
/*!40000 ALTER TABLE `oc_trusted_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_trusted_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_backupcodes`
--

DROP TABLE IF EXISTS `oc_twofactor_backupcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_backupcodes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) NOT NULL DEFAULT '',
  `code` varchar(128) NOT NULL,
  `used` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `twofactor_backupcodes_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_backupcodes`
--

LOCK TABLES `oc_twofactor_backupcodes` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_twofactor_backupcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_twofactor_providers`
--

DROP TABLE IF EXISTS `oc_twofactor_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_twofactor_providers` (
  `provider_id` varchar(32) NOT NULL,
  `uid` varchar(64) NOT NULL,
  `enabled` smallint(6) NOT NULL,
  PRIMARY KEY (`provider_id`,`uid`),
  KEY `twofactor_providers_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_twofactor_providers`
--

LOCK TABLES `oc_twofactor_providers` WRITE;
/*!40000 ALTER TABLE `oc_twofactor_providers` DISABLE KEYS */;
INSERT INTO `oc_twofactor_providers` VALUES ('backup_codes','admin',0);
/*!40000 ALTER TABLE `oc_twofactor_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_status`
--

DROP TABLE IF EXISTS `oc_user_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_status` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `status_timestamp` int(10) unsigned NOT NULL,
  `is_user_defined` tinyint(1) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `custom_icon` varchar(255) DEFAULT NULL,
  `custom_message` longtext DEFAULT NULL,
  `clear_at` int(10) unsigned DEFAULT NULL,
  `is_backup` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_status_uid_ix` (`user_id`),
  KEY `user_status_clr_ix` (`clear_at`),
  KEY `user_status_tstmp_ix` (`status_timestamp`),
  KEY `user_status_iud_ix` (`is_user_defined`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_status`
--

LOCK TABLES `oc_user_status` WRITE;
/*!40000 ALTER TABLE `oc_user_status` DISABLE KEYS */;
INSERT INTO `oc_user_status` VALUES (1,'admin','online',1680772854,0,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `oc_user_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_transfer_owner`
--

DROP TABLE IF EXISTS `oc_user_transfer_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_transfer_owner` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `source_user` varchar(64) NOT NULL,
  `target_user` varchar(64) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `node_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_transfer_owner`
--

LOCK TABLES `oc_user_transfer_owner` WRITE;
/*!40000 ALTER TABLE `oc_user_transfer_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_user_transfer_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_users`
--

DROP TABLE IF EXISTS `oc_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_users` (
  `uid` varchar(64) NOT NULL DEFAULT '',
  `displayname` varchar(64) DEFAULT NULL,
  `password` varchar(255) NOT NULL DEFAULT '',
  `uid_lower` varchar(64) DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `user_uid_lower` (`uid_lower`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_users`
--

LOCK TABLES `oc_users` WRITE;
/*!40000 ALTER TABLE `oc_users` DISABLE KEYS */;
INSERT INTO `oc_users` VALUES ('admin',NULL,'3|$argon2id$v=19$m=65536,t=4,p=1$Zk1mbHpucEJ5bVBSallaaA$mt1PlQxgphb1YlRQ8WxiJhZIo7E0yxleHdd9BByLZr8','admin');
/*!40000 ALTER TABLE `oc_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory`
--

DROP TABLE IF EXISTS `oc_vcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT '',
  `category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid_index` (`uid`),
  KEY `type_index` (`type`),
  KEY `category_index` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory`
--

LOCK TABLES `oc_vcategory` WRITE;
/*!40000 ALTER TABLE `oc_vcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vcategory_to_object`
--

DROP TABLE IF EXISTS `oc_vcategory_to_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vcategory_to_object` (
  `objid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `categoryid` bigint(20) unsigned NOT NULL DEFAULT 0,
  `type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`,`objid`,`type`),
  KEY `vcategory_objectd_index` (`objid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vcategory_to_object`
--

LOCK TABLES `oc_vcategory_to_object` WRITE;
/*!40000 ALTER TABLE `oc_vcategory_to_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_vcategory_to_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_webauthn`
--

DROP TABLE IF EXISTS `oc_webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `public_key_credential_id` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webauthn_uid` (`uid`),
  KEY `webauthn_publicKeyCredentialId` (`public_key_credential_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_webauthn`
--

LOCK TABLES `oc_webauthn` WRITE;
/*!40000 ALTER TABLE `oc_webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_webauthn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_whats_new`
--

DROP TABLE IF EXISTS `oc_whats_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_whats_new` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(64) NOT NULL DEFAULT '11',
  `etag` varchar(64) NOT NULL DEFAULT '',
  `last_check` int(10) unsigned NOT NULL DEFAULT 0,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `version` (`version`),
  KEY `version_etag_idx` (`version`,`etag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_whats_new`
--

LOCK TABLES `oc_whats_new` WRITE;
/*!40000 ALTER TABLE `oc_whats_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_whats_new` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-06  9:22:51
