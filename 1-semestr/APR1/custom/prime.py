
class intiger(int):
    def __init__(self,number: int):
        self.__number = number
        self.__odd = self.__isOdd()
        self.__even = self.__isEven()
        self.__prime = self.__isPrime()

    def __isPrime(self):
        if self.__number == 0 or self.__number == 1: 
            return False
        for n in range(2, int(self.__number/2)):
            if self.__number % n == 0:
                return False
        return True

    def __isEven(self):
        if self.__number == 0: 
            return False
        even = True
        if self.__number % 2 != 0:
            even = False
        return even

    def __isOdd(self):
        if self.__number == 0: 
            return False
        odd = True
        if self.__number % 2 == 0:
            odd = False
        return odd
    
    def prime(self):
        return self.__prime
    
    def odd(self):
        return self.__odd

    def even(self):
        return self.__even

def __main():
    print("runnin'")
    for n in range(50):
        new_n = intiger(n)
        print(f"{n} is prime {new_n.prime()}")
        print(f"{n} is odd {new_n.odd()}")
        print(f"{n} is even {new_n.even()}")

if __name__ == "__main__":
    __main()