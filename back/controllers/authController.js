import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import * as User from "../models/user.js";

export const login = async (req, res) => {
  const { email, password } = req.body;

  try {
    console.log("🔐 Login attempt for email:", `[${email}]`);
    
    // 1. Buscar al usuario por email
    const user = await User.findByEmail(email);
    
    if (!user) {
      console.log("❌ User not found in DB:", `[${email}]`);
      return res.status(401).json({ error: "Invalid credentials" });
    }

    console.log("✅ User found:", { id: user.id, email: user.email, role: user.role });
    console.log("🔑 Comparing password...");

    // 2. Verificar contraseña
    const passwordMatch = await bcrypt.compare(password, user.password_hash);
    console.log("🔑 Password match result:", passwordMatch);
    
    if (!passwordMatch) {
      console.log("❌ Invalid password for:", `[${email}]`);
      return res.status(401).json({ error: "Invalid credentials" });
    }

    // 3. Generar el Token (JWT)
    const token = jwt.sign(
      { id: user.id, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: "8h" }
    );

    // 4. Responder al Front con lo que necesita
    const userData = {
      role: user.role,
      id: user.id,
    };

    if (user.role === "CENTER") {
      userData.name = user.center_name;
      userData.id_center = user.id;
    } else if (user.role === "ADMIN") {
      userData.name = email.split('@')[0]; // Use email prefix for admin
    } else {
      userData.name = user.first_name;
      userData.id_center = user.id_center_assigned;
      if (user.role === 'TEACHER') {
        userData.teacher_id = user.teacher_id;
      }
    }

    console.log("✅ Login successful for:", email, "Role:", user.role);

    res.json({
      token,
      user: userData,
    });
  } catch (error) {
    console.error("❌ Login error:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};
