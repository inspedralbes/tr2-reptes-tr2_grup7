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
    // Rutas de Centro Educativo
    {
      path: '/centro',
      children: [
        {
          path: 'panel',
          name: 'centro-panel',
          component: () => import('../components/views/centre/PanelCentro.vue')
        },
        {
          path: 'catalogo',
          name: 'centro-catalogo',
          component: () => import('../components/shared/CatalogoTalleres.vue')
        },
        {
          path: 'nueva-peticion',
          name: 'centro-nueva-peticion',
          component: () => import('../components/views/centre/NuevaPeticion.vue')
        }
      ]
    },
    // Rutas de Administración
    {
      path: '/admin',
      children: [
        {
          path: 'panel',
          name: 'admin-panel',
          component: () => import('../components/views/admin/PanelAdmin.vue')
        },
        {
          path: 'peticiones',
          name: 'admin-peticiones',
          component: () => import('../components/views/admin/GestionPeticiones.vue')
        },
        {
          path: 'asignacion',
          name: 'admin-asignacion',
          component: () => import('../components/views/admin/HerramientaAsignacion.vue')
        }
      ]
    },
    // Rutas de Profesor
    {
      path: '/profesor',
      children: [
        {
          path: 'talleres',
          name: 'profesor-talleres',
          component: () => import('../components/views/profesor/PanelProfesor.vue')
        },
        {
          path: 'detalle/:id?',
          name: 'profesor-detalle',
          component: () => import('../components/shared/DetalleTaller.vue')
        }
      ]
    },
    // Ruta por defecto
    {
      path: '/',
      redirect: '/login'
    }
  ],
})

// Navigation Guard - Protege las rutas según autenticación
router.beforeEach((to, from, next) => {
  const token = localStorage.getItem('token')
  const user = localStorage.getItem('user')
  
  // Si intenta acceder a una ruta protegida sin estar autenticado
  if (to.path !== '/login' && !token) {
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
  }
  else {
    next()
  }
})

export default router
