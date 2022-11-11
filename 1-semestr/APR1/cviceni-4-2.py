import matplotlib.pyplot as plt
import string

veta = 'Ahoj Jano. Jak se mas Jano. Mas se taky tak dobre jako ja Jano? Tak cau Jano'
nechtene_symboly = ["?", "!", ",", "."]
veta = veta.lower()
for symbol in nechtene_symboly:
    veta = veta.replace(symbol, "")

citac_pismen = {} #to se muze hodit, priradim = 0

for st in string.ascii_lowercase:
     citac_pismen[st] = 0    



for slovo in veta.split():
    for pismeno in slovo:
        if pismeno in citac_pismen:
            citac_pismen[pismeno] += 1
        else:
            citac_pismen[pismeno] = 1
            

print(citac_pismen)

plt.bar(x=citac_pismen.keys(), height=citac_pismen.values())
plt.show()