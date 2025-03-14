from database import SessionLocal
from crud.aula_crud import insertar_aula, consultar_aulas

db = SessionLocal()

# Insertar un aula
nueva_aula = insertar_aula(db, "101", "DISPONIBLE", "1")
print(f"Aula insertada: {nueva_aula.get_numero_aula()} - {nueva_aula.get_situacion()}")

# Consultar todas las aulas
aulas = consultar_aulas(db)
for aula in aulas:
    print(f"Aula: {aula.get_numero_aula()} - Situación: {aula.get_situacion()}")
