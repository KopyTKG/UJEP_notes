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
    def __init__(self, start: List, geneticCode: str, stepLength: int, loopCount: int):
        self.__stepLength = stepLength
        self.__steps = [start]
        self.__direction = Direction.UP
        self.__geneticCoce = geneticCode
        self.__loopCount = loopCount
        self.__degreeStr = ""

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
        usedSymbols = ""
        activeLoop = False
        for symbol in self.__geneticCoce:
            usedSymbols += symbol
            if symbol == "[":
                self.__geneticCoce = self.__geneticCoce.replace(usedSymbols, "") 
                loopIndex = self.__geneticCoce.index("]")
                for i in range(self.__loopCount):
                    for loopSymbol in self.__geneticCoce:
                        if loopSymbol == "]":
                            break
                        self.__doMove(loopSymbol)                   
                tmp = ""
                for i in range(loopIndex , len(self.__geneticCoce)):
                    tmp += self.__geneticCoce[i]
                self.__geneticCoce = tmp
                activeLoop = True
                continue
            
            if symbol == "]":
                activeLoop = False
                continue
            if not activeLoop:
                self.__doMove(symbol)
        return self.__steps

    def __doMove(self, symbol):
        try:
            if int(symbol):
                pass
        except:
            if symbol == "L":
                self.__turnLeft()
            if symbol == "R":
                self.__turnRight()
            if symbol == "F":
                self.__move()
        
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
        geneticCode="FFLFRFRF[FF]LF[LF]",
        stepLength=10,
        loopCount=4
    )
    newTurtle.run()
    for step in newTurtle:
        print(step)
if __name__ == "__main__":
    main()