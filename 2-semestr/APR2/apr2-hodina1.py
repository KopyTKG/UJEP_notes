from typing import List

class Student:
    def __init__(self, jmeno: str, studentskeId: int, predmety: List[str]):
        self._jmeno = jmeno
        self._studentskeId = studentskeId
        self._predmety = predmety

    
    @property
    def jmeno(self):
        return self._jmeno
    
        @jmeno.setter
        def jmeno(self, jmeno):
            self._jmeno = jmeno
    
    @property
    def studentskeId(self):
        return self._studentskeId
    
    @studentskeId.setter
    def studentskeId(self, studentskeId):
        self._studentskeId = studentskeId
    
    @property
    def predmety(self):
        return self._predmety
    
    @predmety.setter
    def predmety(self, predmety):
        self._predmety = predmety
    
    def zapisPredmet(self, predmet: str):
        self._predmety.append(predmet)

    def odepsatPredmet(self, predmet: str):
        try: 
            self._predmety.remove(predmet) 
        except ValueError: 
            pass


st1 = Student(
                jmeno="Karel Petr", 
                studentskeId=15,
                predmety=["Test", "Test2"]
)

print(st1.predmety)

st1.zapisPredmet("Test3")
st1.odepsatPredmet("Test")
print(st1.predmety)
