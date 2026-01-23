import * as Workshop from "../models/workshop.js";
import { generateSessions } from "./sessionController.js";

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
    console.log('Creating workshop with data:', req.body);
    const newData = await Workshop.create(req.body);
    
    // Auto-generate sessions for Modalidad C (30h = 10 sessions of 3h)
    if (req.body.modalidad === 'C' || !req.body.modalidad) { // Default is C
        await generateSessions(newData.id_workshop, req.body.start_date);
    }

    res.status(201).json(newData);
  } catch (error) {
    console.error('Error creating workshop:', error);
    // Si el teacher_id no existe, Postgres lanza error 23503
    if (error.code === "23503")
      return res.status(400).json({ error: "Invalid teacher_id" });
    
    // Devolver más información del error para debugging
    res.status(500).json({ 
      error: "Error creating workshop",
      details: error.message,
      code: error.code
    });
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

export const getMyWorkshops = async (req, res) => {
  try {
    const teacher_id = req.query.teacher_id;
    if (!teacher_id) {
      return res.status(400).json({ error: "teacher_id is required" });
    }
    const data = await Workshop.getByTeacherId(teacher_id);
    res.json(data);
  } catch (error) {
    res.status(500).json({ error: "Internal server error" });
  }
};

