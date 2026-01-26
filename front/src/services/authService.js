import apiClient from './apiClient'

export const login = async (email, password, rememberMe = false) => {
  try {
    // Enviamos email y password al endpoint de tu authRoutes
    const response = await apiClient.post('/auth/login', { email, password })

    // Si hay token, persistimos la sesión en el navegador
    if (response.data.token) {
      // 1. Limpiamos cualquier sesión previa para evitar conflictos
      localStorage.removeItem('token')
      localStorage.removeItem('user')
      sessionStorage.removeItem('token')
      sessionStorage.removeItem('user')

      // 2. Guardamos en el storage seleccionado
      const storage = rememberMe ? localStorage : sessionStorage
      storage.setItem('token', response.data.token)
      storage.setItem('user', JSON.stringify(response.data.user))
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
  sessionStorage.removeItem('token')
  sessionStorage.removeItem('user')
  // Opcional: recargar o redirigir
  window.location.href = '/login'
}

export const getCurrentUser = () => {
  const user = sessionStorage.getItem('user') || localStorage.getItem('user')
  return user ? JSON.parse(user) : null
}
