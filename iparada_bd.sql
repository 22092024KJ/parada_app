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

DELIMITER //

-- 🔹 Insertar un Aula
CREATE PROCEDURE InsertarAula(
    IN p_numero VARCHAR(10), 
    IN p_planta INT, 
    IN p_situacion ENUM('DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al insertar aula';
    END;
    
    START TRANSACTION;
    INSERT INTO Aula (numero, planta, situacion) VALUES (p_numero, p_planta, p_situacion);
    COMMIT;
END;
//

-- 🔹 Consultar un Aula por ID
CREATE PROCEDURE ConsultarAula(IN p_id BIGINT UNSIGNED)
BEGIN
    SELECT * FROM Aula WHERE id = p_id;
END;
//

-- 🔹 Consultar todas las Aulas
CREATE PROCEDURE ConsultarAulas()
BEGIN
    SELECT * FROM Aula;
END;
//

-- 🔹 Actualizar un Aula
CREATE PROCEDURE ActualizarAula(
    IN p_id BIGINT UNSIGNED,
    IN p_numero VARCHAR(10), 
    IN p_planta INT, 
    IN p_situacion ENUM('DISPONIBLE', 'OCUPADA', 'EN MANTENIMIENTO')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al actualizar aula';
    END;

    START TRANSACTION;
    UPDATE Aula 
    SET numero = p_numero, planta = p_planta, situacion = p_situacion
    WHERE id = p_id;
    COMMIT;
END;
//

-- 🔹 Eliminar un Aula
CREATE PROCEDURE EliminarAula(IN p_id BIGINT UNSIGNED)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error al eliminar aula';
    END;

    START TRANSACTION;
    DELETE FROM Aula WHERE id = p_id;
    COMMIT;
END;
//

DELIMITER ;

-- Insertar Aula
CALL InsertarAula('101', 1, 'DISPONIBLE');

--Consultar un Aula por ID
CALL ConsultarAula(1);

--Consultar todas las Aulas
CALL ConsultarAulas();

--Actualizar un Aula
CALL ActualizarAula(1, '102', 2, 'OCUPADA');

--Eliminar un Aula
CALL EliminarAula(1);

