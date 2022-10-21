from copy import deepcopy as cp

hodnoty = [0,1]


for index in range(int(input("Zadej číslo:")) +1):
    soucasna = cp(hodnoty[index]) + cp(hodnoty[index+1])
    hodnoty.append(soucasna)

for hodnota in hodnoty:
    print(f"hodnota: {hodnota}")