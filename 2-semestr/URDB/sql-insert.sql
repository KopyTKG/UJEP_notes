/* Drop old DB*/
DROP DATABASE `RFID`;

/* Create new DB and select it */
CREATE DATABASE `RFID`;
USE `RFID`;

/* Create tables*/
CREATE TABLE `chips` (
  `chipID` int PRIMARY KEY AUTO_INCREMENT,
  `codeID` int
);
CREATE TABLE `codes` (
  `codeID` int PRIMARY KEY AUTO_INCREMENT,
  `code` text,
  `rightID` int,
  `realCode` text
);
CREATE TABLE `emploies` (
  `employeID` int PRIMARY KEY AUTO_INCREMENT,
  `chipID` int,
  `codeID` int,
  `firstname` text,
  `lastname` text,
  `position` text
);
CREATE TABLE `rightsGroups` (
  `rGroupID` int PRIMARY KEY AUTO_INCREMENT,
  `accessGroup` int,
  `timeGroup` int,
  `description` text
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
  `codeID` int,
  `status` tinyint,
  `day` date,
  `time` timestamp
);

/* Create references*/
ALTER TABLE `chips` ADD FOREIGN KEY (`codeID`) REFERENCES `codes` (`codeID`);
ALTER TABLE `codes` ADD FOREIGN KEY (`rightID`) REFERENCES `rightsGroups` (`rGroupID`);
ALTER TABLE `emploies` ADD FOREIGN KEY (`chipID`) REFERENCES `chips` (`chipID`);
ALTER TABLE `emploies` ADD FOREIGN KEY (`codeID`) REFERENCES `codes` (`codeID`);
ALTER TABLE `rightsGroups` ADD FOREIGN KEY (`accessGroup`) REFERENCES `accessGroups` (`aGroupID`);
ALTER TABLE `rightsGroups` ADD FOREIGN KEY (`timeGroup`) REFERENCES `timeGroups` (`tGroupID`);
ALTER TABLE `logs` ADD FOREIGN KEY (`employeID`) REFERENCES `emploies` (`employeID`);
ALTER TABLE `logs` ADD FOREIGN KEY (`chipID`) REFERENCES `emploies` (`chipID`);
ALTER TABLE `logs` ADD FOREIGN KEY (`codeID`) REFERENCES `emploies` (`codeID`);
ALTER TABLE `daysGroups` ADD FOREIGN KEY (`tGroupID`) REFERENCES `timeGroups` (`tGroupID`);
ALTER TABLE `daysGroups` ADD FOREIGN KEY (`dayID`) REFERENCES `days` (`dayID`);
ALTER TABLE `doorsGroups` ADD FOREIGN KEY (`doorID`) REFERENCES `doors` (`doorID`);
ALTER TABLE `doorsGroups` ADD FOREIGN KEY (`aGroupID`) REFERENCES `accessGroups` (`aGroupID`);
    
/* INSERT SECTION */
INSERT INTO `days` (`day`) VALUES ('Monday');
INSERT INTO `days` (`day`) VALUES ('Tuesday');
INSERT INTO `days` (`day`) VALUES ('Wednesday');
INSERT INTO `days` (`day`) VALUES ('Thursday');
INSERT INTO `days` (`day`) VALUES ('Friday');
INSERT INTO `days` (`day`) VALUES ('Saturday');
INSERT INTO `days` (`day`) VALUES ('Sunday');
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('3:00:00', '8:45:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (1,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (1,2);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('0:00:00', '8:45:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2,5);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('2:00:00', '12:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (3,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (3,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (3,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (3,4);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('11:00:00', '22:45:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4,5);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4,6);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('3:00:00', '8:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5,3);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('3:00:00', '8:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6,4);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('5:00:00', '9:00:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (7,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (7,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (7,3);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('3:00:00', '12:00:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (8,1);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('1:00:00', '5:00:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (9,1);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('0:00:00', '9:00:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (10,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (10,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (10,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (10,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (10,5);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('4:00:00', '9:30:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (11,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (11,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (11,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (11,4);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('8:00:00', '17:30:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (12,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (12,2);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('1:00:00', '11:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (13,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (13,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (13,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (13,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (13,5);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('10:00:00', '14:30:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (14,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (14,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (14,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (14,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (14,5);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (14,6);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('12:00:00', '17:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (15,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (15,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (15,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (15,4);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (15,5);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (15,6);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('5:00:00', '14:00:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (16,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (16,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (16,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (16,4);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('2:00:00', '7:30:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (17,1);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('10:00:00', '21:45:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (18,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (18,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (18,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (18,4);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('4:00:00', '12:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (19,1);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (19,2);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (19,3);
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (19,4);
INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('9:00:00', '20:15:00');
INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (20,1);
INSERT INTO `doors` (`MAC`, `description`) VALUES ('eb:94:70:34:1b:85','Lab A1 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('cb:3c:a4:3d:6b:4f','Lab A2 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('c7:f7:ed:a5:06:ce','Lab B1 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('ec:02:6c:de:ed:f8','Lab B2 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('b6:cc:04:5f:73:7e','Lab C1 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('b0:f1:19:20:d6:d1','Lab C2 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('37:6a:2f:df:06:2f','Lab C3 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('2b:a7:37:51:23:13','Lab D1 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('11:4d:f1:71:bb:b6','Lab D2 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('c0:6b:48:91:7d:ee','Lab E1 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('e3:ec:cc:d7:59:2e','Lab E2 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('72:37:c1:6c:75:2d','Lab E3 Basement'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('24:0f:ac:29:49:dd','Office floor 2'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('85:b8:1d:7f:5f:c7','Office floor 3'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('83:4a:6b:c3:67:7b','Office floor 4'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('ab:f5:fd:74:95:1b','Office floor 5'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('f7:65:d6:73:b0:96','Office floor 6'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('f7:76:9a:a1:b6:19','Office floor 7'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('9e:93:89:f2:15:9d','Office floor 8'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('79:8d:9f:14:32:71','Office floor 9'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('ba:1c:b9:16:41:b5','Office floor 10'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('0b:ef:01:05:6d:19','North door 1'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('b0:fc:66:45:55:5e','North door 2'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('13:b8:d6:ce:b3:78','East door'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('15:21:81:b1:87:3d','South door'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('03:6b:63:98:4c:35','Server room -1 floor'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('13:c6:74:8a:e8:51','Server room 2 floor'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('d2:e7:4e:37:76:de','Server room 5 floor'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('98:6c:e8:b0:6f:86','Server room 9 floor'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('a4:ae:98:6e:c2:eb','3 floor management'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('59:f0:49:02:98:69','6 floor management'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('75:a7:94:2b:da:64','9 floor management'); 
INSERT INTO `doors` (`MAC`, `description`) VALUES ('9c:bd:72:24:95:f1','10 floor CEO Office'); 
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

