
def Recursion(number):
    fib = 0
    if number > 1:
        fib = Recursion(number-1) + Recursion(number - 2)
    elif number == 1:
        fib = 1
    else:
        fib = 0
    return fib

print(Recursion(7))
