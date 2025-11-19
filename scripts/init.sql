-- Crear base de datos personalizada
CREATE DATABASE IF NOT EXISTS sistema_facultad;
 
USE sistema_facultad;
 
-- Tabla de estudiantes
CREATE TABLE IF NOT EXISTS estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    legajo VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
-- Tabla de materias
CREATE TABLE IF NOT EXISTS materias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    codigo VARCHAR(10) UNIQUE NOT NULL,
    creditos INT DEFAULT 0
);
 
-- Insertar algunos datos de ejemplo
INSERT IGNORE INTO estudiantes (nombre, apellido, legajo, email) VALUES
('Juan', 'Pérez', 'LP12345', 'juan.perez@facultad.edu'),
('María', 'Gómez', 'LP12346', 'maria.gomez@facultad.edu'),
('Carlos', 'López', 'LP12347', 'carlos.lopez@facultad.edu');
 
INSERT IGNORE INTO materias (nombre, codigo, creditos) VALUES
('Linux y Virtualización', 'LINUX01', 4),
('Bases de Datos', 'BDAT02', 6),
('Docker y Contenedores', 'DOCK03', 4);
 
-- Otorgar todos los privilegios al usuario admlinux
GRANT ALL PRIVILEGES ON *.* TO 'admlinux'@'%';
FLUSH PRIVILEGES;
