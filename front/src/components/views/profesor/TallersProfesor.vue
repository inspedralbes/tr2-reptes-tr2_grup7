<template>
  <div class="space-y-6 pb-12 animate-fade-in">
    <!-- Header -->
    <div
      class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-b border-gray-200 pb-4 mb-6"
    >
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Els Meus Tallers</h1>
    </div>

    <!-- Workshop List -->
    <div v-if="loading" class="text-center py-12">
      <p class="text-gray-500 animate-pulse">Carregant tallers...</p>
    </div>

    <div
      v-else-if="workshops.length === 0"
      class="text-center py-12 card bg-gray-50 border-gray-100"
    >
      <p class="text-gray-500">No tens tallers assignats actualment.</p>
    </div>

    <div v-else class="grid grid-cols-1 lg:grid-cols-2 gap-6">
      <div
        v-for="workshop in workshops"
        :key="workshop.id_workshop"
        class="card hover:shadow-lg transition-all duration-300 group flex flex-col relative overflow-hidden"
      >
        <!-- Category strip -->
        <div
          class="absolute top-0 left-0 w-1 h-full"
          :style="{ backgroundColor: getCategoryColor(workshop.category).text }"
        ></div>

        <div class="flex items-start justify-between mb-4 pl-3">
          <div class="flex-1 pr-4">
            <h2
              class="text-xl font-bold text-gray-800 group-hover:text-primary transition-colors line-clamp-2"
            >
              {{ workshop.title }}
            </h2>
            <div class="flex flex-wrap items-center gap-2 mt-2">
              <span
                class="text-sm font-medium px-2 py-1 rounded-md"
                :style="{
                  backgroundColor: getCategoryColor(workshop.category).bg,
                  color: getCategoryColor(workshop.category).text,
                }"
              >
                {{ workshop.category }}
              </span>
              <span :class="getStatusBadgeClass(workshop.status)">
                {{ getStatusLabel(workshop.status) }}
              </span>
            </div>
          </div>
          <div
            class="p-2 bg-gray-50 rounded-full text-gray-400 group-hover:text-primary group-hover:bg-blue-50 transition-colors"
          >
            <BookOpen :size="24" />
          </div>
        </div>

        <!-- Info Grid -->
        <div class="grid grid-cols-2 gap-y-4 gap-x-2 mb-6 pl-3 bg-gray-50/50 p-4 rounded-lg">
          <div class="flex items-center gap-3">
            <Calendar :size="18" class="text-gray-400" />
            <div>
              <p class="text-xs text-gray-500 uppercase tracking-wide">Inici</p>
              <p class="text-sm font-bold text-gray-800">{{ formatDate(workshop.start_date) }}</p>
            </div>
          </div>

          <div class="flex items-center gap-3">
            <Clock :size="18" class="text-gray-400" />
            <div>
              <p class="text-xs text-gray-500 uppercase tracking-wide">Durada</p>
              <p class="text-sm font-bold text-gray-800">{{ workshop.duration_hours }}h</p>
            </div>
          </div>

          <div class="flex items-center gap-3">
            <Users :size="18" class="text-gray-400" />
            <div>
              <p class="text-xs text-gray-500 uppercase tracking-wide">Inscrits</p>
              <p class="text-sm font-bold text-gray-800">
                {{ workshop.enrolled_count || 0 }}
                <span class="text-gray-400 font-normal">/ {{ workshop.max_slots }}</span>
              </p>
            </div>
          </div>
        </div>

        <!-- Actions -->
        <div class="mt-auto pl-3 pt-2">
          <button
            v-if="!isPast(workshop.end_date)"
            @click="goToDetail(workshop.id_workshop)"
            class="w-full btn-primary py-2.5 flex items-center justify-center gap-2 shadow-sm transition-transform active:scale-95"
            :style="{ backgroundColor: getCategoryColor(workshop.category).text + ' !important' }"
          >
            <Eye :size="18" />
            Veure detalls
          </button>
          <button
            v-else
            class="w-full btn-outline py-2.5 flex items-center justify-center gap-2 bg-gray-50 text-gray-500 cursor-not-allowed border-gray-200"
          >
            <Archive :size="18" />
            Taller finalitzat
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { BookOpen, Calendar, Users, Clock, Eye, Archive } from 'lucide-vue-next'
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

onMounted(() => {
  fetchWorkshops()
})

const goToDetail = (id) => {
  router.push(`/profesor/detalle/${id}`)
}

const formatDate = (dateStr) => {
  if (!dateStr) return 'N/A'
  const date = new Date(dateStr)
  return date.toLocaleDateString('ca-ES', { day: '2-digit', month: '2-digit', year: 'numeric' })
}

const isPast = (dateStr) => {
  if (!dateStr) return false
  return new Date(dateStr) < new Date()
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
</script>
