import apiClient from './apiClient'

export const getAll = async () => {
  const response = await apiClient.get('/centres')
  return response.data
}

export const getById = async (id) => {
  const response = await apiClient.get(`/centres/${id}`)
  return response.data
}

export const create = async (centreData) => {
  // centreData: { center_name, center_code, address, phone }
  const response = await apiClient.post('/centres', centreData)
  return response.data
}

export const update = async (id, centreData) => {
  const response = await apiClient.put(`/centres/${id}`, centreData)
  return response.data
}

export const remove = async (id) => {
  const response = await apiClient.delete(`/centres/${id}`)
  return response.data
}

export const getTeachers = async (id) => {
  const response = await apiClient.get(`/centres/${id}/teachers`)
  return response.data
}

export const getStatistics = async (id) => {
  const response = await apiClient.get(`/centres/${id}/stats`)
  return response.data
}

export const getStudents = async (id) => {
  const response = await apiClient.get(`/centres/${id}/students`)
  return response.data
}

export const getRequests = async (id) => {
  const response = await apiClient.get(`/centres/${id}/requests`)
  return response.data
}

// Student CRUD
export const updateStudent = async (centreId, studentId, data) => {
  const response = await apiClient.put(`/centres/${centreId}/students/${studentId}`, data)
  return response.data
}

export const deleteStudent = async (centreId, studentId) => {
  const response = await apiClient.delete(`/centres/${centreId}/students/${studentId}`)
  return response.data
}
