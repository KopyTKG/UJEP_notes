from enum import Enum

class Type(Enum):
    Left = 0
    Right = 1


class Node:
    def __init__(self, nodeId:int, data:str):
        self._nodeId = nodeId
        self._data = data
        self._leftChild = None
        self._rightChild = None

    def setLeftChild(self, nodeId:int, nodeData:str) -> None:
        self._leftChild = Node(nodeId, nodeData)

    def setRightChild(self, nodeId:int, nodeData:str) -> None:
        self._rightChild = Node(nodeId, nodeData)

    def addChild(self, newId:int, data:str, nodeType:Type, parrentId:int) -> None:


        if self._nodeId == parrentId:
            if nodeType == Type.Left:
                self.setLeftChild(newId, data)
            elif nodeType == Type.Right:
                self.setRightChild(newId, data)
            
        else:
            if self._leftChild:
                self._leftChild.addChild(newId, data,  nodeType, parrentId)
            if self._rightChild:
                self._rightChild.addChild(newId, data, nodeType, parrentId)
            



Parrent = Node(1, "Karel")
Parrent.addChild(2, "Kamil", Type.Left , 1)
Parrent.addChild(4, "Kristof", Type.Left , 2)
Parrent.addChild(5, "Petr", Type.Right , 2)
types = [Type.Left, Type.Right]
for i in range(6,100,4):
    l = i-2
    c = i
    for _ in range(2):
        for last in types:
            Parrent.addChild(c, f"text{i}", last, l)
            c += i
        l -= 2



print("Stop")

