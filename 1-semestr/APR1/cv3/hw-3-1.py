while True:
    mozna_cislo = input("Zadej číslo:")

    try:
        if int(mozna_cislo):
            break
    except:
        print("neni číslo")