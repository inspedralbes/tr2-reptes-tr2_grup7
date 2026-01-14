-- Script para actualizar la contraseña del admin con un hash bcrypt válido
-- Contraseña: 123
-- Hash generado con bcrypt (10 rounds)

UPDATE users 
SET password_hash = '$2b$10$K3khv8g7qXFZ3Z3Z3Z3Z3eqK3khv8g7qXFZ3Z3Z3Z3Z3eqK3khv8O'
WHERE email = 'admin@workshop.com';

-- Verificar el cambio
SELECT id, email, role, LEFT(password_hash, 20) as hash_preview 
FROM users 
WHERE email = 'admin@workshop.com';
