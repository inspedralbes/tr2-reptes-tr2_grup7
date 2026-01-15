<template>
  <div>
    <h1
      class="text-2xl font-semibold mt-4"
      style="
        color: var(--text-primary);
        text-transform: uppercase;
        letter-spacing: 0.5px;
        text-align: center;
      "
    >
      Llista d'Alumnes
    </h1>
    <div style="padding-bottom: 20rem">
      <table style="border: 4px solid var(--border-color)">
        <thead>
          <tr
            class="text-left text-sm font-semibold text-gray-700 bg-gray-50"
            style="border: 4px solid var(--border-color)"
          >
            <th>Nom</th>
            <th class="px-6 py-3">Cognoms</th>
            <th class="px-6 py-3">Email</th>
            <th class="px-6 py-3">Telèfon</th>
            <th class="px-6 py-3">Data Naixement</th>
            <th class="px-6 py-3">Estat</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-100">
          <tr v-for="student in students" :key="student.id_user" class="hover:bg-gray-50">
            <td class="px-6 py-4 text-sm font-medium text-gray-900">{{ student.first_name }}</td>
            <td class="px-6 py-4 text-sm text-gray-900">{{ student.last_name }}</td>
            <td class="px-6 py-4 text-sm text-gray-500">{{ student.email }}</td>
            <td class="px-6 py-4 text-sm text-gray-500">{{ student.phone || '-' }}</td>
            <td class="-6 pxpy-4 text-sm text-gray-500">{{ formatDate(student.birth_date) }}</td>
            <td class="px-6 py-4">
              <span
                class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
                :class="
                  student.is_active ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                "
              >
                {{ student.is_active ? 'Actiu' : 'Inactiu' }}
              </span>
            </td>
          </tr>
          <tr v-if="students.length === 0">
            <td colspan="6" class="px-6 py-8 text-center text-sm text-gray-500">
              No hi ha alumnes registrats en aquest centre.
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

const students = ref([])
const loading = ref(true)

const formatDate = (dateString) => {
  if (!dateString) return '-'
  return new Date(dateString).toLocaleDateString('es-ES')
}

onMounted(async () => {
  try {
    const user = JSON.parse(localStorage.getItem('user') || '{}')
    if (user.id) {
      students.value = await centreService.getStudents(user.id)
    }
  } catch (error) {
    console.error('Error fetching students:', error)
  } finally {
    loading.value = false
  }
})
</script>
