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

export const getCentreTopWorkshops = async (req, res) => {
  try {
    const workshops = await Centre.getTopWorkshopsForCenter(req.params.id);
    res.json(workshops);
  } catch (error) {
    console.error("Error getting centre top workshops:", error);
    res.status(500).json({ error: "Error fetching top workshops" });
  }
};

export const getCentreUpcomingWorkshops = async (req, res) => {
  try {
    const workshops = await Centre.getUpcomingWorkshopsForCenter(req.params.id);
    res.json(workshops);
  } catch (error) {
    console.error("Error getting centre upcoming workshops:", error);
    res.status(500).json({ error: "Error fetching upcoming workshops" });
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
export const createStudent = async (req, res) => {
  try {
    const { id } = req.params;
    const { first_name, last_name, email, birth_date, phone } = req.body;

    if (!first_name || !last_name || !email || !birth_date) {
      return res.status(400).json({ error: "Faltan campos obligatorios" });
    }

    // Default password for students if not provided? Or generate one?
    // Project requirement usually implies students might not log in or have a default one.
    // For now, let's use a default or allow it to be passed.
    // Based on user.js, password_hash is required.
    // Let's generate a temporary password or use '12345678' for ease if not specified,
    // or better, if the frontend doesn't send it, generate one.
    // Looking at `LlistaProfessors`, we send password. `LlistaAlumnes` currently doesn't have password field in edit.
    // I'll add a default generic password for students created by center: "student123" (hashed)
    // or require it from frontend. Let's start with a default to simplify UI unless user asks.

    // Correction: Frontend UI for students usually doesn't ask for password in this context?
    // Let's check `User.create`.

    const salt = await bcrypt.genSalt(10);
    const password_hash = await bcrypt.hash("12345678", salt); // Default password

    const newStudent = await User.create({
      email,
      password_hash,
      role: "STUDENT",
      first_name,
      last_name,
      birth_date,
      phone,
      id_center_assigned: id,
    });

    res.status(201).json(newStudent);
  } catch (error) {
    console.error("Error creating student:", error);
    if (error.code === "23505") {
      return res
        .status(400)
        .json({ error: "El correo electrónico ya está registrado" });
    }
    res.status(500).json({ error: "Error creando el alumno" });
  }
};

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

// Teacher CRUD operations
export const createTeacher = async (req, res) => {
  try {
    const { id } = req.params;
    const { first_name, last_name, email, password } = req.body;

    if (!first_name || !last_name || !email || !password) {
      return res.status(400).json({ error: "Faltan campos obligatorios" });
    }

    const salt = await bcrypt.genSalt(10);
    const password_hash = await bcrypt.hash(password, salt);

    // Create user with role TEACHER and assigned to this center
    const newTeacher = await User.create({
      email,
      password_hash,
      role: "TEACHER",
      first_name,
      last_name,
      id_center_assigned: id,
    });

    res.status(201).json(newTeacher);
  } catch (error) {
    console.error("Error creating teacher:", error);
    if (error.code === "23505") {
      // Unique violation
      return res
        .status(400)
        .json({ error: "El correo electrónico ya está registrado" });
    }
    res.status(500).json({ error: "Error creando el profesor" });
  }
};

export const updateTeacher = async (req, res) => {
  try {
    const { teacherId } = req.params;
    const { first_name, last_name, email } = req.body;

    // We need to import db to run raw queries if we don't have a Teacher model
    // Assuming db is not imported in this file, we might need to add it or use User model if we fix it.
    // Checking imports... "import * as User" is there. User model methods might not suffice for specific updates.
    // Let's rely on adminController logic which likely imports 'db'.
    // Wait, centreController imports models which import db.
    // I should check if I can import db here or if I should add a method to User model or Centre model.
    // I'll assume I need to import db at the top or add a helper in Centre model.
    // Adding to Centre model "updateTeacher" seems cleanest since I already import Centre.

    // For now, let's use Centre.updateTeacher (I will create it in next step)
    // to avoid messing with top-level imports in this replace block if possible.
    // But wait, I can't guarantee Centre.updateTeacher exists yet.
    // I already inspected Centre model and it didn't have it.

    // Actually, I can just add the import of db at the top of this file in a separate step?
    // Or I can add `updateTeacher` to `back/models/centre.js` which already imports db.
    // Let's go with adding helper methods to `back/models/centre.js` to keep controller clean.

    const updated = await Centre.updateTeacher(teacherId, {
      first_name,
      last_name,
      email,
    });
    if (updated) {
      res.json(updated);
    } else {
      res.status(404).json({ error: "Profesor no encontrado" });
    }
  } catch (error) {
    console.error("Error updating teacher:", error);
    if (error.code === "23505") {
      return res
        .status(400)
        .json({ error: "El correo electrónico ya está en uso" });
    }
    res.status(500).json({ error: "Error actualizando profesor" });
  }
};

export const deleteTeacher = async (req, res) => {
  try {
    const { teacherId } = req.params;
    // User.remove deletes from users table, which cascades to teachers
    const deleted = await Centre.deleteTeacher(teacherId); // Using Centre model wrapper for consistency
    if (deleted) {
      res.json({ message: "Profesor eliminado correctamente" });
    } else {
      res.status(404).json({ error: "Profesor no encontrado" });
    }
  } catch (error) {
    console.error("Error deleting teacher:", error);
    res.status(500).json({ error: "Error eliminando profesor" });
  }
};
