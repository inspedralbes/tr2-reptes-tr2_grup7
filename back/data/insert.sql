-- -- ==========================================
-- -- 1. CLEANUP
-- -- ==========================================
-- DROP TABLE IF EXISTS evaluations CASCADE;
-- DROP TABLE IF EXISTS workshop_enrollments CASCADE;
-- DROP TABLE IF EXISTS center_request_students CASCADE;
-- DROP TABLE IF EXISTS student_interest CASCADE;
-- DROP TABLE IF EXISTS center_requests CASCADE;
-- DROP TABLE IF EXISTS school_applications CASCADE;
-- DROP TABLE IF EXISTS application_periods CASCADE;
-- DROP TABLE IF EXISTS workshop_teachers CASCADE;
-- DROP TABLE IF EXISTS workshops CASCADE;
-- DROP TABLE IF EXISTS students CASCADE;
-- DROP TABLE IF EXISTS teachers CASCADE;
-- DROP TABLE IF EXISTS centers CASCADE;
-- DROP TABLE IF EXISTS users CASCADE;

-- ==========================================
-- 2. USERS (Identities)
-- ==========================================
INSERT INTO users (email, password_hash, role, is_active, created_at, password_last_changed_at) VALUES
-- Admin (Has changed password)
('admin@workshop.com', '123', 'ADMIN', TRUE, '2026-01-01 10:00:00', '2026-01-01 10:00:00'),

-- Centers (IDs 2-6) - NULL timestamp (Force Change)
('pedralbes@edu.com', '1234', 'CENTER', TRUE, '2026-01-01', NULL),
('a23edstorcev@inspedralbes.cat', '1234', 'CENTER', TRUE, '2026-01-01', NULL),
('tecnologic@edu.com','1234', 'CENTER', TRUE, '2026-01-01', NULL),
('gracia@edu.com',    '1234', 'CENTER', TRUE, '2026-01-01', NULL),
('treball@edu.com',   '1234', 'CENTER', TRUE, '2026-01-01', NULL),

-- Teachers (IDs 7-11)
('teacher.juan@edu.com', '1234', 'TEACHER', TRUE, '2026-01-01', NULL),
('teacher.ana@edu.com',  '1234', 'TEACHER', TRUE, '2026-01-01', NULL),
('teacher.pol@edu.com',  '1234', 'TEACHER', TRUE, '2026-01-01', NULL),
('teacher.sofia@edu.com','1234', 'TEACHER', TRUE, '2026-01-01', NULL),
('teacher.marc@gmail.com', '1234', 'TEACHER', TRUE, '2026-01-01', NULL);

-- Students (IDs 12+)
-- We will create students dynamically below via the students table but need users first.
-- Let's create users for 20 students.
INSERT INTO users (email, password_hash, role, is_active, created_at) VALUES
('student.1@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.2@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.3@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.4@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.5@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.6@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.7@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.8@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.9@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.10@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.11@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.12@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.13@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.14@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.15@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.16@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.17@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.18@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.19@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01'),
('student.20@edu.com', '1234', 'STUDENT', TRUE, '2026-01-01');

-- ==========================================
-- 3. PROFILES (Centers, Teachers, Students)
-- ==========================================

INSERT INTO centers (id_user, center_name, center_code, address, phone) VALUES
(2, 'Institut Pedralbes', '08001', 'Av. Diagonal 1', '931111111'),
(3, 'Institut Poblenou',  '08002', 'C/ Bilbao 1',    '932222222'),
(4, 'Institut Tecnologic','08003', 'C/ Valencia 1',  '933333333'),
(5, 'Institut Gracia',    '08004', 'C/ Gran de Gracia','934444444'),
(6, 'Escola del Treball', '08005', 'C/ Urgell 1',    '935555555');

INSERT INTO teachers (id_user, first_name, last_name, specialty, id_center_assigned) VALUES
(7, 'Juan', 'Perez', 'Tech', 2),
(8, 'Ana', 'Lopez', 'Tech', 3),
(9, 'Pol', 'Garcia', 'Design', 4),
(10, 'Sofia', 'Ruiz', 'General', 5),
(11, 'Marc', 'Torres', 'Tech', 6);

-- STUDENTS: Diverse Profiles for Testing Matching Logic
-- ID 12-31

-- Group 1: Ideal Candidates (Grade 4, Risk 0, Papers OK) -> Assigned Logic
INSERT INTO students (id_user, first_name, last_name, birth_date, eso_grade, gender, risk_level, id_center_assigned) VALUES
(12, 'Albert', 'Valid1', '2010-01-01', 4, 'M', 0, 2), -- Pedralbes
(13, 'Berta',  'Valid2', '2010-02-01', 4, 'F', 0, 3), -- Poblenou
(14, 'Carles', 'Valid3', '2010-03-01', 4, 'M', 0, 4); -- Tecnologic

-- Group 2: High Priority (Risk Level High) -> Should jump the queue
INSERT INTO students (id_user, first_name, last_name, birth_date, eso_grade, gender, risk_level, id_center_assigned) VALUES
(15, 'David', 'RiskHigh1', '2009-01-01', 4, 'M', 5, 2), -- Pedralbes (Risk 5!)
(16, 'Elena', 'RiskHigh2', '2009-02-01', 3, 'F', 2, 3); -- Poblenou (Risk 2)

-- Group 3: Excluded (Missing Papers or Grade 1/2) -> Should be Rejected
-- Note: 'papers' are in student_interest table, not here.
-- But Grade 1/2 might be excluded by rules.
INSERT INTO students (id_user, first_name, last_name, birth_date, eso_grade, gender, risk_level, id_center_assigned) VALUES
(17, 'Fabian', 'YoungGrade1', '2013-01-01', 1, 'M', 0, 2), -- Grade 1 (Too young?)
(18, 'Gemma',  'YoungGrade2', '2012-01-01', 2, 'F', 0, 3); -- Grade 2

-- Group 4: Filler for Quotas
INSERT INTO students (id_user, first_name, last_name, birth_date, eso_grade, gender, risk_level, id_center_assigned) VALUES
(19, 'Hugo',   'Filler1', '2010-05-01', 4, 'M', 0, 5),
(20, 'Irene',  'Filler2', '2010-05-01', 4, 'F', 0, 5),
(21, 'Jordi',  'Filler3', '2010-05-01', 4, 'M', 0, 5),
(22, 'Klara',  'Filler4', '2010-05-01', 4, 'F', 0, 5), -- 4th from Center 5
(23, 'Lluis',  'FillerOver', '2010-05-01', 4, 'M', 0, 5); -- 5th from Center 5 (Might hit max limit)

-- ==========================================
-- 4. WORKSHOPS
-- ==========================================
-- Need DEADLINE in the PAST ('2026-01-10') so matching runs NOW ('2026-01-16')
INSERT INTO workshops (title, short_description, max_slots, start_date, end_date, available_slots, category, center_id, modalidad, request_deadline, duration_hours) VALUES
('Robótica Avanzada', 'Arduino', 4, '2026-05-01 10:00', '2026-05-01 14:00', 0, 'Tech', 2, 'C', '2026-01-10 23:59:00', 30),
('Diseño UI/UX', 'Figma', 4, '2026-05-02 10:00', '2026-05-02 14:00', 4,  'Design', 3, 'C', '2026-01-10 23:59:00', 30);

-- ==========================================
-- 5. SCHOOL APPLICATIONS & REQUESTS
-- ==========================================
-- ==========================================
-- 4.5 APPLICATION PERIODS
-- ==========================================
INSERT INTO application_periods (name, start_date, end_date, status) VALUES
('Convocatoria Enero 2026', '2026-01-01 00:00:00', '2026-01-31 23:59:00', 'OPEN');

-- ==========================================
-- 5. SCHOOL APPLICATIONS & REQUESTS
-- ==========================================
-- We need Applications for the centers created in section 2
-- Linking to Period 1
INSERT INTO school_applications (id_center, id_period, status, global_comments, created_at) VALUES
-- (2, 1, 'SUBMITTED', 'App Pedralbes', '2026-01-05'), -- Commented out
(3, 1, 'SUBMITTED', 'App Poblenou',  '2026-01-05'),
(4, 1, 'SUBMITTED', 'App Tecnologic','2026-01-05'),
(5, 1, 'SUBMITTED', 'App Gracia',    '2026-01-05');

-- Create Requests linked to Apps
-- Request 1: Pedralbes wants Workshop 1 (Robotics)
INSERT INTO center_requests (id_application, id_workshop, requested_slots, status, created_at) VALUES
-- (1, 1, 4, 'PENDING', '2026-01-06'), -- App 1 (Pedralbes) -> Workshop 1 -- Commented out
(1, 1, 4, 'ACCEPTED', '2026-01-06'), -- App 2 (Poblenou) -> Workshop 1 (2/4 aceptados)
(2, 2, 3, 'PENDING', '2026-01-06'), -- App 3 (Tecnologic) -> Workshop 2 (Capacity 5) - 3 estudiantes
(3, 1, 4, 'ACCEPTED', '2026-01-06'); -- App 4 (Gracia) -> Workshop 1 (3/4 aceptados)

-- ==========================================
-- 6. STUDENT INTEREST
-- ==========================================
-- Linking students to the requests. THIS IS CRITICAL.
-- We set `has_legal_papers` to TRUE for most, FALSE for some to test rejection.

-- Workshop 1: Robótica (10 slots)
-- Candidates:
-- 1. Albert (Valid, Pedralbes) -> OK
-- 2. Berta (Valid, Poblenou) -> OK
-- 3. David (High Risk, Pedralbes) -> OK (Should be top priority)
-- 4. Fabian (Grade 1, Pedralbes) -> Might fail grade rule
-- 5. Hugo, Irene, Jordi, Klara, Lluis (Gracia) -> 5 students. Limit per center is 4. One should be excluded?

-- Request 1 (Pedralbes)
-- INSERT INTO student_interest (id_student, id_workshop, id_request, status, has_legal_papers, created_at) VALUES
-- (12, 1, 1, 'WAITING', TRUE, '2026-01-07'), -- Albert -- Commented out
-- (15, 1, 1, 'WAITING', TRUE, '2026-01-07'), -- David -- Commented out
-- (17, 1, 1, 'WAITING', TRUE, '2026-01-07'); -- Fabian (Grade 1) -- Commented out

-- Request 2 (Poblenou)
INSERT INTO student_interest (id_student, id_request, status, has_legal_papers, created_at) VALUES
(13, 1, 'WAITING', TRUE, '2026-01-07'), -- Berta
(16, 1, 'WAITING', TRUE, '2026-01-07'); -- Elena

-- Request 4 (Gracia) -> 5 students (Test Limit)
INSERT INTO student_interest (id_student, id_request, status, has_legal_papers, created_at) VALUES
(19, 3, 'WAITING', TRUE, '2026-01-07'), -- Hugo
(20, 3, 'WAITING', TRUE, '2026-01-07'), -- Irene
(21, 3, 'WAITING', TRUE, '2026-01-07'), -- Jordi
(22, 3, 'WAITING', TRUE, '2026-01-07'), -- Klara
(23, 3, 'WAITING', TRUE, '2026-01-07'); -- Lluis

-- Workshop 2: Design (5 slots)
-- Request 3 (Tecnologic)
-- Test Paper Rejection
INSERT INTO student_interest (id_student, id_request, status, has_legal_papers, created_at) VALUES
(14, 2, 'WAITING', FALSE, '2026-01-07'); -- Carles (Valid profile but NO PAPERS) -> Should Reject



-- ==========================================
-- 8. WORKSHOP ENROLLMENTS (Estudiantes Aceptados)
-- ==========================================
-- Simular que algunas peticiones ya tienen estudiantes aceptados
-- Request 1: 2 de 4 estudiantes aceptados
-- INSERT INTO workshop_enrollments (id_workshop, id_student, enrolled_at) VALUES
-- (1, 13, '2026-01-08 10:00:00'), -- Berta aceptada
-- (1, 16, '2026-01-08 10:00:00'); -- Elena aceptada
-- -- Albert y David NO están aceptados aún

-- -- Request 3: 3 de 4 estudiantes aceptados
-- INSERT INTO workshop_enrollments (id_workshop, id_student, enrolled_at) VALUES
-- (1, 19, '2026-01-08 11:00:00'), -- Hugo aceptado
-- (1, 20, '2026-01-08 11:00:00'); -- Irene aceptada
-- Jordi (21) removido para respetar limite de 4 (Berta, Elena, Hugo, Irene)
-- Klara NO está aceptada aún

-- ==========================================
-- 9. WORKSHOP TEACHERS
-- ==========================================
-- Asignar profesores a los talleres
-- INSERT INTO workshop_teachers (id_workshop, id_teacher) VALUES
-- (1, 7), -- Juan enseña Robótica
-- (1, 8), -- Ana también enseña Robótica
-- (2, 9); -- Pol enseña Diseño

-- ==========================================
-- 10. GENERATE SESSIONS (Test Data)
-- ==========================================
-- Workshop 1 (Robótica) - 10 Sessions (Weekly)
INSERT INTO workshop_sessions (id_workshop, session_number, date) VALUES
(1, 1, '2026-05-01'),
(1, 2, '2026-05-08'),
(1, 3, '2026-05-15'),
(1, 4, '2026-05-22'),
(1, 5, '2026-05-29'),
(1, 6, '2026-06-05'),
(1, 7, '2026-06-12'),
(1, 8, '2026-06-19'),
(1, 9, '2026-06-26'),
(1, 10, '2026-07-03');
