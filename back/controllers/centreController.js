import * as Centre from "../models/centre.js";
import * as User from "../models/user.js";
import * as CentreRequest from "../models/centerRequest.js";
import * as Student from "../models/student.js";
import bcrypt from "bcrypt";

export const getAllCentres = async (req, res) => {
  try {
    const centres = await Centre.getAll();
    res.json(centres);
  } catch (error) {
    console.error("Error getting centres:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
};

export const getCentreById = async (req, res) => {
  try {
    const centre = await Centre.getById(req.params.id);
    if (centre) {
      res.json(centre);
    } else {
      res.status(404).json({ error: "Centro no encontrado" });
    }
  } catch (error) {
    console.error("Error getting centre:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
};

export const getCentreTeachers = async (req, res) => {
  try {
    // If the user effectively asking is the center itself (via req.user.id), or an admin asking for a specific center
    // For now, let's assume the endpoint uses the URL param :id, but we should secure it.
    // However, if we want "getMyTeachers", we might use req.user.id.
    // Let's implement generic "get teachers of center :id"
    const teachers = await Centre.getTeachersByCenter(req.params.id);
    res.json(teachers);
  } catch (error) {
    console.error("Error getting centre teachers:", error);
    res.status(500).json({ error: "Error fetching teachers" });
  }
};

export const getCentreStudents = async (req, res) => {
  try {
    const students = await Centre.getStudentsByCenter(req.params.id);
    res.json(students);
  } catch (error) {
    console.error("Error getting centre students:", error);
    res.status(500).json({ error: "Error fetching students" });
  }
};

export const getCentreStats = async (req, res) => {
  try {
    const stats = await Centre.getDashboardStats(req.params.id);
    res.json(stats);
  } catch (error) {
    console.error("Error getting centre stats:", error);
    res.status(500).json({ error: "Error fetching stats" });
  }
};

export const getCentreRequests = async (req, res) => {
  try {
    // Import dynamically or assuming it's available or move import to top.
    // Better to use dynamic import if circular dep, but here we can just add import at top if possible.
    // Actually, I can just use the model directly if I import it.
    // But I need to add the import to the top of the file.
    // Let's rely on adding the import in a separate edit or assume the user wants me to handle it.
    // I will add the import at the top first if not present.
    // Wait, I can't do multiple edits easily.
    // I'll check imports.
    // Existing imports: Centre, User, bcrypt.
    // I need CenterRequest.
    const requests = await CentreRequest.getByCenter(req.params.id);
    res.json(requests);
  } catch (error) {
    console.error("Error getting centre requests:", error);
    res.status(500).json({ error: "Error fetching requests" });
  }
};

export const createCentre = async (req, res) => {
  try {
    const { email, password, center_name, center_code, address, phone } =
      req.body;

    if (!email || !password || !center_name || !center_code) {
      return res.status(400).json({ error: "Faltan campos obligatorios" });
    }

    const salt = await bcrypt.genSalt(10);
    const password_hash = await bcrypt.hash(password, salt);

    const newUser = await User.create({
      email,
      password_hash,
      role: "CENTER",
      center_name,
      center_code,
      address,
      phone,
    });

    res.status(201).json(newUser);
  } catch (error) {
    console.error("Error creating centre:", error);
    if (error.code === "23505") {
      if (error.detail.includes("email")) {
        return res.status(400).json({ error: "L'email ja està registrat." });
      }
      if (error.detail.includes("center_code")) {
        return res
          .status(400)
          .json({ error: "El codi del centre ja existeix." });
      }
    }
    res
      .status(500)
      .json({ error: "Error creant el centre. Revisa les dades." });
  }
};

export const updateCentre = async (req, res) => {
  try {
    const updatedCentre = await Centre.update(req.params.id, req.body);
    if (updatedCentre) {
      res.json(updatedCentre);
    } else {
      res.status(404).json({ error: "Centro no encontrado" });
    }
  } catch (error) {
    console.error("Error updating centre:", error);
    if (error.code === "23505") {
      if (error.detail.includes("email")) {
        return res.status(400).json({ error: "L'email ja està registrat." });
      }
      if (error.detail.includes("center_code")) {
        return res
          .status(400)
          .json({ error: "El codi del centre ja existeix." });
      }
    }
    res.status(500).json({ error: "Error actualizando el centro" });
  }
};

export const deleteCentre = async (req, res) => {
  try {
    // This will delete the user and cascade to center
    const deletedUser = await Centre.remove(req.params.id);
    if (deletedUser) {
      res.json({ message: "Centro eliminado correctamente" });
    } else {
      res.status(404).json({ error: "Centro no encontrado" });
    }
  } catch (error) {
    console.error("Error deleting centre:", error);
    // Si hay restricciones de clave foránea que impiden el borrado
    if (error.code === "23503") {
      return res.status(400).json({
        error:
          "No se puede eliminar el centro porque tiene elementos asociados (profesores, alumnos, etc.)",
        details: error.constraint,
      });
    }
    res
      .status(500)
      .json({ error: "Error eliminando el centro", details: error.message });
  }
};

// Student CRUD operations
export const updateStudent = async (req, res) => {
  try {
    const { studentId } = req.params;
    const updatedStudent = await Student.updateStudent(studentId, req.body);
    if (updatedStudent) {
      res.json(updatedStudent);
    } else {
      res.status(404).json({ error: "Alumne no trobat" });
    }
  } catch (error) {
    console.error("Error updating student:", error);
    res.status(500).json({ error: "Error actualitzant l'alumne" });
  }
};

export const deleteStudent = async (req, res) => {
  try {
    const { studentId } = req.params;
    const deletedStudent = await Student.deleteStudent(studentId);
    if (deletedStudent) {
      res.json({ message: "Alumne eliminat correctament" });
    } else {
      res.status(404).json({ error: "Alumne no trobat" });
    }
  } catch (error) {
    console.error("Error deleting student:", error);
    if (error.code === "23503") {
      return res.status(400).json({
        error: "No es pot eliminar l'alumne perquè té elements associats",
        details: error.constraint,
      });
    }
    res.status(500).json({ error: "Error eliminant l'alumne" });
  }
};
