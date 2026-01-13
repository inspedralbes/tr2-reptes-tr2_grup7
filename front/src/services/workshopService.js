import apiClient from './apiClient'

export const getAll = async () => {
  const response = await apiClient.get('/workshops')
  return response.data
}

export const getById = async (id) => {
  const response = await apiClient.get(`/workshops/${id}`)
  return response.data
}

export const create = async (workshopData) => {
  // workshopData: { title, short_description, max_slots, category, schedule, duration_hours, teacher_id }
  const response = await apiClient.post('/workshops', workshopData)
  return response.data
}

export const update = async (id, workshopData) => {
  const response = await apiClient.put(`/workshops/${id}`, workshopData)
  return response.data
}

export const remove = async (id) => {
  const response = await apiClient.delete(`/workshops/${id}`)
  return response.data
}

