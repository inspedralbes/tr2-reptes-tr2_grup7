import * as ApplicationModel from "../models/schoolApplication.js";
import * as Centre from "../models/centre.js";

export const createApplication = async (req, res) => {
  try {
    const {
      year_period,
      comments, // Global comments
      items, // Array of workshops
      teachers, // Array of teacher IDs
    } = req.body;
    const id_center = req.user.id;

    if (!items || !Array.isArray(items) || items.length === 0) {
      return res
        .status(400)
        .json({ error: "No se han seleccionado talleres." });
    }

    // Accumulate all students to validate center ownership once
    let allStudentIds = [];
    for (const item of items) {
      if (item.students && Array.isArray(item.students)) {
        allStudentIds = allStudentIds.concat(item.students);
      }
    }

    // Validate students belong to center
    if (allStudentIds.length > 0) {
      const validStudents = await Centre.checkStudentsBelongToCenter(
        id_center,
        allStudentIds,
      );
      if (!validStudents) {
        return res.status(403).json({
          error: "Uno o más alumnos no pertenecen a este centro.",
        });
      }
    }

    const result = await ApplicationModel.createApplicationWithDetails(
      id_center,
      year_period || "2025-2026",
      comments,
      items,
      teachers,
    );

    res.status(201).json(result);
  } catch (error) {
    console.error(error);
    if (error.code === "23505") {
      if (
        error.constraint === "school_applications_id_center_year_period_key"
      ) {
        return res
          .status(400)
          .json({ error: "Ja existeix una petició per aquest trimestre." });
      }
    }
    res.status(500).json({ error: "Error creant la petició" });
  }
};

export const getMyApplications = async (req, res) => {
  try {
    const id_center = req.user.id;
    const apps = await ApplicationModel.getByCenter(id_center);
    res.json(apps);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching applications" });
  }
};

export const getApplicationById = async (req, res) => {
  try {
    const { id } = req.params;
    const details = await ApplicationModel.getApplicationDetails(id);
    if (!details)
      return res.status(404).json({ error: "Application not found" });

    // Ensure center owns this application (or is admin)
    if (req.user.role === "CENTER" && details.id_center !== req.user.id) {
      return res.status(403).json({ error: "Unauthorized" });
    }

    res.json(details);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching application details" });
  }
};
