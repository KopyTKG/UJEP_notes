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