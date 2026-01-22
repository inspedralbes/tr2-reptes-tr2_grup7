<template>
  <div class="space-y-6 pb-12 animate-fade-in">
    <!-- Header -->
    <div
      class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-b border-gray-200 pb-4 mb-6"
    >
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Historial de Tallers</h1>
    </div>

    <div v-if="loading" class="text-center py-12">
      <p class="text-gray-500">Carregant historial...</p>
    </div>

    <div
      v-else-if="completedWorkshops.length === 0"
      class="text-center py-12 card bg-gray-50 border-gray-100"
    >
      <p class="text-gray-500">No tens tallers finalitzats encara.</p>
    </div>

    <div v-else>
      <!-- Estadístiques generals -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-8">
        <div class="stat-card-blue text-white p-5 rounded-lg shadow-sm">
          <div class="flex items-start justify-between">
            <div>
              <p class="text-sm opacity-90 mb-2 font-medium">Total de tallers</p>
              <p class="text-3xl font-bold">{{ completedWorkshops.length }}</p>
            </div>
            <BookOpen :size="28" class="opacity-75" />
          </div>
        </div>

        <div class="stat-card-green text-white p-5 rounded-lg shadow-sm">
          <div class="flex items-start justify-between">
            <div>
              <p class="text-sm opacity-90 mb-2 font-medium">Alumnes totals</p>
              <p class="text-3xl font-bold">{{ totalStudents }}</p>
            </div>
            <Users :size="28" class="opacity-75" />
          </div>
        </div>

        <div class="stat-card-purple text-white p-5 rounded-lg shadow-sm">
          <div class="flex items-start justify-between">
            <div>
              <p class="text-sm opacity-90 mb-2 font-medium">Hores impartides</p>
              <p class="text-3xl font-bold">{{ totalHours }}h</p>
            </div>
            <Clock :size="28" class="opacity-75" />
          </div>
        </div>

        <div class="stat-card-orange text-white p-5 rounded-lg shadow-sm">
          <div class="flex items-start justify-between">
            <div>
              <p class="text-sm opacity-90 mb-2 font-medium">Valoració mitjana</p>
              <p class="text-3xl font-bold">{{ averageRating }}</p>
            </div>
            <Star :size="28" class="opacity-75" />
          </div>
        </div>
      </div>

      <!-- Llistat de tallers finalitzats -->
      <div class="space-y-6">
        <h2 class="text-xl font-bold text-gray-800 pb-2 border-b border-gray-200">
          Tallers finalitzats
        </h2>

        <div
          v-for="workshop in completedWorkshops"
          :key="workshop.id_workshop"
          class="card hover:shadow-md transition-shadow"
        >
          <div class="flex flex-col md:flex-row items-start gap-4">
            <div
              class="flex-shrink-0 p-3 rounded-lg flex items-center justify-center"
              :style="{ backgroundColor: getCategoryColor(workshop.category).bg }"
            >
              <Check :size="24" :style="{ color: getCategoryColor(workshop.category).text }" />
            </div>

            <div class="flex-1 w-full">
              <div class="flex flex-wrap items-center justify-between gap-2 mb-3">
                <div>
                  <h3 class="text-lg font-bold text-gray-800">
                    {{ workshop.title }}
                  </h3>
                  <p class="text-sm mt-1 text-gray-500 font-medium">
                    {{ workshop.category }} <span class="mx-1">•</span>
                    {{ workshop.duration_hours }}h
                  </p>
                </div>
                <span class="badge-secondary bg-gray-100 text-gray-600">Finalitzat</span>
              </div>

              <div class="grid grid-cols-2 lg:grid-cols-4 gap-4 mb-5 p-4 bg-gray-50 rounded-lg">
                <div class="flex items-center gap-3">
                  <CalendarCheck :size="18" class="text-gray-400" />
                  <div>
                    <p class="text-xs text-gray-500 uppercase">Fi</p>
                    <p class="text-sm font-bold text-gray-800">
                      {{ formatDate(workshop.end_date) }}
                    </p>
                  </div>
                </div>

                <div class="flex items-center gap-3">
                  <Users :size="18" class="text-gray-400" />
                  <div>
                    <p class="text-xs text-gray-500 uppercase">Alumnes</p>
                    <p class="text-sm font-bold text-gray-800">
                      {{ workshop.max_slots - workshop.available_slots }} / {{ workshop.max_slots }}
                    </p>
                  </div>
                </div>

                <div class="flex items-center gap-3">
                  <Star :size="18" class="text-gray-400" />
                  <div>
                    <p class="text-xs text-gray-500 uppercase">Estat</p>
                    <p class="text-sm font-bold text-primary">
                      {{ workshop.status }}
                    </p>
                  </div>
                </div>
              </div>

              <div class="flex gap-3">
                <button
                  @click="goToDetail(workshop.id_workshop)"
                  class="btn-outline py-2 px-4 text-sm flex items-center gap-2"
                >
                  <Eye :size="16" />
                  Veure detalls
                </button>
                <button class="btn-outline py-2 px-4 text-sm flex items-center gap-2">
                  <Download :size="16" />
                  Informe
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Timeline per any -->
      <div class="card p-6 mt-8">
        <h3 class="text-lg font-bold text-gray-800 mb-6 pb-2 border-b border-gray-200">
          Distribució per categories
        </h3>
        <div class="space-y-4">
          <div
            v-for="(count, category) in categoryCounts"
            :key="category"
            class="flex items-center gap-4"
          >
            <div class="w-32 text-sm font-medium text-gray-600 truncate" :title="category">
              {{ category }}
            </div>
            <div class="flex-1 h-6 rounded-full bg-gray-100 overflow-hidden">
              <div
                class="h-full flex items-center justify-end px-3 text-xs font-bold text-white transition-all duration-500"
                :style="{
                  width: Math.max((count / completedWorkshops.length) * 100, 5) + '%',
                  backgroundColor: getCategoryColor(category).text,
                }"
              >
                {{ count }}
              </div>
            </div>
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
  BookOpen,
  Users,
  Clock,
  Star,
  Check,
  CalendarCheck,
  Award,
  Eye,
  Download,
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

const completedWorkshops = computed(() => {
  const now = new Date()
  return workshops.value
    .filter((w) => new Date(w.end_date) < now || w.status === 'ARCHIVED')
    .sort((a, b) => new Date(b.end_date) - new Date(a.end_date))
})

const totalStudents = computed(() => {
  return completedWorkshops.value.reduce((sum, w) => sum + (w.max_slots - w.available_slots), 0)
})

const totalHours = computed(() => {
  return completedWorkshops.value.reduce((sum, w) => sum + (w.duration_hours || 0), 0)
})

const averageRating = computed(() => {
  // As average rating is not in DB model, we show N/A or hide it
  return 'N/A'
})

const categoryCounts = computed(() => {
  const counts = {}
  completedWorkshops.value.forEach((w) => {
    counts[w.category] = (counts[w.category] || 0) + 1
  })
  return counts
})

const goToDetail = (id) => {
  router.push(`/profesor/detalle/${id}`)
}

onMounted(() => {
  fetchWorkshops()
})

// Helpers
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
