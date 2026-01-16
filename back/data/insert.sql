-- ==========================================
-- 1. USUARIOS (USERS) - CREACIÓN MASIVA
-- ==========================================
-- ID 1 es Admin (ya creado en schema).
-- IDs 2-6: Centros (5 Centros)
-- IDs 7-16: Profesores (10 Profesores)
-- IDs 17-46: Alumnos (30 Alumnos)

-- 1.1 Centros
INSERT INTO users (email, password_hash, role, is_active) VALUES
('centro.pedralbes@edu.com', '1234', 'CENTER', TRUE), -- ID 2
('centro.poblenou@edu.com', '1234', 'CENTER', TRUE),  -- ID 3
('centro.tecnologico@edu.com', '1234', 'CENTER', TRUE),-- ID 4
('centro.gracia@edu.com', '1234', 'CENTER', TRUE),    -- ID 5
('centro.treball@edu.com', '1234', 'CENTER', TRUE);    -- ID 6

-- 1.2 Profesores (2 por centro aprox)
INSERT INTO users (email, password_hash, role, is_active) VALUES
('profe.juan@edu.com', '1234', 'TEACHER', TRUE),    -- ID 7
('profe.laura@edu.com', '1234', 'TEACHER', TRUE),   -- ID 8
('profe.carlos@edu.com', '1234', 'TEACHER', TRUE),  -- ID 9
('profe.ana@edu.com', '1234', 'TEACHER', TRUE),     -- ID 10
('profe.roberto@edu.com', '1234', 'TEACHER', TRUE), -- ID 11
('profe.elena@edu.com', '1234', 'TEACHER', TRUE),   -- ID 12
('profe.marcos@edu.com', '1234', 'TEACHER', TRUE),  -- ID 13
('profe.sofia@edu.com', '1234', 'TEACHER', TRUE),   -- ID 14
('profe.david@edu.com', '1234', 'TEACHER', TRUE),   -- ID 15
('profe.julia@edu.com', '1234', 'TEACHER', TRUE);   -- ID 16

-- 1.3 Alumnos (30 alumnos variados)
INSERT INTO users (email, password_hash, role, is_active) VALUES
-- Alumnos del Centro 2
('alum2.1@edu.com', '1234', 'STUDENT', TRUE), ('alum2.2@edu.com', '1234', 'STUDENT', TRUE), 
('alum2.3@edu.com', '1234', 'STUDENT', TRUE), ('alum2.4@edu.com', '1234', 'STUDENT', TRUE), 
('alum2.5@edu.com', '1234', 'STUDENT', TRUE), ('alum2.6@edu.com', '1234', 'STUDENT', TRUE),
-- Alumnos del Centro 3
('alum3.1@edu.com', '1234', 'STUDENT', TRUE), ('alum3.2@edu.com', '1234', 'STUDENT', TRUE), 
('alum3.3@edu.com', '1234', 'STUDENT', TRUE), ('alum3.4@edu.com', '1234', 'STUDENT', TRUE), 
('alum3.5@edu.com', '1234', 'STUDENT', TRUE), ('alum3.6@edu.com', '1234', 'STUDENT', TRUE),
-- Alumnos del Centro 4
('alum4.1@edu.com', '1234', 'STUDENT', TRUE), ('alum4.2@edu.com', '1234', 'STUDENT', TRUE), 
('alum4.3@edu.com', '1234', 'STUDENT', TRUE), ('alum4.4@edu.com', '1234', 'STUDENT', TRUE), 
('alum4.5@edu.com', '1234', 'STUDENT', TRUE), ('alum4.6@edu.com', '1234', 'STUDENT', TRUE),
-- Alumnos del Centro 5
('alum5.1@edu.com', '1234', 'STUDENT', TRUE), ('alum5.2@edu.com', '1234', 'STUDENT', TRUE), 
('alum5.3@edu.com', '1234', 'STUDENT', TRUE), ('alum5.4@edu.com', '1234', 'STUDENT', TRUE), 
('alum5.5@edu.com', '1234', 'STUDENT', TRUE), ('alum5.6@edu.com', '1234', 'STUDENT', TRUE),
-- Alumnos del Centro 6
('alum6.1@edu.com', '1234', 'STUDENT', TRUE), ('alum6.2@edu.com', '1234', 'STUDENT', TRUE), 
('alum6.3@edu.com', '1234', 'STUDENT', TRUE), ('alum6.4@edu.com', '1234', 'STUDENT', TRUE), 
('alum6.5@edu.com', '1234', 'STUDENT', TRUE), ('alum6.6@edu.com', '1234', 'STUDENT', TRUE);
-- IDs de alumnos van del 17 al 46.

-- ==========================================
-- 2. DETALLES DE CENTROS
-- ==========================================
INSERT INTO centers (id_user, center_name, center_code, address, phone) VALUES
(2, 'IES Pedralbes',      '080001', 'Av. Esplugues 36, BCN', '930111111'),
(3, 'Institut Poblenou',  '080002', 'Carrer Bilbao 20, BCN', '930222222'),
(4, 'Colegio Tecnológico','080003', 'Gran Via 123, BCN',     '930333333'),
(5, 'IES Gracia',         '080004', 'Carrer Verdi 50, BCN',  '930444444'),
(6, 'Escola del Treball', '080005', 'Carrer Urgell 187, BCN','930555555');

-- ==========================================
-- 3. DETALLES DE PROFESORES
-- ==========================================
INSERT INTO teachers (id_user, first_name, last_name, id_center_assigned) VALUES
(7, 'Juan', 'Pérez', 2),    (8, 'Laura', 'García', 2),   -- Pedralbes
(9, 'Carlos', 'Sánchez', 3), (10, 'Ana', 'Martínez', 3),  -- Poblenou
(11, 'Roberto', 'Ruiz', 4),  (12, 'Elena', 'Gómez', 4),   -- Tecnológico
(13, 'Marcos', 'Díaz', 5),   (14, 'Sofía', 'López', 5),   -- Gracia
(15, 'David', 'Fernández', 6),(16, 'Julia', 'Torres', 6); -- Treball

-- ==========================================
-- 4. DETALLES DE ALUMNOS (Asignación masiva)
-- ==========================================
-- IDs 17-22 -> Centro 2
INSERT INTO students (id_user, first_name, last_name, birth_date, id_center_assigned) VALUES
(17, 'Alumno', 'DosUno', '2006-01-01', 2), (18, 'Alumno', 'DosDos', '2006-02-01', 2),
(19, 'Alumno', 'DosTres', '2006-03-01', 2), (20, 'Alumno', 'DosCuatro', '2006-04-01', 2),
(21, 'Alumno', 'DosCinco', '2006-05-01', 2), (22, 'Alumno', 'DosSeis', '2006-06-01', 2);
-- IDs 23-28 -> Centro 3
INSERT INTO students (id_user, first_name, last_name, birth_date, id_center_assigned) VALUES
(23, 'Alumno', 'TresUno', '2005-01-01', 3), (24, 'Alumno', 'TresDos', '2005-02-01', 3),
(25, 'Alumno', 'TresTres', '2005-03-01', 3), (26, 'Alumno', 'TresCuatro', '2005-04-01', 3),
(27, 'Alumno', 'TresCinco', '2005-05-01', 3), (28, 'Alumno', 'TresSeis', '2005-06-01', 3);
-- IDs 29-34 -> Centro 4
INSERT INTO students (id_user, first_name, last_name, birth_date, id_center_assigned) VALUES
(29, 'Alumno', 'CuatroUno', '2007-01-01', 4), (30, 'Alumno', 'CuatroDos', '2007-02-01', 4),
(31, 'Alumno', 'CuatroTres', '2007-03-01', 4), (32, 'Alumno', 'CuatroCuatro', '2007-04-01', 4),
(33, 'Alumno', 'CuatroCinco', '2007-05-01', 4), (34, 'Alumno', 'CuatroSeis', '2007-06-01', 4);
-- IDs 35-40 -> Centro 5
INSERT INTO students (id_user, first_name, last_name, birth_date, id_center_assigned) VALUES
(35, 'Alumno', 'CincoUno', '2006-01-01', 5), (36, 'Alumno', 'CincoDos', '2006-02-01', 5),
(37, 'Alumno', 'CincoTres', '2006-03-01', 5), (38, 'Alumno', 'CincoCuatro', '2006-04-01', 5),
(39, 'Alumno', 'CincoCinco', '2006-05-01', 5), (40, 'Alumno', 'CincoSeis', '2006-06-01', 5);
-- IDs 41-46 -> Centro 6
INSERT INTO students (id_user, first_name, last_name, birth_date, id_center_assigned) VALUES
(41, 'Alumno', 'SeisUno', '2005-01-01', 6), (42, 'Alumno', 'SeisDos', '2005-02-01', 6),
(43, 'Alumno', 'SeisTres', '2005-03-01', 6), (44, 'Alumno', 'SeisCuatro', '2005-04-01', 6),
(45, 'Alumno', 'SeisCinco', '2005-05-01', 6), (46, 'Alumno', 'SeisSeis', '2005-06-01', 6);

-- ==========================================
-- 5. TALLERES (WORKSHOPS)
-- ==========================================
-- Creamos 8 Talleres variados (Pasados, Futuros, Llenos)

INSERT INTO workshops (title, short_description, max_slots, start_date, end_date, available_slots, category, center_id, status) VALUES
-- Taller 1: Futuro, Robótica (Centro 2)
('Robótica Avanzada', 'Arduino y Raspberry Pi', 16, '2026-05-10 09:00', '2026-05-10 13:00', 16, 'Tecnología', 2, 'OFFERED'),
-- Taller 2: Futuro, Web (Centro 2)
('Full Stack Web', 'React y Node.js', 20, '2026-05-11 10:00', '2026-05-11 14:00', 20, 'Informática', 2, 'OFFERED'),
-- Taller 3: Futuro, Impresión 3D (Centro 3)
('Modelado 3D Blender', 'Creación de personajes', 12, '2026-06-01 16:00', '2026-06-01 19:00', 12, 'Arte Digital', 3, 'OFFERED'),
-- Taller 4: Pasado (Para evaluaciones) (Centro 4)
('Intro a Python', 'Fundamentos de programación', 15, '2024-01-10 09:00', '2024-01-10 13:00', 0, 'Programación', 4, 'ARCHIVED'),
-- Taller 5: Lleno (Centro 5)
('Ciberseguridad Básica', 'Protección de redes', 4, '2026-07-20 09:00', '2026-07-20 13:00', 0, 'Seguridad', 5, 'FULL'),
-- Taller 6: Cancelado (Centro 6)
('Energías Renovables', 'Paneles solares', 20, '2026-08-01 10:00', '2026-08-01 14:00', 20, 'Sostenibilidad', 6, 'CANCELLED'),
-- Taller 7: Futuro Inminente (Centro 3)
('Videojuegos con Unity', 'Crear tu primer juego', 10, '2026-03-15 15:00', '2026-03-15 19:00', 10, 'Gaming', 3, 'OFFERED'),
-- Taller 8: Futuro Lejano (Centro 4)
('Inteligencia Artificial', 'Uso de APIs de IA', 25, '2026-11-05 10:00', '2026-11-05 12:00', 25, 'IA', 4, 'OFFERED');

-- ==========================================
-- 6. ASIGNACIÓN PROFESORES A TALLERES
-- ==========================================
INSERT INTO workshop_teachers (id_workshop, id_teacher) VALUES
(1, 7), (1, 8),  -- Robótica: Juan y Laura
(2, 7),          -- Web: Juan
(3, 9),          -- 3D: Carlos
(4, 11),         -- Python (Pasado): Roberto
(5, 13),         -- Ciber (Lleno): Marcos
(6, 15),         -- Energías (Cancelado): David
(7, 10),         -- Unity: Ana
(8, 12);         -- IA: Elena

-- ==========================================
-- 7. SOLICITUDES DE CENTROS (CENTER_REQUESTS)
-- ==========================================
-- Centro 3 pide plazas en Taller 1 (Robótica del Centro 2)
INSERT INTO center_requests (id_center, id_workshop, requested_slots, id_teacher, status, comments) VALUES
(3, 1, 4, 9, 'ACCEPTED', 'Alumnos de grado superior'),
-- Centro 4 pide plazas en Taller 1 (Robótica del Centro 2) - Parcialmente aceptado
(4, 1, 4, 11, 'PARTIAL', 'Solo quedan 2 plazas disponibles'),
-- Centro 5 pide plazas en Taller 2 (Web del Centro 2) - Pendiente
(5, 2, 3, 13, 'PENDING', 'Interés en React'),
-- Centro 2 pide plazas en Taller 3 (3D del Centro 3) - Rechazado
(2, 3, 4, 7, 'REJECTED', 'No cumple requisitos de edad');

-- ==========================================
-- 8. VINCULAR ALUMNOS A SOLICITUDES (center_request_students)
-- ==========================================
-- Solicitud 1 (Centro 3 va al Taller 1): 4 alumnos del centro 3 (IDs 23-26)
INSERT INTO center_request_students (id_request, id_student) VALUES
(1, 23), (1, 24), (1, 25), (1, 26);

-- Solicitud 2 (Centro 4 va al Taller 1): 2 alumnos (parcial) del centro 4 (IDs 29, 30)
INSERT INTO center_request_students (id_request, id_student) VALUES
(2, 29), (2, 30);

-- ==========================================
-- 9. INTERÉS DE ALUMNOS (STUDENT_INTEREST)
-- ==========================================
-- Alumnos mostrando interés individual (fuera de las solicitudes de su centro)
INSERT INTO student_interest (id_student, id_workshop, status, verified_by_teacher_id) VALUES
(17, 2, 'CONFIRMED', 7), -- Alumno Centro 2 interesado en taller de su propio centro
(18, 2, 'WAITING', 7),
(35, 7, 'WAITING', 10),  -- Alumno Centro 5 interesado en Unity del Centro 3
(41, 8, 'CONFIRMED', 12); -- Alumno Centro 6 interesado en IA del Centro 4

-- ==========================================
-- 10. INSCRIPCIONES REALES (WORKSHOP_ENROLLMENTS)
-- ==========================================
-- Importante: Actualizar available_slots (esto normalmente lo hace el backend, aquí manual)

-- Inscribimos a los de la Solicitud 1 (Taller 1)
INSERT INTO workshop_enrollments (id_workshop, id_student) VALUES
(1, 23), (1, 24), (1, 25), (1, 26); 
-- Update slots Taller 1 (16 - 4 = 12)
UPDATE workshops SET available_slots = 12 WHERE id_workshop = 1;

-- Inscribimos a los de la Solicitud 2 (Taller 1)
INSERT INTO workshop_enrollments (id_workshop, id_student) VALUES
(1, 29), (1, 30);
-- Update slots Taller 1 (12 - 2 = 10)
UPDATE workshops SET available_slots = 10 WHERE id_workshop = 1;

-- Inscribimos alumnos del Taller Pasado (ID 4) para poder poner notas
INSERT INTO workshop_enrollments (id_workshop, id_student) VALUES
(4, 35), (4, 36), (4, 37);

-- Inscribimos alumnos en el Taller Lleno (ID 5) - Capacidad 4
INSERT INTO workshop_enrollments (id_workshop, id_student) VALUES
(5, 41), (5, 42), (5, 43), (5, 44);
-- Update slots a 0
UPDATE workshops SET available_slots = 0 WHERE id_workshop = 5;

-- ==========================================
-- 11. EVALUACIONES (EVALUATIONS)
-- ==========================================
-- Evaluaciones del taller pasado (ID 4)
INSERT INTO evaluations (id_workshop, id_student, grade, comments) VALUES
(4, 35, 5, 'Me encantó el curso de Python, el profe Roberto es crack.'),
(4, 36, 4, 'Muy bien, pero faltó tiempo para práctica.'),
(4, 37, 3, 'El aula estaba muy caliente, pero el contenido bien.');