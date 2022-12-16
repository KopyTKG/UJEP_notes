import os

{
    "name": []

}

def __main():
    data = []
    with open(os.getcwd() + "/1-semestr/APR1/cv-9.csv", "r") as file:
        data = file.read().split()
    
    studenti = dict() 
    header, students = data[0].split(";")[1:], data[1:]

    print(header)

    for line in students:
        line = line.split(";")
        name, znamky = line[0], list(map(int, line[1:]))
        std_znamky = dict()
        for pozice, znamka in enumerate(znamky):
            std_znamky[header[pozice]] = znamka
        studenti[name] = std_znamky
        
    print(studenti)

    return 0

if __name__ == "__main__":
    __main()