#generování dat
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from numpy.random import randn
N = 100000 # počet datových bodů

# pomocí gausovského rozdělení nagenerujeme body v prostoru váha-výška
# generování váhy v kg
def generuj_vahu(vaha_prumer = 80, vaha_sigma = 12, kolik = 100):
  vaha = vaha_prumer+randn(kolik)*vaha_sigma
  vaha[vaha < vaha_prumer-4*vaha_sigma] = vaha_prumer-4*vaha_sigma # orezani nepravdepodobnych hodnot - podvaha
  vaha[vaha > vaha_prumer+4*vaha_sigma] = vaha_prumer+4*vaha_sigma # orezani nepravdepodobnych hodnot - nadpodvaha
  return vaha

#generování výšky v cm
def generuj_vysku(vyska_prumer = 180, vyska_sigma = 15, kolik = 100):
  vyska = vyska_prumer+randn(kolik)*vyska_sigma
  vyska[vyska < vyska_prumer-4*vyska_sigma] = vyska_prumer-4*vyska_sigma
  vyska[vyska > vyska_prumer+4*vyska_sigma] = vyska_prumer+4*vyska_sigma
  return vyska

# spocteni body mass indexu BMI
vaha = generuj_vahu(kolik=N)
vyska = generuj_vysku(kolik=N)
bmi = vaha/(vyska/100)**2
data = {"vyska": vyska ,"vaha" : vaha, "bmi" : bmi}
data["label"] = (bmi>24) * 2 - 1 
df = pd.DataFrame(data) #
df.to_csv('data_lide.csv', index = False)
df.head(10)

promichano_index = df.index.to_list()
np.random.shuffle(promichano_index)

trenovaci_data_velikost = int(len(df)*0.80) # vezmeme 80 % pro nauceni modelu
print(df.index[10])
trenovaci_data = df.filter(promichano_index[:trenovaci_data_velikost], axis = 0) # vem nahodne indexy
testovaci_data = df.filter(promichano_index[trenovaci_data_velikost:], axis = 0) # vem nahodne indexy

import numpy.linalg as la

#priprava dat pro linearni regresi
y = trenovaci_data['bmi']
X_t = np.array((np.ones(y.shape), trenovaci_data['vyska'], trenovaci_data['vaha']))
X = X_t.transpose()

# sestaveni matice a prave strany
A = X_t @ X # np.dot(X^T,X)
b = X_t @ y
# vypocet koeficientu resenim soustavy lin. rovnic
koeficienty = la.solve(A,b)
bmi_hat_trenovaci = X @ koeficienty # vypocet predikce na trenovacich datech


X_test_t = np.array(( np.ones(len(testovaci_data)),testovaci_data['vyska'], testovaci_data['vaha']))
X_test = X_test_t.transpose()
bmi_hat_testovaci = X_test @ koeficienty

# vypocet chyby
mse_ls_modelu_trenovaci = ((trenovaci_data['bmi']-bmi_hat_trenovaci)**2).mean()
mse_ls_modelu_testovaci = ((testovaci_data['bmi']-bmi_hat_testovaci)**2).mean()

print(f"Chyba na trenovacich datech {mse_ls_modelu_trenovaci}")
print(f"Chyba na testovacich datech {mse_ls_modelu_testovaci}")
