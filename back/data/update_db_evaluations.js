import pkg from 'pg';
const { Pool } = pkg;

const connectionString = 'postgres://admin:password123@localhost:5432/talleres_db';

const pool = new Pool({
  connectionString,
});

const createTableQuery = `
CREATE TABLE IF NOT EXISTS evaluations (
    id_evaluation SERIAL PRIMARY KEY,
    id_workshop INT REFERENCES workshops(id_workshop) ON DELETE CASCADE,
    id_student INT REFERENCES students(id_user) ON DELETE CASCADE,
    grade INT CHECK (grade BETWEEN 1 AND 5),
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(id_workshop, id_student)
);
`;

async function updateDb() {
  try {
    console.log("Connecting to database at localhost...");
    const client = await pool.connect();
    console.log("Connected! Creating evaluations table...");
    await client.query(createTableQuery);
    console.log("Success! Table 'evaluations' created (or already exists).");
    client.release();
  } catch (error) {
    console.error("Error creating table:", error);
  } finally {
    await pool.end();
  }
}

updateDb();
