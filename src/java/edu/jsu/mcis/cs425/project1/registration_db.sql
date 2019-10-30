-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.17-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema registration_db
--

CREATE DATABASE IF NOT EXISTS registration_db;
USE registration_db;

--
-- Definition of table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
CREATE TABLE `registrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `displayname` varchar(90) NOT NULL,
  `sessionid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_registrations_1` (`sessionid`),
  CONSTRAINT `FK_registrations_1` FOREIGN KEY (`sessionid`) REFERENCES `sessions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registrations`
--

/*!40000 ALTER TABLE `registrations` DISABLE KEYS */;
INSERT INTO `registrations` (`id`,`firstname`,`lastname`,`displayname`,`sessionid`) VALUES 
 (1,'Thomas','Beckwith','Thomas Beckwith',3),
 (2,'Courtney','Eckhoff','Courtney Eckhoff',3),
 (3,'Timothy','Freeman','Timothy Freeman',4),
 (4,'Kathy','Cox','Kathy Cox',4),
 (5,'Barbara','Freda','Barbara Freda',3),
 (6,'Cindy','Leavitt','Cindy Leavitt',4),
 (7,'Robert','Holder','Robert Holder',3),
 (8,'Ali','Peters','Ali Peters',4),
 (9,'Stephanie','Johnson','Stephanie Johnson',4),
 (10,'Betty','Hoffmann','Betty Hoffmann',3),
 (11,'Robert','Waddell','Robert Waddell',2),
 (12,'Shannon','Hartmann','Shannon Hartmann',2),
 (13,'James','Jennings','James Jennings',4),
 (14,'James','Lipe','James Lipe',3),
 (15,'William','Hughes','William Hughes',2),
 (16,'Damian','Seymour','Damian Seymour',3),
 (17,'Jessica','Meyers','Jessica Meyers',3),
 (18,'Florence','Davis','Florence Davis',3),
 (19,'Joyce','Herrmann','Joyce Herrmann',4),
 (20,'James','Wells','James Wells',4),
 (21,'Fred','Madison','Fred Madison',3),
 (22,'Mark','Preston','Mark Preston',3),
 (23,'Alexander','Hunter','Alexander Hunter',4),
 (24,'Dwight','Cepeda','Dwight Cepeda',1),
 (25,'Sheryl','Bartholomew','Sheryl Bartholomew',2),
 (26,'Jennifer','Connor','Jennifer Connor',1),
 (27,'Sheryl','Puckett','Sheryl Puckett',1),
 (28,'Willie','Lujan','Willie Lujan',1),
 (29,'Alyson','Scott','Alyson Scott',1),
 (30,'Daniel','Cooper','Daniel Cooper',2),
 (31,'Maurice','McAllister','Maurice McAllister',2),
 (32,'Brenda','Kincheloe','Brenda Kincheloe',1),
 (33,'Queen','Corey','Queen Corey',2),
 (34,'Kim','Huffman','Kim Huffman',2),
 (35,'James','Reed','James Reed',1),
 (36,'Joshua','Wood','Joshua Wood',4),
 (37,'Paul','Amick','Paul Amick',2),
 (38,'Crystal','Hill','Crystal Hill',2),
 (39,'Bradley','Leboeuf','Bradley Leboeuf',2),
 (40,'Nathan','Beil','Nathan Beil',1),
 (41,'Matthew','Lupo','Matthew Lupo',1),
 (42,'Mavis','Favela','Mavis Favela',3),
 (43,'Jose','Le','Jose Le',4),
 (44,'Paul','Beeler','Paul Beeler',3),
 (45,'Pamela','Haase','Pamela Haase',3),
 (46,'Eugene','Wright','Eugene Wright',3),
 (47,'George','Chapell','George Chapell',2),
 (48,'Kenneth','Terrell','Kenneth Terrell',4),
 (49,'Theresa','Gibson','Theresa Gibson',2),
 (50,'Amie','Littell','Amie Littell',3);
/*!40000 ALTER TABLE `registrations` ENABLE KEYS */;


--
-- Definition of table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--

/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`id`,`description`) VALUES 
 (1,'Session 1'),
 (2,'Session 2'),
 (3,'Session 3'),
 (4,'Session 4');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
