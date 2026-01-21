<template>
  <div class="space-y-6 pb-12 animate-fade-in">
    <!-- Header -->
    <div
      class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-b border-gray-200 pb-4 mb-6"
    >
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Sessions Programades</h1>
    </div>

    <div v-if="loading" class="text-center py-12">
      <p class="text-gray-500">Carregant sessions...</p>
    </div>

    <div
      v-else-if="upcomingSessions.length === 0"
      class="text-center py-12 card bg-gray-50 border-gray-100"
    >
      <p class="text-gray-500">No tens sessions programades properament.</p>
    </div>

    <div v-else class="space-y-6">
      <!-- Timeline de sessions -->
      <div
        v-for="session in upcomingSessions"
        :key="session.id_workshop"
        class="card hover:shadow-md transition-all border-l-4"
        :style="{ borderLeftColor: getCategoryColor(session.category).text }"
      >
        <div class="flex flex-col md:flex-row md:items-start gap-6">
          <!-- Date Box -->
          <div
            class="flex-shrink-0 flex md:flex-col items-center justify-center p-4 rounded-lg bg-gray-50 min-w-[100px] border border-gray-100"
          >
            <span class="text-3xl font-bold text-gray-800">{{
              formatDay(session.start_date)
            }}</span>
            <span class="text-sm font-semibold uppercase tracking-wider text-gray-500">{{
              formatMonth(session.start_date)
            }}</span>
          </div>

          <div class="flex-1 w-full">
            <div class="flex flex-wrap items-center justify-between gap-2 mb-3">
              <h3 class="text-xl font-bold text-gray-800">
                {{ session.title }}
              </h3>
              <span :class="getStatusBadgeClass(session.status)">
                {{ getStatusLabel(session.status) }}
              </span>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-sm mb-4">
              <div class="flex items-center gap-2 text-gray-600">
                <Clock :size="18" class="text-gray-400" />
                <span>
                  {{ formatTime(session.start_date) }} - {{ formatTime(session.end_date) }}
                  <span class="font-medium text-gray-800 ml-1"
                    >({{ session.duration_hours }}h)</span
                  >
                </span>
              </div>

              <div class="flex items-center gap-2 text-gray-600">
                <Users :size="18" class="text-gray-400" />
                <span>
                  <span class="font-bold text-gray-800">{{
                    session.max_slots - session.available_slots
                  }}</span>
                  / {{ session.max_slots }} alumnes inscrits
                </span>
              </div>

              <div class="flex items-center gap-2 text-gray-600 sm:col-span-2">
                <Tag :size="18" class="text-gray-400" />
                <span>{{ session.category }}</span>
              </div>
            </div>

            <div
              v-if="session.short_description"
              class="mb-5 p-4 bg-gray-50 rounded-lg text-gray-600 text-sm border-l-2 border-gray-300 italic"
            >
              {{ session.short_description }}
            </div>

            <div class="flex flex-wrap gap-3 mt-auto">
              <button
                @click="goToDetail(session.id_workshop)"
                class="btn-primary py-2 px-5 flex items-center gap-2"
                :style="{
                  backgroundColor: getCategoryColor(session.category).text + ' !important',
                }"
              >
                <BookOpen :size="18" /> Veure detalls
              </button>
              <button
                @click="goToAttendance(session.id_workshop)"
                class="btn-outline py-2 px-5 flex items-center gap-2"
              >
                <ClipboardList :size="18" /> Gestionar assistència
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Sessions passades -->
    <div v-if="pastSessions.length > 0" class="mt-12">
      <h2
        class="text-lg font-bold text-gray-800 mb-6 pb-2 border-b border-gray-200 flex items-center gap-2"
      >
        <CheckCircle :size="20" class="text-secondary" />
        Sessions realitzades recentment
      </h2>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <div
          v-for="session in pastSessions"
          :key="'past-' + session.id_workshop"
          class="card p-4 hover:shadow-md transition-all cursor-pointer border-gray-200 opacity-80 hover:opacity-100 group"
          @click="goToDetail(session.id_workshop)"
        >
          <div class="flex items-center gap-3">
            <div
              class="p-2 rounded-full bg-green-50 text-green-600 group-hover:bg-green-100 transition-colors"
            >
              <CheckCircle :size="20" />
            </div>
            <div class="flex-1 min-w-0">
              <p class="font-bold text-gray-800 truncate">{{ session.title }}</p>
              <p class="text-sm text-gray-500">
                {{ formatDate(session.start_date) }}
              </p>
            </div>
            <ChevronRight :size="16" class="text-gray-300 group-hover:text-gray-500" />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import {
  Clock,
  Users,
  Tag,
  CheckCircle,
  BookOpen,
  ClipboardList,
  ChevronRight,
} from 'lucide-vue-next'
import apiClient from '../../../services/apiClient'
import { getCurrentUser } from '../../../services/authService'

const router = useRouter()
const workshops = ref([])
const loading = ref(true)
const user = ref(getCurrentUser() || {})

const fetchWorkshops = async () => {
  try {
    loading.value = true
    const teacherId = user.value.teacher_id
    if (!teacherId) {
      console.warn('No teacher_id found in user object')
      workshops.value = []
      return
    }
    const response = await apiClient.get(`/workshops/mine?teacher_id=${teacherId}`)
    workshops.value = response.data
  } catch (error) {
    console.error('Error fetching workshops:', error)
  } finally {
    loading.value = false
  }
}

const upcomingSessions = computed(() => {
  const now = new Date()
  return workshops.value
    .filter((w) => new Date(w.end_date) >= now)
    .sort((a, b) => new Date(a.start_date) - new Date(b.start_date))
})

const pastSessions = computed(() => {
  const now = new Date()
  return workshops.value
    .filter((w) => new Date(w.end_date) < now)
    .sort((a, b) => new Date(b.start_date) - new Date(a.start_date))
    .slice(0, 6)
})

const goToDetail = (id) => {
  router.push(`/profesor/detalle/${id}`)
}

const goToAttendance = (id) => {
  router.push(`/profesor/asistencia/${id}`)
}

onMounted(() => {
  fetchWorkshops()
})

// Helpers
const formatDay = (dateStr) => {
  if (!dateStr) return ''
  return new Date(dateStr).getDate()
}

const formatMonth = (dateStr) => {
  if (!dateStr) return ''
  const date = new Date(dateStr)
  return date.toLocaleDateString('ca-ES', { month: 'short' }).toUpperCase()
}

const formatTime = (dateStr) => {
  if (!dateStr) return ''
  return new Date(dateStr).toLocaleTimeString('ca-ES', { hour: '2-digit', minute: '2-digit' })
}

const formatDate = (dateStr) => {
  if (!dateStr) return 'N/A'
  const date = new Date(dateStr)
  return date.toLocaleDateString('ca-ES', { day: '2-digit', month: '2-digit', year: 'numeric' })
}

const getStatusBadgeClass = (status) => {
  if (status === 'OFFERED' || status === 'PENDING') return 'badge-success'
  if (status === 'FULL') return 'badge-warning'
  return 'badge-secondary'
}

const getStatusLabel = (status) => {
  switch (status) {
    case 'OFFERED':
      return 'Actiu'
    case 'PENDING':
      return 'Pendent'
    case 'FULL':
      return 'Complet'
    case 'ARCHIVED':
      return 'Finalitzat'
    default:
      return status
  }
}

const getCategoryColor = (category) => {
  const colors = {
    'Arts escèniques': { bg: '#f3e5f5', text: '#7b1fa2' },
    'Indústria-manufactura': { bg: '#efebe9', text: '#5d4037' },
    Hostaleria: { bg: '#fff3e0', text: '#e65100' },
    'Indústria 4.0': { bg: '#e3f2fd', text: '#0d47a1' },
    Esportiu: { bg: '#e8f5e9', text: '#2e7d32' },
    default: { bg: '#f5f5f5', text: '#666' },
  }
  return colors[category] || colors.default
}
</script>
