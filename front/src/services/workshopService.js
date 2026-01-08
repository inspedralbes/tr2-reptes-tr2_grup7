import apiClient from './apiClient'

export const getAll = async () => {
  const response = await apiClient.get('/tallers')
  return response.data
}

export const getById = async (id) => {
  const response = await apiClient.get(`/tallers/${id}`)
  return response.data
}

export const create = async (workshopData) => {
  // workshopData: { title, short_description, max_slots, category, schedule, duration_hours, teacher_id }
  const response = await apiClient.post('/tallers', workshopData)
  return response.data
}

export const update = async (id, workshopData) => {
  const response = await apiClient.put(`/tallers/${id}`, workshopData)
  return response.data
}

export const remove = async (id) => {
  const response = await apiClient.delete(`/tallers/${id}`)
  return response.data
}
