-- ===========================================
-- Consultas SQL de apoyo - SkillTrack Empresas
-- ===========================================
-- Requiere haber ejecutado antes:
--   docs/bd/script.sql
-- ===========================================

USE skilltrack;

-- 1) Listar inscripciones con colaborador, curso, categoría y estado
--    (JOIN de 3 tablas, SELECT de columnas específicas)
SELECT
    c.nombre    AS nombre_colaborador,
    cu.nombre   AS nombre_curso,
    cu.categoria,
    i.estado
FROM inscripcion i
         JOIN colaborador c ON i.id_colaborador = c.id_colaborador
         JOIN curso cu      ON i.id_curso = cu.id_curso
ORDER BY c.nombre ASC, cu.nombre ASC;



-- 2) JOIN de 4 tablas: empresas, colaboradores, inscripciones, evaluaciones
--    Muestra la nota final cuando existe (LEFT JOIN)
SELECT
    e.nombre     AS empresa,
    c.nombre     AS colaborador,
    cu.nombre    AS curso,
    i.estado,
    ev.nota_final
FROM empresa e
         JOIN colaborador c ON c.id_empresa = e.id_empresa
         JOIN inscripcion i ON i.id_colaborador = c.id_colaborador
         JOIN curso cu      ON i.id_curso = cu.id_curso
         LEFT JOIN evaluacion ev ON ev.id_inscripcion = i.id_inscripcion
ORDER BY e.nombre, c.nombre, cu.nombre;


-- 3) WHERE: colaboradores aprobados en cursos Backend de una empresa específica
SELECT
    c.nombre AS colaborador,
    cu.nombre AS curso,
    i.estado
FROM inscripcion i
         JOIN colaborador c ON i.id_colaborador = c.id_colaborador
         JOIN curso cu      ON i.id_curso = cu.id_curso
WHERE i.estado = 'APROBADO'
  AND cu.categoria = 'Backend'
  AND c.id_empresa = 1
ORDER BY c.nombre;

-- 4) ORDER BY por curso y fecha de inscripción (más recientes al inicio)
SELECT
    cu.nombre  AS curso,
    c.nombre   AS colaborador,
    i.estado,
    i.fecha_inscripcion
FROM inscripcion i
         JOIN colaborador c ON i.id_colaborador = c.id_colaborador
         JOIN curso cu      ON i.id_curso = cu.id_curso
ORDER BY cu.nombre ASC, i.fecha_inscripcion DESC;



-- 5) GROUP BY: porcentaje de aprobación por curso
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



-- 6) GROUP BY simple: cantidad de colaboradores por empresa
SELECT
    e.nombre AS empresa,
    COUNT(c.id_colaborador) AS total_colaboradores
FROM empresa e
         LEFT JOIN colaborador c ON c.id_empresa = e.id_empresa
GROUP BY e.id_empresa, e.nombre
ORDER BY total_colaboradores DESC;

-- 7) TOP de cursos por número de inscripciones
SELECT
    cu.nombre AS curso,
    COUNT(i.id_inscripcion) AS total_inscripciones
FROM curso cu
         LEFT JOIN inscripcion i ON i.id_curso = cu.id_curso
GROUP BY cu.id_curso, cu.nombre
ORDER BY total_inscripciones DESC, cu.nombre ASC;