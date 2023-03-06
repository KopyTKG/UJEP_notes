/* Select DB */
USE `RFID`;

/* days */
INSERT INTO `days` (`dayID`, `day`) VALUES (1 ,"Monday");
INSERT INTO `days` (`dayID`, `day`) VALUES (2 ,"Tuesday");
INSERT INTO `days` (`dayID`, `day`) VALUES (3 ,"Wednesday");
INSERT INTO `days` (`dayID`, `day`) VALUES (4 ,"Thursday");
INSERT INTO `days` (`dayID`, `day`) VALUES (5 ,"Friday");
INSERT INTO `days` (`dayID`, `day`) VALUES (6 ,"Saturday");
INSERT INTO `days` (`dayID`, `day`) VALUES (7 ,"Sunday");

/* time groups */

    /* 1] Technic worker */
        INSERT INTO `timeGroups` (`tGroupID`, `timeFrom`, `timeTo`) VALUES (1 ,'05:00:00', '14:30:00');
    /* 2] Master admin worker */
        INSERT INTO `timeGroups` (`tGroupID`, `timeFrom`, `timeTo`) VALUES (2 ,'00:00:00', '23:59:59');
    /* 3] Weekend pass  */
        INSERT INTO `timeGroups` (`tGroupID`, `timeFrom`, `timeTo`) VALUES (3 ,'10:00:00', '13:00:00');
    /* 4] Office worker */
        INSERT INTO `timeGroups` (`tGroupID`, `timeFrom`, `timeTo`) VALUES (4 ,'08:00:00', '15:00:00');
    /* 5] Emergency shift */
        INSERT INTO `timeGroups` (`tGroupID`, `timeFrom`, `timeTo`) VALUES (5 ,'15:00:00', '02:30:00');
    /* 6] Night shift */
        INSERT INTO `timeGroups` (`tGroupID`, `timeFrom`, `timeTo`) VALUES (6 ,'20:00:00', '08:00:00');
    /* 7] Managment worker */
        INSERT INTO `timeGroups` (`tGroupID`, `timeFrom`, `timeTo`) VALUES (7 ,'07:30:00', '16:30:00');
    /* 8] Security admin worker*/
        INSERT INTO `timeGroups` (`tGroupID`, `timeFrom`, `timeTo`) VALUES (8 ,'04:00:00', '20:00:00');

/* groups */
    /* 1] Technic worker */
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (1 ,1);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (1 ,2);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (1 ,3);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (1 ,4);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (1 ,5);

    /* 2] Master admin worker */
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2 ,1);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2 ,2);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2 ,3);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2 ,4);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2 ,5);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2 ,6);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (2 ,7);

    /* 3] Weekend pass */
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (3 , 6);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (3 , 7);

    /* 4] Office worker */
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4 ,1);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4 ,2);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4 ,3);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (4 ,4);

    /* 5] Emergency shift */
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5 ,1);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5 ,2);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5 ,3);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5 ,4);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5 ,5);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5 ,6);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (5 ,7);

    /* 6] Night shift */
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6 ,1);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6 ,2);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6 ,3);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6 ,4);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (6 ,5);
    
    /* 7] Managment worker */
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (7 ,1);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (7 ,2);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (7 ,3);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (7 ,4);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (7 ,5);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (7 ,6);

    /* 8] Security admin worker*/
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (8 ,1);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (8 ,2);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (8 ,3);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (8 ,4);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (8 ,5);
        INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES (8 ,6);

/* doors */
    /* LAB doors */
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('72:37:c1:6c:75:2d','Lab A1 Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('e3:ec:cc:d7:59:2e','Lab A2 Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('ec:02:6c:de:ed:f8','Lab B1 Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('13:b8:d6:ce:b3:78','Lab B2 Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('b6:cc:04:5f:73:7e','Lab C1 Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('85:b8:1d:7f:5f:c7','Lab C2 Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('cb:3c:a4:3d:6b:4f','Lab C3 Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('9e:93:89:f2:15:9d','Lab D1 Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('d2:e7:4e:37:76:de','Lab D2 Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('93:91:a5:d2:f7:e1','Lab E1 Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('24:0f:ac:29:49:dd','Lab E2 Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('ba:1c:b9:16:41:b5','Lab E3 Basement');
    /* Office doors */ 
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('a4:ae:98:6e:c2:eb','Office floor 2');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('79:8d:9f:14:32:71','Office floor 3');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('ab:f5:fd:74:95:1b','Office floor 4');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('37:6a:2f:df:06:2f','Office floor 5');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('b2:f5:97:91:84:46','Office floor 6');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('eb:94:70:34:1b:85','Office floor 7');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('c0:6b:48:91:7d:ee','Office floor 8');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('13:c6:74:8a:e8:51','Office floor 9');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('f7:76:9a:a1:b6:19','Office floor 10');
    /* Main doors */
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('f7:65:d6:73:b0:96','North door 1');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('98:6c:e8:b0:6f:86','North door 2');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('83:4a:6b:c3:67:7b','East door');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('9c:bd:72:24:95:f1','South door');
    /* Server rooms */
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('0b:ef:01:05:6d:19','Server room Basement');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('11:4d:f1:71:bb:b6','Server room 1 floor');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('c7:f7:ed:a5:06:ce','Server room 5 floor');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('15:21:81:b1:87:3d','Server room 9 floor');
    /* Management */ 
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('b0:fc:66:45:55:5e','3 floor management');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('59:f0:49:02:98:69','6 floor management');
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('2d:98:34:bd:39:b2','9 floor management');
    /* CEO Office */
        INSERT INTO `doors` (`MAC`, `description`) VALUES ('69:56:c1:fe:8d:fa','10 floor CEO Office');

/* access groups */
    /* Offices */
        INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 2');
        INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 3');
        INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 4');
        INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 5');
        INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 6');
        INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 7');
        INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 8');
        INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 9');
        INSERT INTO `accessGroups` (`description`) VALUES ('Office pass floor 10');
    /* Labs */
        INSERT INTO `accessGroups` (`description`) VALUES ('Labs pass A');
        INSERT INTO `accessGroups` (`description`) VALUES ('Labs pass B');
        INSERT INTO `accessGroups` (`description`) VALUES ('Labs pass C');
        INSERT INTO `accessGroups` (`description`) VALUES ('Labs pass D');
        INSERT INTO `accessGroups` (`description`) VALUES ('Labs pass E');
    /* Main doors */
        INSERT INTO `accessGroups` (`description`) VALUES ('Main door access');
    /* Server rooms */
        INSERT INTO `accessGroups` (`description`) VALUES ('Basement server room accesss');
        INSERT INTO `accessGroups` (`description`) VALUES ('1 floor server room accesss');
        INSERT INTO `accessGroups` (`description`) VALUES ('5 floor server room accesss');
        INSERT INTO `accessGroups` (`description`) VALUES ('9 floor server room accesss');
    /* Management */
        INSERT INTO `accessGroups` (`description`) VALUES ('Front line management');
        INSERT INTO `accessGroups` (`description`) VALUES ('Mid level management');
        INSERT INTO `accessGroups` (`description`) VALUES ('Top level management');
        INSERT INTO `accessGroups` (`description`) VALUES ('CEO');
    /* Admin pass */
        INSERT INTO `accessGroups` (`description`) VALUES ('Master admin');
        INSERT INTO `accessGroups` (`description`) VALUES ('Admin');

/* access group */        
    /* CEO */
        
    /* Master Admin */
    /* Admin */