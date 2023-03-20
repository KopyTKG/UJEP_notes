SELECT `emploies`.`firstname`,`emploies`.`lastname`FROM `emploies`
LEFT OUTER JOIN `rightsGroups`
ON `emploies`.`employeID` = `rightsGroups`.`employeID`;
/* Mega select */
SELECT e.firstname, e.lastname, d.day, tg.timeFrom, tg.timeTo, dr.MAC, dr.description FROM emploies e
	INNER JOIN rightsGroups 
    AS rg 
    ON rg.employeID = e.employeID 
    	INNER JOIN timeGroups 
        as tg 
        ON rg.timeGroup = tg.tGroupID 
        	INNER JOIN daysGroups 
            as dg 
            ON tg.tGroupID = dg.tGroupID 
            	LEFT OUTER JOIN days 
                as d 
                ON d.dayID = dg.dayID
                	INNER JOIN
                    accessGroups 
                    as ag
                    on ag.aGroupID = rg.accessGroup
                    	INNER JOIN
                        doorsGroups
                        as drg
                        ON drg.aGroupID = ag.aGroupID
                        	LEFT OUTER JOIN
                            doors
                            as dr
                            ON dr.doorID = drg.doorID;