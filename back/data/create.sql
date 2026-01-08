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
    center_id INT REFERENCES centers(id_user), -- Solo centros, EL PROFESOR NO VA AQUÍ
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Coma añadida
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
INSERT INTO users (email, password_hash, role, is_active)
VALUES ('admin@workshop.com', '123', 'ADMIN', TRUE);