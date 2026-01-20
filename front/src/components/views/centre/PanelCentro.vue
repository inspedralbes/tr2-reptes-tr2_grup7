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
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { ref, onMounted } from 'vue'
import * as centreService from '../../../services/centreService'
import {
  FileText,
  CheckCircle,
  Clock,
  Users,
  Plus,
  Bell,
  AlertCircle,
  Award,
} from 'lucide-vue-next'

const router = useRouter()
const stats = ref({
  requests_active: 0,
  requests_accepted: 0, // 'Assignacions' usually maps to accepted
  requests_pending: 0,
  student_count: 0,
})

import { getCurrentUser } from '../../../services/authService'

const centerInfo = ref({})
const coReferent = ref(null)
const students = ref([])

const goToNewRequest = () => {
  router.push('/centro/nueva-peticion')
}

const sendMessage = () => {
  window.location.href = 'mailto:admin@workshop.com'
}

onMounted(async () => {
  try {
    const user = getCurrentUser() || {}
    if (user.id) {
      const statsData = await centreService.getStatistics(user.id)
      stats.value = statsData
      stats.value.total_assignments =
        statsData.requests_accepted + (statsData.requests_partial || 0)

      const studentsData = await centreService.getStudents(user.id)
      students.value = studentsData

      // Load center info
      centerInfo.value = await centreService.getById(user.id)

      // Load teachers
      const teachers = await centreService.getTeachers(user.id)
      if (teachers && teachers.length > 0) {
        coReferent.value = teachers[0]
      }
    }
  } catch (error) {
    console.error('Error loading dashboard data:', error)
  }
})
</script>
