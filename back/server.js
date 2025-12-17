const express = require("express");
const http = require("http"); // Necesario para unir Express con Socket.io
const { Server } = require("socket.io");
const cors = require("cors");
const sequelize = require("./config/database"); // Tu conexión a la BD
require("dotenv").config();

// 1. Inicialización del Servidor
const app = express();
const server = http.createServer(app); // Creamos servidor HTTP a partir de Express

// 2. Configuración de Socket.io
const io = new Server(server, {
  cors: {
    origin: "*", // En producción, cambia esto por la URL de tu frontend (ej: http://localhost:5173)
    methods: ["GET", "POST"],
  },
});

// 3. Middlewares (Configuración global)
app.use(cors()); // Permite peticiones desde otros dominios
app.use(express.json()); // Permite que el servidor entienda JSON en el body de las peticiones

// 4. Verificación de conexión a Base de Datos
async function assertDatabaseConnectionOk() {
  try {
    await sequelize.authenticate();
    console.log("✅ Conexión a Base de Datos establecida correctamente.");

    // Sincronizar modelos (Crea tablas si no existen).
    // ¡OJO! En producción usa migraciones, no 'sync({ force: true })'
    await sequelize.sync({ alter: true });
    console.log("✅ Modelos sincronizados.");
  } catch (error) {
    console.error("❌ No se pudo conectar a la Base de Datos:", error);
  }
}
assertDatabaseConnectionOk();

// 5. Rutas de la API (Endpoints)
app.get("/", (req, res) => {
  res.send("API del Gestor de Talleres funcionando 🚀");
});

// Aquí irán tus rutas reales:
// app.use('/api/auth', require('./routes/authRoutes'));
// app.use('/api/tallers', require('./routes/tallerRoutes'));

// 6. Lógica de Socket.io (Tiempo Real)
io.on("connection", (socket) => {
  console.log(`⚡ Cliente conectado via Socket.io: ${socket.id}`);

  // Ejemplo: Escuchar cuando un usuario entra a una "sala" (ej: sala de un taller específico)
  socket.on("join_room", (room) => {
    socket.join(room);
    console.log(`Usuario ${socket.id} entró a la sala: ${room}`);
  });

  socket.on("disconnect", () => {
    console.log(`❌ Cliente desconectado: ${socket.id}`);
  });
});

// 7. Arrancar el servidor
const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log(`\n🚀 Servidor corriendo en http://localhost:${PORT}`);
});

// Exportamos 'io' por si necesitamos emitir eventos desde los controladores
module.exports = { io };
