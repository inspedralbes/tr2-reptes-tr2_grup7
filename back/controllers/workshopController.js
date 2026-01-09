import * as Workshop from "../models/workshop.js";

export const getAllWorkshops = async (req, res) => {
  try {
    const data = await Workshop.getAll();
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
};

export const getWorkshopById = async (req, res) => {
  try {
    const data = await Workshop.getById(req.params.id);
    data
      ? res.json(data)
      : res.status(404).json({ error: "Workshop not found" });
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
};

export const createWorkshop = async (req, res) => {
  try {
    const newData = await Workshop.create(req.body);
    res.status(201).json(newData);
  } catch (error) {
    // Si el teacher_id no existe, Postgres lanza error 23503
    if (error.code === "23503")
      return res.status(400).json({ error: "Invalid teacher_id" });
    res.status(500).json({ error: "Error creating workshop" });
  }
};

export const updateWorkshop = async (req, res) => {
  try {
    const updated = await Workshop.update(req.params.id, req.body);
    updated
      ? res.json(updated)
      : res.status(404).json({ error: "Workshop not found" });
  } catch (error) {
    res.status(500).json({ error: "Error updating workshop" });
  }
};

export const deleteWorkshop = async (req, res) => {
  try {
    const deleted = await Workshop.remove(req.params.id);
    deleted
      ? res.json({ message: "Deleted successfully" })
      : res.status(404).json({ error: "Not found" });
  } catch (error) {
    res.status(500).json({ error: "Error deleting workshop" });
  }
};

export const addTeacherToWorkshop = async (req, res) => {
  try {
    const { id_teacher } = req.body;
    const { id } = req.params;
    const result = await Workshop.assignTeacher(id, id_teacher);
    res.json(result);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error assigning teacher" });
  }
};

export const removeTeacherFromWorkshop = async (req, res) => {
  try {
    const { id, teacherId } = req.params;
    const result = await Workshop.removeTeacher(id, teacherId);
    // If result is undefined, it means no row deleted (maybe not found), but idempotent delete is usually 200/204
    res.json({ message: "Teacher removed" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error removing teacher" });
  }
};
