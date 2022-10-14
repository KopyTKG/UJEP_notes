disponibilni_hodiny = 5
znamka = int(input("Známka: "))
if znamka > 5  or znamka < 1:
    print(f"známka {znamka} není platné číslo")
    exit()

if znamka == 1:
    disponibilni_hodiny += 1
elif znamka in [2, 3]: 
    pass
elif 4 <= znamka <= 5:
    disponibilni_hodiny -= 1

print(f"Zbýva hodin: {disponibilni_hodiny}")
