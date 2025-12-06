-- ===========================================
-- Script de usuario dedicado - SkillTrack Empresas
-- ===========================================
-- Ejecutar este script con un usuario con privilegios de administración
-- (por ejemplo: root). No usar en producción sin ajustar permisos.
-- ===========================================

-- 1) Crear usuario dedicado para la app
CREATE USER IF NOT EXISTS 'skilltrack_user'@'localhost'
    IDENTIFIED BY 'CAMBIAR_PASSWORD_AQUI';

-- 2) Otorgar permisos sobre la base de datos skilltrack
GRANT SELECT, INSERT, UPDATE, DELETE
    ON skilltrack.*
    TO 'skilltrack_user'@'localhost';

-- Nota:
-- En MySQL 8, GRANT ya actualiza los privilegios.
-- No es necesario usar explícitamente FLUSH PRIVILEGES.

-- Nota:
-- Cambiar la contraseña antes de ejecutar este script.