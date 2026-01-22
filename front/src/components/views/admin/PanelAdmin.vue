<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Tauler d'Administració</h1>
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 lg:gap-5">
      <div class="stat-card-blue text-white p-5 rounded-lg shadow-sm">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Total Peticions</p>
            <p class="text-3xl font-bold">{{ stats.totalRequests }}</p>
          </div>
          <FileText :size="32" class="opacity-75" />
        </div>
      </div>

      <div class="stat-card-green text-white p-5 rounded-lg shadow-sm">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Assignades</p>
            <p class="text-3xl font-bold">{{ stats.assignedRequests }}</p>
          </div>
          <CheckCircle :size="32" class="opacity-75" />
        </div>
      </div>

      <div class="stat-card-orange text-white p-5 rounded-lg shadow-sm">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Pendents</p>
            <p class="text-3xl font-bold">{{ stats.pendingRequests }}</p>
          </div>
          <Clock :size="32" class="opacity-75" />
        </div>
      </div>

      <div class="stat-card-purple text-white p-5 rounded-lg shadow-sm">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Centres Actius</p>
            <p class="text-3xl font-bold">{{ stats.activeCenters }}</p>
          </div>
          <Users :size="32" class="opacity-75" />
        </div>
      </div>
    </div>

    <!-- Charts Section -->
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
      <div class="bg-white rounded-lg border border-gray-200 shadow-sm p-6">
        <h2 class="text-lg font-semibold mb-4 text-gray-800 pb-3 border-b border-gray-200">
          Peticions per Estat
        </h2>
        <div class="space-y-3">
          <div
            class="flex items-center justify-between p-3 bg-green-50 border-l-4 border-green-500 rounded"
          >
            <span class="text-gray-800 font-medium">Assignades</span>
            <span class="font-bold text-gray-900 text-2xl">
              {{
                stats.totalRequests > 0
                  ? Math.round((stats.assignedRequests / stats.totalRequests) * 100)
                  : 0
              }}%
            </span>
          </div>
          <div
            class="flex items-center justify-between p-3 bg-orange-50 border-l-4 border-orange-500 rounded"
          >
            <span class="text-gray-800 font-medium">Pendents</span>
            <span class="font-bold text-gray-900 text-2xl">
              {{
                stats.totalRequests > 0
                  ? Math.round((stats.pendingRequests / stats.totalRequests) * 100)
                  : 0
              }}%
            </span>
          </div>
        </div>
      </div>

      <div class="bg-white rounded-lg border border-gray-200 shadow-sm p-6">
        <h2 class="text-lg font-semibold mb-4 text-gray-800 pb-3 border-b border-gray-200">
          Tallers Més Sol·licitats
        </h2>
        <div class="space-y-3">
          <div v-if="topWorkshops.length === 0" class="text-center py-4 text-gray-500">
            No hi ha dades disponibles
          </div>
          <div
            v-for="workshop in topWorkshops.slice(0, 3)"
            :key="workshop.title"
            class="flex items-center justify-between py-3 border-b border-gray-100 last:border-0"
          >
            <span class="text-gray-800 font-medium truncate mr-2">{{ workshop.title }}</span>
            <span
              class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-blue-100 text-blue-800 min-w-[2.5rem] justify-center"
            >
              {{ workshop.request_count }}
            </span>
          </div>
        </div>
      </div>
    </div>

    <!-- Quick Actions Section -->
    <div class="bg-white rounded-lg border border-gray-200 shadow-sm p-6">
      <h2 class="text-lg font-semibold mb-4 text-gray-800 pb-3 border-b border-gray-200">
        Accions Ràpides
      </h2>
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-4">
        <button
          @click="$router.push('/admin/peticiones')"
          class="flex items-center gap-3 p-4 rounded-lg border border-gray-200 hover:border-blue-500 hover:bg-blue-50 transition-all group"
        >
          <div
            class="p-2 rounded-lg bg-blue-100 text-blue-600 group-hover:bg-blue-600 group-hover:text-white transition-colors"
          >
            <FileText :size="20" />
          </div>
          <div class="text-left">
            <p class="font-semibold text-gray-800 text-sm">Gestionar Peticions</p>
            <p class="text-xs text-gray-500">Veure totes les sol·licituds</p>
          </div>
        </button>

        <button
          @click="$router.push('/admin/talleres')"
          class="flex items-center gap-3 p-4 rounded-lg border border-gray-200 hover:border-green-500 hover:bg-green-50 transition-all group"
        >
          <div
            class="p-2 rounded-lg bg-green-100 text-green-600 group-hover:bg-green-600 group-hover:text-white transition-colors"
          >
            <Award :size="20" />
          </div>
          <div class="text-left">
            <p class="font-semibold text-gray-800 text-sm">Gestionar Tallers</p>
            <p class="text-xs text-gray-500">Administra els tallers</p>
          </div>
        </button>

        <button
          @click="$router.push('/admin/centros')"
          class="flex items-center gap-3 p-4 rounded-lg border border-gray-200 hover:border-purple-500 hover:bg-purple-50 transition-all group"
        >
          <div
            class="p-2 rounded-lg bg-purple-100 text-purple-600 group-hover:bg-purple-600 group-hover:text-white transition-colors"
          >
            <Building2 :size="20" />
          </div>
          <div class="text-left">
            <p class="font-semibold text-gray-800 text-sm">Gestionar Centres</p>
            <p class="text-xs text-gray-500">Administra els centres</p>
          </div>
        </button>

        <button
          @click="$router.push('/admin/profesores')"
          class="flex items-center gap-3 p-4 rounded-lg border border-gray-200 hover:border-orange-500 hover:bg-orange-50 transition-all group"
        >
          <div
            class="p-2 rounded-lg bg-orange-100 text-orange-600 group-hover:bg-orange-600 group-hover:text-white transition-colors"
          >
            <Users :size="20" />
          </div>
          <div class="text-left">
            <p class="font-semibold text-gray-800 text-sm">Gestionar Professors</p>
            <p class="text-xs text-gray-500">Administra els professors</p>
          </div>
        </button>

        <button
          @click="$router.push('/admin/asignacion')"
          class="flex items-center gap-3 p-4 rounded-lg border border-gray-200 hover:border-indigo-500 hover:bg-indigo-50 transition-all group"
        >
          <div
            class="p-2 rounded-lg bg-indigo-100 text-indigo-600 group-hover:bg-indigo-600 group-hover:text-white transition-colors"
          >
            <CheckCircle :size="20" />
          </div>
          <div class="text-left">
            <p class="font-semibold text-gray-800 text-sm">Eina d'Assignació</p>
            <p class="text-xs text-gray-500">Assignació automàtica</p>
          </div>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { FileText, CheckCircle, Clock, Users, Award, Building2 } from 'lucide-vue-next'
import { adminService } from '../../../services/adminService.js'
import socketService from '../../../services/socketService.js'

const stats = ref({
  totalRequests: 0,
  assignedRequests: 0,
  pendingRequests: 0,
  activeCenters: 0,
})

const topWorkshops = ref([])

const loadStats = async () => {
  try {
    const data = await adminService.getAdminStats()
    stats.value = data
  } catch (error) {
    console.error('Error loading stats:', error)
  }
}

const loadTopWorkshops = async () => {
  try {
    const data = await adminService.getTopWorkshops()
    topWorkshops.value = data
  } catch (error) {
    console.error('Error loading top workshops:', error)
  }
}

// Función para actualizar datos cuando llega evento de Socket.io
const handleStatsUpdate = () => {
  console.log('📊 Actualizando estadísticas en tiempo real...')
  loadStats()
  loadTopWorkshops()
}

onMounted(() => {
  // Cargar datos iniciales
  loadStats()
  loadTopWorkshops()

  // Conectar a Socket.io
  socketService.connect()

  // Escuchar eventos de actualización
  socketService.on('stats_updated', handleStatsUpdate)
})

onUnmounted(() => {
  // Limpiar listener cuando se desmonta el componente
  socketService.off('stats_updated', handleStatsUpdate)
})
</script>
