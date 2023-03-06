/* Select group One group */
USE `RFID`; SELECT `days`.`day` FROM `days` WHERE `days`.`dayID` IN (
    SELECT `daysGroups`.`dayID` FROM `daysGroups` WHERE `daysGroups`.`tGroupID` IN (
        SELECT `timeGroups`.`TGroupID` FROM `timeGroups` WHERE `timeGroups`.`tGroupID` = 1
    )
);