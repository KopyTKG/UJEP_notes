
data = []

while True:
    mozna_cislo = input("Zadej číslo:")

    try:
        if int(mozna_cislo):
            data.append(int(mozna_cislo))
    except:
        if(mozna_cislo) == "STOP":
            vysledek = 0
            for cislo in data:
                vysledek += cislo
            vysledek = vysledek / len(data)

            print(f"{vysledek=}")
            break