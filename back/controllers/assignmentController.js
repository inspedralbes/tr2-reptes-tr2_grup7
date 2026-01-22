import { generateProposal, applyProposal } from '../engines/matchingEngine.js';
import * as User from "../models/user.js";
import * as Request from "../models/centerRequest.js";
// Note: User.getTeachersByCenter might be broken if schema changed, but matchingEngine uses its own queries so we are safe for automatic assignment.

export const triggerAssignment = async (req, res) => {
    // Legacy endpoint - Redirect or inform
    res.status(400).json({ error: "Use /run-matching endpoint" });
};

export const runMatching = async (req, res) => {
    try {
        const config = req.body;
        console.log("Requesting Matching Proposal with config:", config);
        
        const result = await generateProposal(config);
        
        res.json({
            success: true,
            message: "Propuesta generada. Revise antes de confirmar.",
            proposalId: result.proposalId,
            data: result.details // { students: [], teachers: [] }
        });
    } catch (error) {
        console.error("Error en runMatching:", error);
        res.status(500).json({ message: "Error generando la propuesta", error: error.message });
    }
};

export const confirmMatching = async (req, res) => {
    try {
        const { proposalId } = req.body;
        if (!proposalId) return res.status(400).json({ error: "Se requiere proposalId" });

        console.log("Confirming Proposal:", proposalId);
        const pdfBase64 = await applyProposal(proposalId);

        res.json({
            success: true,
            message: "Asignación aplicada correctamente.",
            pdf_report: pdfBase64
        });
    } catch (error) {
        console.error("Error en confirmMatching:", error);
        res.status(500).json({ message: "Error confirmando la propuesta", error: error.message });
    }
};
