import db from './db.js';
import bcrypt from 'bcrypt';

async function seed() {
    console.log('🚀 Seeding data from insert.sql logic...');
    const client = await db.connect();
    
    try {
        await client.query('BEGIN');

        // Clear existing data (though it should be empty now)
        await client.query('TRUNCATE workshop_enrollments, student_interest, center_requests, workshop_teachers, workshops, students, teachers, centers, users RESTART IDENTITY CASCADE');

        const password = 'password123';
        const hash = await bcrypt.hash(password, 10);

        // 1. Create Admin
        await client.query(
            'INSERT INTO users (email, password_hash, role) VALUES ($1, $2, $3)',
            ['admin@workshop.com', hash, 'ADMIN']
        );

        // 2. Create Centers
        const centersData = [
            { email: 'centro1@ejemplo.com', name: 'IES Pedralbes', code: '080001', address: 'Av. Esplugues 36, BCN', phone: '930000001' },
            { email: 'centro2@ejemplo.com', name: 'Institut Poblenou', code: '080002', address: 'Carrer bilbao 20, BCN', phone: '930000002' },
            { email: 'centro3@ejemplo.com', name: 'Colegio Tecnológico', code: '080003', address: 'Gran Via 123, BCN', phone: '930000003' },
            { email: 'centro4@ejemplo.com', name: 'IES Gracia', code: '080004', address: 'Carrer Verdi 50, BCN', phone: '930000004' },
            { email: 'centro5@ejemplo.com', name: 'Escola del Treball', code: '080005', address: 'Carrer Urgell 187, BCN', phone: '930000005' }
        ];

        const centerIdMap = {};
        for (const c of centersData) {
            const userRes = await client.query(
                'INSERT INTO users (email, password_hash, role) VALUES ($1, $2, $3) RETURNING id',
                [c.email, hash, 'CENTER']
            );
            const userId = userRes.rows[0].id;
            await client.query(
                'INSERT INTO centers (id_user, center_name, center_code, address, phone) VALUES ($1, $2, $3, $4, $5)',
                [userId, c.name, c.code, c.address, c.phone]
            );
            centerIdMap[c.email] = userId;
        }

        // 3. Create Teachers
        const teachersData = [
            { email: 'profe1@ejemplo.com', first: 'Juan', last: 'Pérez', center: 'centro1@ejemplo.com' },
            { email: 'profe2@ejemplo.com', first: 'Laura', last: 'García', center: 'centro1@ejemplo.com' },
            { email: 'profe3@ejemplo.com', first: 'Carlos', last: 'Sánchez', center: 'centro2@ejemplo.com' },
            { email: 'profe4@ejemplo.com', first: 'Ana', last: 'Martínez', center: 'centro3@ejemplo.com' },
            { email: 'profe5@ejemplo.com', first: 'Roberto', last: 'Rodríguez', center: 'centro4@ejemplo.com' },
            { email: 'profesor@test.com', first: 'Joan', last: 'Professor', center: 'centro1@ejemplo.com' }
        ];

        const teacherIdMap = {};
        for (const t of teachersData) {
            const userRes = await client.query(
                'INSERT INTO users (email, password_hash, role) VALUES ($1, $2, $3) RETURNING id',
                [t.email, hash, 'TEACHER']
            );
            const userId = userRes.rows[0].id;
            await client.query(
                'INSERT INTO teachers (id_user, first_name, last_name, id_center_assigned) VALUES ($1, $2, $3, $4)',
                [userId, t.first, t.last, centerIdMap[t.center]]
            );
            teacherIdMap[t.email] = userId;
        }

        // 4. Create Students
        const studentsData = [
            { email: 'alumno1@ejemplo.com', first: 'María', last: 'López', birth: '2005-01-15', phone: '600000001', center: 'centro1@ejemplo.com' },
            { email: 'alumno2@ejemplo.com', first: 'Pedro', last: 'Gómez', birth: '2006-03-22', phone: '600000002', center: 'centro1@ejemplo.com' },
            { email: 'alumno3@ejemplo.com', first: 'Lucía', last: 'Fern.', birth: '2005-07-30', phone: '600000003', center: 'centro2@ejemplo.com' },
            { email: 'alumno4@ejemplo.com', first: 'Miguel', last: 'Torres', birth: '2005-11-05', phone: '600000004', center: 'centro2@ejemplo.com' },
            { email: 'alumno5@ejemplo.com', first: 'Elena', last: 'Ruiz', birth: '2006-02-14', phone: '600000005', center: 'centro3@ejemplo.com' }
        ];

        const studentIdMap = {};
        for (const s of studentsData) {
            const userRes = await client.query(
                'INSERT INTO users (email, password_hash, role) VALUES ($1, $2, $3) RETURNING id',
                [s.email, hash, 'STUDENT']
            );
            const userId = userRes.rows[0].id;
            await client.query(
                'INSERT INTO students (id_user, first_name, last_name, birth_date, phone, id_center_assigned) VALUES ($1, $2, $3, $4, $5, $6)',
                [userId, s.first, s.last, s.birth, s.phone, centerIdMap[s.center]]
            );
            studentIdMap[s.email] = userId;
        }

        // 5. Create Workshops
        const workshopsData = [
            { title: 'Robótica Básica', desc: 'Intro a Arduino', slots: 16, start: '2025-05-10 09:00', end: '2025-05-10 13:00', cat: 'Tecnología', center: 'centro1@ejemplo.com' },
            { title: 'Diseño Web', desc: 'HTML y CSS', slots: 20, start: '2025-05-11 10:00', end: '2025-05-11 14:00', cat: 'Informática', center: 'centro1@ejemplo.com' },
            { title: 'Impresión 3D', desc: 'Modelado básico', slots: 10, start: '2025-05-12 16:00', end: '2025-05-12 19:00', cat: 'Fabricación', center: 'centro2@ejemplo.com' },
            { title: 'Ciberseguridad', desc: 'Hacking ético', slots: 15, start: '2026-06-01 09:00', end: '2026-06-01 13:00', cat: 'Seguridad', center: 'centro2@ejemplo.com' },
            { title: 'IA para Todos', desc: 'Conceptos de LLM', slots: 25, start: '2026-06-02 10:00', end: '2026-06-02 12:00', cat: 'IA', center: 'centro3@ejemplo.com' }
        ];

        const workshopIdMap = {};
        for (const w of workshopsData) {
            const res = await client.query(
                `INSERT INTO workshops (title, short_description, max_slots, start_date, end_date, available_slots, category, center_id) 
                 VALUES ($1, $2, $3, $4, $5, $3, $6, $7) RETURNING id_workshop`,
                [w.title, w.desc, w.slots, w.start, w.end, w.cat, centerIdMap[w.center]]
            );
            workshopIdMap[w.title] = res.rows[0].id_workshop;
        }

        // 6. Assign Teachers to Workshops
        const assignments = [
            { workshop: 'Robótica Básica', teacher: 'profe1@ejemplo.com' },
            { workshop: 'Robótica Básica', teacher: 'profe2@ejemplo.com' },
            { workshop: 'Robótica Básica', teacher: 'profesor@test.com' },
            { workshop: 'Diseño Web', teacher: 'profe1@ejemplo.com' },
            { workshop: 'Impresión 3D', teacher: 'profe3@ejemplo.com' },
            { workshop: 'Ciberseguridad', teacher: 'profe3@ejemplo.com' }
        ];

        for (const a of assignments) {
            await client.query(
                'INSERT INTO workshop_teachers (id_workshop, id_teacher) VALUES ($1, $2)',
                [workshopIdMap[a.workshop], teacherIdMap[a.teacher]]
            );
        }

        await client.query('COMMIT');
        console.log('✅ Seeding completed!');
    } catch (error) {
        await client.query('ROLLBACK');
        console.error('❌ Error seeding data:', error);
    } finally {
        client.release();
        process.exit();
    }
}

seed();
