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
        Les Meves Peticions
      </h1>
    </div>

    <div v-if="loading" class="text-center py-8">
      <p class="text-gray-500">Carregant historial...</p>
    </div>

    <div v-else-if="requests.length === 0" class="text-center py-8">
      <p class="text-gray-500">No tens cap petició registrada.</p>
    </div>

    <div v-else class="card overflow-hidden">
      <table class="w-full">
        <thead class="bg-gray-50">
          <tr>
            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Taller</th>
            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Data Petició</th>
            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Curs</th>
            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">
              Places Sol·licitades
            </th>
            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Estat</th>
            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Prof. Referent</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-100">
          <tr
            v-for="req in requests"
            :key="req.id_request"
            class="hover:bg-gray-50 transition-colors"
          >
            <td class="px-6 py-4 text-sm font-medium text-gray-900">{{ req.workshop_title }}</td>
            <td class="px-6 py-4 text-sm text-gray-600">{{ formatDate(req.created_at) }}</td>
            <td class="px-6 py-4 text-sm text-gray-600">{{ req.course_level }}</td>
            <td class="px-6 py-4 text-sm text-gray-600">
              {{ req.student_count }} alumnes ({{ req.requested_slots || 1 }} grups)
            </td>
            <td class="px-6 py-4">
              <span
                class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
                :class="getStatusClass(req.status)"
              >
                {{ getStatusLabel(req.status) }}
              </span>
            </td>
            <td class="px-6 py-4 text-sm text-gray-500">
              {{
                req.teacher_first_name
                  ? `${req.teacher_first_name} ${req.teacher_last_name}`
                  : req.id_teacher || '-'
              }}
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import * as centreService from '../../../services/centreService'

const requests = ref([])
const loading = ref(true)

const formatDate = (dateString) => {
  if (!dateString) return '-'
  return new Date(dateString).toLocaleDateString('es-ES', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
  })
}

const getStatusClass = (status) => {
  switch (status) {
    case 'ACCEPTED':
      return 'bg-green-100 text-green-800'
    case 'REJECTED':
      return 'bg-red-100 text-red-800'
    case 'PENDING':
      return 'bg-yellow-100 text-yellow-800'
    case 'PARTIAL':
      return 'bg-blue-100 text-blue-800'
    default:
      return 'bg-gray-100 text-gray-800'
  }
}

const getStatusLabel = (status) => {
  const labels = {
    ACCEPTED: 'Acceptada',
    REJECTED: 'Rebutjada',
    PENDING: 'Pendent',
    PARTIAL: 'Parcial',
  }
  return labels[status] || status
}

onMounted(async () => {
  try {
    const user = JSON.parse(localStorage.getItem('user') || '{}')
    if (user.id) {
      // Fetch all requests for this center
      requests.value = await centreService.getRequests(user.id)

      // Sort by date descending (newest first)
      requests.value.sort((a, b) => new Date(b.created_at) - new Date(a.created_at))
    }
  } catch (error) {
    console.error('Error loading request history:', error)
  } finally {
    loading.value = false
  }
})
</script>
