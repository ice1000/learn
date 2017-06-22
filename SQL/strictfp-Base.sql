# Host: localhost  (Version: 5.5.53)
# Date: 2017-01-24 17:25:35
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "article"
#

DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
	`Id`       INT(11)               NOT NULL AUTO_INCREMENT,
	`date`     DATE                  NOT NULL DEFAULT '2017-01-01',
	`authorId` SMALLINT(5) UNSIGNED  NOT NULL DEFAULT '0',
	`tags`     TINYTEXT              NOT NULL
	COMMENT 'e.g. Tech,Music,Startalk',
	`category` TINYTEXT              NOT NULL,
	`title`    TINYTEXT              NOT NULL,
	`brief`    TINYTEXT              NOT NULL,
	`content`  MEDIUMTEXT            NOT NULL,
	`up`       MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
	`down`     MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
	`click`    MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY (`Id`, `date`)
)
	ENGINE = MyISAM
	AUTO_INCREMENT = 3
	DEFAULT CHARSET = utf8
	ROW_FORMAT = DYNAMIC;

#
# Data for table "article"
#

/*!40000 ALTER TABLE `article`
	DISABLE KEYS */;
INSERT INTO `article` VALUES
	(1, '2017-01-01', 1, 'Tech, Startalk', 'Tech', 'How to mo the older?', 'Tech you how to mo the older',
	    'Mo is the best way to increase your knowledge.', 10000, 0, 23333),
	(2, '2017-01-01', 1, 'Tech, Startalk', 'Tech', 'How to mo the older?', 'Tech you how to mo the older',
	    'Mo is the best way to increase your knowledge.', 10000, 0, 23333),
	(2, '2017-01-02', 2, 'Tech, Startalk', 'Tech', 'How to mo the older?', 'Tech you how to mo the older',
	    'Mo is the best way to increase your knowledge.', 10000, 0, 23333);
/*!40000 ALTER TABLE `article`
	ENABLE KEYS */;

#
# Structure for table "author"
#

DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
	`Id`         INT(11)    NOT NULL AUTO_INCREMENT,
	`authorType` TINYINT(1) NOT NULL DEFAULT '0',
	`username`   TINYTEXT   NOT NULL,
	`pass`       TINYTEXT   NOT NULL,
	`motto`      TINYTEXT   NOT NULL,
	`avatarURL`  TINYTEXT   NOT NULL,
	`gender`     TINYINT(3) NOT NULL DEFAULT '0',
	PRIMARY KEY (`Id`, `authorType`)
)
	ENGINE = MyISAM
	AUTO_INCREMENT = 2
	DEFAULT CHARSET = utf8
	ROW_FORMAT = DYNAMIC;

#
# Data for table "author"
#

/*!40000 ALTER TABLE `author`
	DISABLE KEYS */;
INSERT INTO `author` VALUES (1, 0, 'Eldath', '', 'Mo is the best way to increase knowledge.', 'http://mo.mo/mo', 1);
INSERT INTO `author`
VALUES (2, 0, 'ice1000', '', 'Play dress is the best way to increase knowledge.', 'http://mo.mo/mo/000', -1);
/*!40000 ALTER TABLE `author`
	ENABLE KEYS */;

#
# Structure for table "quiz"
#

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz` (
	`Id`       INT(11)    NOT NULL AUTO_INCREMENT,
	`formId`   TINYINT(3) NOT NULL DEFAULT '0',
	`type`     TINYINT(1) NOT NULL DEFAULT '0',
	`question` TINYTEXT   NOT NULL,
	`options`  TEXT       NOT NULL
	COMMENT 'e.g. A.Test,B.go,C.run',
	`answer`   CHAR(1)    NOT NULL DEFAULT 'A',
	PRIMARY KEY (`Id`, `formId`)
)
	ENGINE = MyISAM
	AUTO_INCREMENT = 2
	DEFAULT CHARSET = utf8;

#
# Data for table "quiz"
#

/*!40000 ALTER TABLE `quiz`
	DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1, 0, 0, 'as', 'A.as,B.as', 'A');
/*!40000 ALTER TABLE `quiz`
	ENABLE KEYS */;

#
# Structure for table "quiz_form"
#

DROP TABLE IF EXISTS `quiz_form`;
CREATE TABLE `quiz_form` (
	`Id`    INT(11)  NOT NULL AUTO_INCREMENT,
	`name`  TINYTEXT NOT NULL,
	`brief` TINYTEXT NOT NULL,
	PRIMARY KEY (`Id`)
)
	ENGINE = MyISAM
	AUTO_INCREMENT = 2
	DEFAULT CHARSET = utf8;

#
# Data for table "quiz_form"
#

/*!40000 ALTER TABLE `quiz_form`
	DISABLE KEYS */;
INSERT INTO `quiz_form` VALUES (1, 'test', 'test');
/*!40000 ALTER TABLE `quiz_form`
	ENABLE KEYS */;

#
# Structure for table "salt"
#

DROP TABLE IF EXISTS `salt`;
CREATE TABLE `salt` (
	`userId` INT(11)  NOT NULL AUTO_INCREMENT,
	`salt`   TINYTEXT NOT NULL,
	PRIMARY KEY (`userId`)
)
	ENGINE = MyISAM
	DEFAULT CHARSET = utf8;

#
# Data for table "salt"
#

/*!40000 ALTER TABLE `salt`
	DISABLE KEYS */;
/*!40000 ALTER TABLE `salt`
	ENABLE KEYS */;

#
# Structure for table "senior_author_application"
#

DROP TABLE IF EXISTS `senior_author_application`;
CREATE TABLE `senior_author_application` (
	`Id`            INT(11)             NOT NULL AUTO_INCREMENT,
	`email`         TINYTEXT            NOT NULL,
	`zhihu`         TINYTEXT,
	`github`        TINYTEXT,
	`stackoverflow` TINYTEXT,
	`brief`         TINYTEXT            NOT NULL,
	`introduce`     TEXT                NOT NULL,
	`advice`        TINYINT(1) UNSIGNED NOT NULL DEFAULT '0',
	PRIMARY KEY (`Id`)
)
	ENGINE = MyISAM
	DEFAULT CHARSET = utf8
	COMMENT = 'The writer info that need check artificially.';

#
# Data for table "senior_author_application"
#

/*!40000 ALTER TABLE `senior_author_application`
	DISABLE KEYS */;
/*!40000 ALTER TABLE `senior_author_application`
	ENABLE KEYS */;

