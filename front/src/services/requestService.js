import apiClient from './apiClient'

export const create = async (data) => {
  const response = await apiClient.post('/requests', data)
  return response.data
}

export const getMyRequests = async () => {
  const response = await apiClient.get('/requests/my-requests')
  return response.data
}
