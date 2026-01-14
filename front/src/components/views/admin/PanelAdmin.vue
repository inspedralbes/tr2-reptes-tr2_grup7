<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">
        Tauler d'Administració
      </h1>
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
          <div class="flex items-center justify-between p-3 bg-green-50 border-l-4 border-green-500 rounded">
            <span class="text-gray-800 font-medium">Assignades</span>
            <span class="font-bold text-gray-900 text-2xl">
              {{ stats.totalRequests > 0 ? Math.round((stats.assignedRequests / stats.totalRequests) * 100) : 0 }}%
            </span>
          </div>
          <div class="flex items-center justify-between p-3 bg-orange-50 border-l-4 border-orange-500 rounded">
            <span class="text-gray-800 font-medium">Pendents</span>
            <span class="font-bold text-gray-900 text-2xl">
              {{ stats.totalRequests > 0 ? Math.round((stats.pendingRequests / stats.totalRequests) * 100) : 0 }}%
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
          <div v-for="workshop in topWorkshops.slice(0, 3)" :key="workshop.title" 
               class="flex items-center justify-between py-3 border-b border-gray-100 last:border-0">
            <span class="text-gray-800 font-medium truncate mr-2">{{ workshop.title }}</span>
            <span class="inline-flex items-center px-3 py-1 rounded-full text-xs font-semibold bg-blue-100 text-blue-800 min-w-[2.5rem] justify-center">
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
