from abc import ABC #abstract class

class Animal(ABC):
    def __init__(self, owner=None):
        if not owner:
            self._owner = []
        else: 
            self._owner = owner

    @property
    def owner(self):
        return self._owner

    @owner.setter
    def owner(self, value):
        self._owner = value
    
    @abstractmethod
    def sound(self):
        ...

class Dog(Animal):
    def __init__(self,name, owner=None):
        super().__init__(owner=owner)

