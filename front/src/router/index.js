import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    // Ruta de Login
    {
      path: '/login',
      name: 'login',
      component: () => import('../components/general/login.vue')
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
          meta: { roles: ['CENTER', 'ADMIN'] }
        },
        {
          path: 'centro/catalogo',
          name: 'centro-catalogo',
          component: () => import('../components/shared/CatalogoTalleres.vue'),
          meta: { roles: ['CENTER', 'ADMIN', 'TEACHER'] }
        },
        {
          path: 'centro/nueva-peticion',
          name: 'centro-nueva-peticion',
          component: () => import('../components/views/centre/NuevaPeticion.vue'),
          meta: { roles: ['CENTER', 'ADMIN'] }
        },
        {
          path: 'centro/info',
          name: 'centro-info',
          component: () => import('../components/shared/SotaConstruccio.vue'),
          meta: { roles: ['CENTER', 'ADMIN'] }
        },
        {
          path: 'centro/alumnos',
          name: 'centro-alumnos',
          component: () => import('../components/shared/SotaConstruccio.vue'),
          meta: { roles: ['CENTER', 'ADMIN'] }
        },
        {
          path: 'centro/peticiones',
          name: 'centro-mis-peticiones',
          component: () => import('../components/shared/SotaConstruccio.vue'),
          meta: { roles: ['CENTER', 'ADMIN'] }
        },
        {
          path: 'centro/historial',
          name: 'centro-historial',
          component: () => import('../components/shared/SotaConstruccio.vue'),
          meta: { roles: ['CENTER', 'ADMIN'] }
        },
        {
          path: 'centro/checklist',
          name: 'centro-checklist',
          component: () => import('../components/shared/SotaConstruccio.vue'),
          meta: { roles: ['CENTER', 'ADMIN'] }
        },
        {
          path: 'centro/finalizados',
          name: 'centro-finalizados',
          component: () => import('../components/shared/SotaConstruccio.vue'),
          meta: { roles: ['CENTER', 'ADMIN'] }
        },

        // Rutas de Administración
        {
          path: 'admin/panel',
          name: 'admin-panel',
          component: () => import('../components/views/admin/PanelAdmin.vue'),
          meta: { roles: ['ADMIN'] }
        },
        {
          path: 'admin/peticiones',
          name: 'admin-peticiones',
          component: () => import('../components/views/admin/GestionPeticiones.vue'),
          meta: { roles: ['ADMIN'] }
        },
        {
          path: 'admin/asignacion',
          name: 'admin-asignacion',
          component: () => import('../components/views/admin/HerramientaAsignacion.vue'),
          meta: { roles: ['ADMIN'] }
        },
        {
          path: 'admin/estadisticas',
          name: 'admin-stats',
          component: () => import('../components/shared/SotaConstruccio.vue'),
          meta: { roles: ['ADMIN'] }
        },
        {
          path: 'admin/centros',
          name: 'admin-centros',
          component: () => import('../components/shared/SotaConstruccio.vue'),
          meta: { roles: ['ADMIN'] }
        },

        // Rutas de Profesor
        {
          path: 'profesor/talleres',
          name: 'profesor-talleres',
          component: () => import('../components/views/profesor/PanelProfesor.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] }
        },
        {
          path: 'profesor/detalle/:id?',
          name: 'profesor-detalle',
          component: () => import('../components/shared/DetalleTaller.vue'),
          meta: { roles: ['TEACHER', 'ADMIN', 'CENTER'] }
        },
        {
          path: 'profesor/historial',
          name: 'profesor-historial',
          component: () => import('../components/views/profesor/HistorialProfesor.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] }
        },
        {
          path: 'profesor/sessions',
          name: 'profesor-sessions',
          component: () => import('../components/views/profesor/SessionsProfesor.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] }
        },
        {
          path: 'profesor/avaluacions',
          name: 'profesor-avaluacions',
          component: () => import('../components/views/profesor/AvaluacionsProfesor.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] }
        },
        {
          path: 'profesor/asistencia/:id',
          name: 'profesor-asistencia',
          component: () => import('../components/views/profesor/ControlAsistencia.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] }
        },
        {
          path: 'profesor/materials',
          name: 'profesor-materials',
          component: () => import('../components/views/profesor/MaterialesProfesor.vue'),
          meta: { roles: ['TEACHER', 'ADMIN'] }
        }
      ]
    }
  ],
})

// Navigation Guard - Protege las rutas según autenticación y roles
router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('token')
  const userStr = localStorage.getItem('user')
  const userData = userStr ? JSON.parse(userStr) : null
  
  // 1. Si intenta acceder a / e identificar el panel de inicio
  if (to.path === '/') {
    if (!token || !userData) return next('/login')
    
    if (userData.role === 'ADMIN') return next('/admin/panel')
    if (userData.role === 'CENTER') return next('/centro/panel')
    if (userData.role === 'TEACHER') return next('/profesor/talleres')
    return next('/login')
  }

  // 2. Ruta de Login: si ya está logueado, redirigir a su panel
  if (to.path === '/login') {
    if (token && userData) {
      if (userData.role === 'ADMIN') return next('/admin/panel')
      if (userData.role === 'CENTER') return next('/centro/panel')
      if (userData.role === 'TEACHER') return next('/profesor/talleres')
    }
    return next()
  }

  // 3. Rutas Protegidas
  if (!token || !userData) {
    return next('/login')
  }

  // 4. Verificación de ROL (RBAC)
  if (to.meta.roles && !to.meta.roles.includes(userData.role)) {
    console.warn(`🛑 Accés denegat per al rol ${userData.role} a la ruta ${to.path}`);
    
    // Redirigir al panel base del usuario si intenta entrar donde no debe
    if (userData.role === 'ADMIN') return next('/admin/panel')
    if (userData.role === 'CENTER') return next('/centro/panel')
    if (userData.role === 'TEACHER') return next('/profesor/talleres')
    return next('/login')
  }

  next()
})

export default router
