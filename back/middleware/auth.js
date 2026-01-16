import jwt from "jsonwebtoken";

//de momento cogemos token de la web
export const verifyToken = (req, res, next) => {
  const token = req.headers["authorization"];

  if (!token) {
    return res.status(403).json({ error: "No token provided" });
  }

  // Remove "Bearer " if present
  const tokenString = token.startsWith("Bearer ")
    ? token.slice(7, token.length)
    : token;

  try {
    const decoded = jwt.verify(tokenString, process.env.JWT_SECRET);
    req.user = decoded; // { id, role, ... }
    next();
  } catch (err) {
    return res.status(401).json({ error: "Unauthorized" });
  }
};

// Middleware para autorizar roles específicos
export const authorizeRoles = (...allowedRoles) => {
  return (req, res, next) => {
    if (!req.user || !req.user.role) {
      return res.status(403).json({ error: "No role found in token" });
    }

    if (!allowedRoles.includes(req.user.role)) {
      console.warn(`Acceso denegado: El rol ${req.user.role} no tiene permiso para esta ruta.`);
      return res.status(403).json({ error: "Acceso denegado: Permisos insuficientes" });
    }

    next();
  };
};
