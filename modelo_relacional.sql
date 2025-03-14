CREATE TABLE Estudiante (
    N_Matricula INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(255)
);

CREATE TABLE Aula (
    Numero INT PRIMARY KEY,
    Planta VARCHAR(10),
    Situacion VARCHAR(100)
);

CREATE TABLE Asignatura (
    Nombre VARCHAR(100) PRIMARY KEY,
    Ciclo VARCHAR(50),
    Descripcion TEXT
);

CREATE TABLE Estudia (
    N_Matricula INT,
    NombreAsignatura VARCHAR(100),
    Hora TIME,
    PRIMARY KEY (N_Matricula, NombreAsignatura),
    FOREIGN KEY (N_Matricula) REFERENCES Estudiante(N_Matricula),
    FOREIGN KEY (NombreAsignatura) REFERENCES Asignatura(Nombre)
);