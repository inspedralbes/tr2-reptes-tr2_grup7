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
    // DEBUG: Log verification attempt
    // console.log("Middleware verifyToken: Verifying token...");
    // console.log("Middleware Secret exists?", !!process.env.JWT_SECRET);
    
    const decoded = jwt.verify(tokenString, process.env.JWT_SECRET);
    req.user = decoded; // { id, role, ... }
    next();
  } catch (err) {
    console.error("❌ Authentication Error in verifyToken:");
    console.error("   Error Name:", err.name);
    console.error("   Error Message:", err.message);
    if(err.name === 'TokenExpiredError') {
        console.error("   Expired At:", err.expiredAt);
    }
    return res.status(401).json({ error: "Unauthorized", details: err.message });
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
