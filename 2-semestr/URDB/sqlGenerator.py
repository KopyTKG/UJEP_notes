import yaml, os
from random import randint as rng, choice
from classes import Queue, Randomizer


def rand_mac():
    return str("%02x:%02x:%02x:%02x:%02x:%02x" % (
        rng(0, 255),
        rng(0, 255),
        rng(0, 255),
        rng(0, 255),
        rng(0, 255),
        rng(0, 255)
        )).upper()



home =f"{os.getcwd()}/2-semestr/URDB"

firstnames = surnames = Randomizer([])

with open(f"{home}/Cache/firstnames.csv", "r") as Names: 
    firstnames = Randomizer(Names.read().upper().split("\n"))
with open(f"{home}/Cache/surnames.csv", "r") as Names: 
    surnames = Randomizer(Names.read().split("\n"))


rules = {}
with open(f"{home}/rules.yaml", "r") as yml:
    rules = yaml.safe_load(yml)

with open(f"{home}/sql-insert.sql", "w") as sql:
    db = ""
    with open(f"{home}/RFID.sql", "r") as database:
        db = database.read()
    sql.write(db)
    sql.write("\n/* INSERT SECTION */ \n\n")
    
# Days insert -------------------------------
    sql.write("/* ------ Days ------*/\n")
    for day in rules["days"]:
        sql.write(f"INSERT INTO `days` (`day`) VALUES ('{day}');\n")
    
# Time groups insert -------------------------------
    sql.write("\n\n/* ------ Time Groups ------*/\n")
    index = 1
    for count in range(0, rules['timeGroups']):
        valid = ["00",15,30,45]
        timeFrom = rng(0, 12)
        timeTo = timeFrom + rng(4, 12)
        sql.write(f"INSERT INTO `timeGroups` (`timeFrom`, `timeTo`) VALUES ('{timeFrom}:00:00', '{timeTo}:{choice(valid)}:00');\n")
        
        days = rng(1, rules["maxDayPerGroup"])
        for day in range(1, days+1):
            sql.write(f"INSERT INTO `daysGroups` (`tGroupID`,`dayID`) VALUES ({index},{day});\n")
        
        index += 1

# Doors -------------------------------    
    sql.write("\n\n/* ------ Doors ------*/\n")
    descDoors = Queue(rules["Doors"]["Descriptions"])
    while not descDoors.isEmpty():
        sql.write(f"INSERT INTO `doors` (`MAC`, `description`) VALUES ('{rand_mac()}','{descDoors.dequeue()}'); \n")

# Access groups -------------------------------    
    sql.write("\n\n/* ------ Access Groups ------*/\n")
    accessGroups = Queue(rules["accessGroups"])
    totalCount = 0
    while not accessGroups.isEmpty():
        sql.write(f"INSERT INTO `accessGroups` (`description`) VALUES ('{accessGroups.dequeue()}');\n")
        totalCount += 1

# Lab access -------------------------------    
    labs = [
        { "name": "A", "count": rules["Doors"]["Labs"]["A"] }, 
        { "name": "B", "count": rules["Doors"]["Labs"]["B"] }, 
        { "name": "C", "count": rules["Doors"]["Labs"]["C"] }, 
        { "name": "D", "count": rules["Doors"]["Labs"]["D"] }, 
        { "name": "E", "count": rules["Doors"]["Labs"]["E"] }
    ]
    sql.write("\n\n/* ------ Door access link ------*/\n")
    for segment in labs:
        for count in range(segment["count"]):
            sql.write(f"INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (\n(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%pass {segment['name']}%'),\n(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%{segment['name'] + str(count+1)}%'));\n\n")
# Floor access -------------------------------
    for floor in range(rules['Doors']['Offices']['start'],rules['Doors']['Offices']['end']+1):
        sql.write(f"INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (\n(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%floor {floor}%'),\n(SELECT `doorID` FROM `doors` WHERE `description` LIKE '%Office%%{floor}%'));\n\n")
    
    for room in rules["ServerRooms"]["MasterAdmin"]:
        sql.write(f"INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (\n(SELECT `aGroupID` FROM `accessGroups` WHERE `description` LIKE '%Master%'),\n(SELECT `doorID` FROM `doors` WHERE `description` LIKE '{room}'));\n\n")
    
    for room in rules["ServerRooms"]["Admin"]:
        sql.write(f"INSERT INTO `doorsGroups` (`aGroupID`, `doorID`) VALUES (\n(SELECT `aGroupID` FROM `accessGroups` WHERE `description` = 'Admin'),\n(SELECT `doorID` FROM `doors` WHERE `description` LIKE '{room}'));\n\n")
    sql.write("/* ------ Chips ------ */ \n")

    for _ in range(rules["Emploies"]["Count"]):
        sql.write(f"INSERT INTO `chips`(macCode) VALUES ('{rand_mac()}'); \n")
# Emploies -------------------------------
    sql.write("\n/* ------ Emploies ------ */ \n")
    rnd = Randomizer([x for x in range(1, rules["Emploies"]["Count"]+1)])
    for _ in range(rules["Emploies"]["Count"]):
        sql.write(f"INSERT INTO `emploies` (`chipID`,`firstname`,`lastname`) VALUES ({rnd.pop()},'{firstnames.pop()}', '{surnames.pop()}'); \n")
    
    print(totalCount)
    rnd = Randomizer([x for x in range(1, rules["Emploies"]["Count"]+1)])
    while not rnd.isEmpty():
        current = rnd.pop()
        inner = rng(rules["Emploies"]["Min"], rules["Emploies"]["Max"]+1)
        for __ in range(inner):
            access = rng(1, totalCount)
            time = rng(1, rules["timeGroups"])
            sql.write(f"INSERT INTO `rightsGroups` (`employeID`, `accessGroup`, `timeGroup`) VALUES ({current},{access},{time}); \n")