<template>
  <div class="space-y-6">
    <div
      class="flex justify-between items-center"
      style="
        border-bottom: 2px solid var(--border-color);
        padding-bottom: 1rem;
        margin-bottom: 1.5rem;
      "
    >
      <h1
        class="text-2xl font-semibold"
        style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px"
      >
        Tauler de Control
      </h1>
      <button @click="goToNewRequest" class="btn-primary px-6 py-2 flex items-center gap-2">
        <Plus :size="18" /> Nova Petició
      </button>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-5">
      <div class="stat-card-blue text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Peticions Actives
            </p>
            <p class="text-3xl font-bold">{{ stats.requests_active }}</p>
          </div>
          <FileText :size="32" style="opacity: 0.75" />
        </div>
      </div>

      <div class="stat-card-green text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Assignacions
            </p>
            <p class="text-3xl font-bold">{{ stats.total_assignments }}</p>
          </div>
          <CheckCircle :size="32" style="opacity: 0.75" />
        </div>
      </div>

      <div class="stat-card-orange text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Pendents
            </p>
            <p class="text-3xl font-bold">{{ stats.requests_pending }}</p>
          </div>
          <Clock :size="32" style="opacity: 0.75" />
        </div>
      </div>

      <div class="stat-card-purple text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Alumnes Total
            </p>
            <p class="text-3xl font-bold">{{ stats.student_count }}</p>
          </div>
          <Users :size="32" style="opacity: 0.75" />
        </div>
      </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <div class="space-y-6">
        <div class="card p-5">
          <h3
            class="text-base font-semibold mb-3"
            style="
              color: var(--text-primary);
              padding-bottom: 0.5rem;
              border-bottom: 1px solid var(--border-color);
            "
          >
            Contacte Centre
          </h3>
          <div class="space-y-3">
            <div>
              <p
                class="text-xs"
                style="
                  color: var(--text-secondary);
                  text-transform: uppercase;
                  letter-spacing: 0.5px;
                  margin-bottom: 0.25rem;
                "
              >
                Centre
              </p>
              <p class="font-semibold" style="color: var(--text-primary)">
                {{ centerInfo.center_name || 'Carregant...' }}
              </p>
            </div>
            <div>
              <p
                class="text-xs"
                style="
                  color: var(--text-secondary);
                  text-transform: uppercase;
                  letter-spacing: 0.5px;
                  margin-bottom: 0.25rem;
                "
              >
                Email
              </p>
              <p class="font-medium" style="color: var(--primary)">
                {{ centerInfo.email || '-' }}
              </p>
            </div>
            <div>
              <p
                class="text-xs"
                style="
                  color: var(--text-secondary);
                  text-transform: uppercase;
                  letter-spacing: 0.5px;
                  margin-bottom: 0.25rem;
                "
              >
                Telèfon
              </p>
              <p class="font-semibold" style="color: var(--text-primary)">
                {{ centerInfo.phone || '-' }}
              </p>
            </div>
          </div>
          <button @click="sendMessage" class="w-full mt-4 btn-primary py-2.5">
            Enviar Missatge
          </button>
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
