import * as User from '../models/user.js';
import bcrypt from 'bcrypt';

async function testLogin() {
    const email = 'profesor@test.com';
    const password = 'password123';

    console.log(`Testing login for ${email}...`);
    
    try {
        const user = await User.findByEmail(email);
        if (!user) {
            console.log('User not found in DB');
            return;
        }

        console.log('User found in DB:', { id: user.id, email: user.email, role: user.role });
        console.log('Stored hash:', user.password_hash);

        const match = await bcrypt.compare(password, user.password_hash);
        console.log('Password match:', match);

        if (match) {
            console.log('SUCCESS: Login would work in controller');
        } else {
            console.log('FAILURE: Password mismatch');
        }
    } catch (err) {
        console.error('ERROR during test:', err);
    } finally {
        process.exit();
    }
}

testLogin();
