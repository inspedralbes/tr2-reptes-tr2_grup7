import nodemailer from 'nodemailer';
import 'dotenv/config';

// Configuración del transporte (SMTP)
// En producción, usar variables de entorno reales.
// Para desarrollo, podemos usar Ethereal o un log en consola si no hay credenciales.
const transporter = nodemailer.createTransport({
    host: process.env.SMTP_HOST || 'smtp.gmail.com',
    port: process.env.SMTP_PORT || 587,
    secure: false, // true for 465, false for other ports
    auth: {
        user: process.env.SMTP_USER,
        pass: process.env.SMTP_PASS,
    },
});

/**
 * Envía un correo electrónico genérico.
 * @param {string} to - Destinatario
 * @param {string} subject - Asunto
 * @param {string} html - Cuerpo del correo en HTML
 */
export const sendEmail = async (to, subject, html) => {
    try {
        if (!process.env.SMTP_USER) {
            console.log('⚠️ SMTP no configurado. Simulando envío de correo:');
            console.log(`   To: ${to}`);
            console.log(`   Subject: ${subject}`);
            console.log('   Body preview:', html.substring(0, 50) + '...');
            return;
        }

        const info = await transporter.sendMail({
            from: process.env.SMTP_FROM || '"Gestor Talleres" <noreply@talleres.com>',
            to,
            subject,
            html,
        });

        console.log(`📧 Correo enviado: ${info.messageId}`);
    } catch (error) {
        console.error('❌ Error enviando correo:', error);
    }
};

/**
 * Notifica a un centro sobre sus asignaciones.
 * @param {string} centerEmail - Email del centro
 * @param {string} centerName - Nombre del centro
 * @param {string} periodName - Nombre del periodo/convocatoria (opcional)
 * @param {Array} assignments - Lista de asignaciones { workshopTitle, studentName, status }
 */
export const sendAssignmentNotification = async (centerEmail, centerName, assignments) => {
    // Agrupar por taller
    const byWorkshop = {};
    assignments.forEach(a => {
        if (!byWorkshop[a.workshopTitle]) byWorkshop[a.workshopTitle] = [];
        byWorkshop[a.workshopTitle].push(a);
    });

    let htmlContent = `
        <div style="font-family: Arial, sans-serif; color: #333;">
            <h2 style="color: #2c3e50;">Resultados de Asignación de Talleres</h2>
            <p>Hola <strong>${centerName}</strong>,</p>
            <p>El proceso de asignación automática ha finalizado. Aquí tienes el resumen de tus alumnos aceptados:</p>
            <hr style="border: 0; border-top: 1px solid #eee; margin: 20px 0;">
    `;

    if (assignments.length === 0) {
        htmlContent += `<p>No se han asignado plazas en esta convocatoria.</p>`;
    } else {
        for (const [workshop, students] of Object.entries(byWorkshop)) {
            htmlContent += `
                <div style="background: #f9f9f9; padding: 15px; border-radius: 5px; margin-bottom: 15px;">
                    <h3 style="margin-top: 0; color: #d35400;">${workshop}</h3>
                    <ul style="padding-left: 20px;">
            `;
            students.forEach(s => {
                htmlContent += `<li><strong>${s.studentName}</strong> - <span style="color: green;">Asignado</span></li>`;
            });
            htmlContent += `
                    </ul>
                </div>
            `;
        }
    }

    htmlContent += `
            <p style="margin-top: 30px; font-size: 0.9em; color: #777;">
                Puedes consultar el detalle completo en la plataforma.
            </p>
        </div>
    `;

    await sendEmail(centerEmail, `Asignación de Talleres - ${centerName}`, htmlContent);
};
