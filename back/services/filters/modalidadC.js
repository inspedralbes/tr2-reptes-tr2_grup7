export const filtrosC = {
  exclusiones: [
    (alumno) => alumno.has_legal_papers === true, // Note: Logic seems inverted in original? 'has_legal_papers' means they HAVE them. Generally filtered if they DON'T. But kept as is per existing file.
    (alumno) => alumno.eso_grade === 3 || alumno.eso_grade === 4,
    (alumno, taller) => {
      // "Talent femení" check
      if (taller.title && taller.title.includes("Talent femení")) return alumno.gender === 'F';
      return true;
    }
  ],
  prioridades: [
    (alumno, taller, config) => { 
        const enabled = config?.risk_enabled ?? true;
        if (!enabled) return 0;
        return (alumno.risk_level || 0) * 1000000;
    },
    (alumno, taller, config) => {
        const enabled = config?.eso4_enabled ?? true;
        if (!enabled) return 0;
        return alumno.eso_grade === 4 ? 10000 : 0;
    },
    (alumno, taller, config) => {
        const enabled = config?.age_enabled ?? true;
        if (!enabled) return 0;
        if (!alumno.birth_date) return 0;
        const daysAlive = (Date.now() - new Date(alumno.birth_date).getTime()) / (1000 * 60 * 60 * 24);
        return Math.floor(daysAlive);
    }
  ]
};

export const assignTeachers = async (workshop, participatingCenters, globalLoad, db, config = {}) => {
    // ==============================================================
    // STRICT FAIRNESS ALGORITHM (Global Load -> Specialty -> Conflict)
    // ==============================================================
    
    // 1. Prepare Candidates with Detailed Metrics
    const candidates = [];
    
    for (const centerId of participatingCenters) {
        // Fetch teachers for this center
        const tParams = [centerId];
        const tQuery = `SELECT * FROM teachers WHERE id_center_assigned = $1`;
        const tRes = await db.query(tQuery, tParams);
        const teachers = tRes.rows;
        
        // If center has no teachers, they can't participate in teacher assignment
        if (teachers.length === 0) continue;

        // Find Best Teacher (Specialty Match > General > First Available)
        // Note: workshop.category should match teacher.specialty
        // Assuming workshop.category is e.g. "Tecnologia", "Científic", etc.
        let exactMatch = teachers.find(t => t.specialty && t.specialty === workshop.category);
        let generalMatch = teachers.find(t => t.specialty === 'General');
        
        let selectedTeacher = exactMatch || generalMatch || teachers[0];
        
        candidates.push({
             centerId,
             teacher: selectedTeacher,
             load: globalLoad[centerId] || 0, // Current Global Load
             hasSpecialty: !!exactMatch,      // Priority Flag
             teacherName: `${selectedTeacher.first_name} ${selectedTeacher.last_name}`
        });
    }

    // 2. Sort Candidates (The "No Luck" Sort)
    candidates.sort((a, b) => {
        // Priority 1: Lower Load is better (if enabled)
        if (config.teacher_load_enabled !== false) {
             if (a.load !== b.load) return a.load - b.load; 
        }
        
        // Priority 2: Has Specialty is better (if enabled)
        if (config.teacher_specialty_enabled !== false) {
             if (a.hasSpecialty !== b.hasSpecialty) return b.hasSpecialty - a.hasSpecialty; // true=1, false=0
        }
        
        return 0; // Absolute Tie
    });

    // 3. Determine how many we need
    const existing = await db.query(`SELECT COUNT(*) as c FROM workshop_teachers WHERE id_workshop = $1`, [workshop.id_workshop]);
    const currentCount = parseInt(existing.rows[0].c);
    const needed = 2; // Fixed requirement for Modality C
    const slotsToFill = Math.max(0, needed - currentCount);

    const actions = [];
    if (slotsToFill === 0) return actions;

    // 4. Check for Boundary Conflicts (The "Manual Validation" Trigger)
    // If we need N slots, we look at candidate[N-1] (last in) and candidate[N] (first out).
    // If they are tied, we cannot decide deterministically -> CONFLICT.
    
    let hasConflict = false;
    // We only care if we have enough candidates to fill slots vs overflow
    if (candidates.length > slotsToFill) {
        const lastIn = candidates[slotsToFill - 1];  // The one who gets the last spot
        const firstOut = candidates[slotsToFill];    // The one who just missed it
        
        // Are they indistinguishable?
        if (lastIn.load === firstOut.load && lastIn.hasSpecialty === firstOut.hasSpecialty) {
            hasConflict = true;
            console.warn(`⚠️ CONFLICT DETECTED in ${workshop.title}: Candidates tied at boundary (Load ${lastIn.load})`);
        }
    }

    // 5. Assign
    for (let i = 0; i < slotsToFill; i++) {
        if (i >= candidates.length) break;
        const cand = candidates[i];
        
        actions.push({
            type: 'ASSIGN_TEACHER',
            workshopId: workshop.id_workshop,
            teacherId: cand.teacher.id_user,
            teacherName: cand.teacherName,
            centerId: cand.centerId,
            // Logic explanation for the UI
            reason: hasConflict 
                ? `CONFLICT: Tied with other centers (Load: ${cand.load})` 
                : `Fairness (Load: ${cand.load}, Spec: ${cand.hasSpecialty ? 'Yes' : 'No'})`,
            conflict: hasConflict // Frontend should highlight this
        });
        
        // CRITICAL: Update Global Load immediately so next workshop sees the new load
        globalLoad[cand.centerId] = (globalLoad[cand.centerId] || 0) + 1;
    }
    
    return actions;
};