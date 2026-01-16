-- Población de datos inicial (Ejemplos Extensos) --

-- ==========================================
-- 1. USUARIOS (USERS)
-- ==========================================
-- Admin (ID 1) se asume creado.
-- IDs 2-6: Centros
-- IDs 7-11: Profesores
-- IDs 12-16: Alumnos

-- 1.1 Centros
INSERT INTO users (email, password_hash, role, is_active, created_at) VALUES
('centro1@ejemplo.com', '1234', 'CENTER', TRUE, '2026-01-01 10:00:00'),
('centro2@ejemplo.com', '1234', 'CENTER', TRUE, '2026-01-01 10:00:00'),
('centro3@ejemplo.com', '1234', 'CENTER', TRUE, '2026-01-01 10:00:00'),
('centro4@ejemplo.com', '1234', 'CENTER', TRUE, '2026-01-01 10:00:00'),
('centro5@ejemplo.com', '1234', 'CENTER', TRUE, '2026-01-01 10:00:00');

-- 1.2 Profesores
INSERT INTO users (email, password_hash, role, is_active) VALUES
('profe1@ejemplo.com', '1234', 'TEACHER', TRUE),
('profe2@ejemplo.com', '1234', 'TEACHER', TRUE),
('profe3@ejemplo.com', '1234', 'TEACHER', TRUE),
('profe4@ejemplo.com', '1234', 'TEACHER', TRUE),
('profe5@ejemplo.com', '1234', 'TEACHER', TRUE);

-- 1.3 Alumnos
INSERT INTO users (email, password_hash, role, is_active) VALUES
('alumno1@ejemplo.com', '1234', 'STUDENT', TRUE),
('alumno2@ejemplo.com', '1234', 'STUDENT', TRUE),
('alumno3@ejemplo.com', '1234', 'STUDENT', TRUE),
('alumno4@ejemplo.com', '1234', 'STUDENT', TRUE),
('alumno5@ejemplo.com', '1234', 'STUDENT', TRUE);


-- ==========================================
-- 2. CENTROS (CENTERS)
-- ==========================================
-- IDs de usuario 2 al 6
INSERT INTO centers (id_user, center_name, center_code, address, phone) VALUES
(2, 'IES Pedralbes',      '080001', 'Av. Esplugues 36, BCN', '930000001'),
(3, 'Institut Poblenou',  '080002', 'Carrer bilbao 20, BCN', '930000002'),
(4, 'Colegio Tecnológico','080003', 'Gran Via 123, BCN',     '930000003'),
(5, 'IES Gracia',         '080004', 'Carrer Verdi 50, BCN',  '930000004'),
(6, 'Escola del Treball', '080005', 'Carrer Urgell 187, BCN','930000005');


-- ==========================================
-- 3. PROFESORES (TEACHERS)
-- ==========================================
-- IDs de usuario 7 al 11. Asignados a distintos centros.
INSERT INTO teachers (id_user, first_name, last_name, id_center_assigned) VALUES
(7,  'Juan',    'Pérez',     2), -- En IES Pedralbes
(8,  'Laura',   'García',    2), -- En IES Pedralbes
(9,  'Carlos',  'Sánchez',   3), -- En Poblenou
(10, 'Ana',     'Martínez',  4), -- En Col. Tecnológico
(11, 'Roberto', 'Rodríguez', 5); -- En IES Gracia


-- ==========================================
-- 4. ALUMNOS (STUDENTS)
-- ==========================================
-- IDs de usuario 12 al 16.
-- FIXED: Added eso_grade and gender
INSERT INTO students (id_user, first_name, last_name, birth_date, phone, id_center_assigned, eso_grade, gender) VALUES
(12, 'María',  'López',  '2005-01-15', '600000001', 2, 4, 'F'), -- Pedralbes
(13, 'Pedro',  'Gómez',  '2006-03-22', '600000002', 2, 4, 'M'), -- Pedralbes
(14, 'Lucía',  'Fern.',  '2005-07-30', '600000003', 3, 4, 'F'), -- Poblenou
(15, 'Miguel', 'Torres', '2005-11-05', '600000004', 3, 4, 'M'), -- Poblenou
(16, 'Elena',  'Ruiz',   '2006-02-14', '600000005', 4, 4, 'F'); -- Tecnológico


-- ==========================================
-- 5. TALLERES (WORKSHOPS)
-- ==========================================
-- Suponemos que auto-increment empieza en 1 -> 5
-- FIXED: Added modalidad and request_deadline
INSERT INTO workshops (title, short_description, max_slots, start_date, end_date, available_slots, category, center_id, modalidad, request_deadline) VALUES
('Robótica Básica', 'Intro a Arduino',  16, '2026-05-10 09:00', '2026-05-10 13:00', 16, 'Tecnología', 2, 'C', '2026-01-10 23:59:00'),
('Diseño Web',      'HTML y CSS',       20, '2026-05-11 10:00', '2026-05-11 14:00', 20, 'Informática', 2, 'C', '2026-01-10 23:59:00'),
('Impresión 3D',    'Modelado básico',  10, '2026-05-12 16:00', '2026-05-12 19:00', 10, 'Fabricación', 3, 'C', '2026-01-10 23:59:00'),
('Ciberseguridad',  'Hacking ético',    15, '2026-06-01 09:00', '2026-06-01 13:00', 15, 'Seguridad',   3, 'C', '2026-01-10 23:59:00'),
('IA para Todos',   'Conceptos de LLM', 25, '2026-06-02 10:00', '2026-06-02 12:00', 25, 'IA',          4, 'C', '2026-01-10 23:59:00');


-- ==========================================
-- 6. TALLER_PROFESORES (WORKSHOP_TEACHERS)
-- ==========================================
-- Asignamos profesores a los talleres recién creados
-- IDs workshop 1..5 estáticos supuestos (al ser fresh insert)
-- Profesores IDs 7..11
INSERT INTO workshop_teachers (id_workshop, id_teacher) VALUES
(1, 7), -- Juan da Robótica
(1, 8), -- Laura también ayuda en Robótica
(2, 7), -- Juan da Diseño Web
(3, 9), -- Carlos da Impresión 3D
(4, 9); -- Carlos da Ciberseguridad


-- ==========================================
-- 7. SOLICITUDES (APPLICATIONS + REQUESTS)
-- ==========================================

-- 7.1 SCHOOL APPLICATIONS (Una por centro)
-- ID 1: Pedralbes (User 2)
-- ID 2: Poblenou (User 3)
-- ID 3: Tecnológico (User 4)
-- ID 4: Gracia (User 5)
-- ID 5: Treball (User 6)
INSERT INTO school_applications (id_center, year_period, status, global_comments, created_at) VALUES
(2, '2025-2026', 'SUBMITTED', 'Solicitud Global Pedralbes', '2026-01-05 10:00:00'),
(3, '2025-2026', 'SUBMITTED', 'Solicitud Global Poblenou',  '2026-01-05 11:00:00'),
(4, '2025-2026', 'SUBMITTED', 'Solicitud Global Tecnológico', '2026-01-05 12:00:00'),
(5, '2025-2026', 'DRAFT',     'Borrador Gracia',              '2026-01-05 09:00:00'),
(6, '2025-2026', 'SUBMITTED', 'Solicitud Global Treball',     '2026-01-05 13:00:00');

-- 7.2 CENTER REQUESTS (Items dentro de la Application)
-- Referencian a id_application (1..5)
-- Request ID 1: App 2 (Poblenou) -> Taller 1 (Robótica)
-- Request ID 2: App 3 (Tecnológico) -> Taller 2 (Diseño Web)
-- Request ID 3: App 4 (Gracia) -> Taller 1 (Robótica) - Rejected example
-- Request ID 4: App 1 (Pedralbes) -> Taller 3 (Impresión 3D)
-- Request ID 5: App 5 (Treball) -> Taller 5 (IA)
INSERT INTO center_requests (id_application, id_workshop, requested_slots, status, comments, created_at) VALUES
(2, 1, 4, 'PENDING',  'Interés alto - Poblenou',      '2026-01-05 11:05:00'),
(3, 2, 2, 'ACCEPTED', 'Confirmado - Tecnológico',     '2026-01-05 12:05:00'),
(4, 1, 3, 'REJECTED', 'Fuera de plazo - Gracia',      '2026-01-05 09:05:00'),
(1, 3, 4, 'PENDING',  'Alumnos motivados - Pedralbes','2026-01-05 10:05:00'),
(5, 5, 4, 'PARTIAL',  'Solo hay 2 huecos - Treball',  '2026-01-05 13:05:00');


-- ==========================================
-- 8. INTERÉS DE ALUMNOS (STUDENT_INTEREST)
-- ==========================================
-- Alumnos (12..16) interesados en talleres (1..5)
-- Linked to SPECIFIC REQUESTS (Request IDs 1..5 created above)
-- Student 12 (Maria, Pedralbes) -> Request 4 (Pedralbes -> 3D Printing)
-- Student 13 (Pedro, Pedralbes) -> Request 4 (Pedralbes -> 3D Printing)
-- Student 14 (Lucia, Poblenou)  -> Request 1 (Poblenou -> Robotica)
-- Student 15 (Miguel, Poblenou) -> Request 1 (Poblenou -> Robotica)
-- Student 16 (Elena, Tecnológico)-> Request 2 (Tecnológico -> Web)

INSERT INTO student_interest (id_student, id_workshop, id_request, status, verified_by_teacher_id, created_at, has_legal_papers) VALUES
(14, 1, 1, 'WAITING',   9, '2026-01-05 11:10:00', TRUE), -- Lucia para Robótica (Poblenou)
(15, 1, 1, 'WAITING',   9, '2026-01-05 11:10:00', TRUE), -- Miguel para Robótica (Poblenou)
(16, 2, 2, 'WAITING',   10,'2026-01-05 12:10:00', TRUE), -- Elena para Web (Tecnológico)
(12, 3, 4, 'WAITING',   7, '2026-01-05 10:10:00', TRUE), -- Maria para 3D (Pedralbes)
(13, 3, 4, 'WAITING',   7, '2026-01-05 10:10:00', TRUE); -- Pedro para 3D (Pedralbes)


-- ==========================================
-- 9. INSCRIPCIONES (WORKSHOP_ENROLLMENTS)
-- ==========================================
-- Opcional: alumnos ya confirmados.
-- En este caso dejamos vacío o ponemos alguno de ejemplo si coincide con Status='CONFIRMED'
-- (Para el ejercicio de "Matching" limpio, mejor dejarlo vacío y que el motor lo haga,
-- pero el script original tenía datos. Los comentamos para probar el motor limpio).
-- INSERT INTO workshop_enrollments ...