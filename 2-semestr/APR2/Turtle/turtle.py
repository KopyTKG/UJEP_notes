from enum import Enum
import re
from typing import List
from copy import deepcopy as copy

class Direction(Enum):
    UP=    8
    DOWN=  2
    LEFT=  4
    RIGHT= 6

class Turtle:
    def __init__(self, start: List, geneticCode: str, stepLength: int):
        self.__stepLength = stepLength
        self.__steps = [start]
        self.__direction = Direction.UP
        self.__validSymbols = 'FRL'
        self.__geneticCoce = geneticCode

        self.__directionMapLeft = {
                Direction.UP: Direction.LEFT,
                Direction.LEFT: Direction.DOWN,
                Direction.DOWN: Direction.RIGHT,
                Direction.RIGHT: Direction.UP
               }

        self.__directionMapRight = {
                Direction.UP: Direction.RIGHT,
                Direction.RIGHT: Direction.DOWN,
                Direction.DOWN: Direction.LEFT,
                Direction.LEFT: Direction.UP
               }

    
    def run(self) -> List:
        for symbol in self.__geneticCoce:
            match = re.search(symbol,self.__validSymbols)
            assert match and symbol != None
            if symbol == "L":
                self.__turnLeft()
            if symbol == "R":
                self.__turnRight()
            if symbol == "F":
                self.__move()

        return self.__steps

    def __move(self) -> None:
        oldPosition = copy(self.__steps[len(self.__steps)-1])

        if self.__direction == Direction.UP:
            newPosition = [oldPosition[0], oldPosition[1]-self.__stepLength]
            self.__steps.append(newPosition)

        if self.__direction == Direction.DOWN:
            newPosition = [oldPosition[0], oldPosition[1]+self.__stepLength]
            self.__steps.append(newPosition)

        if self.__direction == Direction.LEFT:
            newPosition = [oldPosition[0]-self.__stepLength, oldPosition[1]]
            self.__steps.append(newPosition)

        if self.__direction == Direction.RIGHT:
            newPosition = [oldPosition[0]+self.__stepLength, oldPosition[1]]
            self.__steps.append(newPosition)

    def __turnLeft(self) -> None:
        self.__direction = self.__directionMapLeft[self.__direction]

    def __turnRight(self) -> None:
        self.__direction = self.__directionMapRight[self.__direction]

    def __iter__(self) -> List:
        for x in range(1, len(self.__steps)):
            if x <= len(self.__steps) -1:
                yield self.__steps[x-1]+ self.__steps[x]
            else:
                raise Exception("not enought steps for iteration")



def main():
    newTurtle = Turtle(
        start=[0,0],
        geneticCode="FFLFRFRFLF"
    )
    newTurtle.run()
    for step in newTurtle:
        print(step)
if __name__ == "__main__":
    main()