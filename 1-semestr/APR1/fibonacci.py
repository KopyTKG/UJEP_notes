from copy import deepcopy as cp

class fibonacci:
    def __init__(self, number):
        self.number = number
        self.iter_nums = [0,1]
        self.rec_nums = []

    def iteration(self):
        for index in range(self.number-1):
            current = cp(self.iter_nums[index]) + cp(self.iter_nums[index+1])
            self.iter_nums.append(current)
        return self.iter_nums
    
    def recursion(self):
        for index in range(self.number+1):
            self.rec_nums.append(self.recAlg(index))
        return self.rec_nums

    def recAlg(self, number):
        inner = 0
        if number > 1: 
            inner = self.recAlg(number -1) + self.recAlg(number-2)
        elif number == 1:
            inner = 1
        return inner
        


fib = fibonacci(int(input("Zadej číslo: ")))

numbers_iter = fib.iteration()
numbers_recu = fib.recursion()

for number in numbers_recu:
    print(number)

print("--------------------------------")
for number in numbers_iter:
    print(number)