from copy import deepcopy as cp
"""
1) n
2) n+n-+1
3) n+4
4) 
5) (n-1)*2
6) a*n-1
"""

n = int(input("Zadej n: "))

vys1 = n
vys2 = cp(n)+cp(n-1)
vys3 = cp(n)+(3*cp(n-1))
vys4 = None
vys5 = 2**cp(n-1)
vys6 = 1

for num in range(2,n):
    current = cp(vys6) * num
    vys6 = cp(current) 

vys7=1


print(f"""
{vys1=}
{vys2=}
{vys3=}
{vys4=}
{vys5=}
{vys6=}

""")
for row in range(n):
    string = ""
    for column in range(row+1):
        string += f"{column+1} "
    print(string)