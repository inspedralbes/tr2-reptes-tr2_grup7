<template>
  <div class="space-y-6 pb-12 animate-fade-in">
    <!-- Header -->
    <div
      class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-b border-gray-200 pb-4 mb-6"
    >
      <div class="flex items-center gap-3">
        <div class="p-2 bg-primary/10 rounded-lg text-primary">
          <LayoutDashboard :size="24" />
        </div>
        <div>
          <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Tauler del Professor</h1>
          <p class="text-sm text-gray-500 mt-1">Benvingut/da, {{ user.first_name }}</p>
        </div>
      </div>
      <div
        class="text-sm font-medium text-gray-500 bg-gray-50 px-3 py-1.5 rounded-full border border-gray-100 self-start sm:self-auto"
      >
        Curs 2025-2026
      </div>
    </div>

    <!-- Stats Cards -->
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
      <div
        class="stat-card-blue text-white p-5 rounded-lg shadow-sm hover:shadow-md transition-all duration-300 transform hover:-translate-y-1"
      >
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Tallers Actius</p>
            <p class="text-3xl font-bold">{{ stats.active_workshops }}</p>
          </div>
          <div class="p-2 bg-white/20 rounded-lg">
            <BookOpen :size="24" class="opacity-90" />
          </div>
        </div>
      </div>

      <div
        class="stat-card-green text-white p-5 rounded-lg shadow-sm hover:shadow-md transition-all duration-300 transform hover:-translate-y-1"
      >
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Pròximes Sessions</p>
            <p class="text-3xl font-bold">{{ stats.upcoming_sessions }}</p>
          </div>
          <div class="p-2 bg-white/20 rounded-lg">
            <Calendar :size="24" class="opacity-90" />
          </div>
        </div>
      </div>

      <div
        class="stat-card-purple text-white p-5 rounded-lg shadow-sm hover:shadow-md transition-all duration-300 transform hover:-translate-y-1"
      >
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Alumnes Inscrits</p>
            <p class="text-3xl font-bold">{{ stats.total_students }}</p>
          </div>
          <div class="p-2 bg-white/20 rounded-lg">
            <Users :size="24" class="opacity-90" />
          </div>
        </div>
      </div>

      <div
        class="stat-card-orange text-white p-5 rounded-lg shadow-sm hover:shadow-md transition-all duration-300 transform hover:-translate-y-1"
      >
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm opacity-90 mb-2 font-medium">Hores Totals</p>
            <p class="text-3xl font-bold">{{ stats.total_hours }}h</p>
          </div>
          <div class="p-2 bg-white/20 rounded-lg">
            <Clock :size="24" class="opacity-90" />
          </div>
        </div>
      </div>
    </div>

    <!-- Quick Actions -->
    <div>
      <h2 class="text-xl font-bold text-gray-800 mb-4 flex items-center gap-2">
        <Star :size="20" class="text-yellow-500" />
        Accions Ràpides
      </h2>
      <div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
        <button
          @click="router.push('/profesor/talleres')"
          class="p-4 bg-white border border-gray-200 rounded-lg shadow-sm hover:shadow-md hover:border-primary/50 hover:bg-blue-50/30 transition-all duration-300 group text-left"
        >
          <div
            class="p-3 bg-blue-100 text-blue-600 rounded-full w-fit mb-3 group-hover:scale-110 transition-transform"
          >
            <BookOpen :size="24" />
          </div>
          <h3 class="font-bold text-gray-800 group-hover:text-primary transition-colors">
            Els Meus Tallers
          </h3>
          <p class="text-xs text-gray-500 mt-1">Gestiona els teus tallers</p>
        </button>

        <button
          @click="router.push('/profesor/sesiones')"
          class="p-4 bg-white border border-gray-200 rounded-lg shadow-sm hover:shadow-md hover:border-green-500/50 hover:bg-green-50/30 transition-all duration-300 group text-left"
        >
          <div
            class="p-3 bg-green-100 text-green-600 rounded-full w-fit mb-3 group-hover:scale-110 transition-transform"
          >
            <Calendar :size="24" />
          </div>
          <h3 class="font-bold text-gray-800 group-hover:text-green-700 transition-colors">
            Calendari
          </h3>
          <p class="text-xs text-gray-500 mt-1">Properes sessions</p>
        </button>

        <button
          @click="router.push('/profesor/asistencia')"
          class="p-4 bg-white border border-gray-200 rounded-lg shadow-sm hover:shadow-md hover:border-purple-500/50 hover:bg-purple-50/30 transition-all duration-300 group text-left"
        >
          <div
            class="p-3 bg-purple-100 text-purple-600 rounded-full w-fit mb-3 group-hover:scale-110 transition-transform"
          >
            <CheckCircle :size="24" />
          </div>
          <h3 class="font-bold text-gray-800 group-hover:text-purple-700 transition-colors">
            Assistència
          </h3>
          <p class="text-xs text-gray-500 mt-1">Control d'alumnes</p>
        </button>

        <button
          @click="router.push('/profesor/avaluacions')"
          class="p-4 bg-white border border-gray-200 rounded-lg shadow-sm hover:shadow-md hover:border-orange-500/50 hover:bg-orange-50/30 transition-all duration-300 group text-left"
        >
          <div
            class="p-3 bg-orange-100 text-orange-600 rounded-full w-fit mb-3 group-hover:scale-110 transition-transform"
          >
            <ClipboardList :size="24" />
          </div>
          <h3 class="font-bold text-gray-800 group-hover:text-orange-700 transition-colors">
            Avaluacions
          </h3>
          <p class="text-xs text-gray-500 mt-1">Qualificar progressos</p>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import {
  LayoutDashboard,
  BookOpen,
  Calendar,
  Users,
  Clock,
  Star,
  CheckCircle,
  ClipboardList,
} from 'lucide-vue-next'
import apiClient from '../../../services/apiClient'
import { getCurrentUser } from '../../../services/authService'

const router = useRouter()
const user = ref(getCurrentUser() || { first_name: 'Professor' })
const stats = ref({
  active_workshops: 0,
  upcoming_sessions: 0,
  total_students: 0,
  total_hours: 0,
})

const fetchStats = async () => {
  try {
    const teacherId = user.value.teacher_id
    if (teacherId) {
      // In a real scenario, we might have a dedicated stats endpoint
      // For now, we scale from the workshops endpoint or mock it effectively
      const response = await apiClient.get(`/workshops/mine?teacher_id=${teacherId}`)
      const workshops = response.data

      stats.value = {
        active_workshops: workshops.filter((w) => w.status === 'OFFERED').length,
        upcoming_sessions: 3, // Mocked or derived
        total_students: workshops.reduce((acc, w) => acc + (w.enrolled_count || 0), 0),
        total_hours: workshops.reduce((acc, w) => acc + (w.duration_hours || 0), 0),
      }
    }
  } catch (error) {
    console.error('Error fetching stats:', error)
  }
}

onMounted(() => {
  fetchStats()
})
</script>

<style scoped>
/* Scoped styles mainly if needed, but we rely on global edubcn-theme.css */
</style>
