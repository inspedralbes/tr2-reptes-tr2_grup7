<template>
  <div class="min-h-screen" style="background-color: var(--background-alt);">
    <!-- Header Superior - Navegación Principal Horizontal -->
    <header class="header" style="box-shadow: 0 2px 4px rgba(0,0,0,0.1);">
      <div class="flex items-center justify-between px-6 py-3">
        <!-- Logo y Título -->
        <div class="flex items-center gap-4">
          <div style="background-color: rgba(255,255,255,0.2); padding: 0.5rem; border-radius: 3px;">
            <BookOpen class="text-white" :size="24" />
          </div>
          <div>
            <h1 class="text-lg font-semibold text-white">Sistema Tallers Educatius</h1>
            <p class="text-xs text-white" style="opacity: 0.85;">Consorci d'Educació de Barcelona</p>
          </div>
        </div>

        <!-- User Info -->
        <div class="flex items-center gap-3">
          <select
            v-model="currentRole"
            @change="handleRoleChange"
            class="text-sm px-3 py-1.5"
            style="background: white; color: #00426b; border: 1px solid rgba(255,255,255,0.3); border-radius: 3px; font-weight: 300;"
          >
            <option value="centre" style="color: #00426b;">Centre Educatiu</option>
            <option value="admin" style="color: #00426b;">Administració</option>
            <option value="teacher" style="color: #00426b;">Professor</option>
          </select>
          <div class="flex items-center gap-2 pl-3" style="border-left: 1px solid rgba(255,255,255,0.3);">
            <span class="text-sm text-white font-medium">{{ getRoleName() }}</span>
            <div style="width: 32px; height: 32px; background: rgba(255,255,255,0.2); border-radius: 3px; display: flex; align-items: center; justify-content: center;">
              <span class="text-white font-semibold text-sm">{{ getRoleInitial() }}</span>
            </div>
          </div>
        </div>
      </div>

      <!-- Navegación Principal Horizontal -->
      <div style="background-color: rgba(0,0,0,0.1); border-top: 1px solid rgba(255,255,255,0.1);">
        <nav class="flex px-6">
          <button
            v-for="section in mainSections"
            :key="section.id"
            @click="currentSection = section.id; currentSubsection = section.subsections[0]?.id || null"
            :class="['px-6 py-3 text-sm font-medium transition-colors', 
              currentSection === section.id 
                ? 'text-white border-b-3' 
                : 'text-white hover:bg-white hover:bg-opacity-10']"
            :style="currentSection === section.id ? 'border-bottom: 3px solid white; background: rgba(255,255,255,0.15);' : ''"
          >
            {{ section.name }}
          </button>
        </nav>
      </div>
    </header>

    <!-- Layout: Sidebar Izquierdo + Contenido Principal -->
    <div class="flex" style="min-height: calc(100vh - 120px);">
      <!-- Sidebar Izquierdo - Submenú -->
      <aside class="sidebar" style="width: 240px; border-right: 1px solid var(--border-color);">
        <div class="p-4">
          <h3 class="text-xs font-semibold mb-3 px-4" style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px;">
            {{ getCurrentSectionName() }}
          </h3>
          <nav class="space-y-1">
            <button
              v-for="subsection in currentSubsections"
              :key="subsection.id"
              @click="currentSubsection = subsection.id"
              :class="['w-full text-left px-4 py-2.5 text-sm font-medium transition-colors',
                currentSubsection === subsection.id 
                  ? 'sidebar-item-active' 
                  : 'hover:bg-gray-100']"
              :style="currentSubsection === subsection.id ? '' : 'color: var(--text-primary);'"
            >
              {{ subsection.name }}
            </button>
          </nav>
        </div>
      </aside>

      <!-- Contenido Principal -->
      <main class="flex-1 p-6" style="background-color: white;">
        <!-- Centro -->
        <template v-if="currentRole === 'centre'">
          <CentreDashboard v-if="currentSubsection === 'taula-centre'" />
          <CatalogWorkshops v-else-if="currentSubsection === 'catalog'" />
          <NewRequestForm v-else-if="currentSubsection === 'nova-peticio'" />
          <div v-else-if="currentSubsection === 'info-taller'">
            <h2 class="text-xl font-semibold mb-4" style="color: var(--text-primary);">Informació del Taller</h2>
            <p style="color: var(--text-secondary);">Contingut d'informació del taller...</p>
          </div>
          <div v-else>
            <h2 class="text-xl font-semibold mb-4" style="color: var(--text-primary);">{{ getCurrentSubsectionName() }}</h2>
            <p style="color: var(--text-secondary);">Contingut de {{ getCurrentSubsectionName() }}...</p>
          </div>
        </template>

        <!-- Admin -->
        <template v-if="currentRole === 'admin'">
          <AdminDashboard v-if="currentSubsection === 'dashboard'" />
          <AdminRequests v-else-if="currentSubsection === 'peticions'" />
          <AssignmentTool v-else-if="currentSubsection === 'assignacio'" />
          <div v-else>
            <h2 class="text-xl font-semibold mb-4" style="color: var(--text-primary);">{{ getCurrentSubsectionName() }}</h2>
            <p style="color: var(--text-secondary);">Contingut de {{ getCurrentSubsectionName() }}...</p>
          </div>
        </template>

        <!-- Profesor -->
        <template v-if="currentRole === 'teacher'">
          <TeacherDashboard v-if="currentSubsection === 'meus-tallers'" />
          <WorkshopDetail v-else-if="currentSubsection === 'detall-taller'" />
          <div v-else>
            <h2 class="text-xl font-semibold mb-4" style="color: var(--text-primary);">{{ getCurrentSubsectionName() }}</h2>
            <p style="color: var(--text-secondary);">Contingut de {{ getCurrentSubsectionName() }}...</p>
          </div>
        </template>
      </main>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';
import { BookOpen } from 'lucide-vue-next';

// Importar componentes
import CentreDashboard from './CentreDashboard.vue';
import CatalogWorkshops from './CatalogWorkshops.vue';
import NewRequestForm from './NewRequestForm.vue';
import AdminDashboard from './AdminDashboard.vue';
import AdminRequests from './AdminRequests.vue';
import AssignmentTool from './AssignmentTool.vue';
import TeacherDashboard from './TeacherDashboard.vue';
import WorkshopDetail from './WorkshopDetail.vue';

// Estado
const currentRole = ref('centre');
const currentSection = ref('taula');
const currentSubsection = ref('taula-centre');

// Estructura de navegación por rol
const navigationStructure = {
  centre: [
    {
      id: 'taula',
      name: 'Taula',
      subsections: [
        { id: 'taula-centre', name: 'Taula Central' },
        { id: 'info-taller', name: 'Informació Tallers' },
        { id: 'alumnes', name: 'Llista Alumnes' }
      ]
    },
    {
      id: 'catalog',
      name: 'Catàleg',
      subsections: [
        { id: 'catalog', name: 'Veure Catàleg' },
        { id: 'modalitats', name: 'Modalitats' }
      ]
    },
    {
      id: 'peticions',
      name: 'Peticions',
      subsections: [
        { id: 'nova-peticio', name: 'Nova Petició' },
        { id: 'meves-peticions', name: 'Les Meves Peticions' },
        { id: 'historial', name: 'Historial' }
      ]
    },
    {
      id: 'checklist',
      name: 'Checklist',
      subsections: [
        { id: 'checklist-actual', name: 'Checklist Actual' },
        { id: 'finalitzats', name: 'Finalitzats' }
      ]
    }
  ],
  admin: [
    {
      id: 'dashboard',
      name: 'Dashboard',
      subsections: [
        { id: 'dashboard', name: 'Resum General' },
        { id: 'estadistiques', name: 'Estadístiques' }
      ]
    },
    {
      id: 'peticions',
      name: 'Peticions',
      subsections: [
        { id: 'peticions', name: 'Totes les Peticions' },
        { id: 'pendents', name: 'Pendents' },
        { id: 'assignades', name: 'Assignades' }
      ]
    },
    {
      id: 'assignacio',
      name: 'Assignació',
      subsections: [
        { id: 'assignacio', name: 'Eina Assignació' },
        { id: 'professors', name: 'Professors Disponibles' }
      ]
    },
    {
      id: 'tallers',
      name: 'Tallers',
      subsections: [
        { id: 'gestio-tallers', name: 'Gestió Tallers' },
        { id: 'nou-taller', name: 'Crear Taller' }
      ]
    },
    {
      id: 'centres',
      name: 'Centres',
      subsections: [
        { id: 'llista-centres', name: 'Llista Centres' },
        { id: 'estadistiques-centres', name: 'Estadístiques' }
      ]
    }
  ],
  teacher: [
    {
      id: 'tallers',
      name: 'Els Meus Tallers',
      subsections: [
        { id: 'meus-tallers', name: 'Tallers Actius' },
        { id: 'historial-tallers', name: 'Historial' }
      ]
    },
    {
      id: 'sessions',
      name: 'Sessions',
      subsections: [
        { id: 'proximes-sessions', name: 'Pròximes Sessions' },
        { id: 'detall-taller', name: 'Detall Taller' }
      ]
    },
    {
      id: 'avaluacions',
      name: 'Avaluacions',
      subsections: [
        { id: 'crear-avaluacio', name: 'Crear Avaluació' },
        { id: 'avaluacions-enviades', name: 'Enviades' }
      ]
    },
    {
      id: 'materials',
      name: 'Materials',
      subsections: [
        { id: 'materials-taller', name: 'Materials del Taller' },
        { id: 'recursos', name: 'Recursos Educatius' }
      ]
    }
  ]
};

// Computed
const mainSections = computed(() => navigationStructure[currentRole.value] || []);

const currentSubsections = computed(() => {
  const section = mainSections.value.find(s => s.id === currentSection.value);
  return section?.subsections || [];
});

// Métodos
const getRoleName = () => {
  if (currentRole.value === 'centre') return 'IES Terrassa';
  if (currentRole.value === 'admin') return 'Administració';
  return 'Prof. Maria García';
};

const getRoleInitial = () => {
  if (currentRole.value === 'centre') return 'C';
  if (currentRole.value === 'admin') return 'A';
  return 'P';
};

const getCurrentSectionName = () => {
  const section = mainSections.value.find(s => s.id === currentSection.value);
  return section?.name || '';
};

const getCurrentSubsectionName = () => {
  const section = mainSections.value.find(s => s.id === currentSection.value);
  const subsection = section?.subsections.find(ss => ss.id === currentSubsection.value);
  return subsection?.name || '';
};

const handleRoleChange = () => {
  const firstSection = navigationStructure[currentRole.value][0];
  currentSection.value = firstSection.id;
  currentSubsection.value = firstSection.subsections[0]?.id || null;
};
</script>
