from abc import ABC #abstract class

class Soldier(ABC):
    def __init__(self, HP=100, ATT=50, DEF=50, pos=[0,0], speed=100):
        self._position = pos
        self._hp = HP
        self._def = DEF
        self._att = ATT
        self._position = pos
        self._speed = speed

    @property
    def position(self):
        return self._position

    @position.setter
    def position(self, value):
        self._position = value

    @property
    def hp(self):
        return self._hp

    @hp.setter
    def hp(self, value):
        if value < 0:
            raise ValueError("HP cannot be negative")
        else:
            self._hp = value

    @property
    def defense(self):
        return self._def

    @defense.setter
    def defense(self, value):
        self._def = value

    @property
    def attack(self):
        return self._att

    @attack.setter
    def attack(self, value):
        self._att = value

    @property
    def speed(self):
        return self._speed

    @speed.setter
    def speed(self, value):
        self._speed = value


    @abstractmethod
    def hit(self):
        ...

    @abstractmethod
    def attack(self):
        ...
    
    @abstractmethod
    def move(self):
        ...


class Archer(Soldier):
    def __init__(self, HP=100, ATT=125, DEF=25, pos=[0,0], Ammo=10, Speed=125):
        super().__init__(HP,ATT,DEF,pos,Speed)
        self._ammo = Ammo

    def attack(self):
        if self._ammo != 0:
            ...
    
    def move(self):
        ... 