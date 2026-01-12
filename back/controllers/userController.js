import bcrypt from "bcrypt";
import * as User from "../models/user.js";

//Aquí es fan les peticions express de la pàgina web

export const getAllUsers = async (req, res) => {
  try {
    const users = await User.getAll();
    res.json(users);
  } catch (error) {
    console.error("Error getting users:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
};

export const getUserById = async (req, res) => {
  try {
    const user = await User.getById(req.params.id);
    if (user) {
      res.json(user);
    } else {
      res.status(404).json({ error: "Usuario no encontrado" });
    }
  } catch (error) {
    console.error("Error getting user:", error);
    res.status(500).json({ error: "Error interno del servidor" });
  }
};

export const createUser = async (req, res) => {
  try {
    const { password, ...userData } = req.body;
    const password_hash = await bcrypt.hash(password, 10);
    
    // Pasamos el password_hash junto con el resto de datos
    const newUser = await User.create({ ...userData, password_hash });
    res.status(201).json(newUser);
  } catch (error) {
    console.error("Error creating user:", error);
    res.status(500).json({ error: "Error creando el usuario" });
  }
};

export const updateUser = async (req, res) => {
  try {
    const updatedUser = await User.update(req.params.id, req.body);
    if (updatedUser) {
      res.json(updatedUser);
    } else {
      res.status(404).json({ error: "Usuario no encontrado" });
    }
  } catch (error) {
    console.error("Error updating user:", error);
    res.status(500).json({ error: "Error actualizando el usuario" });
  }
};

export const deleteUser = async (req, res) => {
  try {
    const deletedUser = await User.remove(req.params.id);
    if (deletedUser) {
      res.json({ message: "Usuario eliminado correctamente" });
    } else {
      res.status(404).json({ error: "Usuario no encontrado" });
    }
  } catch (error) {
    console.error("Error deleting user:", error);
    res.status(500).json({ error: "Error eliminando el usuario" });
  }
};
