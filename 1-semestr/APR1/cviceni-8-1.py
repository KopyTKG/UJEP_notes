from random import randint as rng
import matplotlib.pyplot as plt

cisla =  [
        str(cislo) 
            if cislo%2 ==0 
            else cislo 
            for cislo in range(10)
                if cislo%4==0 
        ]
#print(cisla)


dekCisla = [
    cislo for cislo in range(50,501,10)
]
#print(dekCisla)

desCisla = [
    float(cislo) for cislo in range(0,20) if cislo%2 == 0
]
#print(desCisla)

nsloupce = 100
nhrany = 50

matice = [
    [rng(0,255) for j in range(nsloupce)] for _ in range(nhrany)
]

#plt.imshow(matice,cmap="gray")
#plt.show()

jmena = ["Alena", "Jiri", "Zbysek", "Adam"]

def validName(name):
    return not(str(name).lower())[0] == "a"
jmena = list(filter(validName, jmena))

#print(jmena)


sezname = ["1","2","neco","neco","3"]

def valid(char):
    return char.isnumeric()

#sezname = list(filter(valid, sezname))
sezname = list(filter(lambda char: char.isnumeric(), sezname))
print(sezname)