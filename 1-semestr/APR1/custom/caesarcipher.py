import string

class Caesar:
    def __init__(self, data: str, offset: int):
        self.__text = data
        self.__offset = offset
        self.__cipher = self.__Cipher()

    def __Cipher(self):
        cipher = ""
        for letter in self.__text:
            if letter.islower():
                asciidata = string.ascii_lowercase
                index = asciidata.index(letter)
                cipher += asciidata[index+self.__offset]
            else:
                asciidata = string.ascii_uppercase
                index = asciidata.index(letter)
                cipher += asciidata[index+self.__offset]
        return cipher

    def getCipher(self):
        return self.__cipher
