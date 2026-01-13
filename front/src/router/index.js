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
        },
        {
          path: 'centro/catalogo',
          name: 'centro-catalogo',
          component: () => import('../components/shared/CatalogoTalleres.vue'),
        },
        {
          path: 'centro/nueva-peticion',
          name: 'centro-nueva-peticion',
          component: () => import('../components/views/centre/NuevaPeticion.vue'),
        },
        // Rutas de Administración
        {
          path: 'admin/panel',
          name: 'admin-panel',
          component: () => import('../components/views/admin/PanelAdmin.vue'),
        },
        {
          path: 'admin/peticiones',
          name: 'admin-peticiones',
          component: () => import('../components/views/admin/GestionPeticiones.vue'),
        },
        {
          path: 'admin/asignacion',
          name: 'admin-asignacion',
          component: () => import('../components/views/admin/HerramientaAsignacion.vue'),
        },
        // Rutas de Profesor
        {
          path: 'profesor/talleres',
          name: 'profesor-talleres',
          component: () => import('../components/views/profesor/PanelProfesor.vue'),
        },
        {
          path: 'profesor/detalle/:id?',
          name: 'profesor-detalle',
          component: () => import('../components/shared/DetalleTaller.vue'),
        },
      ],
    },
  ],
})

// Navigation Guard - Protege las rutas según autenticación
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
