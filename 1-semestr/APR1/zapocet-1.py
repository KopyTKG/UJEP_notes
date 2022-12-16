def Pi(presnost):
    try:
        presnost = int(presnost)
        pi = 0
        for prvek in range(1, presnost, 4):
            pi += (1/(prvek)) - (1/(prvek+2)) 
        return pi*4
    except ValueError:
        return None


def NumCislo():
    for i in range(-50, 150 , 2):
        eq = Pi(i)
        if i <= 0:
            assert eq == 0
        else:
            verf = 0
            for prvek in range(1, i, 4):
                verf += (1/(prvek)) - (1/(prvek+2)) 
            assert eq == verf*4


def LetterTest():
    eq = Pi("a")
    assert eq == None

def __TestRunner():
    NumCislo()
    LetterTest()

def __main__():
    presnost = input("Zadej přesnost: ")
    print(Pi(presnost))


if __name__ == "__main__":
    __TestRunner()
    #__main__()