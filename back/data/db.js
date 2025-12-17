import pkg from "pg";
import "dotenv/config";

const { Pool } = pkg;

// Usamos la DATABASE_URL que definimos en el docker-compose
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

// Eventos para monitorizar la conexión
pool.on("connect", () => {
  console.log("✅ Conexión establecida con PostgreSQL");
});

pool.on("error", (err) => {
  console.error("❌ Error inesperado en el pool de Postgres", err);
  // En desarrollo, no queremos que el contenedor se muera siempre,
  // pero en producción es vital saber que la DB falló.
});

// Exportación moderna (ES Modules)
export const query = (text, params) => pool.query(text, params);
export default pool;
