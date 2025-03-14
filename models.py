from sqlalchemy import Column, String, Integer, Enum, ForeignKey, Time, BIGINT
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

# 🔹 Modelo de Aula
class Aula(Base):
    __tablename__ = 'Aula'
    
    _id = Column(BIGINT, primary_key=True, autoincrement=True)
    _numero = Column(String(10), nullable=False, unique=True)
    _planta = Column(Integer, nullable=False, default=1)
    _situacion = Column(Enum('DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO'), nullable=False, default='DISPONIBLE')
    
    def __init__(self, numero, planta, situacion):
        self.set_numero(numero)
        self.set_planta(planta)
        self.set_situacion(situacion)

    def get_numero(self):
        return self._numero
    
    def set_numero(self, numero):
        if not numero or not (3 <= len(numero) <= 20):
            raise ValueError("El número del aula debe tener entre 3 y 20 caracteres.")
        self._numero = numero
    
    def get_planta(self):
        return self._planta
    
    def set_planta(self, planta):
        if planta is None:
            raise ValueError("La planta no puede ser nula.")
        self._planta = planta
    
    def get_situacion(self):
        return self._situacion
    
    def set_situacion(self, situacion):
        if situacion not in ['DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO']:
            raise ValueError("Situación no válida.")
        self._situacion = situacion

# 🔹 Modelo de Estudiante
class Estudiante(Base):
    __tablename__ = 'Estudiante'
    
    _id = Column(BIGINT, primary_key=True, autoincrement=True)
    _n_matricula = Column(String(15), unique=True, nullable=False)
    _nombre = Column(String(100), nullable=False)
    _direccion = Column(String(255), nullable=False)
    
    def __init__(self, n_matricula, nombre, direccion):
        self.set_n_matricula(n_matricula)
        self.set_nombre(nombre)
        self.set_direccion(direccion)

    def get_n_matricula(self):
        return self._n_matricula
    
    def set_n_matricula(self, n_matricula):
        if not n_matricula or not (3 <= len(n_matricula) <= 20):
            raise ValueError("El número de matrícula debe tener entre 3 y 20 caracteres.")
        self._n_matricula = n_matricula
    
    def get_nombre(self):
        return self._nombre
    
    def set_nombre(self, nombre):
        if not nombre or not (3 <= len(nombre) <= 20):
            raise ValueError("El nombre debe tener entre 3 y 20 caracteres.")
        self._nombre = nombre
    
    def get_direccion(self):
        return self._direccion
    
    def set_direccion(self, direccion):
        if not direccion:
            raise ValueError("La dirección no puede ser nula.")
        self._direccion = direccion

# 🔹 Modelo de Asignatura
class Asignatura(Base):
    __tablename__ = 'Asignatura'
    
    _id = Column(BIGINT, primary_key=True, autoincrement=True)
    _nombre = Column(String(100), nullable=False)
    _ciclo = Column(Enum('I', 'II', 'III'), nullable=False, default='I')
    _descripcion = Column(String(255), nullable=False)
    
    def __init__(self, nombre, ciclo, descripcion):
        self.set_nombre(nombre)
        self.set_ciclo(ciclo)
        self.set_descripcion(descripcion)

    def get_nombre(self):
        return self._nombre
    
    def set_nombre(self, nombre):
        if not nombre or not (3 <= len(nombre) <= 20):
            raise ValueError("El nombre de la asignatura debe tener entre 3 y 20 caracteres.")
        self._nombre = nombre
    
    def get_ciclo(self):
        return self._ciclo
    
    def set_ciclo(self, ciclo):
        if ciclo not in ['I', 'II', 'III']:
            raise ValueError("Ciclo no válido.")
        self._ciclo = ciclo
    
    def get_descripcion(self):
        return self._descripcion
    
    def set_descripcion(self, descripcion):
        if not descripcion:
            raise ValueError("La descripción no puede ser nula.")
        self._descripcion = descripcion