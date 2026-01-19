<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center">
      <h1
        class="text-2xl font-semibold"
        style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px"
      >
        Llistat de Professors
      </h1>
    </div>

    <div v-if="loading" class="text-center py-8">
      <p class="text-gray-500">Carregant professors...</p>
    </div>

    <div v-else-if="teachers.length === 0" class="text-center py-8">
      <p class="text-gray-500">No hi ha professors assignats a aquest centre.</p>
    </div>

    <div v-else class="card overflow-hidden shadow-sm">
      <table class="w-full" style="margin-bottom: 15rem">
        <thead class="bg-gray-50" style="border-bottom: 2px solid var(--border-color)">
          <tr>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Nom</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Cognoms</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Email</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Estat</th>
            <!-- Add more columns if needed, e.g. Phone or Dep -->
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-100 bg-white">
          <tr
            v-for="teacher in teachers"
            :key="teacher.id_user"
            class="hover:bg-gray-50 transition-colors"
          >
            <td class="px-6 py-4 text-sm font-medium text-gray-900">{{ teacher.first_name }}</td>
            <td class="px-6 py-4 text-sm text-gray-900">{{ teacher.last_name }}</td>
            <td class="px-6 py-4 text-sm text-gray-600">{{ teacher.email }}</td>
            <td class="px-6 py-4">
              <span
                class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium"
                :class="
                  teacher.is_active ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800'
                "
              >
                {{ teacher.is_active ? 'Actiu' : 'Inactiu' }}
              </span>
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
import { getCurrentUser } from '../../../services/authService'

const teachers = ref([])
const loading = ref(true)

const sortTeachers = () => {
    teachers.value.sort((a, b) => {
    const lastNameCompare = (a.last_name || '').localeCompare(b.last_name || '', 'ca')
    if (lastNameCompare !== 0) return lastNameCompare
    return (a.first_name || '').localeCompare(b.first_name || '', 'ca')
  })
}

onMounted(async () => {
  try {
    const user = getCurrentUser() || {}
    if (user.id) {
      teachers.value = await centreService.getTeachers(user.id)
      sortTeachers()
    }
  } catch (error) {
    console.error('Error fetching teachers:', error)
  } finally {
    loading.value = false
  }
})
</script>
