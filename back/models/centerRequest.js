import db from "../data/db.js";

export const getByCenter = async (id_center) => {
  const text = `
        SELECT cr.*, 
               w.title as workshop_title, 
               sa.status as app_status, 
               sa.year_period as course_level,
               cr.requested_slots as student_count,
               (
                   SELECT t.first_name 
                   FROM workshop_teachers wt
                   JOIN teachers t ON wt.id_teacher = t.id_user
                   WHERE wt.id_workshop = w.id_workshop
                   LIMIT 1
               ) as teacher_first_name,
               (
                   SELECT t.last_name 
                   FROM workshop_teachers wt
                   JOIN teachers t ON wt.id_teacher = t.id_user
                   WHERE wt.id_workshop = w.id_workshop
                   LIMIT 1
               ) as teacher_last_name
        FROM center_requests cr
        JOIN school_applications sa ON cr.id_application = sa.id_application
        JOIN workshops w ON cr.id_workshop = w.id_workshop
        WHERE sa.id_center = $1
    `;
  const result = await db.query(text, [id_center]);
  return result.rows;
};

export const getAllPending = async () => {
  const text = `
        SELECT cr.*, 
               w.title as workshop_title, 
               w.available_slots,
               c.center_name,
               sa.id_application
        FROM center_requests cr
        JOIN school_applications sa ON cr.id_application = sa.id_application
        JOIN workshops w ON cr.id_workshop = w.id_workshop
        JOIN centers c ON sa.id_center = c.id_user
        WHERE cr.status = 'PENDING'
        ORDER BY cr.created_at ASC
    `;
  const result = await db.query(text);
  return result.rows;
};

export const updateStatus = async (id, status) => {
  const text =
    "UPDATE center_requests SET status = $1 WHERE id_request = $2 RETURNING *";
  const result = await db.query(text, [status, id]);
  return result.rows[0];
};
