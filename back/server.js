import express from "express";
import http from "http";
import { Server } from "socket.io";
import cors from "cors";
import db from "./data/db.js";
import userRouter from "./routes/userRouter.js";
import centreRouter from "./routes/centreRouter.js";
import interestRouter from "./routes/interestRouter.js";
import requestRouter from "./routes/requestRouter.js";
import workshopRouter from "./routes/workshopRouter.js";
import authRouter from "./routes/authRouter.js";
import db from "./data/db.js"; // Importante el .js al final
import usuarioRouter from "./routes/usuarioRouter.js";
import centreRouter from "./routes/centreRouter.js"; // Importante el .js al final
import interestRouter from "./routes/interestRouter.js"; // Importante el .js al final
import requestRouter from "./routes/requestRouter.js"; // Importante el .js al final
import assignRouter from "./routes/assignRouter.js"; // Importante el .js al final
import "dotenv/config";

// 1. Inicialización del Servidor
const app = express();
const server = http.createServer(app);

// 2. Configuración de Socket.io
export const io = new Server(server, {
  cors: {
    origin: "*",
    methods: ["GET", "POST"],
  },
});

// 3. Middlewares (Configuración global)
app.use(cors());
app.use(express.json());

// 4. Verificación de conexión a Base de Datos
async function assertDatabaseConnectionOk() {
  try {
    const res = await db.query("SELECT NOW()");
    console.log(
      " Conexión a Base de Datos establecida correctamente.",
      res.rows[0].now
    );
  } catch (error) {
    console.error(" No se pudo conectar a la Base de Datos:", error);
  }
}
assertDatabaseConnectionOk();

// 5. Rutas de la API (Endpoints)
app.get("/", (req, res) => {
  res.send("API del Gestor de Talleres funcionando ");
});

// Aquí irán las rutas reales:
app.use("/api/users", userRouter);
app.use("/api/centres", centreRouter);
app.use("/api/interests", interestRouter);
app.use("/api/requests", requestRouter);
app.use("/api/workshops", workshopRouter);
app.use("/api/auth", authRouter);
app.use("/api/assign", assignRouter);

// 6. Lógica de Socket.io (Tiempo Real)
io.on("connection", (socket) => {
  console.log(`Cliente conectado via Socket.io: ${socket.id}`);

  socket.on("join_room", (room) => {
    socket.join(room);
    console.log(`Usuario ${socket.id} entró a la sala: ${room}`);
  });

  socket.on("disconnect", () => {
    console.log(` Cliente desconectado: ${socket.id}`);
  });
});

// 7. Arrancar el servidor
const PORT = process.env.PORT || 3000;
server.listen(PORT, () => {
  console.log(`\n Servidor corriendo en http://localhost:${PORT}`);
});
