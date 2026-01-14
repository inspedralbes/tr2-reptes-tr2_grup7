import bcrypt from 'bcrypt';

const password = '123';
const saltRounds = 10;

bcrypt.hash(password, saltRounds, (err, hash) => {
  if (err) {
    console.error('Error generating hash:', err);
  } else {
    console.log('Bcrypt hash for password "123":');
    console.log(hash);
    console.log('\nSQL Update command:');
    console.log(`UPDATE users SET password_hash = '${hash}' WHERE email = 'admin@workshop.com';`);
  }
});
