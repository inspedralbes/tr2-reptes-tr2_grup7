<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Tauler de Control</h1>
      <button @click="goToNewRequest" class="btn-primary px-6 py-2 flex items-center gap-2">
        <Plus :size="18" /> Nova Petició
      </button>
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4 lg:gap-5">
      <div class="stat-card-blue text-white p-5 rounded-lg shadow-sm">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Peticions Actives</p>
            <p class="text-3xl font-bold">{{ stats.requests_active }}</p>
          </div>
          <FileText :size="32" class="opacity-75" />
        </div>
      </div>

      <div class="stat-card-green text-white p-5 rounded-lg shadow-sm">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Assignacions</p>
            <p class="text-3xl font-bold">{{ stats.total_assignments }}</p>
          </div>
          <CheckCircle :size="32" class="opacity-75" />
        </div>
      </div>

      <div class="stat-card-orange text-white p-5 rounded-lg shadow-sm">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Pendents</p>
            <p class="text-3xl font-bold">{{ stats.requests_pending }}</p>
          </div>
          <Clock :size="32" class="opacity-75" />
        </div>
      </div>

      <div class="stat-card-purple text-white p-5 rounded-lg shadow-sm">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Alumnes Total</p>
            <p class="text-3xl font-bold">{{ stats.student_count }}</p>
          </div>
          <Users :size="32" class="opacity-75" />
        </div>
      </div>
    </div>

    <!-- Charts Section -->
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
              stats.requests_active > 0
                ? Math.round((stats.total_assignments / stats.requests_active) * 100)
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
              stats.requests_active > 0
                ? Math.round((stats.requests_pending / stats.requests_active) * 100)
                : 0
            }}%
          </span>
        </div>
      </div>
    </div>

    <!-- Quick Actions Section -->
    <div class="bg-white rounded-lg border border-gray-200 shadow-sm p-6">
      <h2 class="text-lg font-semibold mb-4 text-gray-800 pb-3 border-b border-gray-200">
        Accions Ràpides
      </h2>
      <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <button
          @click="$router.push('/centro/historial')"
          class="flex items-center gap-3 p-4 rounded-lg border border-gray-200 hover:border-blue-500 hover:bg-blue-50 transition-all group"
        >
          <div
            class="p-2 rounded-lg bg-blue-100 text-blue-600 group-hover:bg-blue-600 group-hover:text-white transition-colors"
          >
            <FileText :size="20" />
          </div>
          <div class="text-left">
            <p class="font-semibold text-gray-800 text-sm">Veure Peticions</p>
            <p class="text-xs text-gray-500">Gestiona les teves sol·licituds</p>
          </div>
        </button>

        <button
          @click="$router.push('/centro/alumnos')"
          class="flex items-center gap-3 p-4 rounded-lg border border-gray-200 hover:border-green-500 hover:bg-green-50 transition-all group"
        >
          <div
            class="p-2 rounded-lg bg-green-100 text-green-600 group-hover:bg-green-600 group-hover:text-white transition-colors"
          >
            <Users :size="20" />
          </div>
          <div class="text-left">
            <p class="font-semibold text-gray-800 text-sm">Gestionar Alumnes</p>
            <p class="text-xs text-gray-500">Administra els teus alumnes</p>
          </div>
        </button>

        <button
          @click="$router.push('/centro/profesores')"
          class="flex items-center gap-3 p-4 rounded-lg border border-gray-200 hover:border-purple-500 hover:bg-purple-50 transition-all group"
        >
          <div
            class="p-2 rounded-lg bg-purple-100 text-purple-600 group-hover:bg-purple-600 group-hover:text-white transition-colors"
          >
            <Award :size="20" />
          </div>
          <div class="text-left">
            <p class="font-semibold text-gray-800 text-sm">Gestionar Professors</p>
            <p class="text-xs text-gray-500">Administra els teus professors</p>
          </div>
        </button>

        <button
          @click="goToNewRequest"
          class="flex items-center gap-3 p-4 rounded-lg border border-gray-200 hover:border-orange-500 hover:bg-orange-50 transition-all group"
        >
          <div
            class="p-2 rounded-lg bg-orange-100 text-orange-600 group-hover:bg-orange-600 group-hover:text-white transition-colors"
          >
            <Plus :size="20" />
          </div>
          <div class="text-left">
            <p class="font-semibold text-gray-800 text-sm">Nova Petició</p>
            <p class="text-xs text-gray-500">Crea una nova sol·licitud</p>
          </div>
        </button>
      </div>
    </div>

    <!-- Upcoming Workshops Section -->
    <div
      v-if="upcomingWorkshops.length > 0"
      class="bg-white rounded-lg border border-gray-200 shadow-sm p-6"
    >
      <h2 class="text-lg font-semibold mb-4 text-gray-800 pb-3 border-b border-gray-200">
        Pròximes Sessions
      </h2>
      <div class="space-y-3">
        <div
          v-for="workshop in upcomingWorkshops"
          :key="workshop.id_workshop"
          class="flex items-center justify-between p-4 bg-gray-50 rounded-lg border border-gray-100 hover:border-blue-300 transition-colors"
        >
          <div class="flex-1">
            <h3 class="font-semibold text-gray-800">{{ workshop.title }}</h3>
            <div class="flex items-center gap-4 mt-1">
              <span class="text-xs text-gray-500">
                <Clock :size="14" class="inline mr-1" />
                {{ formatDate(workshop.start_date) }}
              </span>
              <span class="text-xs px-2 py-0.5 rounded-full bg-blue-100 text-blue-700">
                {{ workshop.category }}
              </span>
            </div>
          </div>
          <div class="text-right">
            <span
              :class="[
                'px-3 py-1 rounded-full text-xs font-semibold',
                workshop.status === 'ACCEPTED'
                  ? 'bg-green-100 text-green-700'
                  : 'bg-yellow-100 text-yellow-700',
              ]"
            >
              {{ workshop.status === 'ACCEPTED' ? 'Acceptat' : 'Parcial' }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { ref, onMounted, onUnmounted } from 'vue'
import * as centreService from '../../../services/centreService'
import { FileText, CheckCircle, Clock, Users, Plus, Award } from 'lucide-vue-next'
import { getCurrentUser } from '../../../services/authService'
import socketService from '../../../services/socketService'

const router = useRouter()
const stats = ref({
  requests_active: 0,
  requests_accepted: 0,
  requests_pending: 0,
  student_count: 0,
  total_assignments: 0,
})

const upcomingWorkshops = ref([])

const goToNewRequest = () => {
  router.push('/centro/nueva-peticion')
}

const formatDate = (dateString) => {
  if (!dateString) return '-'
  return new Date(dateString).toLocaleDateString('ca-ES', {
    day: 'numeric',
    month: 'short',
    year: 'numeric',
  })
}

const loadStats = async () => {
  try {
    const user = getCurrentUser() || {}
    if (user.id) {
      const statsData = await centreService.getStatistics(user.id)
      stats.value = statsData
    }
  } catch (error) {
    console.error('Error loading stats:', error)
  }
}

const loadUpcomingWorkshops = async () => {
  try {
    const user = getCurrentUser() || {}
    if (user.id) {
      const data = await centreService.getUpcomingWorkshops(user.id)
      upcomingWorkshops.value = data
    }
  } catch (error) {
    console.error('Error loading upcoming workshops:', error)
  }
}

// Function to update data when Socket.io event arrives
const handleStatsUpdate = () => {
  console.log('📊 Actualizando estadísticas del centro en tiempo real...')
  loadStats()
  loadUpcomingWorkshops()
}

onMounted(async () => {
  // Load initial data
  await loadStats()
  await loadUpcomingWorkshops()

  // Connect to Socket.io
  socketService.connect()

  // Listen for update events
  socketService.on('stats_updated', handleStatsUpdate)
})

onUnmounted(() => {
  // Clean up listener when component unmounts
  socketService.off('stats_updated', handleStatsUpdate)
})
</script>
