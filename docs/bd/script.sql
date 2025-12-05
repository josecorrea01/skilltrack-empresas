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

-- ========================
-- Consultas ejemplo (rúbrica)
-- ========================

-- 1) SELECT de columnas específicas con JOIN
SELECT
    c.nombre    AS nombre_colaborador,
    cu.nombre   AS nombre_curso,
    cu.categoria,
    i.estado
FROM inscripcion i
         JOIN colaborador c ON i.id_colaborador = c.id_colaborador
         JOIN curso cu      ON i.id_curso = cu.id_curso;

-- 2) JOIN de 4 tablas
SELECT
    e.nombre     AS empresa,
    c.nombre     AS colaborador,
    cu.nombre    AS curso,
    i.estado,
    ev.nota_final
FROM empresa e
         JOIN colaborador c ON c.id_empresa = e.id_empresa
         JOIN inscripcion i ON i.id_colaborador = c.id_colaborador
         LEFT JOIN evaluacion ev ON ev.id_inscripcion = i.id_inscripcion;

-- 3) WHERE para filtrar por estado, categoría y empresa
SELECT
    c.nombre AS colaborador,
    cu.nombre AS curso,
    i.estado
FROM inscripcion i
         JOIN colaborador c ON i.id_colaborador = c.id_colaborador
         JOIN curso cu      ON i.id_curso = cu.id_curso
WHERE i.estado = 'APROBADO'
  AND cu.categoria = 'Backend'
  AND c.id_empresa = 1;

-- 4) ORDER BY por curso y fecha de inscripción
SELECT
    cu.nombre  AS curso,
    c.nombre   AS colaborador,
    i.estado,
    i.fecha_inscripcion
FROM inscripcion i
         JOIN colaborador c ON i.id_colaborador = c.id_colaborador
         JOIN curso cu      ON i.id_curso = cu.id_curso
ORDER BY cu.nombre ASC, i.fecha_inscripcion DESC;

-- 5) GROUP BY con porcentaje de aprobación por curso
SELECT
    cu.nombre AS curso,
    COUNT(*) AS total_inscripciones,
    SUM(CASE WHEN i.estado = 'APROBADO' THEN 1 ELSE 0 END) AS total_aprobados,
    ROUND(SUM(CASE WHEN i.estado = 'APROBADO' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2)
        AS porcentaje_aprobacion
FROM inscripcion i
         JOIN curso cu ON i.id_curso = cu.id_curso
GROUP BY cu.id_curso, cu.nombre
ORDER BY porcentaje_aprobacion DESC;