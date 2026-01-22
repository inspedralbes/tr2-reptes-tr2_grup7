import apiClient from './apiClient'

export const getActive = async () => {
    const response = await apiClient.get('/periods/active')
    return response.data
}

export const getAll = async () => {
    const response = await apiClient.get('/periods')
    return response.data
}
