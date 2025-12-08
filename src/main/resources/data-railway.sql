-- Datos de ejemplo para H2 (perfil railway)

INSERT INTO empresa (nombre, rubro, ciudad, email_contacto) VALUES
('TechCorp',  'Desarrollo de Software', 'Santiago',    'rrhh@techcorp.cl'),
('DataPlus',  'Análisis de Datos',      'Valparaíso', 'contacto@dataplus.cl');

INSERT INTO colaborador (nombre, rut, email, cargo, id_empresa) VALUES
('Ana Pérez',   '11.111.111-1', 'ana.perez@techcorp.cl',   'Backend Trainee', 1),
('Luis Soto',   '22.222.222-2', 'luis.soto@techcorp.cl',   'QA',              1),
('Carla Díaz',  '33.333.333-3', 'carla.diaz@dataplus.cl',  'Data Trainee',    2);

INSERT INTO curso (nombre, categoria, nivel, duracion_horas) VALUES
('Java Backend Inicial',   'Backend', 'Inicial',    40),
('Fundamentos de SQL',     'Datos',   'Inicial',    24),
('Testing Automatizado',   'QA',      'Intermedio', 32);

INSERT INTO inscripcion (id_colaborador, id_curso, fecha_inscripcion, estado) VALUES
(1, 1, DATE '2025-01-10', 'APROBADO'),
(1, 2, DATE '2025-02-01', 'EN_CURSO'),
(2, 3, DATE '2025-01-15', 'REPROBADO'),
(3, 2, DATE '2025-01-20', 'APROBADO');

INSERT INTO evaluacion (id_inscripcion, nota_final, observaciones) VALUES
(1, 6.0, 'Buen desempeño'),
(3, 3.9, 'Debe reforzar contenidos'),
(4, 5.5, 'Cumple expectativas');