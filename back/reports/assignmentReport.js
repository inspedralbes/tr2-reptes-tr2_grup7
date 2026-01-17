import db from "../data/db.js";

export const generateAssignmentReportHtml = async () => {
    const result = await db.query(`
        SELECT 
            w.title as workshop, 
            w.modalidad,
            c.center_name, 
            s.first_name, s.last_name,
            we.enrolled_at
        FROM workshop_enrollments we
        JOIN workshops w ON we.id_workshop = w.id_workshop
        JOIN students s ON we.id_student = s.id_user
        JOIN centers c ON s.id_center_assigned = c.id_user
        ORDER BY w.title, c.center_name, s.last_name
    `);

    const date = new Date().toLocaleDateString('es-ES', { 
        year: 'numeric', month: 'long', day: 'numeric', hour: '2-digit', minute: '2-digit' 
    });

    if (result.rows.length === 0) {
        return `
            <html>
                <body style="font-family: Arial, sans-serif; padding: 40px; text-align: center; color: #666;">
                    <h1>Informe de Asignación</h1>
                    <p>No se han generado asignaciones en este proceso.</p>
                </body>
            </html>
        `;
    }

    // Groupping
    const grouped = {};
    result.rows.forEach(row => {
        if (!grouped[row.workshop]) grouped[row.workshop] = [];
        grouped[row.workshop].push(row);
    });

    // HTML Construction
    let html = `
    <!DOCTYPE html>
    <html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Informe de Asignación</title>
        <style>
            body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; max-width: 1000px; margin: 0 auto; padding: 20px; color: #333; }
            h1 { color: #2c3e50; border-bottom: 2px solid #3498db; padding-bottom: 10px; }
            .meta { color: #7f8c8d; margin-bottom: 30px; font-size: 0.9em; }
            .workshop-card { background: #f9f9f9; border: 1px solid #e0e0e0; border-radius: 8px; margin-bottom: 25px; overflow: hidden; page-break-inside: avoid; }
            .workshop-header { background: #34495e; color: white; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center; }
            .workshop-title { font-size: 1.2em; font-weight: bold; }
            .workshop-badge { background: #3498db; font-size: 0.8em; padding: 4px 8px; border-radius: 4px; }
            table { width: 100%; border-collapse: collapse; }
            th, td { padding: 12px 20px; text-align: left; border-bottom: 1px solid #ddd; }
            th { background-color: #ecf0f1; color: #2c3e50; font-weight: 600; font-size: 0.9em; }
            tr:last-child td { border-bottom: none; }
            .center-name { font-weight: 600; color: #2980b9; }
            .footer { margin-top: 50px; border-top: 1px solid #eee; padding-top: 20px; text-align: center; color: #95a5a6; font-size: 0.8em; }
            @media print {
                body { padding: 0; }
                .workshop-card { border: 1px solid #ccc; }
            }
        </style>
    </head>
    <body>
        <h1>Informe de Resolución de Asignación</h1>
        <div class="meta">
            Generado el: ${date}<br>
            Consorci d'Educació de Barcelona
        </div>
    `;

    for (const [workshopName, rows] of Object.entries(grouped)) {
        html += `
        <div class="workshop-card">
            <div class="workshop-header">
                <span class="workshop-title">${workshopName}</span>
                <span class="workshop-badge">Modalidad ${rows[0].modalidad}</span>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Centro Educativo</th>
                        <th>Alumno</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
        `;

        rows.forEach(row => {
            html += `
                <tr>
                    <td class="center-name">${row.center_name}</td>
                    <td>${row.first_name} ${row.last_name}</td>
                    <td><span style="color: green;">✔ Asignado</span></td>
                </tr>
            `;
        });

        html += `
                </tbody>
            </table>
        </div>
        `;
    }

    html += `
        <div class="footer">
            Documento generado automáticamente por el sistema de gestión de talleres.
        </div>
    </body>
    </html>
    `;

    return html;
};
