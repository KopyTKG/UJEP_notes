from typing import Any

class Queue:
    def __init__(self, start=[], capacity=10, loop=False):
        self.__loop = loop
        if not start:
            self.__memory = []
        else:
            if len(start) > capacity:
                raise Exception("Capacity overflow")
            else:
                self.__memory = start
        self.__capacity = capacity

    def isLoop(self):
        return self.__loop
    
    def enqueue(self, item) -> None:
        if len(self.__memory) < self.__capacity: 
            self.__memory.append(item)
        else:
            raise Exception("Queue overflow detected")
    
    def dequeue(self) -> Any:
        return self.__memory.pop(0)

    def front(self) -> Any:
        if self.isEmpty():
            return None
        else:
            return(self.__memory[0])
    
    def rear(self) -> Any:
        if self.isEmpty():
            return None
        else:
            return(self.__memory[-1])
    
    def isEmpty(self) -> bool:
        return not self.__memory

    def size(self) -> int:
        return(len(self.__memory))

    def __len__(self) -> int:
        return self.size()

    def __repr__(self):
        reprStr = "["
        for item in self.__memory:
            if type(item) == Queue:
                reprStr += repr(item)
            else:
                reprStr += f"{item}"
        reprStr += "]"
        return reprStr

    def __str__(self) -> str:
        strRet = ""
        try:
            for item in self.__memory:
                if type(item) == Queue:
                    strRet += "(Queue)"
                else:
                    strRet += item
            return strRet
        except:
            raise Exception("Not iterable type")
    def __iter__(self):
        for item in self.__memory:
            yield item
