<template>
  <div class="flex justify-between items-center">
    <h1
      class="text-2xl font-semibold"
      style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px"
    >
      Informació del Taller
    </h1>

    <div class="md:col-span-2 space-y-6" style="width: 100%">
      <div class="card p-6">
        <h2
          class="text-lg font-semibold mb-4"
          style="
            color: var(--text-primary);
            padding-bottom: 0.75rem;
            border-bottom: 1px solid var(--border-color);
          "
        >
          Informació del Taller
        </h2>
        <div class="space-y-2" v-if="workshop">
          <div
            class="flex justify-between py-2.5"
            style="border-bottom: 1px solid var(--border-color)"
          >
            <span style="color: var(--text-secondary); font-size: 0.9rem">Taller:</span>
            <span class="font-semibold" style="color: var(--text-primary)">{{
              workshop.workshop_title
            }}</span>
          </div>
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
          <div class="flex justify-between py-2.5">
            <span style="color: var(--text-secondary); font-size: 0.9rem">Estat:</span>
            <span class="font-semibold" :class="getStatusClass(workshop.status)">
              {{ workshop.status }}
            </span>
          </div>
        </div>
        <div v-else class="text-center py-4 text-gray-500">
          No tens cap taller assignat o sol·licitat encara.
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import * as centreService from '../../../services/centreService'

const workshop = ref(null)
const centerName = ref('')

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
      const requests = await centreService.getRequests(user.id)

      // Pick the first accepted one, or just the first one if none accepted
      const accepted = requests.find((r) => r.status === 'ACCEPTED')
      workshop.value = accepted || requests[0] || null
    }
  } catch (error) {
    console.error('Error loading workshop info:', error)
  }
})
</script>
