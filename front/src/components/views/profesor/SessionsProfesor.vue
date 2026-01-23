<template>
  <div class="space-y-6 pb-12 animate-fade-in">
    <!-- Header -->
    <div
      class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-b border-gray-200 pb-4 mb-6"
    >
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Sessions Programades</h1>
    </div>

    <div v-if="loading" class="text-center py-12">
      <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
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
        v-for="(session, index) in upcomingSessions"
        :key="session.id_session"
        class="card hover:shadow-md transition-all border-l-4 group"
        :style="{ borderLeftColor: getCategoryColor(session.category).text }"
      >
        <div class="flex flex-col md:flex-row md:items-center gap-6">
          <!-- Date Box -->
          <div
            class="flex-shrink-0 flex md:flex-col items-center justify-center p-4 rounded-lg bg-gray-50 min-w-[90px] w-full md:w-auto border border-gray-100"
          >
            <span class="md:hidden ml-2 text-gray-400 font-light">{{ formatDateFull(session.date) }}</span>
          </div>

          <!-- Content -->
          <div class="flex-1 w-full relative">
            
            <!-- Session Badge -->
            <div class="absolute -top-6 right-0 md:top-0 md:right-0">
               <span class="bg-gray-800 text-white text-xs font-bold px-2 py-1 rounded-bl-lg rounded-tr-lg shadow-sm">
                 Sessió {{ session.session_number }}
               </span>
            </div>

            <div class="mb-1">
               <span 
                 class="inline-block px-2 py-0.5 rounded text-[10px] font-bold uppercase tracking-wider mb-1"
                 :style="{ backgroundColor: getCategoryColor(session.category).bg, color: getCategoryColor(session.category).text }"
               >
                 {{ session.category }}
               </span>
               <h3 class="text-xl font-bold text-gray-800 mb-1">
                {{ session.title }}
              </h3>
              <p class="text-sm text-gray-500 flex items-center gap-1">
                 <MapPin v-if="session.center_name" :size="14" />
                 {{ session.center_name || 'Centre Desconegut' }}
              </p>
            </div>

            <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 text-sm mt-3">
              <div class="flex items-center gap-2 text-gray-600 bg-gray-50 p-2 rounded-md border border-gray-100 w-fit">
                <Clock :size="16" class="text-primary" />
                <span class="font-medium">
                  {{ formatTime(session.start_time) }} - {{ formatTime(session.end_time) }}
                </span>
              </div>
            </div>
          </div>
          
           <!-- Actions -->
           <div class="flex flex-row md:flex-col gap-2 w-full md:w-auto mt-4 md:mt-0 pt-4 md:pt-0 border-t md:border-t-0 border-gray-100">
              <button
                @click="goToAttendance(session.id_workshop)"
                class="flex-1 md:flex-none btn-primary py-2 px-4 flex items-center justify-center gap-2 text-sm whitespace-nowrap"
              >
                <ClipboardList :size="16" /> Assistència
              </button>
              <button
                @click="goToDetail(session.id_workshop)"
                class="flex-1 md:flex-none btn-outline py-2 px-4 flex items-center justify-center gap-2 text-sm whitespace-nowrap"
              >
                <BookOpen :size="16" /> Detalls
              </button>
           </div>
        </div>
      </div>
    </div>

    <!-- Sessions passades (Mantem logica antiga de workshops finalitzats de moment) -->
    <div v-if="pastWorkshops.length > 0" class="mt-12">
      <h2
        class="text-lg font-bold text-gray-800 mb-6 pb-2 border-b border-gray-200 flex items-center gap-2"
      >
        <CheckCircle :size="20" class="text-gray-400" />
        Tallers Finalitzats Recentment
      </h2>
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
        <div
          v-for="workshop in pastWorkshops"
          :key="'past-' + workshop.id_workshop"
          class="card p-4 hover:shadow-md transition-all cursor-pointer border-gray-200 opacity-70 hover:opacity-100 group"
          @click="goToDetail(workshop.id_workshop)"
        >
          <div class="flex items-center gap-3">
            <div
              class="p-2 rounded-full bg-gray-100 text-gray-500 group-hover:bg-green-50 group-hover:text-green-600 transition-colors"
            >
              <CheckCircle :size="20" />
            </div>
            <div class="flex-1 min-w-0">
              <p class="font-bold text-gray-800 truncate">{{ workshop.title }}</p>
              <p class="text-sm text-gray-500">
                {{ formatDate(workshop.end_date) }}
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
  MapPin
} from 'lucide-vue-next'
import apiClient from '../../../services/apiClient'
import { getCurrentUser } from '../../../services/authService'

const router = useRouter()
const upcomingSessions = ref([])
const pastWorkshops = ref([]) // Renamed from pastSessions to be clear it's workshops
const loading = ref(true)
const user = ref(getCurrentUser() || {})

const fetchData = async () => {
  try {
    loading.value = true
    const teacherId = user.value.teacher_id
    if (!teacherId) return

    // 1. Fetch upcoming sessions (granular)
    const sessionsRes = await apiClient.get(`/workshops/sessions/upcoming?teacher_id=${teacherId}`)
    upcomingSessions.value = sessionsRes.data

    // 2. Fetch past workshops (for history)
    // We can still use the /mine endpoint to get all workshops and filter locally for past ones
    // Or create a new endpoint. For now, reusing existing logic is fine.
    const workshopsRes = await apiClient.get(`/workshops/mine?teacher_id=${teacherId}`)
    const now = new Date()
    pastWorkshops.value = workshopsRes.data
        .filter((w) => new Date(w.end_date) < now)
        .sort((a, b) => new Date(b.end_date) - new Date(a.end_date)) // Sort by end date descending
        .slice(0, 6)

  } catch (error) {
    console.error('Error fetching data:', error)
  } finally {
    loading.value = false
  }
}

const goToDetail = (id) => {
  router.push(`/profesor/detalle/${id}`)
}

const goToAttendance = (id) => {
  router.push(`/profesor/asistencia/${id}`)
}

onMounted(() => {
  fetchData()
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

const formatDateFull = (dateStr) => {
    if (!dateStr) return '';
    return new Date(dateStr).toLocaleDateString('ca-ES', { weekday: 'long', day: 'numeric', month: 'long' });
}

// Handle TIME strings 'HH:MM:SS' or Date objects
const formatTime = (timeStr) => {
  if (!timeStr) return ''
  // If it's a full date string
  if (timeStr.includes('T') || timeStr.includes('-')) {
       return new Date(timeStr).toLocaleTimeString('ca-ES', { hour: '2-digit', minute: '2-digit' })
  }
  // If it's '10:00:00'
  return timeStr.slice(0, 5);
}

const formatDate = (dateStr) => {
  if (!dateStr) return 'N/A'
  const date = new Date(dateStr)
  return date.toLocaleDateString('ca-ES', { day: '2-digit', month: '2-digit', year: 'numeric' })
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
