from typing import Any
from copy import deepcopy as copy
from random import randrange as rnd

class Sklerotik:
    def __init__(self, capacity:int):
        self.__capacity = capacity if capacity else 0
        self.__memory = []

    @property
    def capacity(self) -> int:
        return copy(self.__capacity)

    @property
    def memory(self)-> list:
        return copy(self.__memory)

    def add(self,item:Any) -> None:
        if len(self.__memory) >= self.__capacity:
            assert self.__capacity == len(self.__memory)
            self.__memory[(rnd(0, len(self.__memory)))] = item
        else:
            self.__memory.append(item)
    
    def __len__(self):
        return len(self.__memory)

    def __repr__(self):
        return f"Sklerotik[cap={self.__capacity},mem=[{self.__memory}]]"

    def __str__(self):
        return f"Sklerotik with {len(self.__memory)} items" 
    
    def __iter__(self):
        for item in self.__memory:
            yield item



def main():
    s = Sklerotik(
        capacity=30
    )

    for i in range(0, 100):
        s.add(f"item {i}")
    print(s)

    print(list(s))
if __name__ == "__main__":
    main()