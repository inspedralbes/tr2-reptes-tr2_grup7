export const filtrosA = {
  exclusiones: [
    (alumno) => alumno.has_legal_papers === true,
    (alumno) => alumno.eso_grade >= 1 && alumno.eso_grade <= 4
  ],
  prioridades: [
    (alumno) => 0 // En A prima el orden de inscripción [cite: 43]
  ]
};