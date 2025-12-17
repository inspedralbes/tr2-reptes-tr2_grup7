import * as Centre from "../models/centre.js";

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

export const createCentre = async (req, res) => {
  try {
    const newCentre = await Centre.create(req.body);
    res.status(201).json(newCentre);
  } catch (error) {
    console.error("Error creating centre:", error);
    res.status(500).json({ error: "Error creando el centro" });
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
    res.status(500).json({ error: "Error actualizando el centro" });
  }
};

export const deleteCentre = async (req, res) => {
  try {
    const deletedCentre = await Centre.remove(req.params.id);
    if (deletedCentre) {
      res.json({ message: "Centro eliminado correctamente" });
    } else {
      res.status(404).json({ error: "Centro no encontrado" });
    }
  } catch (error) {
    console.error("Error deleting centre:", error);
    res.status(500).json({ error: "Error eliminando el centro" });
  }
};
