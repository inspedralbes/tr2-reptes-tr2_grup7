import db from "../data/db.js";

// Obtener lista de estudiantes para un taller (para pasar lista)
export const getStudentsForAttendance = async (req, res) => {
  const { id_workshop } = req.params;
  try {
    const text = `
      SELECT s.id_user as id_student, s.first_name, s.last_name, 
             u.email, we.enrolled_at,
             wa.status as last_status, wa.date as last_date
      FROM workshop_enrollments we
      JOIN students s ON we.id_student = s.id_user
      JOIN users u ON s.id_user = u.id
      LEFT JOIN workshop_attendance wa ON we.id_workshop = wa.id_workshop 
                                      AND we.id_student = wa.id_student 
                                      AND wa.date = CURRENT_DATE
      WHERE we.id_workshop = $1
      ORDER BY s.last_name ASC
    `;
    const result = await db.query(text, [id_workshop]);
    res.json(result.rows);
  } catch (error) {
    console.error("Error fetching students for attendance:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Guardar asistencia
export const saveAttendance = async (req, res) => {
  const { id_workshop, date, students } = req.body; 
  // students es un array de { id_student, status, comments }

  const client = await db.connect();
  try {
    await client.query('BEGIN');
    
    for (const student of students) {
      const text = `
        INSERT INTO workshop_attendance (id_workshop, id_student, date, status, comments)
        VALUES ($1, $2, $3, $4, $5)
        ON CONFLICT (id_workshop, id_student, date) 
        DO UPDATE SET status = EXCLUDED.status, comments = EXCLUDED.comments
      `;
      await client.query(text, [id_workshop, student.id_student, date, student.status, student.comments || '']);
    }

    await client.query('COMMIT');
    res.json({ message: "Attendance saved successfully" });
  } catch (error) {
    await client.query('ROLLBACK');
    console.error("Error saving attendance:", error);
    res.status(500).json({ error: "Error saving attendance" });
  } finally {
    client.release();
  }
};
