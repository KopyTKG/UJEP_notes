from sys import path
import datetime, io, os
 

class logs:
    def __init__(self, filename, selftest):
        if filename != "":
            self.filename = f"{filename}-{datetime.datetime.now().strftime('%Y-%m-%d_%H-%M')}.log"
        else:
            self.filename = "Error.log"

        self.selftest = selftest
        self.fullPath = path[0] + "/logs/" + self.filename
        self.__createFile(self.fullPath)


        if self.selftest:
            self.runtest()

    def __date(self):
        return f"{datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')} - " 

    def __createFolder(self):
        print_error = ""
        try:
            os.mkdir(path[0]+"/logs/")
        except:
            print_error = "Folder already exists"
        return print_error

    def __createFile(self, file):
        error = self.__createFolder()        
        file = open(file,"w")
        file.close()
        self.info("Logger loaded")
        if error:
            self.error(error)

    def __write(self, msg):
        file = open(self.fullPath, "a")
        file.write(f"{self.__date()}{msg}\n")
        file.close()

    def info(self, msg):
        message = f"Info: {msg}"
        self.__write(message)

    def debug(self, msg):
        message = f"Debug: {msg}"
        self.__write(message)

    def warning(self, msg):
        message = f"Warning: {msg}"
        self.__write(message)

    def error(self, msg):
        message = f"Error: {msg}"
        self.__write(message)
        

    def runtest(self):
        if self.filename != "Error.log":
            self.debug(self.fullPath)
            self.debug(self.filename)
        else:
            self.error("Missing path to file")
            self.error("Missing filename")
