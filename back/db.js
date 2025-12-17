const { Pool } = require("pg");
require("dotenv").config();

// Configuración de la conexión a PostgreSQL usando variables de entorno
// Se asume que en el docker-compose.yml o .env están definidas:
// DB_USER, DB_PASSWORD, DB_HOST, DB_PORT, DB_NAME
// O bien una DATABASE_URL completa.
// En el docker-compose original vi: DATABASE_URL: postgres://...

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

// Eventos del pool para debug
pool.on("connect", () => {
  // console.log("📦 Conexión creada con la base de datos");
});

pool.on("error", (err) => {
  console.error("❌ Error inesperado en el cliente de PG", err);
  process.exit(-1);
});

module.exports = {
  query: (text, params) => pool.query(text, params),
  pool,
};
