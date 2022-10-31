import statistics

data = []

while True:
    mozna_cislo = input("Zadej číslo:")

    try:
        if int(mozna_cislo):
            data.append(int(mozna_cislo))
    except:
        if(mozna_cislo) == "STOP" or mozna_cislo == "stop":
            vysledek = 0
            for cislo in data:
                vysledek += cislo
            str_hodnota = statistics.mean(data)
            modus, median, deviation = statistics.mode(data), statistics.median(data), statistics.pstdev(data)
            rozptyl = statistics.variance(data)
            print(f"""
{str_hodnota=} 
{modus=}
{median=}
{deviation=}
{rozptyl=}
            """)
            break

