from random import choice

data = [
    "otazka 1)",
    "otazka 2)",
    "otazka 3)",
    "otazka 4)",
    "otazka 5)",
    "otazka 6)",
    "otazka 7)",
    "otazka 8)",
    "otazka 9)",
    "otazka 10)",
    "otazka 11)",
    "otazka 12)",
    "otazka 13)",
    "otazka 14)",
    "otazka 15)",
    "otazka 16)",
    "otazka 17)",
    "otazka 18)",
    "otazka 19)",
    "otazka 20)",
    "otazka 21)",
    "otazka 22)"]


while len(data) > 0:
    otazka = choice(data)
    print(f"{otazka}")
    data.remove(otazka)
    input("press ENTER")

