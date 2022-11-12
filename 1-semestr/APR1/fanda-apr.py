import string
print("Heslo musí obsahovat 1 velké písmeno, 4 malá písmena, 1 číslo!")

def main():
  heslo = ""
  pokusy = 3
  while pokusy > 0:
    heslo = input("Zadej heslo: ")
    kontrola = logic(heslo)
    # [True , True , True] 
    pokusy = repeating(
        Velke_pismeno=kontrola[0], 
        Mala_pismena=kontrola[1], 
        Cislo=kontrola[2],
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
  return [Velke_pismeno, Mala_pismena, Cislo]

def repeating(Velke_pismeno, Mala_pismena, Cislo, pokusy):
    if Velke_pismeno == True and Mala_pismena == True and Cislo == True:
      print("Heslo je správně!")
      return 0
    else:
      print("Heslo bylo zadano špatně!")
      pokusy -= 1
      print(f"Počet zbývajících pokusů: {pokusy}")
      return pokusy

if __name__ == "__main__":
  main()