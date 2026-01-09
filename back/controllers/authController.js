import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import * as User from "../models/user.js";

export const login = async (req, res) => {
  const { email, password } = req.body;

  try {
    // 1. Buscar al usuario por email
    const user = await User.findByEmail(email);
    // const result = await db.query("SELECT * FROM users WHERE email = $1", [
    //   email,
    // ]);
    // const user = result.rows[0];

    // 2. Si no existe o la contraseña no coincide (usamos bcrypt)
    // No decimos cuál de las dos falla por seguridad
    if (!user || !(await bcrypt.compare(password, user.password_hash))) {
      return res.status(401).json({ error: "Invalid credentials" });
    }

    // 3. Generar el Token (JWT)
    // Guardamos el id y el rol dentro del token
    const token = jwt.sign(
      { id: user.id_user, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: "8h" } // El token caduca en 8 horas
    );

    // 4. Responder al Front con lo que necesita
    // 4. Responder al Front con lo que necesita
    const userData = {
      role: user.role,
      id: user.id,
    };

    if (user.role === "CENTER") {
      userData.name = user.center_name;
      userData.id_center = user.id; // Center's ID is the User ID
    } else {
      userData.name = user.first_name;
      userData.id_center = user.id_center_assigned;
    }

    res.json({
      token,
      user: userData,
    });
  } catch (error) {
    console.error("Login error:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
