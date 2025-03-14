from sqlalchemy.orm import Session
from models.aula import Aula

def insertar_aula(db: Session, numero_aula: str, situacion: str, planta: str):
    nueva_aula = Aula(numero_aula=numero_aula, situacion=situacion, planta=planta)
    db.add(nueva_aula)
    db.commit()
    db.refresh(nueva_aula)
    return nueva_aula

def consultar_aula(db: Session, id: int):
    return db.query(Aula).filter(Aula._id == id).first()

def consultar_aulas(db: Session):
    return db.query(Aula).all()

def actualizar_aula(db: Session, id: int, situacion: str):
    aula = db.query(Aula).filter(Aula._id == id).first()
    if aula:
        aula.set_situacion(situacion)
        db.commit()
    return aula

def eliminar_aula(db: Session, id: int):
    aula = db.query(Aula).filter(Aula._id == id).first()
    if aula:
        db.delete(aula)
        db.commit()
    return aula
