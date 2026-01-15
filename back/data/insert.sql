-- Netejar i reiniciar seqüències
TRUNCATE users, centers, teachers, students, workshops, workshop_teachers, center_requests, student_interest, workshop_enrollments RESTART IDENTITY CASCADE;

-- ==========================================
-- 1. USUARIS (USERS)
-- ==========================================
-- Admin (ID 1)
INSERT INTO users (email, password_hash, role, is_active)
VALUES ('admin@workshop.com', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'ADMIN', TRUE);

-- IDs 2-6: Centres
INSERT INTO users (email, password_hash, role, is_active) VALUES
('iespedralbes@educacio.cat', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'CENTER', TRUE),
('instpoblenou@educacio.cat', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'CENTER', TRUE),
('coltecnologic@educacio.cat', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'CENTER', TRUE),
('iesgracia@educacio.cat', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'CENTER', TRUE),
('escolatreball@educacio.cat', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'CENTER', TRUE);

-- IDs 7-11: Professors (Docents Referents)
INSERT INTO users (email, password_hash, role, is_active) VALUES
('profe1@ejemplo.com', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'TEACHER', TRUE),
('profe2@ejemplo.com', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'TEACHER', TRUE),
('profe3@ejemplo.com', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'TEACHER', TRUE),
('profe4@ejemplo.com', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'TEACHER', TRUE),
('profe5@ejemplo.com', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'TEACHER', TRUE);

-- IDs 12-16: Alumnes
INSERT INTO users (email, password_hash, role, is_active) VALUES
('alumne1@ejemplo.com', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'STUDENT', TRUE),
('alumne2@ejemplo.com', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'STUDENT', TRUE),
('alumne3@ejemplo.com', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'STUDENT', TRUE),
('alumne4@ejemplo.com', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'STUDENT', TRUE),
('alumne5@ejemplo.com', '$2b$10$Ni4bF4TGBudgsxtSUHKw/eRsDKYa1Hsmp/lxZzbi9M/H3oK4Xk4Pm', 'STUDENT', TRUE);


-- ==========================================
-- 2. CENTRES (CENTERS)
-- ==========================================
INSERT INTO centers (id_user, center_name, center_code, address, phone) VALUES
(2, 'IES Pedralbes',      '080001', 'Av. Esplugues 36, BCN', '930000001'),
(3, 'Institut Poblenou',  '080002', 'Carrer Bilbao 20, BCN', '930000002'),
(4, 'Col·legi Tecnològic','080003', 'Gran Via 123, BCN',     '930000003'),
(5, 'IES Gràcia',         '080004', 'Carrer Verdi 50, BCN',  '930000004'),
(6, 'Escola del Treball', '080005', 'Carrer Urgell 187, BCN','930000005');


-- ==========================================
-- 3. PROFESORS (TEACHERS)
-- ==========================================
INSERT INTO teachers (id_user, first_name, last_name, id_center_assigned) VALUES
(7,  'Joan',    'Pérez',     2), -- En IES Pedralbes
(8,  'Laura',   'Gras',      2), -- En IES Pedralbes
(9,  'Carles',  'Sánchez',   3), -- En Poblenou
(10, 'Anna',     'Martínez',  4), -- En Col. Tecnològic
(11, 'Robert', 'Rodríguez', 5); -- En IES Gràcia


-- ==========================================
-- 4. ALUMNES (STUDENTS)
-- ==========================================
INSERT INTO students (id_user, first_name, last_name, birth_date, phone, id_center_assigned) VALUES
(12, 'Marc',    'López',  '2005-01-15', '600000001', 2),
(13, 'Pol',     'Gómez',  '2006-03-22', '600000002', 2),
(14, 'Lucia',   'Fern.',  '2005-07-30', '600000003', 3),
(15, 'Miquel',  'Torres', '2005-11-05', '600000004', 3),
(16, 'Elena',   'Ruiz',   '2006-02-14', '600000005', 4);


-- ==========================================
-- 5. TALLERS ENGINY (WORKSHOPS)
-- ==========================================
INSERT INTO workshops (title, short_description, max_slots, start_date, end_date, available_slots, category, schedule, duration_hours, center_id) VALUES
('CIRC i oficis de les arts escèniques', 'Descobrim el món del circ i les arts escèniques.', 16, '2025-10-10 09:00', '2025-12-10 13:00', 16, 'Arts escèniques', 'Dimarts i dijous 9:00-13:00', 40, 2),
('Fusta', 'Taller de fusteria i fabricació sostenible.', 16, '2025-10-11 10:00', '2025-12-11 14:00', 16, 'Indústria-manufactura', 'Dimecres 10:00-14:00', 32, 2),
('Cuina comunitària', 'Aprenem cuina i indústries alimentàries.', 16, '2025-10-12 16:00', '2025-12-12 19:00', 16, 'Hostaleria', 'Dijous 16:00-19:00', 24, 3),
('Metall i artesania', 'Introducció a la metal·lúrgia i artesania.', 16, '2026-01-10 09:00', '2026-03-10 13:00', 16, 'Indústria 4.0', 'Divendres 9:00-13:00', 48, 3),
('Serigrafia', 'Tècniques de serigrafia i disseny gràfic.', 16, '2025-11-02 10:00', '2025-12-02 12:00', 16, 'Indústria-manufactura', 'Dilluns 10:00-12:00', 16, 4),
('Vela', 'Aprenem a navegar en vela lleugera.', 16, '2025-04-15 09:00', '2025-06-15 13:00', 16, 'Esportiu', 'Dissabtes 9:00-13:00', 36, 5);


-- ==========================================
-- 6. TALLER_PROFESORS (WORKSHOP_TEACHERS)
-- ==========================================
INSERT INTO workshop_teachers (id_workshop, id_teacher) VALUES
(1, 7),
(2, 8),
(3, 9),
(4, 9),
(5, 10),
(6, 11);


-- ==========================================
-- 7. SOL·LICITUDS (CENTER_REQUESTS)
-- ==========================================
INSERT INTO center_requests (id_center, id_workshop, requested_slots, status, comments) VALUES
(3, 1, 4, 'PENDING',  'Interès alt'),
(4, 2, 2, 'ACCEPTED', 'Confirmat'),
(5, 1, 3, 'REJECTED', 'Fora de termini');


-- ==========================================
-- 8. INTERÈS ALUMNES (STUDENT_INTEREST)
-- ==========================================
INSERT INTO student_interest (id_student, id_workshop, status, verified_by_teacher_id) VALUES
(12, 1, 'WAITING',   7),
(13, 1, 'CONFIRMED', 7),
(14, 3, 'WAITING',   9);


-- ==========================================
-- 9. INSCRIPCIONS (WORKSHOP_ENROLLMENTS)
-- ==========================================
INSERT INTO workshop_enrollments (id_workshop, id_student) VALUES
(1, 13),
(2, 16),
(3, 14);
