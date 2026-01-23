import db from '../data/db.js';

export const getStudentsForAttendance = async (req, res) => {
    try {
        const { id_workshop } = req.params;
        const date = req.query.date || new Date().toISOString().split('T')[0];

        // Fetch students enrolled in the workshop AND their attendance status for the specific date
        // Join with workshop_enrollments to get students
        // Join with workshop_attendance (LEFT JOIN) to get status if exists
        const text = `
            SELECT 
                s.id_user as id_student, 
                s.first_name, 
                s.last_name, 
                u.email,
                wa.status as last_status,
                wa.comments as last_comments
            FROM workshop_enrollments we
            JOIN students s ON we.id_student = s.id_user
            JOIN users u ON s.id_user = u.id
            LEFT JOIN workshop_attendance wa 
                ON wa.id_student = s.id_user 
                AND wa.id_workshop = $1 
                AND wa.date = $2
            WHERE we.id_workshop = $1
            ORDER BY s.last_name, s.first_name
        `;
        
        const result = await db.query(text, [id_workshop, date]);
        res.json(result.rows);
    } catch (error) {
        console.error("Error fetching students for attendance:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};

export const saveAttendance = async (req, res) => {
    const client = await db.connect();
    try {
        await client.query("BEGIN");
        const { id_workshop, date, students } = req.body;

        // "students" array: [{ id_student, status, comments }]

        for (const student of students) {
            // Upsert logic (Insert or Update)
            // Postgres supports ON CONFLICT
            const text = `
                INSERT INTO workshop_attendance (id_workshop, id_student, date, status, comments)
                VALUES ($1, $2, $3, $4, $5)
                ON CONFLICT (id_workshop, id_student, date) 
                DO UPDATE SET status = EXCLUDED.status, comments = EXCLUDED.comments;
            `;
            await client.query(text, [id_workshop, student.id_student, date, student.status, student.comments]);
        }

        await client.query("COMMIT");
        res.json({ message: "Attendance saved successfully" });
    } catch (error) {
        await client.query("ROLLBACK");
        console.error("Error saving attendance:", error);
        res.status(500).json({ error: "Internal server error" });
    } finally {
        client.release();
    }
};
