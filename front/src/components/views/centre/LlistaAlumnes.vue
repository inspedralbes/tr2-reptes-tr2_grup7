<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center">
      <h1
        class="text-2xl font-semibold"
        style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px"
      >
        Llista d'Alumnes
      </h1>
    </div>

    <div v-if="loading" class="text-center py-8">
      <p class="text-gray-500">Carregant alumnes...</p>
    </div>

    <div v-else-if="students.length === 0" class="text-center py-8">
      <p class="text-gray-500">No hi ha alumnes registrats en aquest centre.</p>
    </div>

    <div v-else class="card overflow-hidden shadow-sm">
      <table class="w-full" style="margin-bottom: 15rem">
        <thead class="bg-gray-50" style="border-bottom: 2px solid var(--border-color)">
          <tr>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Nom</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Cognoms</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Email</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Telèfon</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Data Naixement</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Estat</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Accions</th>
          </tr>
        </thead>
        <tbody class="divide-y divide-gray-100 bg-white">
          <tr
            v-for="student in students"
            :key="student.id_user"
            class="hover:bg-gray-50 transition-colors"
          >
            <td class="px-6 py-4 text-sm font-medium text-gray-900">{{ student.first_name }}</td>
            <td class="px-6 py-4 text-sm text-gray-900">{{ student.last_name }}</td>
            <td class="px-6 py-4 text-sm text-gray-600">{{ student.email }}</td>
            <td class="px-6 py-4 text-sm text-gray-600">{{ student.phone || '-' }}</td>
            <td class="px-6 py-4 text-sm text-gray-600">{{ formatDate(student.birth_date) }}</td>
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
            <td class="px-6 py-4">
              <div class="flex gap-3">
                <button
                  @click="openEditModal(student)"
                  class="text-blue-600 hover:text-blue-800 p-2 rounded hover:bg-blue-50 transition-colors"
                  title="Editar alumne"
                >
                  <Pencil :size="18" />
                </button>
                <button
                  @click="confirmDelete(student)"
                  class="text-red-600 hover:text-red-800 p-2 rounded hover:bg-red-50 transition-colors"
                  title="Eliminar alumne"
                >
                  <Trash2 :size="18" />
                </button>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Modal d'Edició -->
    <div
      v-if="showEditModal"
      class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50"
      @click.self="closeEditModal"
    >
      <div class="bg-white rounded-lg shadow-xl max-w-md w-full mx-4 p-6">
        <h3 class="text-lg font-semibold mb-4" style="color: var(--text-primary)">Editar Alumne</h3>

        <form @submit.prevent="saveStudent" class="space-y-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Nom *</label>
            <input
              v-model="editForm.first_name"
              type="text"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              required
            />
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Cognoms *</label>
            <input
              v-model="editForm.last_name"
              type="text"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              required
            />
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Telèfon</label>
            <input
              v-model="editForm.phone"
              type="tel"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Data Naixement</label>
            <input
              v-model="editForm.birth_date"
              type="date"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
          </div>

          <div class="flex gap-3 pt-4">
            <button type="submit" class="flex-1 btn-primary py-2" :disabled="saving">
              {{ saving ? 'Guardant...' : 'Guardar' }}
            </button>
            <button type="button" @click="closeEditModal" class="flex-1 btn-outline py-2">
              Cancel·lar
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { Pencil, Trash2 } from 'lucide-vue-next'
import * as centreService from '../../../services/centreService'
import { getCurrentUser } from '../../../services/authService'

const students = ref([])
const loading = ref(true)
const showEditModal = ref(false)
const saving = ref(false)
const editForm = ref({
  id_user: null,
  first_name: '',
  last_name: '',
  phone: '',
  birth_date: '',
})
const centreId = ref(null)

const formatDate = (dateString) => {
  if (!dateString) return '-'
  return new Date(dateString).toLocaleDateString('es-ES', {
    year: 'numeric',
    month: 'short',
    day: 'numeric',
  })
}

const formatDateForInput = (dateString) => {
  if (!dateString) return ''
  const date = new Date(dateString)
  return date.toISOString().split('T')[0]
}

const openEditModal = (student) => {
  editForm.value = {
    id_user: student.id_user,
    first_name: student.first_name,
    last_name: student.last_name,
    phone: student.phone || '',
    birth_date: formatDateForInput(student.birth_date),
  }
  showEditModal.value = true
}

const closeEditModal = () => {
  showEditModal.value = false
  editForm.value = {
    id_user: null,
    first_name: '',
    last_name: '',
    phone: '',
    birth_date: '',
  }
}

const saveStudent = async () => {
  saving.value = true
  try {
    await centreService.updateStudent(centreId.value, editForm.value.id_user, {
      first_name: editForm.value.first_name,
      last_name: editForm.value.last_name,
      phone: editForm.value.phone || null,
      birth_date: editForm.value.birth_date || null,
    })

    // Refresh the list
    students.value = await centreService.getStudents(centreId.value)
    sortStudents()
    closeEditModal()
    alert('Alumne actualitzat correctament!')
  } catch (error) {
    console.error('Error updating student:', error)
    alert("Error actualitzant l'alumne. Torna-ho a provar.")
  } finally {
    saving.value = false
  }
}

const confirmDelete = async (student) => {
  const confirmed = confirm(
    `Estàs segur que vols eliminar l'alumne "${student.first_name} ${student.last_name}"?\n\nAquesta acció no es pot desfer.`,
  )

  if (confirmed) {
    try {
      await centreService.deleteStudent(centreId.value, student.id_user)
      // Remove from local list
      students.value = students.value.filter((s) => s.id_user !== student.id_user)
      alert('Alumne eliminat correctament!')
    } catch (error) {
      console.error('Error deleting student:', error)
      alert("Error eliminant l'alumne. Potser té peticions associades.")
    }
  }
}

const sortStudents = () => {
  students.value.sort((a, b) => {
    const lastNameCompare = (a.last_name || '').localeCompare(b.last_name || '', 'ca')
    if (lastNameCompare !== 0) return lastNameCompare
    return (a.first_name || '').localeCompare(b.first_name || '', 'ca')
  })
}

onMounted(async () => {
  try {
    const user = getCurrentUser() || {}
    if (user.id) {
      centreId.value = user.id
      students.value = await centreService.getStudents(user.id)
      sortStudents()
    }
  } catch (error) {
    console.error('Error fetching students:', error)
  } finally {
    loading.value = false
  }
})
</script>
