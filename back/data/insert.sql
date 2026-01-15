-- -- Población de datos inicial (Ejemplos Extensos) --

-- -- ==========================================
-- -- 1. USUARIOS (USERS)
-- -- ==========================================
-- -- Admin (ID 1) se asume creado.
-- -- IDs 2-6: Centros
-- -- IDs 7-11: Profesores
-- -- IDs 12-16: Alumnos

-- -- 1.1 Centros
-- INSERT INTO users (email, password_hash, role, is_active) VALUES
-- ('centro1@ejemplo.com', '1234', 'CENTER', TRUE),
-- ('centro2@ejemplo.com', '1234', 'CENTER', TRUE),
-- ('centro3@ejemplo.com', '1234', 'CENTER', TRUE),
-- ('centro4@ejemplo.com', '1234', 'CENTER', TRUE),
-- ('centro5@ejemplo.com', '1234', 'CENTER', TRUE);

-- -- 1.2 Profesores
-- INSERT INTO users (email, password_hash, role, is_active) VALUES
-- ('profe1@ejemplo.com', '1234', 'TEACHER', TRUE),
-- ('profe2@ejemplo.com', '1234', 'TEACHER', TRUE),
-- ('profe3@ejemplo.com', '1234', 'TEACHER', TRUE),
-- ('profe4@ejemplo.com', '1234', 'TEACHER', TRUE),
-- ('profe5@ejemplo.com', '1234', 'TEACHER', TRUE);

-- -- 1.3 Alumnos
-- INSERT INTO users (email, password_hash, role, is_active) VALUES
-- ('alumno1@ejemplo.com', '1234', 'STUDENT', TRUE),
-- ('alumno2@ejemplo.com', '1234', 'STUDENT', TRUE),
-- ('alumno3@ejemplo.com', '1234', 'STUDENT', TRUE),
-- ('alumno4@ejemplo.com', '1234', 'STUDENT', TRUE),
-- ('alumno5@ejemplo.com', '1234', 'STUDENT', TRUE);


-- -- ==========================================
-- -- 2. CENTROS (CENTERS)
-- -- ==========================================
-- -- IDs de usuario 2 al 6
-- INSERT INTO centers (id_user, center_name, center_code, address, phone) VALUES
-- (2, 'IES Pedralbes',      '080001', 'Av. Esplugues 36, BCN', '930000001'),
-- (3, 'Institut Poblenou',  '080002', 'Carrer bilbao 20, BCN', '930000002'),
-- (4, 'Colegio Tecnológico','080003', 'Gran Via 123, BCN',     '930000003'),
-- (5, 'IES Gracia',         '080004', 'Carrer Verdi 50, BCN',  '930000004'),
-- (6, 'Escola del Treball', '080005', 'Carrer Urgell 187, BCN','930000005');


-- -- ==========================================
-- -- 3. PROFESORES (TEACHERS)
-- -- ==========================================
-- -- IDs de usuario 7 al 11. Asignados a distintos centros.
-- INSERT INTO teachers (id_user, first_name, last_name, id_center_assigned) VALUES
-- (7,  'Juan',    'Pérez',     2), -- En IES Pedralbes
-- (8,  'Laura',   'García',    2), -- En IES Pedralbes
-- (9,  'Carlos',  'Sánchez',   3), -- En Poblenou
-- (10, 'Ana',     'Martínez',  4), -- En Col. Tecnológico
-- (11, 'Roberto', 'Rodríguez', 5); -- En IES Gracia


-- -- ==========================================
-- -- 4. ALUMNOS (STUDENTS)
-- -- ==========================================
-- -- IDs de usuario 12 al 16.
-- INSERT INTO students (id_user, first_name, last_name, birth_date, phone, id_center_assigned) VALUES
-- (12, 'María',  'López',  '2005-01-15', '600000001', 2), -- Pedralbes
-- (13, 'Pedro',  'Gómez',  '2006-03-22', '600000002', 2), -- Pedralbes
-- (14, 'Lucía',  'Fern.',  '2005-07-30', '600000003', 3), -- Poblenou
-- (15, 'Miguel', 'Torres', '2005-11-05', '600000004', 3), -- Poblenou
-- (16, 'Elena',  'Ruiz',   '2006-02-14', '600000005', 4); -- Tecnológico


-- -- ==========================================
-- -- 5. TALLERES (WORKSHOPS)
-- -- ==========================================
-- -- Suponemos que auto-increment empieza en 1 -> 5
-- INSERT INTO workshops (title, short_description, max_slots, start_date, end_date, available_slots, category, center_id) VALUES
-- ('Robótica Básica', 'Intro a Arduino',  16, '2025-05-10 09:00', '2025-05-10 13:00', 16, 'Tecnología', 2),
-- ('Diseño Web',      'HTML y CSS',       20, '2025-05-11 10:00', '2025-05-11 14:00', 20, 'Informática', 2),
-- ('Impresión 3D',    'Modelado básico',  10, '2025-05-12 16:00', '2025-05-12 19:00', 10, 'Fabricación', 3),
-- ('Ciberseguridad',  'Hacking ético',    15, '2025-06-01 09:00', '2025-06-01 13:00', 15, 'Seguridad',   3),
-- ('IA para Todos',   'Conceptos de LLM', 25, '2025-06-02 10:00', '2025-06-02 12:00', 25, 'IA',          4);


-- -- ==========================================
-- -- 6. TALLER_PROFESORES (WORKSHOP_TEACHERS)
-- -- ==========================================
-- -- Asignamos profesores a los talleres recién creados
-- -- IDs workshop 1..5 estáticos supuestos (al ser fresh insert)
-- -- Profesores IDs 7..11
-- INSERT INTO workshop_teachers (id_workshop, id_teacher) VALUES
-- (1, 7), -- Juan da Robótica
-- (1, 8), -- Laura también ayuda en Robótica
-- (2, 7), -- Juan da Diseño Web
-- (3, 9), -- Carlos da Impresión 3D
-- (4, 9); -- Carlos da Ciberseguridad


-- -- ==========================================
-- -- 7. SOLICITUDES DE CENTROS (CENTER_REQUESTS)
-- -- ==========================================
-- -- Centros solicitan plazas para talleres
-- INSERT INTO center_requests (id_center, id_workshop, requested_slots, status, comments) VALUES
-- (3, 1, 4, 'PENDING',  'Interés alto'),         -- Poblenou pide Robótica
-- (4, 2, 2, 'ACCEPTED', 'Confirmado'),           -- Tecnológico pide Diseño Web
-- (5, 1, 3, 'REJECTED', 'Fuera de plazo'),       -- Gracia pide Robótica
-- (2, 3, 4, 'PENDING',  'Alumnos motivados'),    -- Pedralbes pide Impresión 3D (aunque es "su competencia" o colaboración)
-- (6, 5, 4, 'PARTIAL',  'Solo hay 2 huecos');    -- Treball pide IA


-- -- ==========================================
-- -- 8. INTERÉS DE ALUMNOS (STUDENT_INTEREST)
-- -- ==========================================
-- -- Alumnos (12..16) interesados en talleres (1..5)
-- INSERT INTO student_interest (id_student, id_workshop, status, verified_by_teacher_id) VALUES
-- (12, 1, 'WAITING',   7),
-- (13, 1, 'CONFIRMED', 7),
-- (14, 3, 'WAITING',   9),
-- (15, 4, 'CANCELLED', 9),
-- (16, 5, 'WAITING',   10);


-- -- ==========================================
-- -- 9. INSCRIPCIONES (WORKSHOP_ENROLLMENTS)
-- -- ==========================================
-- -- Alumnos inscritos
-- INSERT INTO workshop_enrollments (id_workshop, id_student) VALUES
-- (1, 13), -- Pedro inscrito en Robótica
-- (2, 16), -- Elena inscrita en Diseño Web
-- (3, 14), -- Lucía inscrita en Impresión 3D
-- (1, 12), -- María inscrita en Robótica
-- (5, 15); -- Miguel inscrito en IA