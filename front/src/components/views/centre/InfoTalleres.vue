<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center">
      <h1
        class="text-2xl font-semibold"
        style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px"
      >
        Informació dels Tallers
      </h1>
    </div>

    <div v-if="loading" class="text-center py-8">
      <p class="text-gray-500">Carregant informació...</p>
    </div>

    <div v-else-if="workshops.length === 0" class="text-center py-8">
      <p class="text-gray-500">No tens cap taller assignat o sol·licitat encara.</p>
    </div>

    <div v-else class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div v-for="workshop in workshops" :key="workshop.id_request" class="card p-6">
        <h2
          class="text-lg font-semibold mb-4"
          style="
            color: var(--text-primary);
            padding-bottom: 0.75rem;
            border-bottom: 1px solid var(--border-color);
          "
        >
          {{ workshop.workshop_title }}
        </h2>
        <div class="space-y-2">
          <div
            class="flex justify-between py-2.5"
            style="border-bottom: 1px solid var(--border-color)"
          >
            <span style="color: var(--text-secondary); font-size: 0.9rem">Centre:</span>
            <span class="font-semibold" style="color: var(--text-primary)">{{ centerName }}</span>
          </div>
          <div
            class="flex justify-between py-2.5"
            style="border-bottom: 1px solid var(--border-color)"
          >
            <span style="color: var(--text-secondary); font-size: 0.9rem">Curs:</span>
            <span class="font-semibold" style="color: var(--text-primary)">{{
              workshop.course_level
            }}</span>
          </div>
          <div
            class="flex justify-between py-2.5"
            style="border-bottom: 1px solid var(--border-color)"
          >
            <span style="color: var(--text-secondary); font-size: 0.9rem">Nombre d'alumnes:</span>
            <span class="font-semibold" style="color: var(--text-primary)">{{
              workshop.student_count
            }}</span>
          </div>

          <!-- Schedule Info Rows -->
          <div class="flex justify-between py-2.5" style="border-bottom: 1px solid var(--border-color)">
            <span style="color: var(--text-secondary); font-size: 0.9rem">Horari:</span>
            <span class="font-semibold" style="color: var(--text-primary)">Dijous (3h/setmana)</span>
          </div>
          <div class="flex justify-between py-2.5" style="border-bottom: 1px solid var(--border-color)">
            <span style="color: var(--text-secondary); font-size: 0.9rem">Lloc:</span>
            <span class="font-semibold" style="color: var(--text-primary)">Fora del centre</span>
          </div>
          <div class="flex justify-between py-2.5">
            <span style="color: var(--text-secondary); font-size: 0.9rem">Estat:</span>
            <span class="font-semibold" :class="getStatusClass(workshop.status)">
              {{ workshop.status }}
            </span>
          </div>
          <div class="flex justify-between py-2.5" v-if="workshop.teacher_first_name">
            <span style="color: var(--text-secondary); font-size: 0.9rem">Profesor:</span>
            <span class="font-semibold" style="color: var(--text-primary)">
              {{ workshop.teacher_first_name }} {{ workshop.teacher_last_name }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import * as centreService from '../../../services/centreService'

const workshops = ref([])
const centerName = ref('')
const loading = ref(true)

const getStatusClass = (status) => {
  if (status === 'ACCEPTED') return 'text-green-600'
  if (status === 'REJECTED') return 'text-red-600'
  return 'text-yellow-600'
}

onMounted(async () => {
  try {
    const user = JSON.parse(localStorage.getItem('user') || '{}')
    if (user.id) {
      centerName.value = user.center_name || user.name || 'El meu centre'
      // Get all requests instead of picking just one
      workshops.value = await centreService.getRequests(user.id)

      // Sort by status priority (ACCEPTED first)
      workshops.value.sort((a, b) => {
        if (a.status === 'ACCEPTED' && b.status !== 'ACCEPTED') return -1
        if (a.status !== 'ACCEPTED' && b.status === 'ACCEPTED') return 1
        return new Date(b.created_at) - new Date(a.created_at)
      })
    }
  } catch (error) {
    console.error('Error loading workshop info:', error)
  } finally {
    loading.value = false
  }
})
</script>
