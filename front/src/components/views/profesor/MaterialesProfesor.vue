<template>
  <div class="space-y-6 pb-12 animate-fade-in">
    <!-- Header -->
    <div
      class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-b border-gray-200 pb-4 mb-6"
    >
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Materials del Taller</h1>
    </div>

    <div v-if="loading" class="text-center py-12">
      <p class="text-gray-500">Carregant materials...</p>
    </div>

    <div
      v-else-if="workshops.length === 0"
      class="text-center py-12 card bg-gray-50 border-gray-100"
    >
      <p class="text-gray-500">No tens cap taller assignat amb materials.</p>
    </div>

    <div v-else class="space-y-6">
      <div v-for="workshop in workshops" :key="workshop.id_workshop" class="card">
        <div class="flex items-center justify-between mb-6 pb-4 border-b border-gray-100">
          <div>
            <h2 class="text-xl font-bold text-gray-800">
              {{ workshop.title }}
            </h2>
            <p class="text-sm font-medium text-gray-500 mt-1 flex items-center gap-2">
              <Tag :size="14" /> {{ workshop.category }}
              <span class="mx-1">•</span>
              <Clock :size="14" /> {{ workshop.duration_hours }}h
            </p>
          </div>
          <span :class="getStatusBadgeClass(workshop.status)">
            {{ getStatusLabel(workshop.status) }}
          </span>
        </div>

        <!-- Materials Section -->
        <div>
          <h3 class="text-lg font-bold text-gray-800 mb-4 flex items-center gap-2">
            <FileText :size="20" class="text-primary" />
            Materials del Taller
          </h3>

          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <!-- Material didáctico -->
            <div
              class="p-4 rounded-lg bg-gray-50 border-l-4 border-l-primary hover:bg-blue-50/50 transition-colors group"
            >
              <div class="flex items-start gap-3">
                <BookOpen :size="24" class="text-primary mt-1" />
                <div class="flex-1">
                  <p class="font-bold text-gray-800 group-hover:text-primary transition-colors">
                    Material didàctic
                  </p>
                  <p class="text-sm text-gray-500">Guia completa del taller</p>
                </div>
              </div>
              <button
                class="w-full mt-4 btn-outline py-1.5 text-sm flex items-center justify-center gap-2"
              >
                <Download :size="16" /> Descarregar
              </button>
            </div>

            <!-- Recursos educatius -->
            <div
              class="p-4 rounded-lg bg-gray-50 border-l-4 border-l-secondary hover:bg-orange-50/50 transition-colors group"
            >
              <div class="flex items-start gap-3">
                <Download :size="24" class="text-secondary mt-1" />
                <div class="flex-1">
                  <p class="font-bold text-gray-800 group-hover:text-secondary transition-colors">
                    Recursos educatius
                  </p>
                  <p class="text-sm text-gray-500">Fitxes i activitats</p>
                </div>
              </div>
              <button
                class="w-full mt-4 btn-outline py-1.5 text-sm flex items-center justify-center gap-2"
              >
                <Download :size="16" /> Descarregar
              </button>
            </div>

            <!-- Presentació -->
            <div
              class="p-4 rounded-lg bg-gray-50 border-l-4 border-l-warning hover:bg-yellow-50/50 transition-colors group"
            >
              <div class="flex items-start gap-3">
                <Monitor :size="24" class="text-warning mt-1" />
                <div class="flex-1">
                  <p class="font-bold text-gray-800 group-hover:text-warning transition-colors">
                    Presentació
                  </p>
                  <p class="text-sm text-gray-500">Suport visual</p>
                </div>
              </div>
              <button
                class="w-full mt-4 btn-outline py-1.5 text-sm flex items-center justify-center gap-2"
              >
                <Eye :size="16" /> Veure
              </button>
            </div>
          </div>
        </div>

        <!-- Links útils -->
        <div class="mt-6 p-4 rounded-lg bg-gray-50 border border-gray-100">
          <h4 class="text-sm font-bold text-gray-700 mb-3 flex items-center gap-2">
            <Link :size="16" />
            Enllaços d'interès
          </h4>
          <ul class="space-y-2 text-sm text-gray-600 pl-1">
            <li class="flex items-center gap-2 hover:text-primary cursor-pointer transition-colors">
              <span class="w-1.5 h-1.5 rounded-full bg-gray-400"></span> Portal de recursos
              pedagògics
            </li>
            <li class="flex items-center gap-2 hover:text-primary cursor-pointer transition-colors">
              <span class="w-1.5 h-1.5 rounded-full bg-gray-400"></span> Plataforma d'activitats
            </li>
            <li class="flex items-center gap-2 hover:text-primary cursor-pointer transition-colors">
              <span class="w-1.5 h-1.5 rounded-full bg-gray-400"></span> Biblioteca de materials
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { FileText, BookOpen, Download, Monitor, Link, Tag, Clock, Eye } from 'lucide-vue-next'
import apiClient from '../../../services/apiClient'
import { getCurrentUser } from '../../../services/authService'

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

onMounted(() => {
  fetchWorkshops()
})

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
