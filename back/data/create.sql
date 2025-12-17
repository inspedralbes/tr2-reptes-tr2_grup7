-- 1. Cleanup
DROP TABLE IF EXISTS workshops;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS centers;

-- 2. Table: Centers
CREATE TABLE centers (
    id_center SERIAL PRIMARY KEY,
    center_name VARCHAR(255) NOT NULL,
    center_code VARCHAR(50) UNIQUE NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Table: Users
CREATE TABLE users (
    id_user SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('ADMIN', 'TEACHER', 'CENTER')),
    phone VARCHAR(20),
    id_center INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_users_center FOREIGN KEY (id_center) REFERENCES centers(id_center)
);

-- 4. Table: Workshops
CREATE TABLE workshops (
    id_workshop SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    short_description TEXT,
    max_slots INT NOT NULL,
    available_slots INT,
    category VARCHAR(100),
    schedule VARCHAR(255),
    status VARCHAR(20) NOT NULL DEFAULT 'OFFERED' CHECK (status IN ('PENDING', 'FULL', 'OFFERED', 'ARCHIVED')),
    duration_hours DECIMAL(4, 2),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    teacher_id INT, 
    CONSTRAINT fk_workshop_teacher FOREIGN KEY (teacher_id) REFERENCES users(id_user)
);

-- 5. Create Super Admin
INSERT INTO users (first_name, last_name, email, password_hash, role, is_active)
VALUES (
    'Admin', 
    'System', 
    'admin@workshop.com', 
    '123', 
    'ADMIN', 
    TRUE
);