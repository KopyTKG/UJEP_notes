import sys
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout



class MyWidget(QWidget):

    def __init__(self):
        super().__init__()
        self.setupUI()

    def quit(self):
        exit()

    def setupUI(self):
        #set full screen

        self.showFullScreen()
        self.setWindowTitle('My First App')

        layout = QVBoxLayout()
        button = QPushButton('Hello World',self)
        button.move(100,100)
        button.clicked.connect(self.quit)
        button.show()
        layout.addWidget(button)
        self.setLayout = (layout)

        self.show()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    widget = MyWidget()

    app.exec_()
 