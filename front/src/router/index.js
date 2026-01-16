import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    // Ruta de Login
    {
      path: '/login',
      name: 'login',
      component: () => import('../components/general/login.vue'),
    },
    // Layout principal con rutas protegidas
    {
      path: '/',
      component: () => import('../components/general/MainLayout.vue'),
      children: [
        // Rutas de Centro Educativo
        {
          path: 'centro/panel',
          name: 'centro-panel',
          component: () => import('../components/views/centre/PanelCentro.vue'),
          meta: { roles: ['CENTER', 'ADMIN'] },
        },
        {
          path: 'centro/catalogo',
          name: 'centro-catalogo',
          component: () => import('../components/shared/CatalogoTalleres.vue'),
          meta: { roles: ['CENTER', 'ADMIN', 'TEACHER'] },
        },
        {
          path: 'centro/nueva-peticion',
          name: 'centro-nueva-peticion',
          component: () => import('../components/views/centre/NuevaPeticion.vue'),
        },
        {
          path: 'centro/alumnos',
          name: 'centro-alumnos',
          component: () => import('../components/views/centre/LlistaAlumnes.vue'),
        },
        {
          path: 'centro/talleres',
          name: 'centro-talleres',
          component: () => import('../components/views/centre/InfoTalleres.vue'),
        },
        {
          path: 'centro/historial',
          name: 'centro-historial',
          component: () => import('../components/views/centre/HistorialPeticiones.vue'),
          meta: { roles: ['CENTER', 'ADMIN'] },
        },
        {
          path: 'centro/info',
          name: 'centro-info',
          component: () => import('../components/shared/SotaConstruccio.vue'),
          meta: { roles: ['CENTER', 'ADMIN'] },
        },

        // Rutas de Administración
        {
          path: 'admin/panel',
          name: 'admin-panel',
          component: () => import('../components/views/admin/PanelAdmin.vue'),
          meta: { roles: ['ADMIN'] },
        },
        {
          path: 'admin/peticiones',
          name: 'admin-peticiones',
          component: () => import('../components/views/admin/GestionPeticiones.vue'),
          meta: { roles: ['ADMIN'] },
        },
        {
          path: 'admin/asignacion',
          name: 'admin-asignacion',
          component: () => import('../components/views/admin/HerramientaAsignacion.vue'),
        },
        {
          path: 'admin/profesores',
          name: 'admin-profesores',
          component: () => import('../components/views/admin/GestionProfesores.vue'),
        },
        {
          path: 'admin/talleres',
          name: 'admin-talleres',
          component: () => import('../components/views/admin/GestionTalleres.vue'),
        },
        {
          path: 'admin/centros',
          name: 'admin-centros',
          component: () => import('../components/views/admin/GestionCentros.vue'),
        },
        // Rutas de Profesor
        {
          path: 'profesor/talleres',
          name: 'profesor-talleres',
          component: () => import('../components/views/profesor/PanelProfesor.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] },
        },
        {
          path: 'profesor/detalle/:id?',
          name: 'profesor-detalle',
          component: () => import('../components/shared/DetalleTaller.vue'),
          meta: { roles: ['TEACHER', 'ADMIN', 'CENTER'] },
        },
        {
          path: 'profesor/historial',
          name: 'profesor-historial',
          component: () => import('../components/views/profesor/HistorialProfesor.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] },
        },
        {
          path: 'profesor/sessions',
          name: 'profesor-sessions',
          component: () => import('../components/views/profesor/SessionsProfesor.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] },
        },
        {
          path: 'profesor/avaluacions',
          name: 'profesor-avaluacions',
          component: () => import('../components/views/profesor/AvaluacionsProfesor.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] },
        },
        {
          path: 'profesor/asistencia/:id',
          name: 'profesor-asistencia',
          component: () => import('../components/views/profesor/ControlAsistencia.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] },
        },
        {
          path: 'profesor/materials',
          name: 'profesor-materials',
          component: () => import('../components/views/profesor/MaterialesProfesor.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] },
        },
      ],
    },
  ],
})

// Navigation Guard - Protege las rutas según autenticación y roles
router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('token')
  const user = localStorage.getItem('user')

  // Si intenta acceder a / sin estar autenticado, ir a login
  if (to.path === '/' && !token) {
    next('/login')
  }
  // Si está en / y autenticado, redirigir al panel correspondiente
  else if (to.path === '/' && token && user) {
    const userData = JSON.parse(user)
    if (userData.role === 'ADMIN') {
      next('/admin/panel')
    } else if (userData.role === 'CENTER') {
      next('/centro/panel')
    } else if (userData.role === 'TEACHER') {
      next('/profesor/talleres')
    } else {
      next('/login')
    }
  }
  // Si intenta acceder a una ruta protegida sin estar autenticado
  else if (to.path !== '/login' && !token) {
    next('/login')
  }
  // Si está autenticado e intenta ir a login, redirigir a su panel
  else if (to.path === '/login' && token && user) {
    const userData = JSON.parse(user)
    if (userData.role === 'ADMIN') {
      next('/admin/panel')
    } else if (userData.role === 'CENTER') {
      next('/centro/panel')
    } else if (userData.role === 'TEACHER') {
      next('/profesor/talleres')
    } else {
      next()
    }
  } else {
    next()
  }
})

export default router
