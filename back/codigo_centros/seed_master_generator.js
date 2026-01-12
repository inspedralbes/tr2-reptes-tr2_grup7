import { createRequire } from 'module';
const require = createRequire(import.meta.url);
const XLSX = require('xlsx');
const crypto = require('crypto'); 
const bcrypt = require('bcrypt');
import fs from 'fs';

const NOMBRE_ARCHIVO = 'centres-educatius.xlsx'; 
const SALT_ROUNDS = 10; // Para el hasheo de contraseñas

const REGIONES = {
    '08': 'barcelona',
    '17': 'girona',
    '25': 'lleida',
    '43': 'tarragona'
};

const sqlOutputs = {
    'barcelona': [], 'girona': [], 'lleida': [], 'tarragona': []
};

function generarPassword() {
    return crypto.randomBytes(4).toString('hex');
}

function calcularEmailXtec(codigo) {
    if (!codigo) return null;
    const codStr = String(codigo).trim();
    const prefix = codStr.substring(0, 2);
    let letra = prefix === '08' ? 'a' : prefix === '17' ? 'b' : prefix === '25' ? 'c' : prefix === '43' ? 'e' : null;
    return letra ? `${letra}${codStr.substring(1)}@xtec.cat` : null;
}

function escaparSQL(texto) {
    if (!texto) return '';
    return String(texto).replace(/'/g, "''"); 
}

// --- PROCESO ---

try {
    const workbook = XLSX.readFile(NOMBRE_ARCHIVO);
    const sheet = workbook.Sheets[workbook.SheetNames[0]];
    const datos = XLSX.utils.sheet_to_json(sheet);
    
    console.log(`Procesando ${datos.length} filas y hasheando contraseñas...`);
    
    datos.forEach((row, index) => {
        const codigo = row['Codi_centre'];
        const nombre = row['Denominació_completa'];
        if (!codigo || !nombre) return;

        const prefijo = String(codigo).substring(0, 2);
        const region = REGIONES[prefijo];
        if (!region) return;

        const telefono = row['Telèfon'] || '';
        const direccion = `${row['Adreça'] || ''}, ${row['Codi_postal'] || ''} ${row['Nom_municipi'] || ''}`;
        let emailFinal = row['E-mail_centre'] || calcularEmailXtec(codigo);

        // Hasheo de contraseña (Brutalmente necesario para tu authController)
        const passwordPlana = generarPassword();
        const hash = bcrypt.hashSync(passwordPlana, SALT_ROUNDS);

        // Construcción de la consulta SQL Compleja (Inserta en dos tablas a la vez)
        const query = `
WITH new_user AS (
    INSERT INTO users (email, password_hash, role) 
    VALUES ('${emailFinal}', '${hash}', 'CENTER') 
    RETURNING id
)
INSERT INTO centers (id_user, center_name, center_code, address, phone)
SELECT id, '${escaparSQL(nombre)}', '${codigo}', '${escaparSQL(direccion)}', '${telefono}' FROM new_user;`;
        
        sqlOutputs[region].push(query);

        if (index % 100 === 0) console.log(`Progreso: ${index}/${datos.length}...`);
    });

    for (const [region, queries] of Object.entries(sqlOutputs)) {
        if (queries.length > 0) {
            const fileName = `seed_centers_${region}.sql`;
            fs.writeFileSync(fileName, queries.join("\n"));
            console.log(`✅ SQL Generado: ${fileName}`);
        }
    }

} catch (error) {
    console.error("❌ Error:", error.message);
}