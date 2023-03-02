import sys
from PyQt5.QtWidgets import QApplication, QWidget, QPushButton, QVBoxLayout
from PyQt5.QtGui import QPainter, QPen, QBrush, QColor
from PyQt5.QtCore import Qt
from turtle import Turtle


class Painter(QWidget):

    def __init__(self, title: str):
        super().__init__()
        self.__title = title
        self.__border = 50
        self.__width = QApplication.desktop().screenGeometry().width()
        self.__height = QApplication.desktop().screenGeometry().height()

        self.initUI()

    def quit(self):
        exit()

    def initUI(self):
        # set full screen
        self.showFullScreen()
        # set title from constructor
        self.setWindowTitle(self.__title)        

        # create layout
        layout = QVBoxLayout()
        # create Close button
        closeButton = QPushButton('Close',self)
        closeButton.resize(75, 37.5)
        closeButton.move(self.__width - (self.__border + 75), self.__border)
        closeButton.clicked.connect(self.quit)
        closeButton.setStyleSheet("background-color: red; color: white;")
        closeButton.show()
        # add it to the Layout
        layout.addWidget(closeButton)
        # set layout
        self.setLayout = (layout)
        # render
        self.show()

    def paintCenter(self, painter):
        color = QColor(162,
                       78,
                       0)
        painter.setPen(color)
        painter.setBrush(color)

        centerRaduis = 25
        painter.drawEllipse((self.__width /2 )- (centerRaduis/2),(self.__height - self.__border)-centerRaduis,centerRaduis, centerRaduis)

    def paintTurtleMove(self,painter, center):
        pen = QPen()
        pen.setColor(Qt.black)
        pen.setWidth(5)
        painter.setPen(pen)

        turtle = Turtle(
            start=center,
            geneticCode="FLFLFLF",
            stepLength= 100
        )
        turtle.run()
        for step in turtle:
            painter.drawLine(*step)

    def paintEvent(self, event):
        painter = QPainter()
        painter.begin(self)
        
        pen = QPen()
        pen.setWidth(5)
        pen.setColor(Qt.black)
        painter.setPen(pen)

        border = [
            [self.__border, self.__border, self.__width - self.__border, self.__border],
            [self.__border, self.__height -self.__border, self.__width - self.__border,self.__height - self.__border],
            [self.__width - self.__border, self.__border, self.__width - self.__border,self.__height - self.__border],
            [self.__border, self.__border, self.__border,self.__height - self.__border]
        ]

        for line in border:
            painter.drawLine(*line)
        
        self.paintCenter(painter)
        self.paintTurtleMove(painter, [(self.__width /2 ),(self.__height - self.__border)-25/2])
        painter.end()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    widget = Painter("Turtle")

    app.exec_()
 