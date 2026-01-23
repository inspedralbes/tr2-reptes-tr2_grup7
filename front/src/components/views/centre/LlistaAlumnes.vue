<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center">
      <h1
        class="text-2xl font-semibold"
        style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px"
      >
        Llista d'Alumnes
      </h1>
      <button
        @click="openCreateModal"
        class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors flex items-center gap-2"
      >
        <Plus :size="20" />
        Nou Alumne
      </button>
    </div>

    <div v-if="loading" class="text-center py-8">
      <p class="text-gray-500">Carregant alumnes...</p>
    </div>

    <div v-else-if="students.length === 0" class="text-center py-8">
      <p class="text-gray-500">No hi ha alumnes registrats en aquest centre.</p>
    </div>

    <div v-else class="card overflow-hidden shadow-sm">
      <table class="w-full" style="margin-bottom: 20rem">
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

    <!-- Modal d'Edició / Creació -->
    <Modal
      :show="showModal"
      :title="isEditing ? 'Editar Alumne' : 'Nou Alumne'"
      @close="closeModal"
    >
      <form id="studentForm" @submit.prevent="saveStudent" class="space-y-4">
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Nom *</label>
          <input
            v-model="form.first_name"
            type="text"
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            required
          />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Cognoms *</label>
          <input
            v-model="form.last_name"
            type="text"
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            required
          />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Email *</label>
          <input
            v-model="form.email"
            type="email"
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            required
          />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Telèfon</label>
          <input
            v-model="form.phone"
            type="tel"
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Data Naixement *</label>
          <input
            v-model="form.birth_date"
            type="date"
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            required
          />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Curs (ESO) *</label>
          <select
            v-model="form.eso_grade"
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            required
          >
            <option disabled value="">Selecciona un curs</option>
            <option :value="3">3r ESO</option>
            <option :value="4">4t ESO</option>
          </select>
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-1">Gènere *</label>
          <select
            v-model="form.gender"
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            required
          >
            <option disabled value="">Selecciona un gènere</option>
            <option value="M">Masculí</option>
            <option value="F">Femení</option>
            <option value="O">Altre</option>
          </select>
        </div>
      </form>

      <template #footer>
        <button
          type="button"
          @click="closeModal"
          class="px-4 py-2 text-gray-700 bg-gray-100 rounded-lg hover:bg-gray-200 transition-colors"
        >
          Cancel·lar
        </button>
        <button
          type="submit"
          form="studentForm"
          class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700 flex items-center gap-2 transition-colors"
          :disabled="saving"
        >
          <span v-if="saving">Guardant...</span>
          <span v-else>{{ isEditing ? 'Actualitzar' : 'Crear' }}</span>
        </button>
      </template>
    </Modal>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
// Ensure Plus is imported
import { Plus, Pencil, Trash2 } from 'lucide-vue-next'
import * as centreService from '../../../services/centreService'
import { getCurrentUser } from '../../../services/authService'
import Modal from '../../shared/Modal.vue'
import { useAlertStore } from '../../../stores/alert'

const alertStore = useAlertStore()
const students = ref([])
const loading = ref(true)
const showModal = ref(false)
const saving = ref(false)
const isEditing = ref(false)
// Renamed editForm to form to assume generic usage
const form = ref({
  id_user: null,
  first_name: '',
  last_name: '',
  email: '',
  phone: '',
  birth_date: '',
  eso_grade: '',
  gender: '',
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

const openCreateModal = () => {
  isEditing.value = false
  form.value = {
    id_user: null,
    first_name: '',
    last_name: '',
    email: '',
    phone: '',
    phone: '',
    birth_date: '',
    eso_grade: '',
    gender: '',
  }
  showModal.value = true
}

const openEditModal = (student) => {
  isEditing.value = true
  form.value = {
    id_user: student.id_user,
    first_name: student.first_name,
    last_name: student.last_name,
    email: student.email, 
    phone: student.phone || '',
    birth_date: formatDateForInput(student.birth_date),
    eso_grade: student.eso_grade,
    gender: student.gender,
  }
  showModal.value = true
}

const closeModal = () => {
  showModal.value = false
}

const saveStudent = async () => {
  saving.value = true
  try {
    if (isEditing.value) {
      await centreService.updateStudent(centreId.value, form.value.id_user, {
        first_name: form.value.first_name,
        last_name: form.value.last_name,
        email: form.value.email,
        phone: form.value.phone || null,
        birth_date: form.value.birth_date || null,
        eso_grade: form.value.eso_grade,
        gender: form.value.gender,
      })
      alertStore.addAlert('success', 'Alumne actualitzat correctament!')
    } else {
      await centreService.createStudent(centreId.value, {
        first_name: form.value.first_name,
        last_name: form.value.last_name,
        email: form.value.email,
        phone: form.value.phone || null,
        phone: form.value.phone || null,
        birth_date: form.value.birth_date || null,
        eso_grade: form.value.eso_grade,
        gender: form.value.gender,
      })
      alertStore.addAlert('success', 'Alumne creat correctament!')
    }

    // Refresh the list
    students.value = await centreService.getStudents(centreId.value)
    sortStudents()
    closeModal()
  } catch (error) {
    console.error('Error updating/creating student:', error)
    const msg = error.response?.data?.error || "Error guardant l'alumne."
    alertStore.addAlert('error', msg)
  } finally {
    saving.value = false
  }
}

const confirmDelete = async (student) => {
  const confirmed = await alertStore.confirm(
    `Estàs segur que vols eliminar l'alumne "${student.first_name} ${student.last_name}"?\n\nAquesta acció no es pot desfer.`,
    'Confirmar eliminació'
  )

  if (confirmed) {
    try {
      await centreService.deleteStudent(centreId.value, student.id_user)
      // Remove from local list
      students.value = students.value.filter((s) => s.id_user !== student.id_user)
      alertStore.addAlert('success', 'Alumne eliminat correctament!')
    } catch (error) {
      console.error('Error deleting student:', error)
      const msg = error.response?.data?.details || "Error eliminant l'alumne. Potser té peticions associades."
      alertStore.addAlert('error', msg)
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
    alertStore.addAlert('error', 'Error al carregar els alumnes')
  } finally {
    loading.value = false
  }
})
</script>
