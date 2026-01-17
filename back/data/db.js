import pkg from "pg";
import "dotenv/config";

const { Pool } = pkg;

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

pool.on("connect", () => console.log("✅ Postgres Conectado"));
pool.on("error", (err) => console.error("❌ Error en el Pool", err));

export default pool;
