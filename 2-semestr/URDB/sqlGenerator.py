import yaml
from random import randint as rng, choice
from classes import Queue, Randomizer

home ="./2-semestr/URDB"

rules = {}
with open(f"{home}/rules.yaml", "r") as yml:
    rules = yaml.safe_load(yml)

with open(f"{home}/sql-insert.sql", "w") as sql:
    db = ""
    with open(f"{home}/RFID.sql", "r") as database:
        db = database.read()
    sql.write(db)
    sql.write("""
    
/* INSERT SECTION */
""")

    for day in rules["days"]:
        sql.write(f"INSERT INTO `days` (`day`) VALUES ('{day}');\n")
    
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
    macsDoors = Randomizer(rules["Doors"]["MACS"])
    descDoors = Queue(rules["Doors"]["Descriptions"])

    while not macsDoors.isEmpty() and not descDoors.isEmpty():
        sql.write(f"INSERT INTO `doors` (`MAC`, `description`) VALUES ('{macsDoors.pop()}','{descDoors.dequeue()}'); \n")

# Access groups -------------------------------    
    accessGroups = Queue(rules["accessGroups"])
    while not accessGroups.isEmpty():
        sql.write(f"INSERT INTO `accessGroups` (`description`) VALUES ('{accessGroups.dequeue()}');\n")
    

# Lab access -------------------------------    
    labs = [
        { "name": "A", "count": rules["Doors"]["Labs"]["A"] }, 
        { "name": "B", "count": rules["Doors"]["Labs"]["B"] }, 
        { "name": "C", "count": rules["Doors"]["Labs"]["C"] }, 
        { "name": "D", "count": rules["Doors"]["Labs"]["D"] }, 
        { "name": "E", "count": rules["Doors"]["Labs"]["E"] }
    ]
    
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