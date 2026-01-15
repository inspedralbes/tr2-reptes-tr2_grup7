<template>
  <div class="min-h-screen" style="background-color: var(--background-alt)">
    <!-- Header Superior - Navegación Principal Horizontal -->
    <header
      class="header"
      style="position: sticky; top: 0; z-index: 100; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1)"
    >
      <div class="flex items-center justify-between px-6 py-3">
        <!-- Logo y Título -->
        <div class="flex items-center gap-4">
          <img :src="'/img/logo.jpg'" alt="Logo" style="height: 70px" />
          <div>
            <h1 class="text-lg font-semibold text-white">Sistema Tallers Educatius</h1>
            <p class="text-xs text-white" style="opacity: 0.85">Consorci d'Educació de Barcelona</p>
          </div>
        </div>

        <!-- User Info -->
        <div class="flex items-center gap-3">
          <div
            class="flex items-center gap-2"
            style="border-left: 1px solid rgba(255, 255, 255, 0.3); padding-left: 1rem"
          >
            <span class="text-sm text-white font-medium">{{ getRoleName() }}</span>
            <div
              style="
                width: 32px;
                height: 32px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 3px;
                display: flex;
                align-items: center;
                justify-content: center;
              "
            >
              <span class="text-white font-semibold text-sm">{{ getRoleInitial() }}</span>
            </div>
          </div>
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

    <!-- Layout: Sidebar Izquierdo + Contenido Principal -->
    <div class="flex">
      <!-- Sidebar Izquierdo - Submenú -->
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
              <span v-if="!subsection.route" class="text-xs ml-2">(próximamente)</span>
            </button>
          </nav>
        </div>
      </aside>

      <!-- Contenido Principal -->
      <main class="flex-1 p-6" style="background-color: white; margin-left: 240px">
        <router-view />
      </main>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { BookOpen } from 'lucide-vue-next'

const router = useRouter()

// Estado
const currentRole = ref('centre')
const currentSection = ref('taula')
const currentSubsection = ref('taula-centre')
const user = ref(null)

// Función para obtener el usuario actual
const loadUser = () => {
  const userData = localStorage.getItem('user')
  if (userData) {
    user.value = JSON.parse(userData)
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
      name: 'Taula',
      subsections: [
        { id: 'taula-centre', name: 'Taula Central', route: '/centro/panel' },
        { id: 'info-taller', name: 'Informació Tallers', route: '/centro/talleres' },
        { id: 'alumnes', name: 'Llista Alumnes', route: '/centro/alumnos' },
      ],
    },
    {
      id: 'catalog',
      name: 'Catàleg',
      subsections: [{ id: 'catalog', name: 'Veure Catàleg', route: '/centro/catalogo' }],
    },
    {
      id: 'peticions',
      name: 'Peticions',
      subsections: [
        { id: 'nova-peticio', name: 'Nova Petició', route: '/centro/nueva-peticion' },
        { id: 'meves-peticions', name: 'Les Meves Peticions', route: '/centro/historial' },
      ],
    },
  ],
  admin: [
    {
      id: 'dashboard',
      name: 'Dashboard',
      subsections: [
        { id: 'dashboard', name: 'Resum General', route: '/admin/panel' },
        { id: 'estadistiques', name: 'Estadístiques', route: '/admin/panel' },
      ],
    },
    {
      id: 'peticions',
      name: 'Peticions',
      subsections: [
        { id: 'peticions', name: 'Totes les Peticions', route: '/admin/peticiones' },
        { id: 'pendents', name: 'Pendents', route: '/admin/peticiones' },
        { id: 'assignades', name: 'Assignades', route: '/admin/peticiones' },
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
      id: 'tallers',
      name: 'Tallers',
      subsections: [
        { id: 'gestio-tallers', name: 'Gestió Tallers', route: '/admin/talleres' },
        { id: 'nou-taller', name: 'Crear Taller', route: '/admin/talleres' },
      ],
    },
    {
      id: 'centres',
      name: 'Centres',
      subsections: [
        { id: 'llista-centres', name: 'Llista Centres', route: '/admin/centros' },
        { id: 'estadistiques-centres', name: 'Estadístiques', route: '/admin/centros' },
      ],
    },
  ],
  teacher: [
    {
      id: 'tallers',
      name: 'Els Meus Tallers',
      subsections: [
        { id: 'meus-tallers', name: 'Tallers Actius', route: '/profesor/talleres' },
        { id: 'historial-tallers', name: 'Historial', route: null },
      ],
    },
    {
      id: 'sessions',
      name: 'Sessions',
      subsections: [
        { id: 'proximes-sessions', name: 'Pròximes Sessions', route: null },
        { id: 'detall-taller', name: 'Detall Taller', route: '/profesor/detalle' },
      ],
    },
    {
      id: 'avaluacions',
      name: 'Avaluacions',
      subsections: [
        { id: 'crear-avaluacio', name: 'Crear Avaluació', route: null },
        { id: 'avaluacions-enviades', name: 'Enviades', route: null },
      ],
    },
    {
      id: 'materials',
      name: 'Materials',
      subsections: [
        { id: 'materials-taller', name: 'Materials del Taller', route: null },
        { id: 'recursos', name: 'Recursos Educatius', route: null },
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
  if (!user.value) return 'Usuari'
  return user.value.name || user.value.email || user.value.center_name || 'Usuari'
}

const getRoleInitial = () => {
  if (user.value && user.value.name) return user.value.name.charAt(0).toUpperCase()
  if (user.value && user.value.center_name) return user.value.center_name.charAt(0).toUpperCase()
  if (user.value && user.value.email) return user.value.email.charAt(0).toUpperCase()
  return 'U'
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
</script>
