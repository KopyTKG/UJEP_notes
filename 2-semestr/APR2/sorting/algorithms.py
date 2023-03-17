import random, sys
from typing import List
from copy import deepcopy as copy
class BubleSort():
    def __init__(self, unsorted: List):
        self.__array = unsorted

    def sort(self) -> List:
        for y in range(len(self.__array)-1, 0,-1):
            sorted = True
            for x in range(0,y):
                if self.__array[x] < self.__array[x+1]:
                    sorted = False
                    self.__array[x], self.__array[x+1 ] = self.__array[x+1], self.__array[x]
            if sorted:
                return self.__array
        return self.__array
    

class SelectionSort():
    def __init__(self, unsorted: List ):
        self.__array = unsorted

    def sort(self) -> List:
        for y in range(len(self.__array)):
            maxIn = y
            for x in range(y, len(self.__array)):
                if self.__array[x] > self.__array[maxIn]:
                    maxIn = x
            self.__array[y], self.__array[maxIn] = self.__array[maxIn], self.__array[y]
        return self.__array

class InsertionSort():
    def __init__(self, unsorted: List):
        self.__array = unsorted
    
    def sort(self) -> List:
        for i in range(1, len(self.__array)):
            tmp = self.__array[i]
            j = i-1
            while j >= 0 and self.__array[j] < tmp:
                    self.__array[j+1] = self.__array[j]
                    j -= 1
            self.__array[j+1] = tmp
        return self.__array

class QuickSort():
    def __init__(self, unsorted: List):
        self._array = unsorted
        self._sorted = []
    
    def _QuickSort(self, array):
        if len(array) <= 1:
            return array
        pivot = [num for num in array[1:] if num == array[0]]
        smallerThan = [num for num in array[1:] if num < array[0]]
        biggerThan = [num for num in array[1:] if num > array[0]]
        return self._QuickSort(smallerThan) + pivot + self._QuickSort(biggerThan)    
        
    def sort(self) -> List:
        return self._QuickSort(self._array)

class MergeSort:
    def __init__(self, unsorted: List):
        self._array = unsorted
    
    def _merge(self, array):
        if len(array) <= 1:
            return array

        middleIndex = len(array) // 2
        leftPart = [num for num in array[:middleIndex]]
        rightPart = [num for num in array[middleIndex:]]

        self._merge(leftPart)
        self._merge(rightPart)
        
        middle = left = right = 0 

        while left < len(leftPart) and right < len(rightPart):
            if leftPart[left] < rightPart[right]:
                array[middle] = leftPart[left]
                left += 1
            else:
                array[middle] = rightPart[right]
                right += 1
            middle += 1

        while left < len(leftPart):
            array[middle] = leftPart[left]
            left += 1
            middle += 1

        while right < len(rightPart):
            array[middle] = rightPart[right]
            right += 1
            middle += 1

        return array
    

    def sort(self) -> List:
        return self._merge(self._array)

unsorted = [random.randint(-500000, 500000) for cislo in range(1000000)]    
debug = [1,3,5,4,2,9,7,6,8,10,11]

#buble = BubleSort(copy(unsorted))
#select = SelectionSort(copy(unsorted))
#insert = InsertionSort(copy(unsorted))
#quick = QuickSort(copy(unsorted))
merge = MergeSort(copy(unsorted))

print(f"Merge - {merge.sort()}")
#print(f"Quick - {quick.sort()}")
#print(f"""Are they the same ? - {insert.sort() == buble.sort() == select.sort()}
#Buble  - {buble.sort()}
#Insert - {insert.sort()}
#Select - {select.sort()}
#""")