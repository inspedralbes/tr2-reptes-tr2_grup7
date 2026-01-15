import db from "../data/db.js";

export const getAll = async () => {
  const result = await db.query(
    "SELECT * FROM workshops ORDER BY created_at DESC"
  );
  return result.rows;
};

export const getById = async (id) => {
  const result = await db.query(
    `SELECT w.*, c.center_name, c.address as center_address, c.phone as center_phone, u.email as center_email 
     FROM workshops w
     LEFT JOIN centers c ON w.center_id = c.id_user
     LEFT JOIN users u ON c.id_user = u.id
     WHERE w.id_workshop = $1`,
    [id]
  );
  return result.rows[0];
};

export const create = async (data) => {
  const {
    title,
    short_description,
    max_slots,
    category,
    schedule,
    duration_hours,
    teacher_id,
    start_date,
    end_date,
    center_id
  } = data;

  const client = await db.connect();
  try {
    await client.query('BEGIN');

    // available_slots starts equal to max_slots
    const workshopText = `
      INSERT INTO workshops (title, short_description, max_slots, available_slots, category, schedule, duration_hours, start_date, end_date, center_id)
      VALUES ($1, $2, $3, $3, $4, $5, $6, $7, $8, $9)
      RETURNING *
    `;
    const workshopValues = [
      title,
      short_description,
      max_slots,
      category,
      schedule,
      duration_hours,
      start_date,
      end_date,
      center_id
    ];
    
    const { rows: workshopRows } = await client.query(workshopText, workshopValues);
    const newWorkshop = workshopRows[0];

    // Assign to teacher if provided
    if (teacher_id) {
      const teacherText = `
        INSERT INTO workshop_teachers (id_workshop, id_teacher)
        VALUES ($1, $2)
      `;
      await client.query(teacherText, [newWorkshop.id_workshop, teacher_id]);
    }

    await client.query('COMMIT');
    return newWorkshop;
  } catch (error) {
    await client.query('ROLLBACK');
    throw error;
  } finally {
    client.release();
  }
};

export const update = async (id, data) => {
  const {
    title,
    short_description,
    max_slots,
    available_slots,
    category,
    schedule,
    status,
    duration_hours,
    start_date,
    end_date,
    // is_active, // Not in table based on create.sql check, usually status handles this
    center_id
  } = data;

  // We don't update teacher_id here usually, that would be a separate assignment change
  // If needed, we could handle it, but for now let's focus on workshop details

  const text = `
    UPDATE workshops 
    SET title=$1, short_description=$2, max_slots=$3, available_slots=$4, category=$5, schedule=$6, status=$7, duration_hours=$8, start_date=$9, end_date=$10, center_id=$11
    WHERE id_workshop = $12
    RETURNING *
  `;
  const values = [
    title,
    short_description,
    max_slots,
    available_slots,
    category,
    schedule,
    status,
    duration_hours,
    start_date,
    end_date,
    center_id,
    id,
  ];
  
  const result = await db.query(text, values);
  return result.rows[0];
};

export const remove = async (id) => {
  const result = await db.query(
    "DELETE FROM workshops WHERE id_workshop = $1 RETURNING *",
    [id]
  );
  return result.rows[0];
};

export const assignTeacher = async (id_workshop, id_teacher) => {
  const text = `
    INSERT INTO workshop_teachers (id_workshop, id_teacher)
    VALUES ($1, $2)
    ON CONFLICT DO NOTHING
    RETURNING *
  `;
  const result = await db.query(text, [id_workshop, id_teacher]);
  return result.rows[0];
};

export const getByTeacherId = async (teacherId) => {
  const result = await db.query(
    `SELECT 
      w.*,
      COALESCE(COUNT(DISTINCT we.id_enrollment), 0) AS enrolled_count
     FROM workshops w
     JOIN workshop_teachers wt ON w.id_workshop = wt.id_workshop
     LEFT JOIN workshop_enrollments we ON w.id_workshop = we.id_workshop
     WHERE wt.id_teacher = $1 
     GROUP BY w.id_workshop
     ORDER BY w.created_at DESC`,
    [teacherId]
  );
  return result.rows;
};

