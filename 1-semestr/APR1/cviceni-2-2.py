a,b,c = (map(float, input("Zadej koeficienty a;b;c : ").split(";")))
D = (b**2)-(4*a*c)

x = set([None])

if D < 0:
    pass
elif D == 0:
    x = set([(-b + D**(1/2))/(2*a),(-b + D**(1/2))/(2*a)])
elif D > 0:
    x = set([(-b + D**(1/2))/(2*a), (-b - D**(1/2))/(2*a)])

print(f"{a=} {b=} {c=} {D=} {x=}")