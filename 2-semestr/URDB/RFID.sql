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
  `chipID` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
);

/* Create references*/
ALTER TABLE `rightsGroups` ADD FOREIGN KEY (`employeID`) REFERENCES `emploies` (`employeID`);
ALTER TABLE `emploies` ADD FOREIGN KEY (`chipID`) REFERENCES `chips` (`chipID`);
ALTER TABLE `rightsGroups` ADD FOREIGN KEY (`accessGroup`) REFERENCES `accessGroups` (`aGroupID`);
ALTER TABLE `rightsGroups` ADD FOREIGN KEY (`timeGroup`) REFERENCES `timeGroups` (`tGroupID`);
ALTER TABLE `logs` ADD FOREIGN KEY (`chipID`) REFERENCES `chips` (`chipID`);
ALTER TABLE `daysGroups` ADD FOREIGN KEY (`tGroupID`) REFERENCES `timeGroups` (`tGroupID`);
ALTER TABLE `daysGroups` ADD FOREIGN KEY (`dayID`) REFERENCES `days` (`dayID`);
ALTER TABLE `doorsGroups` ADD FOREIGN KEY (`doorID`) REFERENCES `doors` (`doorID`);
ALTER TABLE `doorsGroups` ADD FOREIGN KEY (`aGroupID`) REFERENCES `accessGroups` (`aGroupID`);