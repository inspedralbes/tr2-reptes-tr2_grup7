import db from "../data/db.js";

//Aquí es on es fa tota la lógica de la base de dades SELECT, INSERT, UPDATE, DELETE

export const getAll = async () => {
  const text = "SELECT * FROM users";
  const result = await db.query(text);
  return result.rows;
};

export const findByEmail = async (email) => {
  const text = `
      SELECT u.id, u.email, u.password_hash, u.role, u.is_active, u.password_last_changed_at,
             c.center_name, c.center_code, c.address, c.phone as center_phone,
             t.id_user as teacher_id, t.first_name as t_first, t.last_name as t_last, t.id_center_assigned as t_center,
             s.first_name as s_first, s.last_name as s_last, s.birth_date, s.id_center_assigned as s_center
      FROM users u
      LEFT JOIN centers c ON u.id = c.id_user AND u.role = 'CENTER'
      LEFT JOIN teachers t ON u.id = t.id_user AND u.role = 'TEACHER'
      LEFT JOIN students s ON u.id = s.id_user AND u.role = 'STUDENT'
      WHERE u.email = $1
    `;
  const result = await db.query(text, [email]);
  if (result.rows.length === 0) return null;

  // Helper to format result nicely
  const raw = result.rows[0];
  const user = {
    id: raw.id,
    email: raw.email,
    password_hash: raw.password_hash,
    role: raw.role,
    is_active: raw.is_active,
    password_last_changed_at: raw.password_last_changed_at,
  };

  if (raw.role === "CENTER") {
    user.center_name = raw.center_name;
    user.center_code = raw.center_code;
    user.address = raw.address;
    user.phone = raw.center_phone;
  } else if (raw.role === "TEACHER") {
    user.teacher_id = raw.teacher_id;
    user.first_name = raw.t_first;
    user.last_name = raw.t_last;
    user.id_center_assigned = raw.t_center;
  } else if (raw.role === "STUDENT") {
    user.first_name = raw.s_first;
    user.last_name = raw.s_last;
    user.birth_date = raw.birth_date;
    user.id_center_assigned = raw.s_center;
  }
  return user;
};

export const getById = async (id) => {
  //Canviem el id_user per id normal ja que en la base de dades es id i depenent del rol tenen id_centre etc..
  const text = "SELECT * FROM users WHERE id = $1";
  const result = await db.query(text, [id]);
  return result.rows[0];
};

export const create = async (usuario) => {
  const {
    email,
    password_hash,
    role,
    // Centros
    center_name,
    center_code,
    address,
    phone,
    // Profesores/Alumnos
    first_name,
    last_name,
    // Profesores
    id_center_assigned: teacher_center,
    // Alumnos
    birth_date,
    eso_grade,
    gender,
    id_center_assigned: student_center,
  } = usuario;

  const client = await db.connect(); // Necesitamos el cliente para acceder al pool de conexiones

  try {
    await client.query("BEGIN");

    // 1. Insert dentro de Users (Tabla padre)
    const userText = `
        INSERT INTO users (email, password_hash, role)
        VALUES ($1, $2, $3)
        RETURNING id
    `;
    const userValues = [email, password_hash, role];
    const userResult = await client.query(userText, userValues);
    const userId = userResult.rows[0].id;

    // 2. Insert dentro de la tabla Hija dependiendo del rol
    if (role === "CENTER") {
      const centerText = `
            INSERT INTO centers (id_user, center_name, center_code, address, phone)
            VALUES ($1, $2, $3, $4, $5)
        `;
      const centerValues = [userId, center_name, center_code, address, phone];
      await client.query(centerText, centerValues);
    } else if (role === "TEACHER") {
      const teacherText = `
            INSERT INTO teachers (id_user, first_name, last_name, id_center_assigned)
            VALUES ($1, $2, $3, $4)
        `;
      const teacherValues = [userId, first_name, last_name, teacher_center];
      await client.query(teacherText, teacherValues);
    } else if (role === "STUDENT") {
      const studentText = `
            INSERT INTO students (id_user, first_name, last_name, birth_date, phone, eso_grade, gender, id_center_assigned)
            VALUES ($1, $2, $3, $4, $5, $6, $7, $8)
        `;
      const studentValues = [
        userId,
        first_name,
        last_name,
        birth_date,
        phone,
        eso_grade,
        gender,
        student_center,
      ];
      await client.query(studentText, studentValues);
    } else if (role === "ADMIN") {
      // Admins might not have an extra table, or maybe we just want them in users
      // Doing nothing extra for proper admin for now
    } else {
      throw new Error(`Invalid role: ${role}`);
    }

    await client.query("COMMIT");

    // Devuelve el usuario con ID
    return { id: userId, email, role, ...usuario }; // Devuelve el objeto usuario con el ID
  } catch (error) {
    await client.query("ROLLBACK");
    throw error;
  } finally {
    client.release();
  }
};

export const update = async (id, usuario) => {
  const { first_name, last_name, email, role, phone, id_center } = usuario;
  const text = `
        UPDATE users
        SET first_name = $1, last_name = $2, email = $3, role = $4, phone = $5, id_center = $6
        WHERE id_user = $7
        RETURNING *
    `;
  // Nota: password_hash no se actualiza aquí por seguridad, requeriría lógica aparte o comprobar si viene.
  // Para simplificar, asumo actualización de campos básicos.
  const values = [first_name, last_name, email, role, phone, id_center, id];
  const result = await db.query(text, values);
  return result.rows[0];
};

export const getTeachersByCenter = async (id_center) => {
  const text = `
    SELECT u.*, t.first_name, t.last_name 
    FROM users u
    JOIN teachers t ON u.id = t.id_user
    WHERE t.id_center_assigned = $1
  `;
  const result = await db.query(text, [id_center]);
  return result.rows;
};

export const remove = async (id) => {
  const text = "DELETE FROM users WHERE id = $1 RETURNING *";
  const result = await db.query(text, [id]);
  return result.rows[0];
};

export const updatePassword = async (id, hashedPassword) => {
  const text =
    "UPDATE users SET password_hash = $1, password_last_changed_at = NOW() WHERE id = $2";
  await db.query(text, [hashedPassword, id]);
};
