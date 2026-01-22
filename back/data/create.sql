-- ==========================================
-- LIMPIEZA INICIAL (Opcional, para reiniciar)
-- ==========================================
DROP TABLE IF EXISTS evaluations CASCADE;
DROP TABLE IF EXISTS workshop_enrollments CASCADE;

DROP TABLE IF EXISTS student_interest CASCADE;
DROP TABLE IF EXISTS center_requests CASCADE;
DROP TABLE IF EXISTS workshop_teachers CASCADE;
DROP TABLE IF EXISTS workshops CASCADE;
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS teachers CASCADE;
DROP TABLE IF EXISTS centers CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- ==========================================
-- 1. LA TABLA DE IDENTIDAD (Login)
-- ==========================================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('ADMIN', 'TEACHER', 'CENTER', 'STUDENT')),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==========================================
-- 2. CENTROS
-- ==========================================
CREATE TABLE centers (
    id_user INT PRIMARY KEY, 
    center_name VARCHAR(255) NOT NULL,
    center_code VARCHAR(50) UNIQUE NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    CONSTRAINT fk_user_center FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE
);

-- ==========================================
-- 3. PROFESORES
-- ==========================================
CREATE TABLE teachers (
    id_user INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(100) DEFAULT 'General',
    id_center_assigned INT,
    CONSTRAINT fk_user_teacher FOREIGN KEY (id_user) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_teacher_center FOREIGN KEY (id_center_assigned) REFERENCES centers(id_user) ON DELETE SET NULL
);

-- ==========================================
-- 4. ALUMNOS
-- ==========================================
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

-- ==========================================
-- 5. TALLERES
-- ==========================================
CREATE TABLE workshops (
    id_workshop SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    short_description TEXT,
    max_slots INT NOT NULL CHECK (max_slots <= 4),
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    available_slots INT,
    category VARCHAR(100),
    schedule VARCHAR(255),
    duration_hours INT DEFAULT 30 CHECK (duration_hours = 30),
    total_capacity INT DEFAULT 16,
    max_students_per_center INT DEFAULT 4,
    request_deadline TIMESTAMP,
    status VARCHAR(20) NOT NULL DEFAULT 'OFFERED' CHECK (status IN ('PENDING', 'FULL', 'OFFERED', 'ARCHIVED', 'CANCELLED')),
    modalidad CHAR(1) DEFAULT 'C' CHECK (modalidad IN ('A', 'B', 'C')),
    gender_audience CHAR(1) DEFAULT 'A' CHECK (gender_audience IN ('A', 'M', 'F')), -- A=Todos, M=Solo Chicos, F=Solo Chicas
    center_id INT REFERENCES centers(id_user), 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT check_dates CHECK (end_date > start_date)
);

-- RELACION DE TALLERES Y PROFESORES 
CREATE TABLE workshop_teachers (
    id_workshop INT REFERENCES workshops(id_workshop) ON DELETE CASCADE,
    id_teacher INT REFERENCES teachers(id_user) ON DELETE CASCADE,
    PRIMARY KEY (id_workshop, id_teacher)
);

-- PERIODOS DE CONVOCATORIA (Ventanas de tiempo para enviar solicitudes)
CREATE TABLE application_periods (
    id_period SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL, -- e.g. "Convocatoria Mayo 2026"
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP NOT NULL,
    status VARCHAR(20) DEFAULT 'OPEN' CHECK (status IN ('OPEN', 'CLOSED')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE school_applications (
    id_application SERIAL PRIMARY KEY,
    id_center INT REFERENCES centers(id_user) ON DELETE CASCADE,
    id_period INT REFERENCES application_periods(id_period), -- Link to specific period
    status VARCHAR(20) DEFAULT 'DRAFT' CHECK (status IN ('DRAFT', 'SUBMITTED', 'ARCHIVED')),
    global_comments TEXT,
    id_teacher_1 INT REFERENCES teachers(id_user),
    id_teacher_2 INT REFERENCES teachers(id_user),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_center, id_period) -- Only one application per period per center
);

-- SOLICITUDES DE CENTROS (Para pedir plazas en bloque)
CREATE TABLE center_requests (
    id_request SERIAL PRIMARY KEY,
    id_application INT REFERENCES school_applications(id_application) ON DELETE CASCADE,
    id_workshop INT REFERENCES workshops(id_workshop),
    requested_slots INT CHECK (requested_slots <= 4),
    student_count INT,
    course_level VARCHAR(50),
    status VARCHAR(20) DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'ACCEPTED', 'REJECTED', 'PARTIAL')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments TEXT
);

-- INTERÉS INDIVIDUAL DE ALUMNOS (Pre-inscripción / Validación legal)
CREATE TABLE student_interest (
    id_interest SERIAL PRIMARY KEY,
    id_student INT REFERENCES students(id_user) ON DELETE CASCADE,
    id_request INT REFERENCES center_requests(id_request) ON DELETE CASCADE,
    has_legal_papers BOOLEAN DEFAULT FALSE,
    verified_by_teacher_id INT REFERENCES teachers(id_user),
    status VARCHAR(20) DEFAULT 'WAITING' CHECK (status IN ('WAITING', 'CONFIRMED', 'CANCELLED')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_student, id_request)
);

-- RELACIÓN SOLICITUD - ALUMNOS (Qué alumnos van en esa solicitud del centro)


-- ==========================================
-- 6. INSCRIPCIONES (Matrícula final firme)
-- ==========================================
CREATE TABLE workshop_enrollments (
    id_enrollment SERIAL PRIMARY KEY,
    id_workshop INT REFERENCES workshops(id_workshop) ON DELETE CASCADE,
    id_student INT REFERENCES students(id_user) ON DELETE CASCADE,
    enrolled_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_workshop, id_student)
);

-- ==========================================
-- 6.5 EVALUACIONES (Feedback post-taller)
-- ==========================================
CREATE TABLE evaluations (
    id_evaluation SERIAL PRIMARY KEY,
    id_workshop INT REFERENCES workshops(id_workshop) ON DELETE CASCADE,
    id_student INT REFERENCES students(id_user) ON DELETE CASCADE,
    grade INT CHECK (grade BETWEEN 1 AND 5),
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_workshop, id_student)
);

-- ==========================================
-- 7. PROPUESTAS DE ASIGNACIÓN (Manual Confirmation)
-- ==========================================
CREATE TABLE assignment_proposals (
    id SERIAL PRIMARY KEY,
    data JSONB NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'APPLIED', 'DISCARDED')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- -- INSERT ADMIN INICIAL
-- INSERT INTO users (email, password_hash, role, is_active)
-- VALUES ('admin@workshop.com', '123', 'ADMIN', TRUE);