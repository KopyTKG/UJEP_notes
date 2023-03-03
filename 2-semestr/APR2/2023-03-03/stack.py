from typing import Any

class Stack:
    def __init__(self, start=[], capacity=10):
        if not start:
            self.__memory = []
        else:
            if len(start) > capacity:
                raise Exception("Capacity overflow")
            else:
                self.__memory = start
        self.__capacity = capacity

    def push(self, item) -> None:
        if len(self.__memory) < self.__capacity:
            self.__memory.append(item)
        else:
            raise Exception("Stack overflow detected")

    def pop(self) -> Any:
        return self.__memory.pop(len(self.__memory)-1)

    def peek(self) -> Any:
        return self.__memory[-1]

    def size(self) -> int:
        return len(self.__memory)

    def isEmpty(self) -> bool:
        return not self.__memory
    


strZavorky = "[{()()[{}]}]"

memory = Stack(capacity=20)

valid = {
    "]":"[",
    "}":"{",
    ")":"("
}

for symbol in strZavorky: 
    try:
        if valid[str(symbol)] == memory.peek():
            memory.pop()
    except:
        memory.push(str(symbol))

for item in range(memory.size()):
    print(memory.pop())