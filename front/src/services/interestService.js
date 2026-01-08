import apiClient from './apiClient'

export const getAllByCenter = async () => {
  // El ID del centro lo saca el Back del token (req.user.id)
  const response = await apiClient.get('/interests/center')
  return response.data
}

export const create = async (idStudent, idWorkshop) => {
  // Solo enviamos el estudiante y el taller.
  // El teacher_id lo pone el Back automáticamente desde el token.
  const response = await apiClient.post('/interests', {
    id_student: idStudent,
    id_workshop: idWorkshop,
  })
  return response.data
}
