import * as Evaluation from "../models/evaluation.js";

export const saveEvaluation = async (req, res) => {
  try {
    const { id_workshop, id_student, grade, comments } = req.body;
    
    // Basic validation
    if (!id_workshop || !id_student || !grade) {
      return res.status(400).json({ error: "Missing required fields" });
    }
    
    if (grade < 1 || grade > 5) {
      return res.status(400).json({ error: "Grade must be between 1 and 5" });
    }

    const evaluation = await Evaluation.create(id_workshop, id_student, grade, comments);
    res.json(evaluation);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error saving evaluation" });
  }
};

export const getWorkshopEvaluations = async (req, res) => {
  try {
    const { id } = req.params; // workshop id
    const evaluations = await Evaluation.getByWorkshop(id);
    res.json(evaluations);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Error fetching evaluations" });
  }
};
