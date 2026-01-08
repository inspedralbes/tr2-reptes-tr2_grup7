import apiClient from './apiClient'

export const login = async (email, password) => {
  try {
    // Enviamos email y password al endpoint de tu authRoutes
    const response = await apiClient.post('/auth/login', { email, password })

    // Si hay token, persistimos la sesión en el navegador
    if (response.data.token) {
      localStorage.setItem('token', response.data.token)
      localStorage.setItem('user', JSON.stringify(response.data.user))
    }

    return response.data
  } catch (error) {
    // Capturamos el "Invalid credentials" o "Internal server error"
    throw error.response?.data || { error: 'Error de conexión con el servidor' }
  }
}

export const logout = () => {
  localStorage.removeItem('token')
  localStorage.removeItem('user')
  // Opcional: recargar o redirigir
  window.location.href = '/login'
}

export const getCurrentUser = () => {
  const user = localStorage.getItem('user')
  return user ? JSON.parse(user) : null
}
