-- 1. La tabla de IDENTIDAD (Login)
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('ADMIN', 'TEACHER', 'CENTER', 'STUDENT')),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. CENTROS
CREATE TABLE centers (
    id_user INT PRIMARY KEY, 
    center_name VARCHAR(255) NOT NULL,
    center_code VARCHAR(50) UNIQUE NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    CONSTRAINT fk_user_center FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE
);

-- 3. PROFESORES
CREATE TABLE teachers (
    id_user INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    id_center_assigned INT,
    CONSTRAINT fk_user_teacher FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_teacher_center FOREIGN KEY (id_center_assigned) REFERENCES centers(id_user) ON DELETE SET NULL
);

-- 4. ALUMNOS
CREATE TABLE students (
    id_user INT PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    phone VARCHAR(20),
    id_center_assigned INT,
    eso_grade INT NOT NULL CHECK (eso_grade BETWEEN 1 AND 4), -- [cite: 148, 158]
    gender CHAR(1) NOT NULL CHECK (gender IN ('M', 'F', 'O')), -- M=Masculino, F=Femenino, O=Otros 
    risk_level INT DEFAULT 0 CHECK (risk_level BETWEEN 0 AND 5), -- Nivel de riesgo (0=Nulo, 1-5=Escala)
    CONSTRAINT fk_user_student FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_student_center FOREIGN KEY (id_center_assigned) REFERENCES centers(id_user) ON DELETE SET NULL
);

-- 5. TALLERES (Relaciones blindadas)
CREATE TABLE workshops (
    id_workshop SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    short_description TEXT,
    max_slots INT NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    available_slots INT,
    category VARCHAR(100),
    total_capacity INT DEFAULT 16,
    max_students_per_center INT DEFAULT 4,
    request_deadline TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'OFFERED' CHECK (status IN ('PENDING', 'FULL', 'OFFERED', 'ARCHIVED')),
    modalidad CHAR(1) DEFAULT 'C' CHECK (modalidad IN ('A', 'B', 'C')), -- Modalidad A, B o C
    center_id INT REFERENCES centers(id_user), -- Solo centros, EL PROFESOR NO VA AQUÍ
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT check_dates CHECK (end_date > start_date)
);

-- RELACION DE TALLERES Y PROFESORES 
CREATE TABLE workshop_teachers (
    id_workshop INT REFERENCES workshops(id_workshop) ON DELETE CASCADE,
    id_teacher INT REFERENCES teachers(id_user) ON DELETE CASCADE,
    PRIMARY KEY (id_workshop, id_teacher)
);


CREATE TABLE center_requests (
    id_request SERIAL PRIMARY KEY,
    id_center INT REFERENCES centers(id_user),
    id_workshop INT REFERENCES workshops(id_workshop),
    requested_slots INT CHECK (requested_slots <= 4), -- El centro pide p.ej. 3 plazas
    status VARCHAR(20) DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'ACCEPTED', 'REJECTED', 'PARTIAL')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT
);

CREATE TABLE student_interest (
    id_interest SERIAL PRIMARY KEY,
    id_student INT REFERENCES students(id_user) ON DELETE CASCADE,
    id_workshop INT REFERENCES workshops(id_workshop) ON DELETE CASCADE,
    id_request INT REFERENCES center_requests(id_request) ON DELETE CASCADE, -- Vinculación con la solicitud del centro
    has_legal_papers BOOLEAN DEFAULT FALSE,
    verified_by_teacher_id INT REFERENCES teachers(id_user),
    status VARCHAR(20) DEFAULT 'WAITING' CHECK (status IN ('WAITING', 'CONFIRMED', 'CANCELLED')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_student, id_workshop) -- Un alumno no puede estar "interesado" dos veces en lo mismo
);

-- 6. INSCRIPCIONES
CREATE TABLE workshop_enrollments (
    id_enrollment SERIAL PRIMARY KEY,
    id_workshop INT REFERENCES workshops(id_workshop) ON DELETE CASCADE,
    id_student INT REFERENCES students(id_user) ON DELETE CASCADE,
    enrolled_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_workshop, id_student)
);

-- 7. INSERT ADMIN (CORREGIDO)
-- Password: 123 (bcrypt hash with 10 rounds)
-- Use the fix-admin-password.js script to regenerate this hash if needed
INSERT INTO users (email, password_hash, role, is_active)
VALUES ('admin@workshop.com', '123', 'ADMIN', TRUE);




-- Población de datos inicial (Ejemplos Extensos) --

-- ==========================================
-- 1. USUARIOS (USERS)
-- ==========================================
-- Admin (ID 1) se asume creado.
-- IDs 2-6: Centros
-- IDs 7-11: Profesores
-- IDs 12-16: Alumnos

-- 1.1 Centros
INSERT INTO users (email, password_hash, role, is_active) VALUES
('centro1@ejemplo.com', '1234', 'CENTER', TRUE),
('centro2@ejemplo.com', '1234', 'CENTER', TRUE),
('centro3@ejemplo.com', '1234', 'CENTER', TRUE),
('centro4@ejemplo.com', '1234', 'CENTER', TRUE),
('centro5@ejemplo.com', '1234', 'CENTER', TRUE);

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
INSERT INTO workshops (title, short_description, max_slots, start_date, end_date, available_slots, category, center_id, modalidad) VALUES
('Robótica Básica', 'Intro a Arduino',  16, '2025-05-10 09:00', '2025-05-10 13:00', 16, 'Tecnología', 2, 'C'),
('Diseño Web',      'HTML y CSS',       20, '2025-05-11 10:00', '2025-05-11 14:00', 20, 'Informática', 2, 'C'),
('Impresión 3D',    'Modelado básico',  10, '2025-05-12 16:00', '2025-05-12 19:00', 10, 'Fabricación', 3, 'C'),
('Ciberseguridad',  'Hacking ético',    15, '2025-06-01 09:00', '2025-06-01 13:00', 15, 'Seguridad',   3, 'C'),
('IA para Todos',   'Conceptos de LLM', 25, '2025-06-02 10:00', '2025-06-02 12:00', 25, 'IA',          4, 'C');


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
-- 7. SOLICITUDES DE CENTROS (CENTER_REQUESTS)
-- ==========================================
-- Centros solicitan plazas para talleres
INSERT INTO center_requests (id_center, id_workshop, requested_slots, status, comments) VALUES
(3, 1, 4, 'PENDING',  'Interés alto'),         -- Poblenou pide Robótica
(4, 2, 2, 'ACCEPTED', 'Confirmado'),           -- Tecnológico pide Diseño Web
(5, 1, 3, 'REJECTED', 'Fuera de plazo'),       -- Gracia pide Robótica
(2, 3, 4, 'PENDING',  'Alumnos motivados'),    -- Pedralbes pide Impresión 3D (aunque es "su competencia" o colaboración)
(6, 5, 4, 'PARTIAL',  'Solo hay 2 huecos');    -- Treball pide IA


-- ==========================================
-- 8. INTERÉS DE ALUMNOS (STUDENT_INTEREST)
-- ==========================================
-- Alumnos (12..16) interesados en talleres (1..5)
INSERT INTO student_interest (id_student, id_workshop, status, verified_by_teacher_id) VALUES
(12, 1, 'WAITING',   7),
(13, 1, 'CONFIRMED', 7),
(14, 3, 'WAITING',   9),
(15, 4, 'CANCELLED', 9),
(16, 5, 'WAITING',   10);


-- ==========================================
-- 9. INSCRIPCIONES (WORKSHOP_ENROLLMENTS)
-- ==========================================
-- Alumnos inscritos
INSERT INTO workshop_enrollments (id_workshop, id_student) VALUES
(1, 13), -- Pedro inscrito en Robótica
(2, 16), -- Elena inscrita en Diseño Web
(3, 14), -- Lucía inscrita en Impresión 3D
(1, 12), -- María inscrita en Robótica
(5, 15); -- Miguel inscrito en IA