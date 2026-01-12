import db from './db.js';
import bcrypt from 'bcrypt';

async function seed() {
    console.log('Seeding dummy data...');
    const client = await db.connect();
    try {
        await client.query('BEGIN');

        // 1. Create Teacher User
        const email = 'profesor@test.com';
        const password = 'password123';
        const hash = await bcrypt.hash(password, 10);
        
        const userCheck = await client.query('SELECT id FROM users WHERE email = $1', [email]);
        let userId;
        if (userCheck.rows.length === 0) {
            const userRes = await client.query(
                'INSERT INTO users (email, password_hash, role) VALUES ($1, $2, $3) RETURNING id',
                [email, hash, 'TEACHER']
            );
            userId = userRes.rows[0].id;
            console.log(`Created user ${email} with ID ${userId}`);
        } else {
            userId = userCheck.rows[0].id;
            console.log(`User ${email} already exists with ID ${userId}`);
        }

        // 2. Create Teacher Profile
        const teacherCheck = await client.query('SELECT id_user FROM teachers WHERE id_user = $1', [userId]);
        if (teacherCheck.rows.length === 0) {
            await client.query(
                'INSERT INTO teachers (id_user, first_name, last_name) VALUES ($1, $2, $3)',
                [userId, 'Joan', 'Professor']
            );
            console.log(`Created teacher profile for user ID ${userId}`);
        } else {
            console.log(`Teacher profile already exists for user ID ${userId}`);
        }

        // 3. Create Center User
        const centerEmail = 'centro@test.com';
        const centerCheck = await client.query('SELECT id FROM users WHERE email = $1', [centerEmail]);
        let centerId;
        if (centerCheck.rows.length === 0) {
            const centerRes = await client.query(
                'INSERT INTO users (email, password_hash, role) VALUES ($1, $2, $3) RETURNING id',
                [centerEmail, hash, 'CENTER']
            );
            centerId = centerRes.rows[0].id;
            console.log(`Created center user ${centerEmail} with ID ${centerId}`);
        } else {
            centerId = centerCheck.rows[0].id;
            console.log(`Center user ${centerEmail} already exists with ID ${centerId}`);
        }

        // 4. Create Center Profile
        const centerProfileCheck = await client.query('SELECT id_user FROM centers WHERE id_user = $1', [centerId]);
        if (centerProfileCheck.rows.length === 0) {
            await client.query(
                'INSERT INTO centers (id_user, center_name, center_code, address, phone) VALUES ($1, $2, $3, $4, $5)',
                [centerId, 'IES Terrassa', '08000001', 'Carrer de la Ciència, 12, Terrassa', '937000000']
            );
            console.log(`Created center profile for user ID ${centerId}`);
        } else {
            console.log(`Center profile already exists for user ID ${centerId}`);
        }

        // 5. Create Workshops
        const workshops = [
            {
                title: 'Robòtica Educativa',
                short_description: 'Introducció a la robòtica amb LEGO Mindstorms.',
                max_slots: 20,
                category: 'Tecnologia',
                schedule: 'Dimarts 10:00 - 12:00',
                duration_hours: 2,
                start_date: '2026-01-15 10:00:00',
                end_date: '2026-01-15 12:00:00'
            },
            {
                title: 'Ciències Experimentals',
                short_description: 'Experiments de química bàsica per a secundària.',
                max_slots: 25,
                category: 'Ciència',
                schedule: 'Dijous 15:30 - 17:30',
                duration_hours: 2,
                start_date: '2026-01-20 15:30:00',
                end_date: '2026-01-20 17:30:00'
            }
        ];

        for (const w of workshops) {
            const workshopCheck = await client.query('SELECT id_workshop FROM workshops WHERE title = $1', [w.title]);
            let workshopId;
            if (workshopCheck.rows.length === 0) {
                const workshopRes = await client.query(
                    `INSERT INTO workshops (title, short_description, max_slots, available_slots, category, start_date, end_date, center_id)
                     VALUES ($1, $2, $3, $3, $4, $5, $6, $7) RETURNING id_workshop`,
                    [w.title, w.short_description, w.max_slots, w.category, w.start_date, w.end_date, centerId]
                );
                workshopId = workshopRes.rows[0].id_workshop;
                console.log(`Created workshop: ${w.title}`);
            } else {
                workshopId = workshopCheck.rows[0].id_workshop;
                console.log(`Workshop ${w.title} already exists`);
            }

            // 4. Assign Teacher to Workshop
            const relationCheck = await client.query(
                'SELECT * FROM workshop_teachers WHERE id_workshop = $1 AND id_teacher = $2',
                [workshopId, userId]
            );
            if (relationCheck.rows.length === 0) {
                await client.query(
                    'INSERT INTO workshop_teachers (id_workshop, id_teacher) VALUES ($1, $2)',
                    [workshopId, userId]
                );
                console.log(`Assigned teacher to workshop: ${w.title}`);
            }
        }

        await client.query('COMMIT');
        console.log('Seeding completed!');
    } catch (error) {
        await client.query('ROLLBACK');
        console.error('Error seeding data:', error);
    } finally {
        client.release();
        process.exit();
    }
}

seed();
