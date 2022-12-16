import string


def validInput(text: str) -> str:
    input_str = ""
    while not input_str:
        input_str = input(text).strip()
    return input_str


def getCoeficients(pocet: int, inputs: list, parse: callable) -> tuple:
    numbers = []
    for index in range(pocet):
        valid = validInput(inputs[index])
        valid = parse(valid)
        numbers.append(valid)
    return numbers


def getDiscriminant(a: float,b: float, c: float) -> float:
    return b**2-4*a*c


def getRoots(D: float, a: float, b: float, c: float) -> dict:
    if D < 0:
        return {'x':None}

    elif D == 0:
        x = (-b + D**(1/2))/(2*a)
        return {
                'x':set([x, 0])
                }
    
    else:
        x1 = (-b + D**(1/2))/(2*a)
        x2 = (-b - D**(1/2))/(2*a)
        return {
                'x1':set([x1,0]),
                'x2':set([x2,0])
                }


def __main():
    # Načtení koeficientů
    lenght = 3
    coefs = getCoeficients(
        pocet  = lenght,
        inputs = [f"Načti {string.ascii_lowercase[i]} :" for i in range(lenght) ], 
        parse = float,
    )
    # výpočet disktiminantu 
    disc = getDiscriminant(*coefs)
    # výpočet kořenů
    roots = getRoots(disc, *coefs)
    print(roots)
    return None


if __name__ == "__main__":
    __main()

