from sqlalchemy import Column, String, Integer, Enum, ForeignKey, Time, BIGINT
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

class Aula(Base):
    __tablename__ = 'Aula'

    id = Column(BIGINT, primary_key=True, autoincrement=True)
    numero = Column(String(10), nullable=False, unique=True)
    planta = Column(Integer, nullable=False, default=1)
    situacion = Column(Enum('DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO'), nullable=False, default='DISPONIBLE')

    def __init__(self, numero, planta, situacion):
        self.set_numero(numero)
        self.set_planta(planta)
        self.set_situacion(situacion)

    # Métodos GET
    def get_numero(self):
        return self.__numero
    
    def get_planta(self):
        return self.__planta

    def get_situacion(self):
        return self.__situacion

    # Métodos SET con validaciones
    def set_numero(self, numero):
        if not numero or len(numero) < 3 or len(numero) > 20:
            raise ValueError("El número del aula debe tener entre 3 y 20 caracteres.")
        self.__numero = numero

    def set_planta(self, planta):
        if not isinstance(planta, int) or planta < 1:
            raise ValueError("La planta debe ser un número entero mayor a 0.")
        self.__planta = planta

    def set_situacion(self, situacion):
        if situacion not in ['DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO']:
            raise ValueError("Situación no válida.")
        self.__situacion = situacion
