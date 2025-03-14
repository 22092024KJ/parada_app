from sqlalchemy import Column, String, Integer, Enum, ForeignKey, Time, BIGINT
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

# 🔹 Modelo de Aula
class Aula(Base):
    __tablename__ = 'Aula'
    
    id = Column(BIGINT, primary_key=True, autoincrement=True)
    numero = Column(String(10), nullable=False, unique=True)
    planta = Column(Integer, nullable=False, default=1)
    situacion = Column(Enum('DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO'), nullable=False, default='DISPONIBLE')

# 🔹 Modelo de Estudiante
class Estudiante(Base):
    __tablename__ = 'Estudiante'
    
    id = Column(BIGINT, primary_key=True, autoincrement=True)
    n_matricula = Column(String(15), unique=True, nullable=False)
    nombre = Column(String(100), nullable=False)
    direccion = Column(String(255), nullable=False)

# 🔹 Modelo de Asignatura
class Asignatura(Base):
    __tablename__ = 'Asignatura'
    
    id = Column(BIGINT, primary_key=True, autoincrement=True)
    nombre = Column(String(100), nullable=False)
    ciclo = Column(Enum('I', 'II', 'III'), nullable=False, default='I')
    descripcion = Column(String(255), nullable=False)

# 🔹 Modelo de Estudia (relación entre Estudiante y Asignatura)
class Estudia(Base):
    __tablename__ = 'Estudia'
    
    id = Column(BIGINT, primary_key=True, autoincrement=True)
    estudiante_id = Column(BIGINT, ForeignKey('Estudiante.id'), nullable=False)
    asignatura_id = Column(BIGINT, ForeignKey('Asignatura.id'), nullable=False)
    hora = Column(Time, nullable=False, default='08:00:00')

    estudiante = relationship("Estudiante")
    asignatura = relationship("Asignatura")

