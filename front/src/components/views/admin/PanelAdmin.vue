<template>
  <div class="space-y-6">
    <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">
      Tauler d'Administració
    </h1>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-5">
      <div class="stat-card-blue text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Total Peticions</p>
            <p class="text-3xl font-bold">{{ stats.totalRequests }}</p>
          </div>
          <FileText :size="32" style="opacity: 0.75;" />
        </div>
      </div>

      <div class="stat-card-green text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Assignades</p>
            <p class="text-3xl font-bold">{{ stats.assignedRequests }}</p>
          </div>
          <CheckCircle :size="32" style="opacity: 0.75;" />
        </div>
      </div>

      <div class="stat-card-orange text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Pendents</p>
            <p class="text-3xl font-bold">{{ stats.pendingRequests }}</p>
          </div>
          <Clock :size="32" style="opacity: 0.75;" />
        </div>
      </div>

      <div class="stat-card-purple text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Centres Actius</p>
            <p class="text-3xl font-bold">{{ stats.activeCenters }}</p>
          </div>
          <Users :size="32" style="opacity: 0.75;" />
        </div>
      </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div class="card p-6">
        <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
          Peticions per Estat
        </h2>
        <div class="space-y-3">
          <div class="flex items-center justify-between p-3" style="background-color: #e8f5e9; border-left: 4px solid var(--success);">
            <span style="color: var(--text-primary); font-weight: 500;">Assignades</span>
            <span class="font-bold" style="color: var(--success); font-size: 1.25rem;">
              {{ stats.totalRequests > 0 ? Math.round((stats.assignedRequests / stats.totalRequests) * 100) : 0 }}%
            </span>
          </div>
          <div class="flex items-center justify-between p-3" style="background-color: #fff3e0; border-left: 4px solid var(--warning);">
            <span style="color: var(--text-primary); font-weight: 500;">Pendents</span>
            <span class="font-bold" style="color: var(--warning); font-size: 1.25rem;">
              {{ stats.totalRequests > 0 ? Math.round((stats.pendingRequests / stats.totalRequests) * 100) : 0 }}%
            </span>
          </div>
        </div>
      </div>

      <div class="card p-6">
        <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
          Tallers Més Sol·licitats
        </h2>
        <div class="space-y-3">
          <div v-for="workshop in topWorkshops.slice(0, 3)" :key="workshop.title" class="flex items-center justify-between py-2" style="border-bottom: 1px solid var(--border-color);">
            <span style="color: var(--text-primary); font-weight: 500;">{{ workshop.title }}</span>
            <span class="badge-info" style="min-width: 2.5rem; text-align: center;">
              {{ workshop.request_count }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { FileText, CheckCircle, Clock, Users } from 'lucide-vue-next'
import { adminService } from '../../../services/adminService.js'

const stats = ref({
  totalRequests: 0,
  assignedRequests: 0,
  pendingRequests: 0,
  activeCenters: 0
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

onMounted(() => {
  loadStats()
  loadTopWorkshops()
})
</script>
