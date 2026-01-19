import pool from "./data/db.js";

const runMigration = async () => {
  try {
    console.log("Starting schema update...");

    // 1. Add id_teacher_1 to school_applications
    try {
      await pool.query(`
        ALTER TABLE school_applications 
        ADD COLUMN IF NOT EXISTS id_teacher_1 INT REFERENCES teachers(id_user);
      `);
      console.log("Added id_teacher_1 column.");
    } catch (e) {
      console.log("Error adding id_teacher_1 (might exist):", e.message);
    }

    // 2. Add id_teacher_2 to school_applications
    try {
      await pool.query(`
        ALTER TABLE school_applications 
        ADD COLUMN IF NOT EXISTS id_teacher_2 INT REFERENCES teachers(id_user);
      `);
      console.log("Added id_teacher_2 column.");
    } catch (e) {
      console.log("Error adding id_teacher_2 (might exist):", e.message);
    }

    console.log("Schema update completed.");
  } catch (error) {
    console.error("Migration failed:", error);
  } finally {
    await pool.end();
  }
};

runMigration();
