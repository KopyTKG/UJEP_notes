from copy import deepcopy as cp
from custom.logger import logger

log = logger("fibonacci.log")
class fibonacci:
    def __init__(self, number):
        self.number = number
        self.iter_nums = [0,1]
        self.rec_nums = []

    def iteration(self):
        log.writestatus("s", "Iteration started")
        for index in range(self.number-1):
            current = cp(self.iter_nums[index]) + cp(self.iter_nums[index+1])
            self.iter_nums.append(current)
        return self.iter_nums
    
    def recursion(self):
        log.writestatus("s", "Recursion started")
        for index in range(self.number+1):
            log.writestatus("s", f"Recursion number {index} started")
            self.rec_nums.append(self.recAlg(index))
        return self.rec_nums

    def recAlg(self, number):
        inner = 0
        if number > 1: 
            inner = self.recAlg(number -1) + self.recAlg(number-2)
        elif number == 1:
            inner = 1
        return inner
        


log.writestatus("s", "Fibonnaci loaded")
fib = fibonacci(int(input("Zadej číslo: ")))
numbers_iter = fib.iteration()
log.writestatus("s", "Iteration ended")
numbers_recu = fib.recursion()
log.writestatus("s", "Recursion ended")


print("""
-----------------------------
            rekurze         
-----------------------------
""")

for number in numbers_recu:
    print(number)
print("""
-----------------------------
            iterace         
-----------------------------
""")
for number in numbers_iter:
    print(number)