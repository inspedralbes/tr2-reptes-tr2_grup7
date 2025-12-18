import { createRequire } from 'module';
const require = createRequire(import.meta.url);
const XLSX = require('xlsx');
const crypto = require('crypto'); 
import fs from 'fs';

const NOMBRE_ARCHIVO = 'centres-educatius.xlsx'; 

const REGIONES = {
    '08': 'barcelona',
    '17': 'girona',
    '25': 'lleida',
    '43': 'tarragona'
};

const sqlOutputs = {
    'barcelona': [],
    'girona': [],
    'lleida': [],
    'tarragona': []
};

function generarPassword() {
    return crypto.randomBytes(4).toString('hex');
}

function calcularEmailXtec(codigo) {
    if (!codigo) return null;
    const codStr = String(codigo).trim();
    const prefix = codStr.substring(0, 2);
    let letra = '';

    if (prefix === '08') letra = 'a';
    else if (prefix === '17') letra = 'b';
    else if (prefix === '25') letra = 'c';
    else if (prefix === '43') letra = 'e';
    else return null;

    return `${letra}${codStr.substring(1)}@xtec.cat`;
}

// Escapar comillas
function escaparSQL(texto) {
    if (!texto) return '';
    return String(texto).replace(/'/g, "''"); 
}

// --- PROCESO ---

try {
    console.log(`Generando SQL con contraseñas...`);
    
    const workbook = XLSX.readFile(NOMBRE_ARCHIVO);
    const sheet = workbook.Sheets[workbook.SheetNames[0]];
    const datos = XLSX.utils.sheet_to_json(sheet);
    
    console.log(`Procesando ${datos.length} filas...`);
    
    datos.forEach(row => {
        const codigo = row['Codi_centre'];
        const nombre = row['Denominació_completa'];
        
        if (!codigo || !nombre) return;

        const prefijo = String(codigo).substring(0, 2);
        const region = REGIONES[prefijo];

        if (!region) return;

        // Datos básicos
        const telefono = row['Telèfon'] || '';
        const direccion = `${row['Adreça'] || ''}, ${row['Codi_postal'] || ''} ${row['Nom_municipi'] || ''}`;
        
        let emailFinal = row['E-mail_centre'];
        if (!emailFinal || emailFinal === '') {
            emailFinal = calcularEmailXtec(codigo);
        }

        const passwordTemp = generarPassword();

        const sqlName = `'${escaparSQL(nombre)}'`;
        const sqlCode = `'${codigo}'`;
        const sqlEmail = emailFinal ? `'${emailFinal.trim()}'` : 'NULL';
        const sqlPass = `'${passwordTemp}'`; 
        const sqlAddr = direccion ? `'${escaparSQL(direccion)}'` : 'NULL';
        const sqlPhone = telefono ? `'${telefono}'` : 'NULL';

        const val = `(${sqlName}, ${sqlCode}, ${sqlEmail}, ${sqlPass}, ${sqlAddr}, ${sqlPhone})`;
        
        sqlOutputs[region].push(val);
    });

    for (const [region, values] of Object.entries(sqlOutputs)) {
        if (values.length > 0) {
            const fileName = `seed_centers_${region}.sql`;
            let content = `-- Seed ${region.toUpperCase()}\n`;
            content += `INSERT INTO centers (center_name, center_code, official_email, password_hash, address, phone) VALUES \n`;
            content += values.join(",\n");
            content += ";\n";

            fs.writeFileSync(fileName, content);
            console.log(`SQL Generado: ${fileName}`);
        }
    }

} catch (error) {
    console.error("Error:", error.message);
}