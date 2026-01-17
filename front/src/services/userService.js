import apiClient from './apiClient'

export const getAll = async () => {
  const response = await apiClient.get('/users')
  return response.data
}

export const getById = async (id) => {
  const response = await apiClient.get(`/users/${id}`)
  return response.data
}

export const create = async (userData) => {
  // userData: { first_name, last_name, email, password, role, id_center }
  const response = await apiClient.post('/users', userData)
  return response.data
}

export const update = async (id, userData) => {
  const response = await apiClient.put(`/users/${id}`, userData)
  return response.data
}

export const remove = async (id) => {
  const response = await apiClient.delete(`/users/${id}`)
  return response.data
}
