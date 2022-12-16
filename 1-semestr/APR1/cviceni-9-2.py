from os.path import exists 
from pathlib import Path
from operator import itemgetter


def getFileData(__memory):
    if exists(__memory):
        with open(__memory, "r") as file:
            hraci = file.read().split("\n")    

    else:
        with open(__memory, "w") as file:
            file.write("")
            hraci = []
    return hraci 

def saveFileData(__memory, __fileData):
    with open(__memory, "w") as file:
        for pozice, hrac in enumerate(__fileData):
            if pozice == len(__fileData)-1:
                file.write(hrac)
            else:
                file.write(hrac+"\n")    

def dataParser(__data):
    parsedData = []
    for line in __data:
        parsedData.append([line.split()[0], int(line.split()[1])])
    return parsedData



def cp(old: str, new: str):
    data = ""
    with open(old, "r") as reader:
        data = reader.read()
    with open(new, "w") as writer:
        writer.write(data)

def __main__():
    saveFile = Path("top3_hraci.txt")
    fileData = getFileData(saveFile)
    if fileData[0] == '':
        fileData.pop(0)
    
    while len(fileData) <= 2:
        newData = input("Zadej jmeno a cislo: ")
        fileData.append(newData)
    else:
        parsedData = dataParser(fileData)
        current = input("Zadej jmeno a cislo: ").split(" ")
        current[1] = int(current[1])
                

    print(fileData)

    sortedData = dataParser(fileData)

    sortedData = sorted(sortedData, key=itemgetter(1), reverse=True)
    print(sortedData)
    compresedData = []
    for line in sortedData:
        compresedData.append(f"{line[0]} {line[1]}")
    saveFileData(saveFile, compresedData)
    return(0)




if __name__ == "__main__":
    __main__()


