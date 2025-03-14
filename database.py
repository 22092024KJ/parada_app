from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from models import Base  # Importa la base de modelos

DATABASE_URL = "mysql+mysqlconnector://root:@localhost/medical_apellido"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base.metadata.create_all(bind=engine)
