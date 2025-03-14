
-- medical_apellido.SQL

CREATE DATABASE IF NOT EXISTS medical_apellido_bd;
USE medical_apellido_bd;

-- Tabla Usuarios
CREATE TABLE usuarios (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    password VARCHAR(128) NOT NULL,
    last_login DATETIME,
    is_superuser TINYINT NOT NULL DEFAULT 0,
    username VARCHAR(150) NOT NULL UNIQUE,
    first_name VARCHAR(45) NOT NULL,
    last_name VARCHAR(45) NOT NULL,
    email VARCHAR(254) UNIQUE,
    is_staff TINYINT NOT NULL DEFAULT 0,
    is_active TINYINT NOT NULL DEFAULT 1,
    date_joined DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tipo_doc ENUM('CC', 'CE') NOT NULL,
    num_doc VARCHAR(20) NOT NULL UNIQUE,
    fecha_nac DATE NOT NULL,
    ciudad_res VARCHAR(100),
    direccion VARCHAR(100),
    telefono VARCHAR(100),
    imagen VARCHAR(100)
);

-- Tabla Médicos
CREATE TABLE medicos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    carnet VARCHAR(45) NOT NULL UNIQUE,
    especialidad VARCHAR(45) NOT NULL,
    usuarios_id BIGINT NOT NULL,
    FOREIGN KEY (usuarios_id) REFERENCES usuarios(id)
);

-- Tabla Pacientes
CREATE TABLE pacientes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    genero ENUM('F', 'M') NOT NULL,
    usuarios_id BIGINT NOT NULL,
    FOREIGN KEY (usuarios_id) REFERENCES usuarios(id)
);

-- Tabla Consultas Médicas
CREATE TABLE consultas_medicas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE NOT NULL,
    pacientes_id BIGINT NOT NULL,
    medicos_id BIGINT NOT NULL,
    FOREIGN KEY (pacientes_id) REFERENCES pacientes(id),
    FOREIGN KEY (medicos_id) REFERENCES medicos(id)
);

-- Tabla Historiales Clínicos
CREATE TABLE historiales_clinicos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    fecha_consulta DATE NOT NULL,
    motivo_consulta TEXT NOT NULL,
    diagnostico TEXT NOT NULL,
    tratamiento TEXT NOT NULL,
    pacientes_id BIGINT NOT NULL,
    medicos_id BIGINT NOT NULL,
    FOREIGN KEY (pacientes_id) REFERENCES pacientes(id),
    FOREIGN KEY (medicos_id) REFERENCES medicos(id)
);

-- Procedimientos almacenados para insertar datos
DELIMITER $$

CREATE PROCEDURE InsertUsuario(
    IN p_password VARCHAR(128), IN p_username VARCHAR(150), IN p_first_name VARCHAR(45),
    IN p_last_name VARCHAR(45), IN p_email VARCHAR(254), IN p_tipo_doc ENUM('CC', 'CE'),
    IN p_num_doc VARCHAR(20), IN p_fecha_nac DATE, IN p_ciudad_res VARCHAR(100),
    IN p_direccion VARCHAR(100), IN p_telefono VARCHAR(100), IN p_imagen VARCHAR(100)
)
BEGIN
    INSERT INTO usuarios (password, username, first_name, last_name, email, tipo_doc, num_doc, fecha_nac, ciudad_res, direccion, telefono, imagen)
    VALUES (p_password, p_username, p_first_name, p_last_name, p_email, p_tipo_doc, p_num_doc, p_fecha_nac, p_ciudad_res, p_direccion, p_telefono, p_imagen);
END $$

DELIMITER ;