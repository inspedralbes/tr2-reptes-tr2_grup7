import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import * as User from "../models/user.js";

export const login = async (req, res) => {
  const { email, password } = req.body;

  try {
    console.log("🔐 Login attempt for email:", email);

    // 1. Buscar al usuario por email
    const user = await User.findByEmail(email);

    if (!user) {
      console.log("❌ User not found in DB:", `[${email}]`);
      return res.status(401).json({ error: "Invalid credentials" });
    }

    console.log("✅ User found:", { id: user.id, email: user.email, role: user.role });
    console.log("🔑 Comparing password...");

    // 2. Verificar contraseña
    // Intenta comparar con bcrypt, si falla o da error, compara texto plano
    const isBcryptMatch = await bcrypt.compare(password, user.password_hash).catch(() => false);
    const isPlainMatch = password === user.password_hash;
    const passwordMatch = isBcryptMatch || isPlainMatch;

    console.log(`🔑 Password check: Bcrypt=${isBcryptMatch}, Plain=${isPlainMatch} => Match=${passwordMatch}`);

    if (!passwordMatch) {
      console.log("❌ Invalid password for:", `[${email}]`);
      return res.status(401).json({ error: "Invalid credentials" });
    }

    // 3. Generar el Token (JWT)
      const token = jwt.sign(
        { id: user.id, role: user.role },
        process.env.JWT_SECRET,
        { expiresIn: "24h" }
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

    // CHECK PASSWORD EXPIRATION / FIRST LOGIN
    // If password_last_changed_at is NULL, force change.
    const mustChangePassword = !user.password_last_changed_at;

    res.json({
      token,
      user: userData,
      mustChangePassword // Frontend will redirect if true
    });
  } catch (error) {
    console.error("❌ Login error:", error);
    res.status(500).json({ error: "Internal server error" });
  }
};

export const changePassword = async (req, res) => {
    try {
        const { id } = req.user; // From middleware
        const { newPassword } = req.body;

        if (!newPassword || newPassword.length < 4) {
             return res.status(400).json({ error: "Password must be at least 4 characters" });
        }
        


        const hashedPassword = await bcrypt.hash(newPassword, 10);
        
        await User.updatePassword(id, hashedPassword);
        
        res.json({ message: "Password updated successfully" });
    } catch (error) {
        console.error("Change Password Error:", error);
        res.status(500).json({ error: "Error changing password" });
    }
};
