CREATE DATABASE IF NOT EXISTS ieperez_bd;
USE ieperez_bd;

-- Tabla Estudiantes
CREATE TABLE Estudiantes (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    num_matricula VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

-- Tabla Aulas
CREATE TABLE Aulas (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(10) NOT NULL,
    planta ENUM('1', '2', '3', '4', '5') NOT NULL DEFAULT '1',
    situacion ENUM('DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO') NOT NULL DEFAULT 'DISPONIBLE'
);

-- Tabla Asignaturas
CREATE TABLE Asignaturas (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciclo ENUM('I', 'II', 'III') NOT NULL DEFAULT 'I',
    descripcion TEXT NOT NULL
);

-- Tabla Estudia (relación entre Estudiantes y Asignaturas)
CREATE TABLE Estudia (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    estudiante_id BIGINT UNSIGNED NOT NULL,
    asignatura_id BIGINT UNSIGNED NOT NULL,
    hora TIME NOT NULL DEFAULT '08:00:00',
    FOREIGN KEY (estudiante_id) REFERENCES Estudiantes(id) ON DELETE CASCADE,
    FOREIGN KEY (asignatura_id) REFERENCES Asignaturas(id) ON DELETE CASCADE
);