import pg from "pg";
import dotenv from "dotenv";

dotenv.config();

const { Pool } = pg;

// Configuración de la conexión a la base de datos PostgreSQL
// Se utiliza 'DATABASE_URL' si existe (común en despliegues y docker-compose)
// De lo contrario, se usan las variables individuales.
const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
  // Si no usas DATABASE_URL, puedes configurar explícitamente:
  // user: process.env.DB_USER,
  // host: process.env.DB_HOST,
  // database: process.env.DB_NAME,
  // password: process.env.DB_PASSWORD,
  // port: process.env.DB_PORT,
});

pool.on("connect", () => {
  // console.log(" Base de datos conectada con éxito.");
});

pool.on("error", (err) => {
  console.error(" Error inesperado en el cliente de PostgreSQL", err);
  process.exit(-1);
});

export const query = (text, params) => pool.query(text, params);
export { pool };
