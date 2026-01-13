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
    (alumno) => (alumno.is_at_risk ? 1000 : 0)
  ]
};