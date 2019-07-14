start transaction;

create database `Acme-Rookies`;

use `Acme-Rookies`;

create user 'acme-user'@'%' 
	identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';

create user 'acme-manager'@'%' 
	identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete 
	on `Acme-Rookies`.* to 'acme-user'@'%';

grant select, insert, update, delete, create, drop, references, index, alter, 
        create temporary tables, lock tables, create view, create routine, 
        alter routine, execute, trigger, show view
    on `Acme-Rookies`.* to 'acme-manager'@'%';

-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Rookies
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surnames` varchar(255) DEFAULT NULL,
  `vat_number` varchar(255) DEFAULT NULL,
  `credit_card` int(11) NOT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fl7pq8veyyxgdk1s4awu0c7mo` (`credit_card`),
  UNIQUE KEY `UK_awymvli3olnnumqow6wf060pa` (`email`),
  KEY `FK_i7xei45auwq1f6vu25985riuh` (`user_account`),
  CONSTRAINT `FK_i7xei45auwq1f6vu25985riuh` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_fl7pq8veyyxgdk1s4awu0c7mo` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surnames` varchar(255) DEFAULT NULL,
  `vat_number` varchar(255) DEFAULT NULL,
  `credit_card` int(11) NOT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_b2e562x98pje1n9vu0deulcev` (`credit_card`),
  UNIQUE KEY `UK_jj3mmcc0vjobqibj67dvuwihk` (`email`),
  KEY `FK_7ohwsa2usmvu0yxb44je2lge` (`user_account`),
  CONSTRAINT `FK_7ohwsa2usmvu0yxb44je2lge` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_b2e562x98pje1n9vu0deulcev` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1394,0,'Sevilla','cristian@hotmail.com','Cristian','654654654','https://www.imagen.com.mx/assets/img/imagen_share.png','Lorca','ES12345678S',1376,1335),(1395,0,'Sevilla','jesus@gmail.com','Jesus','635208248','https://www.imagen.com.mx/assets/img/imagen_share.png','Elias','ES87654321C',1381,1334);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `explication` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `submit_moment` datetime DEFAULT NULL,
  `url_code` varchar(255) DEFAULT NULL,
  `curricula` int(11) NOT NULL,
  `rookie` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hsw5exxa4qe3jxi8xdhnn0dl5` (`curricula`),
  KEY `FK_dq1om37bx4hgli24rbkjo2n7` (`rookie`),
  CONSTRAINT `FK_dq1om37bx4hgli24rbkjo2n7` FOREIGN KEY (`rookie`) REFERENCES `rookie` (`id`),
  CONSTRAINT `FK_hsw5exxa4qe3jxi8xdhnn0dl5` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1414,0,'explication1','2019-01-03 23:59:00',1,'2019-01-03 23:59:00','https://www.google.es/?gws_rd=ssl',1405,1398),(1415,0,'explication2','2019-01-03 23:59:00',1,'2019-01-03 23:59:00','https://www.google.es/?gws_rd=ssl',1405,1398),(1416,0,'explication3','2019-01-03 23:59:00',1,'2019-01-03 23:59:00','https://www.google.es/?gws_rd=ssl',1405,1398),(1417,0,'','2019-01-03 23:59:00',0,'2019-02-03 23:59:00','',1405,1398),(1418,0,'explication2','2019-01-03 23:59:00',1,'2019-01-03 23:59:00','https://www.google.es/?gws_rd=ssl',1405,1398);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `draft_mode` int(11) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `score` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `auditor` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3m6p53wfvy7kcl4f4fvphkh9h` (`auditor`),
  KEY `FK_bumsxo4hc038y25pbfsinc38u` (`position`),
  CONSTRAINT `FK_bumsxo4hc038y25pbfsinc38u` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_3m6p53wfvy7kcl4f4fvphkh9h` FOREIGN KEY (`auditor`) REFERENCES `auditor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
INSERT INTO `audit` VALUES (1407,0,0,'2019-01-02 23:59:00',1,'text1',1388,1401),(1408,0,0,'2019-02-02 23:59:00',5,'text2',1389,1401),(1409,0,1,'2019-03-02 23:59:00',8,'text3',1390,1403);
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor`
--

DROP TABLE IF EXISTS `auditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surnames` varchar(255) DEFAULT NULL,
  `vat_number` varchar(255) DEFAULT NULL,
  `credit_card` int(11) NOT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_k5yihs4tvrnhe8rndei6ypc8w` (`credit_card`),
  UNIQUE KEY `UK_lmcp5r2bol31t270dvfqypbmk` (`email`),
  KEY `FK_1hfceldjralkadedlv9lg1tl8` (`user_account`),
  CONSTRAINT `FK_1hfceldjralkadedlv9lg1tl8` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_k5yihs4tvrnhe8rndei6ypc8w` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
INSERT INTO `auditor` VALUES (1388,0,'Sevilla','david@hotmail.com','David','654654654','https://www.imagen.com.mx/assets/img/imagen_share.png','Lorca','ES12345678S',1382,1340),(1389,0,'Sevilla','fatima@hotmail.com','Fatima','654654654','https://www.imagen.com.mx/assets/img/imagen_share.png','Lorca','LK12345678S',1383,1341),(1390,0,'Sevilla','manuel@hotmail.com','manuel','654654654','https://www.imagen.com.mx/assets/img/imagen_share.png','Lorca','ES12345678S',1384,1342);
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor_positions`
--

DROP TABLE IF EXISTS `auditor_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditor_positions` (
  `auditor` int(11) NOT NULL,
  `positions` int(11) NOT NULL,
  UNIQUE KEY `UK_l70j8r67ioke5eec2tqc8tg27` (`positions`),
  KEY `FK_1urn848nt1bdfyyrmsjbxagwh` (`auditor`),
  CONSTRAINT `FK_1urn848nt1bdfyyrmsjbxagwh` FOREIGN KEY (`auditor`) REFERENCES `auditor` (`id`),
  CONSTRAINT `FK_l70j8r67ioke5eec2tqc8tg27` FOREIGN KEY (`positions`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor_positions`
--

LOCK TABLES `auditor_positions` WRITE;
/*!40000 ALTER TABLE `auditor_positions` DISABLE KEYS */;
INSERT INTO `auditor_positions` VALUES (1388,1400),(1389,1401),(1390,1402);
/*!40000 ALTER TABLE `auditor_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surnames` varchar(255) DEFAULT NULL,
  `vat_number` varchar(255) DEFAULT NULL,
  `credit_card` int(11) NOT NULL,
  `user_account` int(11) DEFAULT NULL,
  `name_company` varchar(255) DEFAULT NULL,
  `total_score` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cp2qc9fdm9995xdhrrd06n86c` (`credit_card`),
  UNIQUE KEY `UK_bma9lv19ba3yjwf12a34xord3` (`email`),
  KEY `FK_pno7oguspp7fxv0y2twgplt0s` (`user_account`),
  CONSTRAINT `FK_pno7oguspp7fxv0y2twgplt0s` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_cp2qc9fdm9995xdhrrd06n86c` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1396,0,'Sevilla','company@hotmail.com','Antonio','654654654','https://www.imagen.com.mx/assets/img/imagen_share.png','Elias','AS12345678W',1377,1336,'Universidad de Sevilla',10),(1397,0,'Sevilla','companyOfJesus@hotmail.com','Jesús','654654654',NULL,'Elias','ZA12345678R',1378,1337,'Universidad de Huelva',NULL);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credit_card` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `cw` int(11) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  `expiration_month` int(11) NOT NULL,
  `expiration_year` int(11) NOT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (1376,0,101,'VISA',3,2019,'nombre1','5325065299416578'),(1377,0,201,'VISA',5,2020,'nombre2','5189377108241039'),(1378,0,202,'VISA',6,2020,'nombre3','5335596241375262'),(1379,0,203,'VISA',2,2022,'nombre4','5596374388258012'),(1380,0,205,'VISA',4,2030,'nombre5','5304175960354308'),(1381,0,302,'VISA',9,2030,'nombre6','5485959849975115'),(1382,0,245,'VISA',6,2024,'nombre7','4444894320560040'),(1383,0,324,'VISA',11,2022,'nombre8','4705769057322836'),(1384,0,602,'VISA',1,2025,'nombre9','4771598816781704'),(1385,0,602,'VISA',1,2024,'nombre10','5295015831508933'),(1386,0,602,'VISA',1,2023,'nombre11','5420430700365679'),(1387,0,602,'VISA',1,2022,'nombre12','5532567307795983');
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula`
--

DROP TABLE IF EXISTS `curricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `is_copy` int(11) NOT NULL,
  `personal_data` int(11) DEFAULT NULL,
  `rookie` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_67ossaqcrfgcegesi91m20iik` (`personal_data`),
  KEY `FK_lq4kfcvf5vufwsng4apko2wd` (`rookie`),
  CONSTRAINT `FK_lq4kfcvf5vufwsng4apko2wd` FOREIGN KEY (`rookie`) REFERENCES `rookie` (`id`),
  CONSTRAINT `FK_67ossaqcrfgcegesi91m20iik` FOREIGN KEY (`personal_data`) REFERENCES `personal_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula`
--

LOCK TABLES `curricula` WRITE;
/*!40000 ALTER TABLE `curricula` DISABLE KEYS */;
INSERT INTO `curricula` VALUES (1404,0,0,1356,1398),(1405,0,0,1357,1399),(1406,0,1,1360,1398);
/*!40000 ALTER TABLE `curricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula_education_data`
--

DROP TABLE IF EXISTS `curricula_education_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula_education_data` (
  `curricula` int(11) NOT NULL,
  `education_data` int(11) NOT NULL,
  UNIQUE KEY `UK_r552kg3pwybsy7igk77depn9l` (`education_data`),
  KEY `FK_a133bnrmd36opa9yi2dvx0rly` (`curricula`),
  CONSTRAINT `FK_a133bnrmd36opa9yi2dvx0rly` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_r552kg3pwybsy7igk77depn9l` FOREIGN KEY (`education_data`) REFERENCES `education_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula_education_data`
--

LOCK TABLES `curricula_education_data` WRITE;
/*!40000 ALTER TABLE `curricula_education_data` DISABLE KEYS */;
INSERT INTO `curricula_education_data` VALUES (1404,1371),(1405,1372),(1406,1375);
/*!40000 ALTER TABLE `curricula_education_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula_miscellaneous_data`
--

DROP TABLE IF EXISTS `curricula_miscellaneous_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula_miscellaneous_data` (
  `curricula` int(11) NOT NULL,
  `miscellaneous_data` int(11) NOT NULL,
  UNIQUE KEY `UK_12gfi193l4ocrk6r69ckn9ee5` (`miscellaneous_data`),
  KEY `FK_dfsfu2upc4v3tudsfcpnu9whf` (`curricula`),
  CONSTRAINT `FK_dfsfu2upc4v3tudsfcpnu9whf` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_12gfi193l4ocrk6r69ckn9ee5` FOREIGN KEY (`miscellaneous_data`) REFERENCES `miscellaneous_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula_miscellaneous_data`
--

LOCK TABLES `curricula_miscellaneous_data` WRITE;
/*!40000 ALTER TABLE `curricula_miscellaneous_data` DISABLE KEYS */;
INSERT INTO `curricula_miscellaneous_data` VALUES (1404,1361),(1405,1362),(1406,1365);
/*!40000 ALTER TABLE `curricula_miscellaneous_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curricula_position_data`
--

DROP TABLE IF EXISTS `curricula_position_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curricula_position_data` (
  `curricula` int(11) NOT NULL,
  `position_data` int(11) NOT NULL,
  UNIQUE KEY `UK_drj10dtgcblo3nirh2se0c0su` (`position_data`),
  KEY `FK_mns5pfwnlroqw4udu760ye28v` (`curricula`),
  CONSTRAINT `FK_mns5pfwnlroqw4udu760ye28v` FOREIGN KEY (`curricula`) REFERENCES `curricula` (`id`),
  CONSTRAINT `FK_drj10dtgcblo3nirh2se0c0su` FOREIGN KEY (`position_data`) REFERENCES `position_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curricula_position_data`
--

LOCK TABLES `curricula_position_data` WRITE;
/*!40000 ALTER TABLE `curricula_position_data` DISABLE KEYS */;
INSERT INTO `curricula_position_data` VALUES (1404,1366),(1405,1367),(1406,1370);
/*!40000 ALTER TABLE `curricula_position_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customizable_system`
--

DROP TABLE IF EXISTS `customizable_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customizable_system` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `max_results` int(11) NOT NULL,
  `message_welcome_page` varchar(255) DEFAULT NULL,
  `name_system` varchar(255) DEFAULT NULL,
  `spanish_message_welcome_page` varchar(255) DEFAULT NULL,
  `telephone_code` varchar(255) DEFAULT NULL,
  `time_cache` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customizable_system`
--

LOCK TABLES `customizable_system` WRITE;
/*!40000 ALTER TABLE `customizable_system` DISABLE KEYS */;
INSERT INTO `customizable_system` VALUES (1348,0,'https://www.downdays.eu/wp-content/uploads/2017/10/654366824_640.jpg',10,'Welcome to Acme Rookies! We\'re IT rookie\'s favourite job marketplace!','Acme Rookies','¡Bienvenidos a Acme Rookies!  ¡Somos el mercado de trabajo favorito de los profesionales de las TICs!','+34',1);
/*!40000 ALTER TABLE `customizable_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_data`
--

DROP TABLE IF EXISTS `education_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `education_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `degree` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `mark` int(11) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_data`
--

LOCK TABLES `education_data` WRITE;
/*!40000 ALTER TABLE `education_data` DISABLE KEYS */;
INSERT INTO `education_data` VALUES (1371,0,'degree1','2019-01-03 23:59:00','institution1',2,'2019-01-02 23:59:00'),(1372,0,'degree2','2019-03-03 23:59:00','institution2',2,'2019-02-02 23:59:00'),(1373,0,'degree3','2019-03-09 23:59:00','institution3',4,'2019-03-05 23:59:00'),(1374,0,'degree4','2019-03-20 23:59:00','institution4',6,'2019-03-09 23:59:00'),(1375,0,'degree4','2019-03-20 23:59:00','institution4',6,'2019-03-09 23:59:00');
/*!40000 ALTER TABLE `education_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder`
--

DROP TABLE IF EXISTS `finder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `dead_line` datetime DEFAULT NULL,
  `key_word` varchar(255) DEFAULT NULL,
  `max_salary` double DEFAULT NULL,
  `min_salary` double DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_hmrrcfsgb3glx75tqy7onw31m` (`key_word`,`dead_line`,`min_salary`,`max_salary`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder`
--

LOCK TABLES `finder` WRITE;
/*!40000 ALTER TABLE `finder` DISABLE KEYS */;
INSERT INTO `finder` VALUES (1349,0,'2019-12-10 00:00:00','Prueba1',100,10,'2019-04-05 20:23:00'),(1350,0,'2019-12-10 00:00:00','Prueba2',100,10,'2019-04-05 23:30:00');
/*!40000 ALTER TABLE `finder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `finder_positions`
--

DROP TABLE IF EXISTS `finder_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `finder_positions` (
  `finder` int(11) NOT NULL,
  `positions` int(11) NOT NULL,
  KEY `FK_3d46gil0nks2dhgg7cyhv2m39` (`positions`),
  KEY `FK_l0b3qg4nly59oeqhe8ig5yssc` (`finder`),
  CONSTRAINT `FK_l0b3qg4nly59oeqhe8ig5yssc` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`),
  CONSTRAINT `FK_3d46gil0nks2dhgg7cyhv2m39` FOREIGN KEY (`positions`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `finder_positions`
--

LOCK TABLES `finder_positions` WRITE;
/*!40000 ALTER TABLE `finder_positions` DISABLE KEYS */;
INSERT INTO `finder_positions` VALUES (1349,1400),(1349,1401),(1350,1402);
/*!40000 ALTER TABLE `finder_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('domain_entity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `provider` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_isojc9iaj7goju6s26847atbn` (`provider`),
  CONSTRAINT `FK_isojc9iaj7goju6s26847atbn` FOREIGN KEY (`provider`) REFERENCES `provider` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1410,0,'este artículo es el mejor','articulo1',1391),(1411,0,'este artículo es el mejor','articulo1',1392),(1412,0,'este artículo es el mejor','articulo1',1392),(1413,0,'este artículo es el mejor','articulo1',1392);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_link`
--

DROP TABLE IF EXISTS `item_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_link` (
  `item` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  KEY `FK_oxhqxiuhm045bjla6aaqkil4s` (`item`),
  CONSTRAINT `FK_oxhqxiuhm045bjla6aaqkil4s` FOREIGN KEY (`item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_link`
--

LOCK TABLES `item_link` WRITE;
/*!40000 ALTER TABLE `item_link` DISABLE KEYS */;
INSERT INTO `item_link` VALUES (1410,'https://www.google.com'),(1410,'https://www.marca.com'),(1411,'https://www.google.com'),(1411,'https://www.marca.com'),(1412,'https://www.google.es'),(1412,'https://www.ev.us.es'),(1413,'https://www.google.com'),(1413,'https://www.marca.com');
/*!40000 ALTER TABLE `item_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pictures`
--

DROP TABLE IF EXISTS `item_pictures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_pictures` (
  `item` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_aur62dcmq5mod3fcwl099dmxi` (`item`),
  CONSTRAINT `FK_aur62dcmq5mod3fcwl099dmxi` FOREIGN KEY (`item`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pictures`
--

LOCK TABLES `item_pictures` WRITE;
/*!40000 ALTER TABLE `item_pictures` DISABLE KEYS */;
INSERT INTO `item_pictures` VALUES (1410,'https://cdn-images-1.medium.com/max/2600/1*TYAzzTJ60x-qg5N81ElU9A.png'),(1411,'https://img.freepik.com/foto-gratis/hacker-portatil_23-2147985341.jpg'),(1412,'https://img.freepik.com/foto-gratis/hacker-portatil_23-2147985341.jpg'),(1413,'https://img.freepik.com/foto-gratis/hacker-portatil_23-2147985341.jpg');
/*!40000 ALTER TABLE `item_pictures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `miscellaneous_data`
--

DROP TABLE IF EXISTS `miscellaneous_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `miscellaneous_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `miscellaneous_data`
--

LOCK TABLES `miscellaneous_data` WRITE;
/*!40000 ALTER TABLE `miscellaneous_data` DISABLE KEYS */;
INSERT INTO `miscellaneous_data` VALUES (1361,0,'attachment1','text1'),(1362,0,'attachment2','text2'),(1363,0,'attachment3','text3'),(1364,0,'attachment4','text4'),(1365,0,'attachment5','text4');
/*!40000 ALTER TABLE `miscellaneous_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1346,0,'Update','Actualización del sistema'),(1347,0,'Update2','Actualización del sistema');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_data`
--

DROP TABLE IF EXISTS `personal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `github_profile` varchar(255) DEFAULT NULL,
  `linkedln_profile` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_data`
--

LOCK TABLES `personal_data` WRITE;
/*!40000 ALTER TABLE `personal_data` DISABLE KEYS */;
INSERT INTO `personal_data` VALUES (1356,0,'profileData1','http://githubProfile1.com','http://linkedlnProfile1','+34 123456789','statement1'),(1357,0,'profileData2','http://githubProfile2.com','http://linkedlnProfile2','+34 123456799','statement2'),(1358,0,'profileData3','http://githubProfile3.com','http://linkedlnProfile3','+34 123456999','statement3'),(1359,0,'profileData4','http://githubProfile4.com','http://linkedlnProfile4','+34 123459999','statement4'),(1360,0,'profileData5','http://githubProfile4.com','http://linkedlnProfile4','+34 123459999','statement4');
/*!40000 ALTER TABLE `personal_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `dead_line` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `draft_mode` int(11) NOT NULL,
  `is_cancelled` int(11) NOT NULL,
  `required_profile` varchar(255) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `skills_required` varchar(255) DEFAULT NULL,
  `technologies_required` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `company` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_15390c4j2aeju6ha0iwvi6mc5` (`ticker`),
  KEY `FK_7qlfn4nye234rrm4w83nms1g8` (`company`),
  CONSTRAINT `FK_7qlfn4nye234rrm4w83nms1g8` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1400,0,'2021-01-23','Description of position1',1,0,'Happy',1500,'MySQL','i7','poio-7654','Position1',1396),(1401,0,'2020-10-04','Description of position2',0,0,'Happy',1200,'MySQL and JPA','i7','pdfo-7654','Position2',1396),(1402,0,'2020-12-01','Description of position3',1,0,'Happy',1600,'MySQL and Java','i7','phgo-7654','Position3',1397),(1403,0,'2025-01-01','Description of position3',0,0,'Happy',1600,'MySQL and Java','i7','phgo-7000','Position4',1397);
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_data`
--

DROP TABLE IF EXISTS `position_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_data` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_data`
--

LOCK TABLES `position_data` WRITE;
/*!40000 ALTER TABLE `position_data` DISABLE KEYS */;
INSERT INTO `position_data` VALUES (1366,0,'description1','2019-01-03 23:59:00','2019-01-02 23:59:00','title1'),(1367,0,'description2','2019-01-20 23:59:00','2019-01-09 23:59:00','title2'),(1368,0,'description3','2019-03-03 23:59:00','2019-03-02 23:59:00','title3'),(1369,0,'description4','2019-03-12 23:59:00','2019-02-12 23:59:00','title4'),(1370,0,'description4','2019-03-12 23:59:00','2019-02-12 23:59:00','title4');
/*!40000 ALTER TABLE `position_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_problems`
--

DROP TABLE IF EXISTS `position_problems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position_problems` (
  `position` int(11) NOT NULL,
  `problems` int(11) NOT NULL,
  UNIQUE KEY `UK_7pe330ganri24wsftsajlm4l9` (`problems`),
  KEY `FK_iji6l3ytrjgytbgo6oi061elj` (`position`),
  CONSTRAINT `FK_iji6l3ytrjgytbgo6oi061elj` FOREIGN KEY (`position`) REFERENCES `position` (`id`),
  CONSTRAINT `FK_7pe330ganri24wsftsajlm4l9` FOREIGN KEY (`problems`) REFERENCES `problem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_problems`
--

LOCK TABLES `position_problems` WRITE;
/*!40000 ALTER TABLE `position_problems` DISABLE KEYS */;
INSERT INTO `position_problems` VALUES (1400,1351),(1400,1352),(1401,1353),(1403,1354),(1403,1355);
/*!40000 ALTER TABLE `position_problems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `draft_mode` int(11) NOT NULL,
  `hint` varchar(255) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (1351,0,0,'Hint1','Statement','Problem1'),(1352,0,1,'Hint2','Statement2','Problem2'),(1353,0,0,'Hint3','Statement3','Problem3'),(1354,0,0,'Hint4','Statement4','Problem4'),(1355,0,0,'Hint5','Statement5','Problem5');
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_applications`
--

DROP TABLE IF EXISTS `problem_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_applications` (
  `problem` int(11) NOT NULL,
  `applications` int(11) NOT NULL,
  UNIQUE KEY `UK_okuywf4d7ofjbuk4ln45ihhnj` (`applications`),
  KEY `FK_ka8tip2le7mmi1eu73c57edrh` (`problem`),
  CONSTRAINT `FK_ka8tip2le7mmi1eu73c57edrh` FOREIGN KEY (`problem`) REFERENCES `problem` (`id`),
  CONSTRAINT `FK_okuywf4d7ofjbuk4ln45ihhnj` FOREIGN KEY (`applications`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_applications`
--

LOCK TABLES `problem_applications` WRITE;
/*!40000 ALTER TABLE `problem_applications` DISABLE KEYS */;
INSERT INTO `problem_applications` VALUES (1351,1414),(1352,1415),(1352,1416),(1353,1417),(1354,1418);
/*!40000 ALTER TABLE `problem_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problem_attachment`
--

DROP TABLE IF EXISTS `problem_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `problem_attachment` (
  `problem` int(11) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  KEY `FK_rdoglrwy3xmmuyij2yn3muwwr` (`problem`),
  CONSTRAINT `FK_rdoglrwy3xmmuyij2yn3muwwr` FOREIGN KEY (`problem`) REFERENCES `problem` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem_attachment`
--

LOCK TABLES `problem_attachment` WRITE;
/*!40000 ALTER TABLE `problem_attachment` DISABLE KEYS */;
INSERT INTO `problem_attachment` VALUES (1351,'attachment1'),(1353,'attachment3'),(1354,'attachment1'),(1355,'attachment1');
/*!40000 ALTER TABLE `problem_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surnames` varchar(255) DEFAULT NULL,
  `vat_number` varchar(255) DEFAULT NULL,
  `credit_card` int(11) NOT NULL,
  `user_account` int(11) DEFAULT NULL,
  `make` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8tfs0v3dygkxkfyijig9gv9mj` (`credit_card`),
  UNIQUE KEY `UK_7pvp08p4hu0e5k4452khlhv78` (`email`),
  KEY `FK_pj40m1p8m3lcs2fkdl1n3f3lq` (`user_account`),
  CONSTRAINT `FK_pj40m1p8m3lcs2fkdl1n3f3lq` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_8tfs0v3dygkxkfyijig9gv9mj` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1391,0,'Sevilla','pedro@hotmail.com','Pedro','654654654','https://www.imagen.com.mx/assets/img/imagen_share.png','Lorca','ES12345622S',1385,1343,'marca1'),(1392,0,'Sevilla','Manuel@hotmail.com','Manuel','644977442','https://www.imagen.com.mx/assets/img/imagen_share.png','Lorca','ES12345633S',1386,1344,'marca2'),(1393,0,'Sevilla','maria@hotmail.com','Maria','645287693','https://www.imagen.com.mx/assets/img/imagen_share.png','Lorca','ES12345644S',1387,1345,'marca3');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rookie`
--

DROP TABLE IF EXISTS `rookie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rookie` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surnames` varchar(255) DEFAULT NULL,
  `vat_number` varchar(255) DEFAULT NULL,
  `credit_card` int(11) NOT NULL,
  `user_account` int(11) DEFAULT NULL,
  `finder` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_n7rveqfq9lm0cwcxhwyvtyi1g` (`finder`),
  UNIQUE KEY `UK_4srgnn4au9gkktapbpr1ip6be` (`credit_card`),
  UNIQUE KEY `UK_dudgelrrmk8b9clu196w7gjgy` (`email`),
  KEY `FK_2n8nv9qsl5pnxhnosngfkkm4i` (`user_account`),
  CONSTRAINT `FK_2n8nv9qsl5pnxhnosngfkkm4i` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_4srgnn4au9gkktapbpr1ip6be` FOREIGN KEY (`credit_card`) REFERENCES `credit_card` (`id`),
  CONSTRAINT `FK_n7rveqfq9lm0cwcxhwyvtyi1g` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rookie`
--

LOCK TABLES `rookie` WRITE;
/*!40000 ALTER TABLE `rookie` DISABLE KEYS */;
INSERT INTO `rookie` VALUES (1398,0,'Sevilla','Cristian@hotmail.com','Cristian','666777888','https://www.imagen.com.mx/assets/img/imagen_share.png','Lorca','PA12345678U',1379,1338,1349),(1399,0,'Sevilla','Raul@hotmail.com','Raul','653234123','https://www.imagen.com.mx/assets/img/imagen_share.png','Rodriguez','QA12345678U',1380,1339,1350);
/*!40000 ALTER TABLE `rookie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_castjbvpeeus0r8lbpehiu0e4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1334,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(1335,0,'e00cf25ad42683b3df678c61f42c6bda','admin1'),(1336,0,'93c731f1c3a84ef05cd54d044c379eaa','company'),(1337,0,'df655f976f7c9d3263815bd981225cd9','company1'),(1338,0,'891fbc7a93834f52f62785c3dddcda05','rookie'),(1339,0,'9701eb1802a4c63f51e1501512fbdd30','rookie1'),(1340,0,'f7d07071ed9431ecae3a8d45b4c82bb2','auditor'),(1341,0,'175d2e7a63f386554a4dd66e865c3e14','auditor1'),(1342,0,'04dd94ba3212ac52ad3a1f4cbfb52d4f','auditor2'),(1343,0,'9e9f3d70bd8c8957627eada96d967706','provider'),(1344,0,'cdb82d56473901641525fbbd1d5dab56','provider1'),(1345,0,'ebfc815ee2cc6a16225105bb7b3e1e53','provider2');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account_authorities`
--

DROP TABLE IF EXISTS `user_account_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account_authorities` (
  `user_account` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_pao8cwh93fpccb0bx6ilq6gsl` (`user_account`),
  CONSTRAINT `FK_pao8cwh93fpccb0bx6ilq6gsl` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account_authorities`
--

LOCK TABLES `user_account_authorities` WRITE;
/*!40000 ALTER TABLE `user_account_authorities` DISABLE KEYS */;
INSERT INTO `user_account_authorities` VALUES (1334,'ADMIN'),(1335,'ADMIN'),(1336,'COMPANY'),(1337,'COMPANY'),(1338,'ROOKIE'),(1339,'ROOKIE'),(1340,'AUDITOR'),(1341,'AUDITOR'),(1342,'AUDITOR'),(1343,'PROVIDER'),(1344,'PROVIDER'),(1345,'PROVIDER');
/*!40000 ALTER TABLE `user_account_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-14 11:24:18

commit;
