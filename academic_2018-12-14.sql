# ************************************************************
# Sequel Pro SQL dump
# Version 5425
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.13)
# Database: academic
# Generation Time: 2018-12-15 04:05:10 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table achieve
# ------------------------------------------------------------

DROP TABLE IF EXISTS `achieve`;

CREATE TABLE `achieve` (
  `achieveid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `scholarshipid` int(11) DEFAULT NULL,
  `addtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`achieveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `achieve` WRITE;
/*!40000 ALTER TABLE `achieve` DISABLE KEYS */;

INSERT INTO `achieve` (`achieveid`, `userid`, `scholarshipid`, `addtime`)
VALUES
	(3,2,2,'2018-12-12 14:56:11');

/*!40000 ALTER TABLE `achieve` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table choose
# ------------------------------------------------------------

DROP TABLE IF EXISTS `choose`;

CREATE TABLE `choose` (
  `chooseid` int(11) NOT NULL AUTO_INCREMENT,
  `courseid` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `addtime` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`chooseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `choose` WRITE;
/*!40000 ALTER TABLE `choose` DISABLE KEYS */;

INSERT INTO `choose` (`chooseid`, `courseid`, `userid`, `addtime`, `grade`, `semester`)
VALUES
	(4,3,2,'2018-12-12 21:37:48','','spring'),
	(5,2,2,'2018-12-12 14:18:48','','fall'),
	(6,4,2,'2018-12-12 14:18:56','C','spring'),
	(8,2,8,'2018-12-12 21:39:36','B','fall'),
	(9,3,2,'2018-12-14 10:00:26',NULL,NULL),
	(10,3,2,'2018-12-14 10:00:32',NULL,NULL),
	(11,3,2,'2018-12-14 10:00:39',NULL,NULL),
	(12,3,2,'2018-12-14 10:00:45',NULL,NULL),
	(13,4,2,'2018-12-14 10:01:04',NULL,NULL),
	(14,4,2,'2018-12-14 10:01:08',NULL,NULL);

/*!40000 ALTER TABLE `choose` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table course
# ------------------------------------------------------------

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `courseid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `coursename` varchar(255) DEFAULT NULL,
  `scorce` int(255) DEFAULT NULL COMMENT 'credit',
  `num` int(11) DEFAULT NULL COMMENT 'capacity',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'online/offline',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'location/url',
  `algorithm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'point/rank',
  `price` int(11) DEFAULT NULL COMMENT 'creditPrice',
  `choosenum` int(11) DEFAULT NULL COMMENT 'registered',
  `semester` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;

INSERT INTO `course` (`courseid`, `userid`, `coursename`, `scorce`, `num`, `type`, `address`, `algorithm`, `price`, `choosenum`, `semester`)
VALUES
	(2,1,'java',5,2,'1','classroom1','1',10,2,'fall'),
	(3,6,'algorithm',3,5,'2','http://123.com','1',20,5,'spring'),
	(4,6,'web',4,3,'1','classroom2','1',20,3,'spring');

/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table homework
# ------------------------------------------------------------

DROP TABLE IF EXISTS `homework`;

CREATE TABLE `homework` (
  `homeworkid` int(11) NOT NULL AUTO_INCREMENT,
  `teaid` int(11) DEFAULT NULL,
  `courseid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `addtime` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `optiona` varchar(255) DEFAULT NULL,
  `optionb` varchar(255) DEFAULT NULL,
  `optionc` varchar(255) DEFAULT NULL,
  `optiond` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`homeworkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `homework` WRITE;
/*!40000 ALTER TABLE `homework` DISABLE KEYS */;

INSERT INTO `homework` (`homeworkid`, `teaid`, `courseid`, `title`, `content`, `addtime`, `type`, `optiona`, `optionb`, `optionc`, `optiond`)
VALUES
	(2,6,2,'assignment1','123412','2018-12-12 20:25:59','1','','','',''),
	(3,6,3,'assignment2','12341234','2018-12-12 20:26:17','2','11234','234','43','4'),
	(4,6,2,'assignment3','assignment','2018-12-12 14:51:56','1','','','','');

/*!40000 ALTER TABLE `homework` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table scholarship
# ------------------------------------------------------------

DROP TABLE IF EXISTS `scholarship`;

CREATE TABLE `scholarship` (
  `scholarshipid` int(11) NOT NULL AUTO_INCREMENT,
  `scholarshipname` varchar(255) DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ptype` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scholarshipid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `scholarship` WRITE;
/*!40000 ALTER TABLE `scholarship` DISABLE KEYS */;

INSERT INTO `scholarship` (`scholarshipid`, `scholarshipname`, `price`, `ptype`, `type`)
VALUES
	(1,'scholar','1000','1','2'),
	(2,'scholarship1','20%','2','2');

/*!40000 ALTER TABLE `scholarship` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stuwork
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stuwork`;

CREATE TABLE `stuwork` (
  `stuworkid` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` int(11) DEFAULT NULL,
  `homeworkid` int(11) DEFAULT NULL,
  `addtime` varchar(255) DEFAULT NULL,
  `filepath` varchar(255) DEFAULT NULL,
  `scorce` int(11) DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`stuworkid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `stuwork` WRITE;
/*!40000 ALTER TABLE `stuwork` DISABLE KEYS */;

INSERT INTO `stuwork` (`stuworkid`, `stuid`, `homeworkid`, `addtime`, `filepath`, `scorce`, `type`)
VALUES
	(5,2,2,'2018-12-12 21:19:35','1544620774843.doc',10,'1'),
	(7,2,3,'2018-12-12 21:38:42','1544621917389.doc',6,'2'),
	(8,2,3,'2018-12-13 23:22:54','1544772173688.pdf',0,'2'),
	(9,2,2,'2018-12-14 01:01:21','1544772173688.pdf',0,'1'),
	(12,2,3,'2018-12-14 01:24:40','1544779479328.doc',0,NULL),
	(13,2,3,'2018-12-14 10:01:31','',0,NULL),
	(14,2,2,'2018-12-14 10:01:37','',0,NULL),
	(15,2,4,'2018-12-14 10:01:44','',0,NULL),
	(16,2,2,'2018-12-14 10:01:51','',0,NULL),
	(17,2,2,'2018-12-14 10:04:19','',0,NULL),
	(18,2,2,'2018-12-14 10:04:24','',0,NULL);

/*!40000 ALTER TABLE `stuwork` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `scorce` int(255) DEFAULT NULL COMMENT '学分',
  `tuition` varchar(255) DEFAULT NULL COMMENT '学费',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`userid`, `username`, `pwd`, `role`, `code`, `sex`, `birthday`, `realname`, `college`, `major`, `tel`, `email`, `scorce`, `tuition`)
VALUES
	(1,'admin','123456','0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'stu1','123456','2','00001','Male','1991-12-12','stu1','coe','is','154878623559','45887@qq.com',32,'5000'),
	(6,'tea1','123456','1',NULL,'Male',NULL,'tea1','cs','cs','1589654785','789@qq.com',0,'0'),
	(7,'fm2','123456','3',NULL,'Male',NULL,'fm',NULL,NULL,'12342134','12341234@qq.com',0,'0'),
	(8,'stu2','123456','2','2234','Female','1997-2-3','yuanjing','ig','kdmfl','8294657082','fjaiognjsg',5,'6000'),
	(10,'fm','123456','3',NULL,'Male',NULL,'',NULL,NULL,'','',0,'0'),
	(11,'yaoyuanjing','123456','2','','Male','','','','','','',0,'0');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
