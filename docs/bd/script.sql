-- ===========================================
-- Script de Base de Datos - SkillTrack Empresas
-- ===========================================

CREATE DATABASE IF NOT EXISTS skilltrack
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE skilltrack;

-- ========================
-- Tablas
-- ========================

CREATE TABLE empresa (
                         id_empresa      INT AUTO_INCREMENT PRIMARY KEY,
                         nombre          VARCHAR(100) NOT NULL,
                         rubro           VARCHAR(100),
                         ciudad          VARCHAR(80),
                         email_contacto  VARCHAR(120)
);

CREATE TABLE colaborador (
                             id_colaborador  INT AUTO_INCREMENT PRIMARY KEY,
                             nombre          VARCHAR(120) NOT NULL,
                             rut             VARCHAR(20) NOT NULL UNIQUE,
                             email           VARCHAR(120) NOT NULL,
                             cargo           VARCHAR(80),
                             id_empresa      INT NOT NULL,
                             CONSTRAINT fk_colab_empresa
                                 FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa)
);

CREATE TABLE curso (
                       id_curso        INT AUTO_INCREMENT PRIMARY KEY,
                       nombre          VARCHAR(120) NOT NULL,
                       categoria       VARCHAR(60),
                       nivel           VARCHAR(30),
                       duracion_horas  INT NOT NULL
);

CREATE TABLE inscripcion (
                             id_inscripcion    INT AUTO_INCREMENT PRIMARY KEY,
                             id_colaborador    INT NOT NULL,
                             id_curso          INT NOT NULL,
                             fecha_inscripcion DATE NOT NULL,
                             estado            VARCHAR(20) NOT NULL,
                             CONSTRAINT fk_insc_colab
                                 FOREIGN KEY (id_colaborador) REFERENCES colaborador(id_colaborador),
                             CONSTRAINT fk_insc_curso
                                 FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE evaluacion (
                            id_evaluacion   INT AUTO_INCREMENT PRIMARY KEY,
                            id_inscripcion  INT NOT NULL,
                            nota_final      DECIMAL(4,2),
                            observaciones   VARCHAR(255),
                            CONSTRAINT fk_eval_insc
                                FOREIGN KEY (id_inscripcion) REFERENCES inscripcion(id_inscripcion)
);

-- ========================
-- Datos de ejemplo
-- ========================

INSERT INTO empresa (nombre, rubro, ciudad, email_contacto) VALUES
                                                                ('TechCorp', 'Desarrollo de Software', 'Santiago', 'rrhh@techcorp.cl'),
                                                                ('DataPlus', 'Análisis de Datos', 'Valparaíso', 'contacto@dataplus.cl');

INSERT INTO colaborador (nombre, rut, email, cargo, id_empresa) VALUES
                                                                    ('Ana Pérez',  '11.111.111-1', 'ana.perez@techcorp.cl',  'Backend Trainee', 1),
                                                                    ('Luis Soto',  '22.222.222-2', 'luis.soto@techcorp.cl',  'QA',              1),
                                                                    ('Carla Díaz', '33.333.333-3', 'carla.diaz@dataplus.cl', 'Data Trainee',    2);

INSERT INTO curso (nombre, categoria, nivel, duracion_horas) VALUES
                                                                 ('Java Backend Inicial',   'Backend', 'Inicial',    40),
                                                                 ('Fundamentos de SQL',     'Datos',   'Inicial',    24),
                                                                 ('Testing Automatizado',   'QA',      'Intermedio', 32);

INSERT INTO inscripcion (id_colaborador, id_curso, fecha_inscripcion, estado) VALUES
                                                                                  (1, 1, '2025-01-10', 'APROBADO'),
                                                                                  (1, 2, '2025-02-01', 'EN_CURSO'),
                                                                                  (2, 3, '2025-01-15', 'REPROBADO'),
                                                                                  (3, 2, '2025-01-20', 'APROBADO');

INSERT INTO evaluacion (id_inscripcion, nota_final, observaciones) VALUES
                                                                       (1, 6.0, 'Buen desempeño'),
                                                                       (3, 3.9, 'Debe reforzar contenidos'),
                                                                       (4, 5.5, 'Cumple expectativas');


-- Fin de script de creación y carga de datos de ejemplo
-- Para consultas de análisis, ver: docs/consultas.sql