retetec_cisel = input("Zadej čísla oddělené čárkou: ")
cisla = retetec_cisel.split(",")
operace = input("Zadej operaci (secti, vynasob): ")
valid = ["secti", "vynasob"]

vysledek = 0

if not operace in valid:
    print("Špatná operace")
    exit()

elif operace == "secti":
    for cislo in cisla:
        vysledek += float(cislo)

elif operace == "vynasob":
    vysledek = 1
    for cislo in cisla:
        vysledek *=  float(cislo)

print(f"{retetec_cisel=} {cisla=} {vysledek=}")