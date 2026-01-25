-- ==========================================
-- 1. USERS & ROLES
-- ==========================================

-- Clean everything first (optional, but good for reset)
-- DELETE FROM users; 

-- Admin
INSERT INTO users (email, password_hash, role, is_active) 
VALUES ('admin@admin.com', '$2b$10$X7V.j/1.j/1.j/1.j/1.jO', 'ADMIN', true); -- pass: 12345678

-- Centers
INSERT INTO users (email, password_hash, role, is_active) VALUES 
('centre1@test.com', '$2b$10$X7V.j/1.j/1.j/1.j/1.jO', 'CENTER', true),
('centre2@test.com', '$2b$10$X7V.j/1.j/1.j/1.j/1.jO', 'CENTER', true);

INSERT INTO centers (id_user, center_name, center_code, address, phone) VALUES 
((SELECT id FROM users WHERE email='centre1@test.com'), 'Institut Tecnològic', 'IT001', 'Carrer Tech 1', '931112233'),
((SELECT id FROM users WHERE email='centre2@test.com'), 'Escola d''Art', 'EA002', 'Avinguda Art 2', '934445566');

-- Teachers
INSERT INTO users (email, password_hash, role, is_active) VALUES 
('profe1@test.com', '$2b$10$X7V.j/1.j/1.j/1.j/1.jO', 'TEACHER', true),
('profe2@test.com', '$2b$10$X7V.j/1.j/1.j/1.j/1.jO', 'TEACHER', true);

INSERT INTO teachers (id_user, first_name, last_name, id_center_assigned) VALUES 
((SELECT id FROM users WHERE email='profe1@test.com'), 'Joan', 'Professor', (SELECT id FROM users WHERE email='centre1@test.com')),
((SELECT id FROM users WHERE email='profe2@test.com'), 'Maria', 'Educadora', (SELECT id FROM users WHERE email='centre2@test.com'));

-- Students (Center 1)
INSERT INTO users (email, password_hash, role, is_active) VALUES 
('student1@test.com', '$2b$10$X7V.j/1.j/1.j/1.j/1.jO', 'STUDENT', true),
('student2@test.com', '$2b$10$X7V.j/1.j/1.j/1.j/1.jO', 'STUDENT', true),
('student3@test.com', '$2b$10$X7V.j/1.j/1.j/1.j/1.jO', 'STUDENT', true),
('student4@test.com', '$2b$10$X7V.j/1.j/1.j/1.j/1.jO', 'STUDENT', true);

INSERT INTO students (id_user, first_name, last_name, birth_date, phone, eso_grade, gender, risk_level, has_legal_papers, id_center_assigned) VALUES 
((SELECT id FROM users WHERE email='student1@test.com'), 'Pau', 'Garcia', '2008-05-15', '600111222', 4, 'M', 0, true, (SELECT id FROM users WHERE email='centre1@test.com')),
((SELECT id FROM users WHERE email='student2@test.com'), 'Laura', 'Martí', '2009-02-20', '600333444', 3, 'F', 2, true, (SELECT id FROM users WHERE email='centre1@test.com')),
((SELECT id FROM users WHERE email='student3@test.com'), 'Ahmed', 'Khan', '2008-11-10', '600555666', 4, 'M', 5, true, (SELECT id FROM users WHERE email='centre1@test.com')), -- High Risk check
((SELECT id FROM users WHERE email='student4@test.com'), 'Sara', 'Lopez', '2009-07-01', '600777888', 3, 'F', 0, true, (SELECT id FROM users WHERE email='centre1@test.com'));

-- Students (Center 2)
INSERT INTO users (email, password_hash, role, is_active) VALUES 
('student5@test.com', '$2b$10$X7V.j/1.j/1.j/1.j/1.jO', 'STUDENT', true),
('student6@test.com', '$2b$10$X7V.j/1.j/1.j/1.j/1.jO', 'STUDENT', true);

INSERT INTO students (id_user, first_name, last_name, birth_date, phone, eso_grade, gender, risk_level, has_legal_papers, id_center_assigned) VALUES 
((SELECT id FROM users WHERE email='student5@test.com'), 'Carla', 'Vila', '2008-01-30', '611222333', 4, 'F', 1, true, (SELECT id FROM users WHERE email='centre2@test.com')),
((SELECT id FROM users WHERE email='student6@test.com'), 'Marc', 'Soler', '2009-09-12', '611444555', 3, 'M', 3, true, (SELECT id FROM users WHERE email='centre2@test.com'));


-- ==========================================
-- 2. WORKSHOPS & PERIODS
-- ==========================================

INSERT INTO periods (name, start_date, end_date, is_active) VALUES 
('Curs 2025-2026', NOW() - INTERVAL '1 month', NOW() + INTERVAL '5 months', true);

INSERT INTO workshops (title, description, start_date, end_date, available_slots, total_capacity, status, category, modalidad, max_students_per_center, gender_audience) VALUES 
('Robòtica Avançada', 'Taller de construcció de robots', NOW() + INTERVAL '10 days', NOW() + INTERVAL '20 days', 20, 20, 'OFFERED', 'Tecnologia', 'C', 4, 'M'), -- Mixed but testing capacity
('Art Digital', 'Creació artística amb tablets', NOW() + INTERVAL '15 days', NOW() + INTERVAL '25 days', 15, 15, 'OFFERED', 'Art', 'C', 2, 'M'), -- Low Max per center
('Cuina Saludable', 'Aprendre a cuinar sà', NOW() + INTERVAL '5 days', NOW() + INTERVAL '30 days', 10, 10, 'OFFERED', 'Cuina', 'C', 4, 'M'); -- Generic


-- ==========================================
-- 3. APPLICATIONS & REQUESTS
-- ==========================================

-- Application for Center 1
INSERT INTO school_applications (id_center, id_period, status, id_teacher_1) 
VALUES (
    (SELECT id FROM users WHERE email='centre1@test.com'),
    (SELECT id_period FROM periods LIMIT 1),
    'SUBMITTED',
    (SELECT id FROM users WHERE email='profe1@test.com')
);

-- Request 1: Center 1 asks for Robotica (4 students)
INSERT INTO center_requests (id_application, id_workshop, requested_slots, student_count, status, course_level) 
VALUES (
    (SELECT id_application FROM school_applications WHERE id_center=(SELECT id FROM users WHERE email='centre1@test.com')),
    (SELECT id_workshop FROM workshops WHERE title='Robòtica Avançada'),
    1, 4, 'PENDING', '4 ESO'
);

-- Students waiting for Request 1
INSERT INTO student_interest (id_student, id_request, status) VALUES
((SELECT id FROM users WHERE email='student1@test.com'), (SELECT id_request FROM center_requests ORDER BY id_request DESC LIMIT 1), 'WAITING'),
((SELECT id FROM users WHERE email='student2@test.com'), (SELECT id_request FROM center_requests ORDER BY id_request DESC LIMIT 1), 'WAITING'),
((SELECT id FROM users WHERE email='student3@test.com'), (SELECT id_request FROM center_requests ORDER BY id_request DESC LIMIT 1), 'WAITING'),
((SELECT id FROM users WHERE email='student4@test.com'), (SELECT id_request FROM center_requests ORDER BY id_request DESC LIMIT 1), 'WAITING');


-- Application for Center 2
INSERT INTO school_applications (id_center, id_period, status, id_teacher_1) 
VALUES (
    (SELECT id FROM users WHERE email='centre2@test.com'),
    (SELECT id_period FROM periods LIMIT 1),
    'SUBMITTED',
    (SELECT id FROM users WHERE email='profe2@test.com')
);

-- Request 2: Center 2 asks for Robotica (2 students)
INSERT INTO center_requests (id_application, id_workshop, requested_slots, student_count, status, course_level) 
VALUES (
    (SELECT id_application FROM school_applications WHERE id_center=(SELECT id FROM users WHERE email='centre2@test.com')),
    (SELECT id_workshop FROM workshops WHERE title='Robòtica Avançada'),
    1, 2, 'PENDING', '3 ESO'
);

-- Students waiting for Request 2
INSERT INTO student_interest (id_student, id_request, status) VALUES
((SELECT id FROM users WHERE email='student5@test.com'), (SELECT id_request FROM center_requests ORDER BY id_request DESC LIMIT 1), 'WAITING'),
((SELECT id FROM users WHERE email='student6@test.com'), (SELECT id_request FROM center_requests ORDER BY id_request DESC LIMIT 1), 'WAITING');
