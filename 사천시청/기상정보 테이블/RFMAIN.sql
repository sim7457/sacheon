/*
SQLyog Community v12.18 (64 bit)
MySQL - 5.1.73-community : Database - RFMAIN
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`RFMAIN` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `RFMAIN`;

/*Table structure for table `atmo4824000000` */

CREATE TABLE `atmo4824000000` (
  `ATMODATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `BTYPE` char(1) NOT NULL DEFAULT '',
  `LAVR` int(11) DEFAULT NULL,
  `LMIN` int(11) DEFAULT NULL,
  `LMAX` int(11) DEFAULT NULL,
  `BRTUSTATE` char(10) DEFAULT NULL,
  PRIMARY KEY (`ATMODATE`,`BTYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `awsstate4824000000` */

CREATE TABLE `awsstate4824000000` (
  `LOGDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `BIT0` char(1) DEFAULT NULL,
  `BIT1` char(1) DEFAULT NULL,
  `BIT2` char(1) DEFAULT NULL,
  `BIT3` char(1) DEFAULT NULL,
  `BIT4` char(1) DEFAULT NULL,
  `BIT5` char(1) DEFAULT NULL,
  `BIT6` char(1) DEFAULT NULL,
  `BIT7` char(1) DEFAULT NULL,
  `FBATTERY` int(11) DEFAULT NULL,
  PRIMARY KEY (`LOGDATE`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `awsstatelog4824000000` */

CREATE TABLE `awsstatelog4824000000` (
  `LOGDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `BIT0` char(1) DEFAULT NULL,
  `BIT1` char(1) DEFAULT NULL,
  `BIT2` char(1) DEFAULT NULL,
  `BIT3` char(1) DEFAULT NULL,
  `BIT4` char(1) DEFAULT NULL,
  `BIT5` char(1) DEFAULT NULL,
  `BIT6` char(1) DEFAULT NULL,
  `BIT7` char(1) DEFAULT NULL,
  `BIT8` char(1) DEFAULT NULL,
  `BIT9` char(1) DEFAULT NULL,
  `BIT10` char(1) DEFAULT NULL,
  `BIT11` char(1) DEFAULT NULL,
  `BIT12` char(1) DEFAULT NULL,
  `BIT13` char(1) DEFAULT NULL,
  `BIT14` char(1) DEFAULT NULL,
  `BIT15` char(1) DEFAULT NULL,
  PRIMARY KEY (`LOGDATE`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `columndisplay` */

CREATE TABLE `columndisplay` (
  `IDX` int(11) NOT NULL DEFAULT '0',
  `SLOCALCODE` varchar(10) NOT NULL DEFAULT '0',
  `POS` int(11) NOT NULL DEFAULT '0',
  `FILENAME` varchar(50) DEFAULT NULL,
  `PAGENAME` varchar(50) DEFAULT NULL,
  `LR` int(11) DEFAULT NULL,
  `RELOADTERM` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDX`,`SLOCALCODE`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `currentvalue` */

CREATE TABLE `currentvalue` (
  `sLocalCode` char(10) NOT NULL DEFAULT '',
  `lTime` int(11) DEFAULT NULL,
  `lToday` int(11) DEFAULT NULL,
  `lYester` int(11) DEFAULT NULL,
  `lMonthly` int(11) DEFAULT NULL,
  `bPrinter` char(1) DEFAULT NULL,
  `bLogger` char(1) DEFAULT NULL,
  `bPower` char(1) DEFAULT NULL,
  `bSensor` char(1) DEFAULT NULL,
  `bCall` char(1) DEFAULT NULL,
  `LastCallTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lBTime` int(11) DEFAULT NULL,
  PRIMARY KEY (`sLocalCode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `displayinfo` */

CREATE TABLE `displayinfo` (
  `SLOCALCODE` varchar(10) DEFAULT NULL,
  `SLOCALNAME` varchar(50) DEFAULT NULL,
  `SRAINLOCALCODE` varchar(10) DEFAULT NULL,
  `SSNOWLOCALCODE` varchar(10) DEFAULT NULL,
  `POS` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `humi4824000000` */

CREATE TABLE `humi4824000000` (
  `HUMIDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `BTYPE` char(1) NOT NULL DEFAULT '',
  `LAVR` int(11) DEFAULT NULL,
  `LMIN` int(11) DEFAULT NULL,
  `LMAX` int(11) DEFAULT NULL,
  `BRTUSTATE` char(10) DEFAULT NULL,
  PRIMARY KEY (`HUMIDATE`,`BTYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `linetype` */

CREATE TABLE `linetype` (
  `lLineType` char(1) NOT NULL DEFAULT '',
  `sLineName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`lLineType`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `linkageinfo` */

CREATE TABLE `linkageinfo` (
  `SLOCALCODE` varchar(10) NOT NULL DEFAULT '',
  `SLOCALNAME` varchar(128) DEFAULT NULL,
  `SMATCHCODE` varchar(10) NOT NULL DEFAULT '',
  `SEQ_NO_LDRS` varchar(32) DEFAULT NULL,
  `SEQ_NO_LC_SAFE` varchar(32) DEFAULT NULL,
  `SEQ_NO_HC_SAFE` varchar(32) DEFAULT NULL,
  `SIPADDRESS_MAIN` varchar(128) DEFAULT NULL,
  `SIPADDRESS_LDRS` varchar(128) DEFAULT NULL,
  `SIPADDRESS_LC_SAFE` varchar(128) DEFAULT NULL,
  `SIPADDRESS_HC_SAFE` varchar(128) DEFAULT NULL,
  `LMODELTYPE_LDRS` int(11) DEFAULT NULL,
  `LMODELTYPE_LC_SAFE` int(11) DEFAULT NULL,
  `LMODELTYPE_HC_SAFE` int(11) DEFAULT NULL,
  `LLINETYPE_LINKAGE` int(11) DEFAULT NULL,
  `LASTCALLTIME_LDRS` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LASTCALLTIME_LC_SAFE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LASTCALLTIME_HC_SAFE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`SLOCALCODE`,`SMATCHCODE`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `localcode` */

CREATE TABLE `localcode` (
  `slocalcode` varchar(10) NOT NULL DEFAULT '',
  `si_do` varchar(25) DEFAULT NULL,
  `si_gu` varchar(25) DEFAULT NULL,
  `dong` varchar(25) DEFAULT NULL,
  `li` varchar(25) DEFAULT NULL,
  `area_level` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`slocalcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `localinfo` */

CREATE TABLE `localinfo` (
  `SLOCALCODE` varchar(10) NOT NULL DEFAULT '',
  `SLOCALNAME` varchar(20) DEFAULT NULL,
  `SK_AREA_CD` varchar(10) DEFAULT NULL,
  `SK_SEQ_NO` varchar(3) DEFAULT NULL,
  `LSENSORTYPE` int(11) NOT NULL DEFAULT '0',
  `LMODELTYPE` int(11) DEFAULT NULL,
  `SIPADDRESS` varchar(50) DEFAULT NULL,
  `SDIALNUM` varchar(20) DEFAULT NULL,
  `LDANGER` int(11) DEFAULT NULL,
  `LWARNING` int(11) DEFAULT NULL,
  `LLINETYPE` int(11) DEFAULT NULL,
  `LPORT` int(11) DEFAULT NULL,
  `LBAUDRATE` int(11) DEFAULT NULL,
  `BAVRTYPE` char(1) DEFAULT NULL,
  `LFONTINDEX` int(11) DEFAULT NULL,
  `LDISPINDEX` int(11) DEFAULT NULL,
  `LASTCALLTIME` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `LMODELID` int(11) DEFAULT NULL,
  `LSETTIMESYNC` int(10) DEFAULT NULL,
  PRIMARY KEY (`SLOCALCODE`,`LSENSORTYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `modeltype` */

CREATE TABLE `modeltype` (
  `lModelType` int(11) NOT NULL DEFAULT '0',
  `sModelName` varchar(50) DEFAULT NULL,
  `CallStart` datetime DEFAULT NULL,
  `CallTerm` int(11) DEFAULT NULL,
  PRIMARY KEY (`lModelType`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `pansetup` */

CREATE TABLE `pansetup` (
  `slocalcode` varchar(10) NOT NULL DEFAULT '',
  `lAxis_x` int(11) DEFAULT NULL,
  `lAxis_y` int(11) DEFAULT NULL,
  `lArea_x` int(11) DEFAULT NULL,
  `lArea_y` int(11) DEFAULT NULL,
  PRIMARY KEY (`slocalcode`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `rain0000000000` */

CREATE TABLE `rain0000000000` (
  `bType` char(1) NOT NULL DEFAULT '',
  `RainDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lValue` int(11) DEFAULT NULL,
  `bSensing` char(1) DEFAULT NULL,
  PRIMARY KEY (`RainDate`,`bType`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `rainstate0000000000` */

CREATE TABLE `rainstate0000000000` (
  `LogDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bCall` char(1) DEFAULT NULL,
  `lResetCnt` char(1) DEFAULT NULL,
  `bPrinter` char(1) DEFAULT NULL,
  `bLogger` char(1) DEFAULT NULL,
  `bPower` char(1) DEFAULT NULL,
  `bSensor` char(1) DEFAULT NULL,
  `fBattery` float DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `setupinfo` */

CREATE TABLE `setupinfo` (
  `sProvince` varchar(10) DEFAULT NULL,
  `sAreaName` varchar(10) DEFAULT NULL,
  `sDepartment` varchar(10) DEFAULT NULL,
  `sServerIP` varchar(20) DEFAULT NULL,
  `lPort` int(11) DEFAULT NULL,
  `sAreaCode` char(10) DEFAULT NULL,
  `sReportTag` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `temp4824000000` */

CREATE TABLE `temp4824000000` (
  `TEMPDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `BTYPE` char(1) NOT NULL DEFAULT '',
  `LAVR` int(11) DEFAULT NULL,
  `LMIN` int(11) DEFAULT NULL,
  `LMAX` int(11) DEFAULT NULL,
  `MINTIME` datetime DEFAULT NULL,
  `MAXTIME` datetime DEFAULT NULL,
  `BRTUSTATE` char(10) DEFAULT NULL,
  PRIMARY KEY (`TEMPDATE`,`BTYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `usergroup` */

CREATE TABLE `usergroup` (
  `sName` varchar(50) DEFAULT NULL,
  `sID` varchar(20) DEFAULT NULL,
  `sPwd` varchar(20) DEFAULT NULL,
  `bType` char(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*Table structure for table `wind4824000000` */

CREATE TABLE `wind4824000000` (
  `WINDDATE` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `BTYPE` char(1) NOT NULL DEFAULT '',
  `LAVRDEG1` int(11) DEFAULT NULL,
  `LAVRVEL1` int(11) DEFAULT NULL,
  `LAVRDEG2` int(11) DEFAULT NULL,
  `LAVRVEL2` int(11) DEFAULT NULL,
  `LMAXDEG` int(11) DEFAULT NULL,
  `LMAXVEL` int(11) DEFAULT NULL,
  `MAXVELTIME` datetime DEFAULT NULL,
  `BRTUSTATE` char(10) DEFAULT NULL,
  PRIMARY KEY (`WINDDATE`,`BTYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=euckr;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
