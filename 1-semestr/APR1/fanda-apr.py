import string
print("Heslo musí obsahovat 1 velké písmeno, 4 malá písmena, 1 číslo!")

def main():
  heslo = ""
  # Pokus jsou uplně venku
  pokusy = 3
  # Celkový cyklus je stavěný na pokusech a ne na hesle
  while pokusy > 0:
    heslo = input("Zadej heslo: ")
    # z funkce logic vychází ty tři stavy jako list
    kontrola = logic(heslo)
    # [True , True , True] 
    # funkce repeating upravuje stav pokusů
    pokusy = repeating(
        Velke_pismeno=kontrola[0], 
        Mala_pismena=kontrola[1], 
        Cislo=kontrola[2],
        # potřebuje je taky do vnitř
        pokusy=pokusy)

def logic(heslo):
  Velke_pismeno = False
  Mala_pismena = False
  Cislo = False
  male_pismeno = 0
  for znak in heslo:
    if znak in string.ascii_uppercase:
      Velke_pismeno = True
    elif znak in string.ascii_lowercase:
      male_pismeno += 1
      if male_pismeno >= 4:
        Mala_pismena = True
    elif znak.isnumeric() == True:
      Cislo = True
  # zde fukce vyhazuje ty tři stavy
  return [Velke_pismeno, Mala_pismena, Cislo]

# fuknce na víc bere pokusy
def repeating(Velke_pismeno, Mala_pismena, Cislo, pokusy):
    # cyklus je zde zbytečně
    if Velke_pismeno == True and Mala_pismena == True and Cislo == True:
      print("Heslo je správně!")
      # vrací 0 jako konečný stav pro ukončení while cyklu
      return 0
    else:
      print("Heslo bylo zadano špatně!")
      pokusy -= 1
      print(f"Počet zbývajících pokusů: {pokusy}")
      # vrací stav pokusů
      return pokusy

if __name__ == "__main__":
  main()
