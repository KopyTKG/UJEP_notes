from typing import Any

class Queue:
    def __init__(self, start=[], capacity=10):
        if not start:
            self.__memory = []
        else:
            if len(start) > capacity:
                raise Exception("Capacity overflow")
            else:
                self.__memory = start
        self.__capacity = capacity
    
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
    
    def __iter__(self):
        for item in self.__memory:
            yield item




print(Queue(start=[1,2,3,4,5,6,7,8,9,10,11], capacity=10).rear())