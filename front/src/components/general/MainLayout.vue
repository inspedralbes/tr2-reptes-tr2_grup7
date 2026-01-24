<template>
  <div class="min-h-screen" style="background-color: var(--background-alt)">
    <!-- Capçalera Superior - Navegació Principal Horizontal -->
    <header
      class="header"
      style="position: sticky; top: 0; z-index: 100; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1)"
    >
      <div class="flex items-center justify-between px-6 py-3">
        <!-- Logo y Título -->
        <div class="flex items-center gap-4">
          <img src="/img/logo.jpg" alt="Logo" style="height: 70px" />
          <div>
            <h1 class="text-lg font-semibold text-white">Sistema Tallers Educatius</h1>
            <p class="text-xs text-white" style="opacity: 0.85">Consorci d'Educació de Barcelona</p>
          </div>
        </div>

        <!-- User Info & Logout -->
        <div class="flex items-center gap-4">
          <div
            class="flex items-center gap-3"
            style="border-left: 1px solid rgba(255, 255, 255, 0.2); padding-left: 1.5rem"
          >
            <div class="user-profile-badge">
              {{ getRoleInitial() }}
            </div>
            <div class="flex flex-row items-center gap-2">
              <span class="text-xs text-white opacity-75">Benvingut/da</span>
              <span class="text-sm text-white font-semibold">{{ getRoleName() }}</span>
            </div>
          </div>
          <button @click="handleLogout" class="logout-button" title="Tancar sessió">
            <LogOut :size="16" />
            <span>Sortir</span>
          </button>
        </div>
      </div>

      <!-- Navegación Principal Horizontal -->
      <div
        style="background-color: rgba(0, 0, 0, 0.1); border-top: 1px solid rgba(255, 255, 255, 0.1)"
      >
        <nav class="flex px-6">
          <button
            v-for="section in mainSections"
            :key="section.id"
            @click="navigateToSection(section)"
            :class="[
              'px-6 py-3 text-sm font-medium transition-colors',
              currentSection === section.id
                ? 'text-white border-b-3'
                : 'text-white hover:bg-white hover:bg-opacity-10',
            ]"
            :style="
              currentSection === section.id
                ? 'border-bottom: 3px solid white; background: rgba(255,255,255,0.15);'
                : ''
            "
          >
            {{ section.name }}
          </button>
        </nav>
      </div>
    </header>

    <!-- Disseny: Barra lateral esquerra + Contingut principal -->
    <div class="flex">
      <!-- Barra lateral esquerra - Submenú -->
      <aside
        class="sidebar"
        style="
          width: 240px;
          border-right: 1px solid var(--border-color);
          overflow-y: auto;
          position: fixed;
          top: 160px;
          left: 0;
          height: calc(100vh - 130px);
          z-index: 50;
        "
      >
        <div class="p-4">
          <h3
            class="text-xs font-semibold mb-3 px-4"
            style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px"
          >
            {{ getCurrentSectionName() }}
          </h3>
          <nav class="space-y-1">
            <button
              v-for="subsection in currentSubsections"
              :key="subsection.id"
              @click="navigateToSubsection(subsection)"
              :class="[
                'w-full text-left px-4 py-2.5 text-sm font-medium transition-colors',
                currentSubsection === subsection.id
                  ? 'sidebar-item-active'
                  : subsection.route
                    ? 'hover:bg-gray-100'
                    : 'opacity-50 cursor-not-allowed',
              ]"
              :style="currentSubsection === subsection.id ? '' : 'color: var(--text-primary);'"
              :disabled="!subsection.route"
            >
              {{ subsection.name }}
              <span v-if="!subsection.route" class="text-xs ml-2">(pròximament)</span>
            </button>
          </nav>
        </div>
      </aside>

      <!-- Contingut Principal -->
      <main class="flex-1 p-6" style="background-color: white; margin-left: 240px">
        <router-view />
      </main>
    </div>

    <!-- Alert Container -->
    <VAlertContainer />
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { BookOpen, LogOut } from 'lucide-vue-next'
import { logout } from '../../services/authService'
import { useAlertStore } from '../../stores/alert'
import VAlertContainer from '../shared/VAlertContainer.vue'

import { getCurrentUser } from '../../services/authService'

const router = useRouter()
const alertStore = useAlertStore()

// Estado
const currentRole = ref('centre')
const currentSection = ref('taula')
const currentSubsection = ref('taula-centre')
const user = ref(null)

// Función para obtener el usuario actual
const loadUser = () => {
  const userData = getCurrentUser()
  if (userData) {
    user.value = userData
    // Mapear rol a currentRole
    if (user.value.role === 'ADMIN') {
      currentRole.value = 'admin'
    } else if (user.value.role === 'CENTER') {
      currentRole.value = 'centre'
    } else if (user.value.role === 'TEACHER') {
      currentRole.value = 'teacher'
    }
  }
}

onMounted(() => {
  loadUser()
  // Inicializar sección y subsección por defecto
  const sections = navigationStructure[currentRole.value]
  if (sections && sections.length > 0) {
    currentSection.value = sections[0].id
    const subsections = sections[0].subsections
    if (subsections && subsections.length > 0) {
      currentSubsection.value = subsections[0].id
    }
  }
})

// Estructura de navegación por rol
const navigationStructure = {
  centre: [
    {
      id: 'taula',
      name: 'Dashboard',
      subsections: [
        { id: 'taula-centre', name: 'Resum General', route: '/centro/panel' },
      ],
    },
    {
      id: 'llistats',
      name: 'Llistat',
      subsections: [
        { id: 'alumnes', name: 'Llista Alumnes', route: '/centro/alumnos' },
        { id: 'professors', name: 'Llista Professors', route: '/centro/profesores' },
      ],
    },
    {
      id: 'catalog',
      name: 'Taller',
      subsections: [
        { id: 'catalog', name: 'Veure Tallers', route: '/centro/catalogo' },
        { id: 'info-taller', name: 'Tallers Sol·licitats', route: '/centro/info' },
      ],
    },
    {
      id: 'peticions',
      name: 'Sol·licituds',
      subsections: [
        { id: 'nova-peticio', name: 'Nova Sol·licitud', route: '/centro/nueva-peticion' },
        { id: 'meves-peticions', name: 'Les Meves Sol·licituds', route: '/centro/historial' },
      ],
    },
  ],
  admin: [
    {
      id: 'dashboard',
      name: 'Dashboard',
      subsections: [
        { id: 'dashboard', name: 'Resum General', route: '/admin/panel' },
      ],
    },
    {
      id: 'peticions',
      name: 'Peticions',
      subsections: [
        { id: 'peticions', name: 'Totes les Peticions', route: '/admin/peticiones' },
      ],
    },
    {
      id: 'assignacio',
      name: 'Assignació',
      subsections: [
        { id: 'assignacio', name: 'Eina Assignació', route: '/admin/asignacion' },
        { id: 'professors', name: 'Professors Disponibles', route: '/admin/profesores' },
      ],
    },
    {
      id: 'centres',
      name: 'Centres',
      subsections: [{ id: 'llista-centres', name: 'Llista Centres', route: '/admin/centros' }],
    },
    {
      id: 'configuracio',
      name: 'Configuració',
      subsections: [{ id: 'convocatories', name: 'Convocatòries', route: '/admin/convocatorias' }],
    },
  ],
  teacher: [
    {
      id: 'tauler',
      name: 'Tauler',
      subsections: [
        { id: 'tauler-inici', name: 'Inici', route: '/profesor/panel' },
      ],
    },
    {
      id: 'tallers',
      name: 'Tallers',
      subsections: [
        { id: 'meus-tallers', name: 'Els Meus Tallers', route: '/profesor/talleres' },
        { id: 'proximes-sessions', name: 'Pròximes Sessions', route: '/profesor/sessions' },
        { id: 'historial-tallers', name: 'Historial', route: '/profesor/historial' },
      ],
    },
    {
      id: 'avaluacions',
      name: 'Avaluacions',
      subsections: [
        { id: 'crear-avaluacio', name: 'Crear Avaluació', route: '/profesor/avaluacions' },
        { id: 'avaluacions-enviades', name: 'Enviades', route: '/profesor/avaluacions' },
      ],
    },
    {
      id: 'materials',
      name: 'Materials',
      subsections: [
        { id: 'materials-taller', name: 'Materials del Taller', route: '/profesor/materials' },
        { id: 'recursos', name: 'Recursos Educatius', route: '/profesor/materials' },
      ],
    },
  ],
}

// Computed
const mainSections = computed(() => navigationStructure[currentRole.value] || [])

const currentSubsections = computed(() => {
  const section = mainSections.value.find((s) => s.id === currentSection.value)
  return section?.subsections || []
})

// Métodos
const getRoleName = () => {
  if (!user.value) return ''
  return user.value.name || 'Usuari'
}

const getRoleInitial = () => {
  if (!user.value || !user.value.name) return 'U'
  return user.value.name.charAt(0).toUpperCase()
}

const getCurrentSectionName = () => {
  const section = mainSections.value.find((s) => s.id === currentSection.value)
  return section?.name || ''
}

const getCurrentSubsectionName = () => {
  const section = mainSections.value.find((s) => s.id === currentSection.value)
  const subsection = section?.subsections.find((ss) => ss.id === currentSubsection.value)
  return subsection?.name || ''
}

const navigateToSection = (section) => {
  console.log('Navigating to section:', section)
  currentSection.value = section.id
  const firstSubsection = section.subsections[0]
  currentSubsection.value = firstSubsection?.id || null

  if (firstSubsection?.route) {
    console.log('Pushing route:', firstSubsection.route)
    router.push(firstSubsection.route)
  }
}

const navigateToSubsection = (subsection) => {
  console.log('Navigating to subsection:', subsection)
  if (subsection.id === 'logout') {
    handleLogout()
    return
  }
  if (subsection.route) {
    currentSubsection.value = subsection.id
    console.log('Pushing route:', subsection.route)
    router.push(subsection.route)
  } else {
    console.log('No route defined for this subsection')
  }
}

const handleRoleChange = () => {
  console.log('Role changed to:', currentRole.value)
  const firstSection = navigationStructure[currentRole.value][0]
  navigateToSection(firstSection)
}

const handleLogout = async () => {
  if (
    await alertStore.confirm('Aquesta acció tancarà la teva sessió actual.', 'Tancar Sessió', {
      confirmText: 'Sortir',
      cancelText: 'Cancel·lar',
      type: 'warning',
    })
  ) {
    logout()
  }
}
</script>

<style scoped>
/* ========================================
   MEJORAS DE UX - MainLayout
   ======================================== */

/* Fix para el hover "loco" en los botones del sidebar */
.sidebar button {
  position: relative;
  display: block;
  width: 100%;
  text-align: left;
  border-radius: 0;
  font-size: 0.9rem;
  padding: 0.875rem 1.5rem;
  margin: 0;
  transition:
    background-color 0.2s ease,
    border-left-color 0.2s ease;
  border-left: 4px solid transparent;
  font-weight: 300;
  background: transparent;
  border: none;
  cursor: pointer;
}

.sidebar button:not(.sidebar-item-active):hover {
  background-color: var(--gray-50);
  color: var(--primary);
  border-left-color: var(--border-color);
  /* NO cambiar padding en hover para evitar el efecto "loco" */
}

.sidebar button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.sidebar button:disabled:hover {
  background-color: transparent;
  border-left-color: transparent;
}

/* Botones de navegación principal - hover suave */
.header nav button {
  padding: 1rem 1.75rem;
  margin: 0;
  border: none;
  border-radius: 0;
  font-size: 0.875rem;
  font-weight: 300;
  transition: background-color 0.2s ease;
  background: transparent;
  text-transform: none;
  letter-spacing: normal;
  border-bottom: 3px solid transparent;
  cursor: pointer;
}

.header nav button:hover {
  background: rgba(255, 255, 255, 0.1);
}

/* Scrollbar mejorado y responsivo */
.sidebar {
  scrollbar-width: thin;
  scrollbar-color: var(--gray-300) var(--gray-100);
  overflow-y: auto;
  overflow-x: hidden;
}

.sidebar::-webkit-scrollbar {
  width: 8px;
}

.sidebar::-webkit-scrollbar-track {
  background: var(--gray-100);
  border-radius: 0;
}

.sidebar::-webkit-scrollbar-thumb {
  background: var(--gray-300);
  border-radius: 4px;
  transition: background 0.2s ease;
}

.sidebar::-webkit-scrollbar-thumb:hover {
  background: var(--primary-light);
}

/* Contenido principal - scroll suave */
main {
  scrollbar-width: thin;
  scrollbar-color: var(--gray-300) var(--gray-100);
  overflow-y: auto;
  overflow-x: hidden;
  height: calc(100vh - 160px);
}

main::-webkit-scrollbar {
  width: 10px;
}

main::-webkit-scrollbar-track {
  background: var(--gray-100);
}

main::-webkit-scrollbar-thumb {
  background: var(--gray-300);
  border-radius: 5px;
  transition: background 0.2s ease;
}

main::-webkit-scrollbar-thumb:hover {
  background: var(--primary-light);
}

/* Botón de logout mejorado */
.logout-button {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.5rem 1rem;
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
  border-radius: 0;
  color: white;
  font-size: 0.875rem;
  font-weight: 300;
  cursor: pointer;
  transition: all 0.2s ease;
}

.logout-button:hover {
  background: rgba(255, 255, 255, 0.2);
  border-color: rgba(255, 255, 255, 0.3);
}

.logout-button:active {
  background: rgba(255, 255, 255, 0.15);
}

/* Badge de perfil de usuario */
.user-profile-badge {
  width: 36px;
  height: 36px;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.2);
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 500;
  font-size: 0.875rem;
  border: 2px solid rgba(255, 255, 255, 0.3);
  transition: all 0.2s ease;
}

.user-profile-badge:hover {
  background: rgba(255, 255, 255, 0.3);
  border-color: rgba(255, 255, 255, 0.5);
}

/* Mejoras responsive */
@media (max-width: 1024px) {
  .sidebar {
    width: 200px !important;
  }

  main {
    margin-left: 200px !important;
  }
}

@media (max-width: 768px) {
  .sidebar {
    position: fixed;
    left: -240px;
    transition: left 0.3s ease;
    z-index: 1000;
  }

  .sidebar.open {
    left: 0;
  }

  main {
    margin-left: 0 !important;
  }
}

/* Animaciones suaves */
@keyframes slideIn {
  from {
    opacity: 0;
    transform: translateX(-10px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

.sidebar button {
  animation: slideIn 0.3s ease;
}

/* Prevenir selección de texto en botones */
.sidebar button,
.header nav button,
.logout-button {
  user-select: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}
</style>
