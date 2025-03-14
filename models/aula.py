from sqlalchemy import Column, Integer, String, Enum
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Aula(Base):
    __tablename__ = "aula"

    _id = Column(Integer, primary_key=True, autoincrement=True)
    _numero_aula = Column(String(10), nullable=False)
    _situacion = Column(Enum('DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO'), default='DISPONIBLE', nullable=False)
    _planta = Column(Enum('1', '2', '3', '4', '5'), default='1', nullable=False)

    def __init__(self, numero_aula, situacion='DISPONIBLE', planta='1'):
        self.set_numero_aula(numero_aula)
        self.set_situacion(situacion)
        self.set_planta(planta)

    def get_id(self):
        return self._id

    def get_numero_aula(self):
        return self._numero_aula

    def set_numero_aula(self, numero_aula):
        if len(numero_aula) < 3 or len(numero_aula) > 20:
            raise ValueError("El número de aula debe tener entre 3 y 20 caracteres")
        self._numero_aula = numero_aula

    def get_situacion(self):
        return self._situacion

    def set_situacion(self, situacion):
        if situacion not in ['DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO']:
            raise ValueError("Situación no válida")
        self._situacion = situacion

    def get_planta(self):
        return self._planta

    def set_planta(self, planta):
        if planta not in ['1', '2', '3', '4', '5']:
            raise ValueError("Planta no válida")
        self._planta = planta