export const filtrosA = {
  exclusiones: [
    (alumno) => alumno.has_legal_papers === true,
    (alumno) => alumno.eso_grade >= 1 && alumno.eso_grade <= 4
  ],
  prioridades: [
  ]
};

export const assignTeachers = async (workshop, participatingCenters, globalLoad, db) => {
    const actions = [];
    const existing = await db.query(`SELECT COUNT(*) as c FROM workshop_teachers WHERE id_workshop = $1`, [workshop.id_workshop]);
    let teachersAssignedCount = parseInt(existing.rows[0].c);

    for (const centerId of participatingCenters) {
        if (teachersAssignedCount >= 2) break;

        const teacherRes = await db.query(`SELECT * FROM teachers WHERE id_center_assigned = $1`, [centerId]);
        const teachers = teacherRes.rows;
        if (!teachers.length) continue;
        
        const selectedTeacher = teachers[0];
        
        actions.push({
            type: 'ASSIGN_TEACHER',
            workshopId: workshop.id_workshop,
            teacherId: selectedTeacher.id_user,
            teacherName: selectedTeacher.first_name,
            centerId: centerId,
            reason: 'Mod A Simple'
        });
        teachersAssignedCount++;
    }
    return actions;
};