/* Drop old DB*/
DROP DATABASE `RFID`;

/* Create new DB and select it */
CREATE DATABASE `RFID`;
USE `RFID`;

/* Create tables*/
CREATE TABLE `chips` (
  `chipID` int PRIMARY KEY AUTO_INCREMENT,
  `macCode` text
);
CREATE TABLE `emploies` (
  `employeID` int PRIMARY KEY AUTO_INCREMENT,
  `chipID` int,
  `firstname` text,
  `lastname` text
);
CREATE TABLE `rightsGroups` (
  `employeID` int,
  `accessGroup` int,
  `timeGroup` int
);
CREATE TABLE `accessGroups` (
  `aGroupID` int PRIMARY KEY AUTO_INCREMENT,
  `description` text
);
CREATE TABLE `doorsGroups` (
  `aGroupID` int,
  `doorID` int
);
CREATE TABLE `doors` (
  `doorID` int PRIMARY KEY AUTO_INCREMENT,
  `MAC` text NOT NULL,
  `description` text
);
CREATE TABLE `timeGroups` (
  `tGroupID` int PRIMARY KEY AUTO_INCREMENT,
  `timeFrom` time,
  `timeTo` time
);
CREATE TABLE `daysGroups` (
  `tGroupID` int,
  `dayID` int
);
CREATE TABLE `days` (
  `dayID` int PRIMARY KEY AUTO_INCREMENT,
  `day` text
);
CREATE TABLE `logs` (
  `logID` int PRIMARY KEY AUTO_INCREMENT,
  `employeID` int,
  `chipID` int,
  `status` tinyint,
  `day` date,
  `time` timestamp
);

/* Create references*/
ALTER TABLE `rightsGroups` ADD FOREIGN KEY (`employeID`) REFERENCES `emploies` (`employeID`);
ALTER TABLE `emploies` ADD FOREIGN KEY (`chipID`) REFERENCES `chips` (`chipID`);
ALTER TABLE `rightsGroups` ADD FOREIGN KEY (`accessGroup`) REFERENCES `accessGroups` (`aGroupID`);
ALTER TABLE `rightsGroups` ADD FOREIGN KEY (`timeGroup`) REFERENCES `timeGroups` (`tGroupID`);
ALTER TABLE `logs` ADD FOREIGN KEY (`employeID`) REFERENCES `emploies` (`employeID`);
ALTER TABLE `logs` ADD FOREIGN KEY (`chipID`) REFERENCES `emploies` (`chipID`);
ALTER TABLE `daysGroups` ADD FOREIGN KEY (`tGroupID`) REFERENCES `timeGroups` (`tGroupID`);
ALTER TABLE `daysGroups` ADD FOREIGN KEY (`dayID`) REFERENCES `days` (`dayID`);
ALTER TABLE `doorsGroups` ADD FOREIGN KEY (`doorID`) REFERENCES `doors` (`doorID`);
ALTER TABLE `doorsGroups` ADD FOREIGN KEY (`aGroupID`) REFERENCES `accessGroups` (`aGroupID`);
/* INSERT SECTION */ 

/* ------ Days ------*/
INSERT INTO `days` (`day`) VALUES ('Monday');
INSERT INTO `days` (`day`) VALUES ('Tuesday');
INSERT INTO `days` (`day`) VALUES ('Wednesday');
INSERT INTO `days` (`day`) VALUES ('Thursday');
INSERT INTO `days` (`day`) VALUES ('Friday');
INSERT INTO `days` (`day`) VALUES ('Saturday');
INSERT INTO `days` (`day`) VALUES ('Sunday');


/* ------ Time Groups ------*/
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('4:00:00', '9:45:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (1,1);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('9:00:00', '15:00:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2,1);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('4:00:00', '16:30:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (3,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (3,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (3,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (3,4);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('2:00:00', '9:30:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4,2);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('0:00:00', '8:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5,2);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('8:00:00', '15:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6,4);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('2:00:00', '9:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (7,1);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('11:00:00', '18:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (8,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (8,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (8,3);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('1:00:00', '5:00:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (9,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (9,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (9,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (9,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (9,5);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('2:00:00', '13:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (10,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (10,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (10,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (10,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (10,5);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (10,6);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('12:00:00', '20:30:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (11,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (11,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (11,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (11,4);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('1:00:00', '7:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (12,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (12,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (12,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (12,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (12,5);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (12,6);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('11:00:00', '23:00:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (13,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (13,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (13,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (13,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (13,5);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('3:00:00', '12:00:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (14,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (14,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (14,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (14,4);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('3:00:00', '15:45:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (15,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (15,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (15,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (15,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (15,5);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('0:00:00', '11:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (16,1);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('9:00:00', '14:45:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (17,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (17,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (17,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (17,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (17,5);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (17,6);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('4:00:00', '16:30:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (18,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (18,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (18,3);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('12:00:00', '22:30:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (19,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (19,2);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('3:00:00', '12:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (20,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (20,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (20,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (20,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (20,5);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (20,6);


/* ------ Doors ------*/
INSERT INTO `doors` (`MAC`, `description`) VALUES ('9D:69:0C:A7:8F:69','Lab A1 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('DA:E3:7C:01:02:71','Lab A2 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('F5:B0:F9:78:60:7B','Lab B1 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('1D:0F:30:93:5E:C1','Lab B2 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('F0:21:36:79:F4:FD','Lab C1 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('32:D5:44:D7:32:D4','Lab C2 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('9F:01:1E:90:1D:73','Lab C3 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('97:35:37:19:A9:B8','Lab D1 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('9A:F8:30:A4:E2:5A','Lab D2 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('9E:0A:4B:D7:59:B9','Lab E1 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('75:88:93:CA:72:ED','Lab E2 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('05:DD:A9:BB:1B:F2','Lab E3 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('66:41:AC:7A:FF:F0','Office floor 2'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('59:FF:BC:4F:03:7D','Office floor 3'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('3A:56:E8:E0:72:90','Office floor 4'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('63:E0:CA:36:07:15','Office floor 5'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('E1:64:BC:E2:78:FD','Office floor 6'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('A6:6C:38:30:06:F6','Office floor 7'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('CD:F2:82:20:EB:65','Office floor 8'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('D7:49:4D:70:54:47','Office floor 9'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('D0:C2:85:C9:87:AD','Office floor 10'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('D4:AB:5B:B6:99:D4','North door 1'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('E3:5E:1F:0D:3F:31','North door 2'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('DF:D1:2F:C9:77:67','East door'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('60:4E:EA:A8:CC:1E','South door'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('EC:62:D6:28:69:04','Server room -1 floor'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('E1:AA:D1:FD:9F:24','Server room 2 floor'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('F0:24:EA:BD:09:43','Server room 5 floor'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('26:72:27:33:B5:F6','Server room 9 floor'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('E3:E7:1F:79:61:49','3 floor management'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('74:E4:6C:6D:EE:8A','6 floor management'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('E7:8C:02:85:93:35','9 floor management'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('5B:68:CE:E6:E7:39','10 floor CEO Office'); 


/* ------ Access Groups ------*/
INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 2');
INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 3');
INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 4');
INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 5');
INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 6');
INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 7');
INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 8');
INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 9');
INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 10');
INSERT INTO `accessGroups` (`description`) VALUES ('Labs pass A');
INSERT INTO `accessGroups` (`description`) VALUES ('Labs pass B');
INSERT INTO `accessGroups` (`description`) VALUES ('Labs pass C');
INSERT INTO `accessGroups` (`description`) VALUES ('Labs pass D');
INSERT INTO `accessGroups` (`description`) VALUES ('Labs pass E');
INSERT INTO `accessGroups` (`description`) VALUES ('Main door access');
INSERT INTO `accessGroups` (`description`) VALUES ('Front line management');
INSERT INTO `accessGroups` (`description`) VALUES ('Mid level management');
INSERT INTO `accessGroups` (`description`) VALUES ('Top level management');
INSERT INTO `accessGroups` (`description`) VALUES ('CEO');
INSERT INTO `accessGroups` (`description`) VALUES ('Master admin');
INSERT INTO `accessGroups` (`description`) VALUES ('Admin');


/* ------ Door access link ------*/
INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass A%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%A1%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass A%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%A2%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass B%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%B1%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass B%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%B2%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass C%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%C1%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass C%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%C2%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass C%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%C3%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass D%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%D1%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass D%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%D2%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass E%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%E1%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass E%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%E2%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass E%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%E3%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%floor 2%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Office%%2%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%floor 3%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Office%%3%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%floor 4%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Office%%4%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%floor 5%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Office%%5%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%floor 6%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Office%%6%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%floor 7%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Office%%7%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%floor 8%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Office%%8%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%floor 9%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Office%%9%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%floor 10%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Office%%10%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%Master%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Server%%-1 floor%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%Master%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Server%%2 floor%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%Master%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Server%%5 floor%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%Master%'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Server%%9 floor%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` = 'Admin'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Server%%2 floor%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` = 'Admin'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Server%%5 floor%'));

INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (
(SELECT `aGroupID` FROM `accessGroups` WHERE `description` = 'Admin'),
(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Server%%9 floor%'));

/* ------ Chips ------ */ 
INSERT INTO `chips`(macCode) VALUES ('3B:37:23:17:59:48'); 
INSERT INTO `chips`(macCode) VALUES ('3F:88:2E:EF:9C:C7'); 
INSERT INTO `chips`(macCode) VALUES ('6D:95:D7:CB:49:CF'); 
INSERT INTO `chips`(macCode) VALUES ('97:DA:08:9C:40:AC'); 
INSERT INTO `chips`(macCode) VALUES ('0F:DF:77:0F:88:9C'); 
INSERT INTO `chips`(macCode) VALUES ('E4:BC:7A:95:59:29'); 
INSERT INTO `chips`(macCode) VALUES ('04:71:77:CF:E5:85'); 
INSERT INTO `chips`(macCode) VALUES ('0D:2F:77:39:A0:1A'); 
INSERT INTO `chips`(macCode) VALUES ('CF:3C:48:D2:D8:3E'); 
INSERT INTO `chips`(macCode) VALUES ('4B:A7:26:EE:39:58'); 
INSERT INTO `chips`(macCode) VALUES ('2B:20:5C:31:9A:E5'); 
INSERT INTO `chips`(macCode) VALUES ('D9:62:D5:72:B3:0C'); 
INSERT INTO `chips`(macCode) VALUES ('FC:3C:65:8F:FC:A1'); 
INSERT INTO `chips`(macCode) VALUES ('65:66:41:5F:2C:54'); 
INSERT INTO `chips`(macCode) VALUES ('92:35:24:BA:CF:37'); 
INSERT INTO `chips`(macCode) VALUES ('4B:20:B6:BF:95:78'); 
INSERT INTO `chips`(macCode) VALUES ('AF:67:36:91:8C:40'); 
INSERT INTO `chips`(macCode) VALUES ('98:BD:33:E6:E9:DB'); 
INSERT INTO `chips`(macCode) VALUES ('94:77:8C:6F:D7:3B'); 
INSERT INTO `chips`(macCode) VALUES ('B1:25:B4:51:87:87'); 
INSERT INTO `chips`(macCode) VALUES ('4D:EB:EA:1F:B8:98'); 
INSERT INTO `chips`(macCode) VALUES ('E4:9F:A7:09:67:AE'); 
INSERT INTO `chips`(macCode) VALUES ('A7:53:C1:46:9D:21'); 
INSERT INTO `chips`(macCode) VALUES ('E7:5F:FF:F0:63:8F'); 
INSERT INTO `chips`(macCode) VALUES ('9F:03:F9:40:4C:E5'); 
INSERT INTO `chips`(macCode) VALUES ('84:56:5F:1E:45:E9'); 
INSERT INTO `chips`(macCode) VALUES ('AF:40:A3:7F:1E:24'); 
INSERT INTO `chips`(macCode) VALUES ('2F:3F:CB:B2:E1:53'); 
INSERT INTO `chips`(macCode) VALUES ('49:92:5E:2E:EF:1D'); 
INSERT INTO `chips`(macCode) VALUES ('E4:B4:F8:7C:37:E1'); 
INSERT INTO `chips`(macCode) VALUES ('9D:43:0A:7C:CB:CE'); 
INSERT INTO `chips`(macCode) VALUES ('C9:92:54:E0:90:83'); 
INSERT INTO `chips`(macCode) VALUES ('8B:E6:FB:D8:63:B1'); 
INSERT INTO `chips`(macCode) VALUES ('F8:90:E6:95:C1:49'); 
INSERT INTO `chips`(macCode) VALUES ('FB:AA:51:3D:5F:C5'); 
INSERT INTO `chips`(macCode) VALUES ('A7:92:63:46:62:B3'); 
INSERT INTO `chips`(macCode) VALUES ('82:91:F3:58:B0:36'); 
INSERT INTO `chips`(macCode) VALUES ('8F:37:6F:72:88:0C'); 
INSERT INTO `chips`(macCode) VALUES ('1E:5C:15:7F:8C:D0'); 
INSERT INTO `chips`(macCode) VALUES ('4F:75:46:18:28:8E'); 
INSERT INTO `chips`(macCode) VALUES ('AB:2E:83:F3:CE:13'); 
INSERT INTO `chips`(macCode) VALUES ('0A:77:EC:48:CA:80'); 
INSERT INTO `chips`(macCode) VALUES ('9C:8D:27:EC:E5:BE'); 
INSERT INTO `chips`(macCode) VALUES ('5A:61:C0:1B:55:CA'); 
INSERT INTO `chips`(macCode) VALUES ('DD:0E:EC:F9:64:41'); 
INSERT INTO `chips`(macCode) VALUES ('4A:05:27:31:7D:72'); 
INSERT INTO `chips`(macCode) VALUES ('2D:8F:9C:1F:EB:FF'); 
INSERT INTO `chips`(macCode) VALUES ('95:EA:14:00:7F:40'); 
INSERT INTO `chips`(macCode) VALUES ('6A:D1:A2:9F:E6:28'); 
INSERT INTO `chips`(macCode) VALUES ('C1:8B:1D:F2:95:FB'); 
INSERT INTO `chips`(macCode) VALUES ('C3:EF:60:05:24:CE'); 
INSERT INTO `chips`(macCode) VALUES ('5D:9D:CD:EE:A9:39'); 
INSERT INTO `chips`(macCode) VALUES ('B8:A2:3A:E8:39:FE'); 
INSERT INTO `chips`(macCode) VALUES ('05:8D:C9:64:2F:E5'); 
INSERT INTO `chips`(macCode) VALUES ('30:4C:9F:B8:72:A2'); 
INSERT INTO `chips`(macCode) VALUES ('AC:47:B6:B2:45:3D'); 
INSERT INTO `chips`(macCode) VALUES ('C2:21:00:37:2F:9D'); 
INSERT INTO `chips`(macCode) VALUES ('83:94:DF:49:F6:D6'); 
INSERT INTO `chips`(macCode) VALUES ('22:D6:8B:25:29:C4'); 
INSERT INTO `chips`(macCode) VALUES ('E2:6F:BB:09:2D:BF'); 
INSERT INTO `chips`(macCode) VALUES ('51:82:3E:B7:5F:D1'); 
INSERT INTO `chips`(macCode) VALUES ('CB:B5:B0:97:8B:91'); 
INSERT INTO `chips`(macCode) VALUES ('22:C5:94:A8:9F:09'); 
INSERT INTO `chips`(macCode) VALUES ('B9:47:C8:3E:93:E1'); 
INSERT INTO `chips`(macCode) VALUES ('C2:F8:7D:11:DF:48'); 
INSERT INTO `chips`(macCode) VALUES ('2C:9F:DF:1D:F1:6F'); 
INSERT INTO `chips`(macCode) VALUES ('10:E6:5F:14:42:99'); 
INSERT INTO `chips`(macCode) VALUES ('B0:F3:D1:16:D0:26'); 
INSERT INTO `chips`(macCode) VALUES ('F3:C3:FC:9C:43:F7'); 
INSERT INTO `chips`(macCode) VALUES ('E4:3E:49:58:03:95'); 
INSERT INTO `chips`(macCode) VALUES ('81:04:24:A1:3C:30'); 
INSERT INTO `chips`(macCode) VALUES ('BB:A2:51:D3:9C:88'); 
INSERT INTO `chips`(macCode) VALUES ('DE:33:7E:21:1F:EE'); 
INSERT INTO `chips`(macCode) VALUES ('02:7A:6A:3D:83:D6'); 
INSERT INTO `chips`(macCode) VALUES ('24:F5:76:4E:01:CB'); 
INSERT INTO `chips`(macCode) VALUES ('0B:E7:77:91:32:51'); 
INSERT INTO `chips`(macCode) VALUES ('83:06:A1:CB:60:24'); 
INSERT INTO `chips`(macCode) VALUES ('C3:B0:66:97:1C:B7'); 
INSERT INTO `chips`(macCode) VALUES ('72:4F:B5:BF:CB:EC'); 
INSERT INTO `chips`(macCode) VALUES ('C1:0C:10:54:D3:92'); 
INSERT INTO `chips`(macCode) VALUES ('D2:20:59:95:80:92'); 
INSERT INTO `chips`(macCode) VALUES ('1A:89:F0:89:C6:57'); 
INSERT INTO `chips`(macCode) VALUES ('2C:6E:3C:BC:2D:CF'); 
INSERT INTO `chips`(macCode) VALUES ('5B:EF:93:C8:6A:D6'); 
INSERT INTO `chips`(macCode) VALUES ('65:14:07:FF:C0:09'); 
INSERT INTO `chips`(macCode) VALUES ('B7:46:33:E7:A7:A9'); 
INSERT INTO `chips`(macCode) VALUES ('4F:72:A3:D3:0D:A8'); 
INSERT INTO `chips`(macCode) VALUES ('86:E2:B0:DC:73:6A'); 
INSERT INTO `chips`(macCode) VALUES ('D4:8F:8E:C9:DE:31'); 
INSERT INTO `chips`(macCode) VALUES ('30:F6:50:62:50:9E'); 
INSERT INTO `chips`(macCode) VALUES ('47:B5:B0:A8:D5:DA'); 
INSERT INTO `chips`(macCode) VALUES ('C0:01:8B:70:A3:19'); 
INSERT INTO `chips`(macCode) VALUES ('D6:A1:BD:EB:1E:32'); 
INSERT INTO `chips`(macCode) VALUES ('F3:61:79:6F:63:A6'); 
INSERT INTO `chips`(macCode) VALUES ('96:2C:F7:37:52:45'); 

/* ------ Emploies ------ */ 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (3,'CAMEL', 'SWANSON'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (9,'DOMINICA', 'NOLAN'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (38,'SHANNEN', 'GARRETT'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (69,'LYN', 'MCDOWELL'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (71,'BRENNA', 'FLEMING'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (4,'EBONEE', 'KHAN'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (16,'DARCEE', 'STEPHENS'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (67,'NATALIE', 'ATKINS'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (17,'JOURDAN', 'FLOYD'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (70,'DEVONDRA', 'COLE'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (42,'CARLIE', 'ASHLEY'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (85,'SEPHIRA', 'HARDING'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (87,'LUCE', 'CUMMINGS'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (76,'GINGER', 'CROSBY'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (20,'BREENA', 'HO'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (77,'DORELLA', 'MANN'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (28,'MILENA', 'PONCE'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (7,'GUGLIELMA', 'NICHOLS'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (79,'SAIDEE', 'MCDANIEL'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (75,'REGGI', 'TUCKER'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (95,'FLORI', 'BRADY'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (25,'FELIZA', 'PINEDA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (93,'DARSEY', 'LE'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (74,'PRUE', 'FLETCHER'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (18,'THERESSA', 'MCKENZIE'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (61,'AIME', 'CANTU'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (12,'FRAN', 'SEXTON'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (94,'MARGALO', 'KNIGHT'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (1,'KATHLEEN', 'SUTTON'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (6,'NELLIE', 'CONNER'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (80,'CLARA', 'BURNETT'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (29,'DENY', 'STUART'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (56,'CAROL', 'REYES'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (34,'ARABELE', 'COOPER'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (27,'CARON', 'WATTS'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (63,'ROZELLE', 'MEJIA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (89,'ELISA', 'KIM'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (86,'MYRTLE', 'MARSHALL'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (88,'GABRIELLA', 'PATRICK'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (82,'EMMI', 'VILLANUEVA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (72,'SAMMY', 'BULLOCK'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (31,'LORRAYNE', 'MARIN'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (66,'ALVERTA', 'MONTOYA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (59,'RUPERTA', 'REYNOLDS'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (62,'MERILEE', 'SANTIAGO'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (49,'KARIE', 'PENA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (22,'KARLYN', 'SUAREZ'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (8,'WINNA', 'BRENNAN'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (65,'EMLYNN', 'ROGERS'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (91,'ILEANA', 'NUNEZ'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (50,'MARNEY', 'OWENS'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (44,'JESSALYN', 'HOUSTON'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (51,'OLLY', 'GRIFFITH'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (36,'FIDELA', 'FITZPATRICK'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (52,'DEVON', 'ARNOLD'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (13,'CYMBRE', 'NORTON'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (40,'VIKKY', 'WILSON'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (37,'HENRIETTA', 'MCLAUGHLIN'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (39,'LONEE', 'GAINES'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (84,'CORABELLA', 'PEARSON'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (19,'MERL', 'SOTO'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (33,'ROZ', 'INGRAM'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (10,'RAFAELIA', 'PHAN'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (60,'NELIE', 'FULLER'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (55,'AMANDI', 'BEST'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (45,'BETTINA', 'WILKERSON'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (14,'BLAKELEE', 'PERKINS'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (41,'ULA', 'DUDLEY'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (21,'IVETTE', 'SINGH'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (92,'MORGANA', 'KEITH'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (32,'RUBI', 'CHERRY'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (81,'GABRILA', 'MCFARLAND'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (23,'ELBERTINE', 'BANKS'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (26,'LORY', 'LARA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (73,'ALISSA', 'ROY'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (47,'LELIA', 'BAXTER'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (90,'ASHLAN', 'DELEON'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (2,'DDENE', 'MENDOZA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (57,'CHARYL', 'ESPINOSA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (35,'BEL', 'LIU'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (58,'GEORGEANNA', 'LU'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (11,'ALMERIA', 'ZAVALA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (83,'KORRY', 'JOHNSTON'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (15,'NINNETTE', 'LUNA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (24,'JYOTI', 'ZUNIGA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (43,'HILDEGAARD', 'WHITNEY'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (68,'NATHALIA', 'BARTON'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (53,'LINDSEY', 'ESTRADA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (54,'PAULINE', 'ROWE'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (30,'LEESE', 'DECKER'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (64,'SALLI', 'GARCIA'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (48,'WREN', 'BROWN'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (46,'BLONDELL', 'ANDREWS'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (5,'MARYLEE', 'HARVEY'); 
INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES (78,'DALLAS', 'JENNINGS'); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (8,6,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (8,17,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (8,4,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (8,12,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (8,18,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (8,20,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (80,4,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (80,15,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (80,9,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (80,7,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (80,19,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (80,18,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (80,12,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (80,4,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (18,14,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (18,4,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (18,20,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (18,11,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (18,14,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (18,16,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (18,5,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (18,11,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (18,2,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (84,6,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (84,12,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (84,19,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (84,10,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (84,5,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (84,2,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (84,21,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (84,21,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (84,21,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (37,20,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (37,14,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (37,1,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (37,10,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (37,19,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (37,19,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (37,20,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (37,2,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (37,14,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (64,8,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (64,13,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (64,10,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (64,13,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (64,18,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (64,9,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (32,16,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (32,6,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (32,6,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (32,7,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (32,20,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (93,13,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (93,20,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (93,8,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (93,8,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (93,20,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (93,3,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (12,7,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (12,2,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (12,16,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (12,12,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (12,15,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (83,20,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (83,14,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (83,1,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (83,18,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (83,4,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (83,21,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (83,20,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (83,13,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (83,21,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (83,5,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (83,12,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (3,7,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (3,16,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (3,13,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (3,10,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (3,13,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (3,2,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (3,6,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (14,20,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (14,21,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (14,16,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (14,4,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (14,13,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (14,15,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (14,15,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (14,11,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (20,17,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (20,13,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (20,11,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (20,17,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (20,6,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (20,10,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (49,4,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (49,18,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (49,7,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (49,16,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (49,1,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (49,11,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (49,2,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (49,20,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (49,3,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (49,8,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (47,18,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (47,15,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (47,8,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (47,15,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (47,8,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (47,16,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (47,18,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (47,2,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (21,10,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (21,15,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (21,4,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (21,17,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (21,10,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (48,17,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (48,2,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (48,15,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (48,7,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (48,8,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (48,4,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (48,7,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (48,17,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (48,15,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (48,13,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (26,10,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (26,12,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (26,5,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (26,5,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (26,12,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (26,21,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (86,18,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (86,15,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (86,14,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (86,8,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (86,11,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (86,11,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (86,15,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (86,8,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (86,21,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (60,4,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (60,3,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (60,14,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (60,18,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (60,6,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (60,7,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (60,3,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (60,13,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (60,7,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (35,13,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (35,7,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (35,18,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (35,14,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (35,4,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (35,6,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (35,5,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (35,21,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (40,15,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (40,14,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (40,9,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (40,18,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (9,12,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (9,21,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (9,13,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (9,10,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (9,6,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (9,8,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (9,12,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (9,4,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (9,14,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (9,16,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (9,19,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (33,15,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (33,18,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (33,8,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (33,5,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (33,5,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (33,21,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (33,2,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (76,2,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (76,5,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (76,1,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (76,10,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (76,10,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (76,13,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (76,15,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (76,11,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (76,2,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (28,6,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (28,6,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (28,11,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (28,17,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (28,13,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (28,3,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (28,12,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (25,5,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (25,5,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (25,1,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (25,18,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (25,18,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (25,2,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (25,9,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (25,15,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (25,9,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (25,8,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (25,1,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (78,20,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (78,6,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (78,12,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (78,18,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (78,3,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (78,21,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (78,11,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (78,2,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (78,17,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (78,10,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (17,4,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (17,4,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (17,21,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (17,1,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (17,8,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (13,9,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (13,17,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (13,21,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (13,19,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (91,13,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (91,19,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (91,2,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (91,15,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (91,5,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (82,17,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (82,7,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (82,3,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (82,5,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (82,1,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (82,19,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (82,17,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (82,19,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (82,2,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (52,3,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (52,2,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (52,7,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (52,14,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (52,19,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (52,9,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (52,8,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (11,5,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (11,14,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (11,1,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (11,7,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (11,9,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (11,16,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (11,11,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (11,6,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (11,21,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (11,9,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (57,13,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (57,6,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (57,19,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (57,19,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (57,9,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (57,3,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (57,16,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (57,12,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (57,9,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (95,15,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (95,21,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (95,20,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (95,11,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (95,15,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (95,10,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (95,1,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (90,9,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (90,18,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (90,13,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (90,7,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (90,4,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (90,14,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (90,8,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (90,6,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (90,18,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (90,6,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (92,7,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (92,2,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (92,2,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (92,12,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (92,17,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (92,3,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (69,10,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (69,13,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (69,20,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (69,6,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (69,5,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (41,2,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (41,2,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (41,2,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (41,19,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (41,5,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (41,2,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (41,8,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (41,2,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (68,21,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (68,20,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (68,9,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (68,6,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (68,2,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (68,8,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (16,7,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (16,12,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (16,16,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (16,6,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (16,20,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (53,20,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (53,18,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (53,11,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (53,6,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (53,5,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (53,7,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (53,5,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (53,18,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (53,3,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (36,17,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (36,4,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (36,7,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (36,20,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (36,3,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (36,11,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (36,14,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (36,14,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (36,18,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (36,6,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (36,1,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (77,5,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (77,12,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (77,2,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (77,1,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (77,2,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (43,12,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (43,7,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (43,8,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (43,9,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (43,9,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (43,7,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (43,1,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (43,7,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (43,19,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (43,10,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (66,1,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (66,5,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (66,1,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (66,17,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (66,11,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (66,10,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (66,1,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (66,19,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (67,9,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (67,17,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (67,16,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (67,6,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (67,8,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (75,11,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (75,4,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (75,6,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (75,20,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (6,5,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (6,2,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (6,8,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (6,5,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (6,18,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (6,4,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (6,6,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (6,7,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (6,16,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (50,7,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (50,8,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (50,1,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (50,7,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (50,10,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (50,5,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (50,5,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (87,2,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (87,10,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (87,18,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (87,10,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (87,14,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (94,11,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (94,11,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (94,6,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (94,20,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (94,2,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (94,18,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (94,17,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (94,16,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (94,5,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (94,21,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (94,15,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (51,15,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (51,3,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (51,21,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (51,21,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (51,4,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (51,15,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (51,15,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (56,5,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (56,7,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (56,3,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (56,9,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (56,20,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (56,13,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (15,10,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (15,16,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (15,2,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (15,7,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (15,12,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (15,11,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (15,9,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (58,8,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (58,20,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (58,8,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (58,18,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (58,1,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (58,6,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (58,6,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (58,12,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (58,10,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (38,17,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (38,14,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (38,18,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (38,3,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (38,17,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (38,17,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (38,1,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (38,9,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (38,19,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (38,5,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (38,14,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (27,17,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (27,4,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (27,3,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (27,6,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (2,16,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (2,1,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (2,14,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (2,8,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (2,5,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (2,6,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (2,17,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (2,10,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (45,8,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (45,10,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (45,10,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (45,9,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (45,11,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (88,21,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (88,16,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (88,10,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (88,13,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (88,14,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (88,17,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (1,11,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (1,10,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (1,9,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (1,3,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (1,2,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (1,17,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (1,6,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (1,18,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (1,16,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (1,1,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (1,16,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (23,20,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (23,12,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (23,18,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (23,2,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (23,2,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (23,19,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (46,19,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (46,20,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (46,8,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (46,19,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (46,10,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (46,1,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (46,20,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (22,6,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (22,20,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (22,19,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (22,4,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (22,2,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (22,20,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (22,3,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (22,9,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (22,3,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (22,11,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (22,10,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (62,6,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (62,10,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (62,2,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (62,13,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (62,2,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (62,15,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (62,14,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (62,17,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (62,12,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (62,5,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (5,10,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (5,8,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (5,21,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (5,4,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (5,8,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (5,1,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (5,10,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (5,16,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (5,2,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (5,10,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (5,11,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (89,12,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (89,7,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (89,14,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (89,2,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (89,2,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (89,4,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (89,8,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (70,1,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (70,9,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (70,18,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (70,8,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (70,2,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (70,3,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (24,19,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (24,16,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (24,17,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (24,17,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (24,4,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (24,20,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (24,2,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (24,17,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (31,11,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (31,3,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (31,21,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (31,17,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (31,18,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (31,17,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (31,6,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (31,10,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (31,8,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (31,10,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (31,21,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (72,6,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (72,17,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (72,7,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (72,17,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (34,20,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (34,1,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (34,20,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (34,4,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (34,17,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (34,20,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (19,7,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (19,15,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (19,19,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (19,16,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (19,20,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (19,10,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (19,20,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (7,1,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (7,16,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (7,6,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (7,9,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (7,8,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (7,11,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (7,21,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (63,20,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (63,19,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (63,5,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (63,10,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (63,7,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (61,2,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (61,7,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (61,3,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (61,12,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (61,5,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (61,13,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (73,21,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (73,21,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (73,7,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (73,1,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (73,19,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (73,12,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (73,14,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (73,18,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (73,11,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (54,20,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (54,8,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (54,6,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (54,8,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (54,12,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (54,2,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (4,6,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (4,7,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (4,21,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (4,21,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (4,11,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (81,20,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (81,21,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (81,17,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (81,18,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (81,14,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (81,19,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (81,19,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (79,10,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (79,3,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (79,17,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (79,15,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (55,19,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (55,21,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (55,1,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (55,1,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (55,8,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (55,8,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (55,19,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (55,16,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (39,21,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (39,2,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (39,4,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (39,18,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (39,3,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (39,13,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (39,11,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (39,20,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (39,16,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (30,14,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (30,14,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (30,19,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (30,12,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (30,12,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (30,6,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (30,11,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (30,8,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (29,3,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (29,21,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (29,1,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (29,2,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (59,9,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (59,17,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (59,3,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (59,9,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (59,21,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (59,19,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (59,5,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (59,8,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (59,5,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (59,12,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (59,10,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (44,5,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (44,8,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (44,10,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (44,8,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (44,10,10); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (85,5,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (85,1,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (85,16,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (85,18,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (85,13,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (85,5,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (85,12,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (85,10,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (85,12,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (85,21,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (74,20,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (74,18,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (74,21,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (74,4,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (74,17,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (74,19,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (71,5,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (71,17,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (71,10,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (71,15,1); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (71,9,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (71,18,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (71,6,4); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (71,13,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (71,13,7); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (71,17,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (71,9,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (65,7,5); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (65,5,15); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (65,3,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (65,5,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (65,21,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (65,14,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (65,13,8); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (65,17,3); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (65,9,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (10,10,16); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (10,14,13); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (10,7,12); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (10,10,18); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (42,3,17); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (42,8,11); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (42,13,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (42,15,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (42,19,2); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (42,20,6); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (42,10,20); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (42,6,19); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (42,7,14); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (42,14,9); 
INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES (42,18,17); 
