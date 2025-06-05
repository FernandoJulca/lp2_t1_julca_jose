-- Eliminar la base de datos si existe y crearla de nuevo
DROP DATABASE IF EXISTS `database_t1`;
CREATE DATABASE `database_t1`;
USE `database_t1`;

-- Crear tabla tbl_especialidad
CREATE TABLE `tbl_especialidad` (
  `id_especialidad` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_especialidad`)
) ENGINE=InnoDB;

-- Insertar datos en tbl_especialidad
INSERT INTO `tbl_especialidad` (`titulo`) VALUES
  ('Ortodoncia'),
  ('Endodoncia'),
  ('Periodoncia'),
  ('Rehabilitación Oral'),
  ('Cirugía Bucal');

-- Crear tabla tbl_dentista
CREATE TABLE `tbl_dentista` (
  `id_dentista` INT NOT NULL AUTO_INCREMENT,
  `cop` CHAR(6) NOT NULL,
  `nombre_completo` VARCHAR(50) NOT NULL,
  `fecha_inicio_contrato` DATE NOT NULL,
  `turno` CHAR(1) NOT NULL,
  `correo` VARCHAR(50) NOT NULL,
  `id_especialidad` INT NOT NULL,
  PRIMARY KEY (`id_dentista`),
  UNIQUE KEY `uq_tbl_dentista_correo` (`correo`),
  CONSTRAINT `chk_tbl_dentista_cop` CHECK (`cop` REGEXP '^[0-9]{6}$'),
  CONSTRAINT `chk_tbl_dentista_turno` CHECK (`turno` IN ('M','T','N')), -- M=Mañana, T=tarde, N=Noche
  CONSTRAINT `fk_tbl_dentista_especialidad` FOREIGN KEY (`id_especialidad`)
    REFERENCES `tbl_especialidad` (`id_especialidad`)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Insertar datos en tbl_dentista
INSERT INTO `tbl_dentista` (
  `cop`, `nombre_completo`, `fecha_inicio_contrato`, `turno`, `correo`, `id_especialidad`
) VALUES
  ('123456', 'Carlos Pérez González', '2023-02-10', 'M', 'carlos.perez@perfil_dental.com', 1),
  ('234567', 'Lucía Gómez Rodríguez', '2022-12-05', 'T', 'lucia.gomez@perfil_dental.com', 3),
  ('345678', 'José Martínez Díaz', '2023-01-20', 'M', 'jose.martinez@perfil_dental.com', 5),
  ('456789', 'Ana Rodríguez Sánchez', '2022-11-10', 'N', 'ana.rodriguez@perfil_dental.com', 2),
  ('567890', 'Pedro Sánchez Rivera', '2023-03-01', 'T', 'pedro.sanchez@perfil_dental.com', 4),
  ('678901', 'María Ruiz Hernández', '2023-01-15', 'M', 'maria.ruiz@perfil_dental.com', 5),
  ('789012', 'Fernando Díaz Morales', '2023-04-12', 'N', 'fernando.diaz@perfil_dental.com', 2),
  ('890123', 'Sofía Torres Delgado', '2022-09-22', 'T', 'sofia.torres@perfil_dental.com', 1),
  ('901234', 'Raúl González Pérez', '2023-03-30', 'M', 'raul.gonzalez@perfil_dental.com', 4),
  ('012345', 'Ricardo Jiménez Soto', '2023-04-10', 'T', 'ricardo.jimenez@perfil_dental.com', 1);

-- Crear tabla tbl_equipo_dental
CREATE TABLE `tbl_equipo_dental` (
  `nro_equipo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `costo` DECIMAL(10,2) NOT NULL,
  `fecha_adquisicion` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` CHAR(1) NOT NULL,
  `id_dentista` INT NULL,
  PRIMARY KEY (`nro_equipo`),
  CONSTRAINT `chk_tbl_equipo_dental_estado` CHECK (`estado` IN ('N','A','R','S')), -- N=Nuevo, A=Alquilado, R=Reparado, S=Segunda
  CONSTRAINT `fk_tbl_equipo_dental_dentista` FOREIGN KEY (`id_dentista`)
    REFERENCES `tbl_dentista` (`id_dentista`)
    ON UPDATE CASCADE
    ON DELETE SET NULL
) ENGINE=InnoDB;

-- Insertar datos en tbl_equipo_dental
INSERT INTO `tbl_equipo_dental` (
  `nombre`, `costo`, `fecha_adquisicion`, `estado`, `id_dentista`
) VALUES
  ('Radiografía Digital',            15000.00, '2022-01-15 00:00:00', 'N', 1),
  ('Lámpara LED',                      800.00, '2022-03-22 00:00:00', 'N', 4),
  ('Microscopio Dental',              2500.00, '2023-05-10 00:00:00', 'N', 2),
  ('Aspirador de Saliva',               400.00, '2021-09-10 00:00:00', 'S', 6),
  ('Autoclave',                       2000.00, '2022-11-15 00:00:00', 'N', 9),
  ('Cámara Intraoral',                1200.00, '2023-02-18 00:00:00', 'A', 3),
  ('Silla Dental',                    3000.00, '2022-08-01 00:00:00', 'N', 8),
  ('Unidad de Rayos X',               10000.00, '2021-10-20 00:00:00', 'S', 5),
  ('Compresor de Aire',               2500.00, '2023-01-05 00:00:00', 'N', 10),
  ('Lámpara de Fotopolimerización',     700.00, '2023-03-12 00:00:00', 'N', 7),
  ('Ultrasonido Dental',              1500.00, '2022-06-25 00:00:00', 'R', 4),
  ('Cuna para el Paciente',           1200.00, '2022-07-10 00:00:00', 'N', 9),
  ('Sistema de Vacío',                1800.00, '2023-04-02 00:00:00', 'N', 6),
  ('Micromotor de Alta Velocidad',      800.00, '2022-05-15 00:00:00', 'A', 2),
  ('Endomotor',                        900.00, '2022-10-10 00:00:00', 'S', 3),
  ('Escáner Intraoral',               5000.00, '2023-04-20 00:00:00', 'N', 8),
  ('Turbina de Alta Velocidad',         600.00, '2021-12-05 00:00:00', 'R', 1),
  ('Unidad de Suministro de Agua',     1000.00, '2023-01-25 00:00:00', 'N', 7);