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

  async getRequestById(requestId) {
    const response = await apiClient.get(`/admin/requests/${requestId}`)
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

  async getAllCenters() {
    const response = await apiClient.get('/admin/centers')
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

  async updateRequest(requestId, requestData) {
    const response = await apiClient.put(`/admin/requests/${requestId}`, requestData)
    return response.data
  },

  async manageRequestStudents(requestId, acceptedStudents, assignedSlots) {
    const response = await apiClient.put(`/admin/requests/${requestId}/students`, { 
      acceptedStudents,
      assignedSlots 
    })
    return response.data
  },

  async manualAssign(assignmentData) {
    const response = await apiClient.post('/admin/assign', assignmentData)
    return response.data
  },

  async autoAssign() {
    const response = await apiClient.post('/admin/auto-assign')
    return response.data
  },

  // Teacher management
  async getTeacherById(teacherId) {
    const response = await apiClient.get(`/admin/teachers/${teacherId}`)
    return response.data
  },

  async updateTeacher(teacherId, teacherData) {
    const response = await apiClient.put(`/admin/teachers/${teacherId}`, teacherData)
    return response.data
  },

  async assignCenterToTeacher(teacherId, centerId) {
    const response = await apiClient.put(`/admin/teachers/${teacherId}/assign-center`, { centerId })
    return response.data
  },

  async toggleTeacherActive(teacherId) {
    const response = await apiClient.put(`/admin/teachers/${teacherId}/toggle-active`)
    return response.data
  },

  async runMatching(config) {
    const response = await apiClient.post('/assign/run-matching', config)
    return response.data
  },

  async confirmMatching(proposalId) {
    const response = await apiClient.post('/assign/confirm-matching', { proposalId })
    return response.data
  },
}
