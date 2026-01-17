CREATE TABLE IF NOT EXISTS workshop_attendance (
    id_attendance SERIAL PRIMARY KEY,
    id_workshop INT REFERENCES workshops(id_workshop) ON DELETE CASCADE,
    id_student INT REFERENCES students(id_user) ON DELETE CASCADE,
    date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'PRESENT' CHECK (status IN ('PRESENT', 'ABSENT', 'LATE', 'EXCUSED')),
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_workshop, id_student, date)
);
