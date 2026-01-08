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
