import db from './db.js';
import bcrypt from 'bcrypt';

async function check() {
    console.log('Checking users...');
    const client = await db.connect();
    try {
        const res = await client.query('SELECT id, email, password_hash, role FROM users');
        console.table(res.rows);

        const email = 'profesor@test.com';
        const password = 'password123';
        const user = res.rows.find(u => u.email === email);

        if (user) {
            const match = await bcrypt.compare(password, user.password_hash);
            console.log(`Password match for ${email}: ${match}`);
        } else {
            console.log(`User ${email} not found!`);
        }

    } catch (error) {
        console.error('Error checking users:', error);
    } finally {
        client.release();
        process.exit();
    }
}

check();
