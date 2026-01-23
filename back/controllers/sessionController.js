import db from '../data/db.js';

export const getSessionsByWorkshop = async (req, res) => {
    try {
        const { id_workshop } = req.params;
        const result = await db.query(
            "SELECT * FROM workshop_sessions WHERE id_workshop = $1 ORDER BY date ASC, session_number ASC",
            [id_workshop]
        );
        res.json(result.rows);
    } catch (error) {
        console.error("Error fetching sessions:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};

export const getUpcomingSessions = async (req, res) => {
    try {
        const { teacher_id } = req.query;
        if (!teacher_id) {
            return res.status(400).json({ error: "Teacher ID is required" });
        }

        const query = `
            SELECT 
                ws.id_session,
                ws.session_number,
                ws.date,
                ws.start_time,
                ws.end_time,
                w.id_workshop,
                w.title,
                w.category,
                w.modalidad,
                centers.center_name
            FROM workshop_sessions ws
            JOIN workshops w ON ws.id_workshop = w.id_workshop
            JOIN workshop_teachers wt ON w.id_workshop = wt.id_workshop
            LEFT JOIN centers ON w.center_id = centers.id_user
            WHERE wt.id_teacher = $1 
              AND ws.date >= CURRENT_DATE
            ORDER BY ws.date ASC, ws.start_time ASC
            LIMIT 20
        `;
        
        const result = await db.query(query, [teacher_id]);
        res.json(result.rows);
    } catch (error) {
        console.error("Error fetching upcoming sessions:", error);
        res.status(500).json({ error: "Internal server error" });
    }
};
export const generateSessions = async (workshopId, startDate) => {
    try {
        const start = new Date(startDate);
        for (let i = 0; i < 10; i++) {
            const sessionDate = new Date(start);
            sessionDate.setDate(start.getDate() + (i * 7)); // Weekly sessions
            
            const dateStr = sessionDate.toISOString().split('T')[0];
            
            await db.query(
                "INSERT INTO workshop_sessions (id_workshop, session_number, date) VALUES ($1, $2, $3) ON CONFLICT DO NOTHING",
                [workshopId, i + 1, dateStr]
            );
        }
        console.log(`Generated 10 sessions for workshop ${workshopId}`);
    } catch (error) {
        console.error("Error generating sessions:", error);
    }
};
