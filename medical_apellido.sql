-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS ieperez_bd;
USE ieperez_bd;

-- Crear tabla Aula
CREATE TABLE Aula (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL UNIQUE,
    planta INT NOT NULL DEFAULT 1,
    situacion ENUM('DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO') NOT NULL DEFAULT 'DISPONIBLE'
);

-- Crear tabla Estudiante
CREATE TABLE Estudiante (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    n_matricula VARCHAR(15) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

-- Crear tabla Asignatura
CREATE TABLE Asignatura (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciclo ENUM('I', 'II', 'III') NOT NULL DEFAULT 'I',
    descripcion VARCHAR(255) NOT NULL
);

-- Tabla intermedia Estudia
CREATE TABLE Estudia (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id BIGINT NOT NULL,
    asignatura_id BIGINT NOT NULL,
    hora TIME NOT NULL DEFAULT '08:00:00',
    FOREIGN KEY (estudiante_id) REFERENCES Estudiante(id) ON DELETE CASCADE,
    FOREIGN KEY (asignatura_id) REFERENCES Asignatura(id) ON DELETE CASCADE
);

-- 🔹 Procedimientos Almacenados
DELIMITER $$

-- Procedimiento para insertar un Aula
CREATE PROCEDURE InsertarAula(
    IN p_numero VARCHAR(10),
    IN p_planta INT,
    IN p_situacion ENUM('DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO')
)
BEGIN
    INSERT INTO Aula (numero, planta, situacion) 
    VALUES (p_numero, p_planta, p_situacion);
END $$

-- Procedimiento para insertar un Estudiante
CREATE PROCEDURE InsertarEstudiante(
    IN p_n_matricula VARCHAR(15),
    IN p_nombre VARCHAR(100),
    IN p_direccion VARCHAR(255)
)
BEGIN
    INSERT INTO Estudiante (n_matricula, nombre, direccion) 
    VALUES (p_n_matricula, p_nombre, p_direccion);
END $$

-- Procedimiento para insertar una Asignatura
CREATE PROCEDURE InsertarAsignatura(
    IN p_nombre VARCHAR(100),
    IN p_ciclo ENUM('I', 'II', 'III'),
    IN p_descripcion VARCHAR(255)
)
BEGIN
    INSERT INTO Asignatura (nombre, ciclo, descripcion) 
    VALUES (p_nombre, p_ciclo, p_descripcion);
END $$

DELIMITER ;
