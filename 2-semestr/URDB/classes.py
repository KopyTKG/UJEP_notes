from typing import List, Any
from random import randint as rng, choice


class Queue:
    def __init__(self, start: List):    
        self.__memory = start

    def enqueue(self, item: Any) -> None:
        self.__memory.append(item)

    def dequeue(self) -> Any:
        return self.__memory.pop(0)
    
    def isEmpty(self) -> bool:
        return not self.__memory

    def __len__(self) -> int:
        return len(self.__memory)


class Randomizer:
    def __init__(self, pool: List):
        self.__memory = pool
    
    def push(self, item: Any) -> None:
        self.__memory.append(item)

    def pop(self) -> None:
        rnd = choice(self.__memory)
        self.__memory.remove(rnd)
        return rnd

    def isEmpty(self) -> bool:
        return not self.__memory
    
    def __len__(self) -> int:
        return len(self.__memory)