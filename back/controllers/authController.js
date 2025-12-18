import * as UserModel from "../models/user.model.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

export const login = async (req, res) => {
  const { email, password } = req.body;

  try {
    // 1. Buscar usuario
    const text = "SELECT * FROM users WHERE email = $1";
    const result = await db.query(text, [email]);
    const user = result.rows[0];

    if (!user) return res.status(401).json({ error: "Credenciales inválidas" });

    // 2. Comparar password (encriptada)
    const validPassword = await bcrypt.compare(password, user.password_hash);
    if (!validPassword)
      return res.status(401).json({ error: "Credenciales inválidas" });

    // 3. Generar JWT
    const token = jwt.sign(
      { id: user.id_user, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: "8h" }
    );

    res.json({
      token,
      user: { id: user.id_user, email: user.email, role: user.role },
    });
  } catch (error) {
    res.status(500).json({ error: "Error en el servidor" });
  }
};
