export const filtrosC = {
  exclusiones: [
    (alumno) => alumno.has_legal_papers === true,
    (alumno) => alumno.eso_grade === 3 || alumno.eso_grade === 4,
    (alumno, taller) => {
      if (taller.title.includes("Talent femení")) return alumno.gender === 'F';
      return true;
    }
  ],
  prioridades: [
    (alumno, taller, config) => { // Use config from params
        const enabled = config?.risk_enabled ?? true; // Default to true if not specified
        if (!enabled) return 0;
        
        // New Logic: risk_level is 0-5. Multiply by base 1M.
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