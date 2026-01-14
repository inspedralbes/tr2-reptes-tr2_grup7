import apiClient from './apiClient.js'

export const adminService = {
  async getAdminStats() {
    const response = await apiClient.get('/admin/stats')
    return response.data
  },

  async getAllRequests() {
    const response = await apiClient.get('/admin/requests')
    return response.data
  },

  async getPendingRequests() {
    const response = await apiClient.get('/admin/pending-requests')
    return response.data
  },

  async getAvailableTeachers() {
    const response = await apiClient.get('/admin/teachers')
    return response.data
  },

  async getTopWorkshops() {
    const response = await apiClient.get('/admin/top-workshops')
    return response.data
  },

  async acceptRequest(requestId) {
    const response = await apiClient.put(`/admin/requests/${requestId}/accept`)
    return response.data
  },

  async rejectRequest(requestId) {
    const response = await apiClient.put(`/admin/requests/${requestId}/reject`)
    return response.data
  },

  async deleteRequest(requestId) {
    const response = await apiClient.delete(`/admin/requests/${requestId}`)
    return response.data
  },

  async manualAssign(assignmentData) {
    const response = await apiClient.post('/admin/assign', assignmentData)
    return response.data
  },

  async autoAssign() {
    const response = await apiClient.post('/admin/auto-assign')
    return response.data
  }
}