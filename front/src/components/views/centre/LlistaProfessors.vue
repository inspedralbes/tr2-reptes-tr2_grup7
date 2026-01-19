<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center">
      <h1
        class="text-2xl font-semibold"
        style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px"
      >
        Llistat de Professors
      </h1>
      <button
        @click="openCreateModal"
        class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700 transition-colors flex items-center gap-2"
      >
        <Plus :size="20" />
        Nou Professor
      </button>
    </div>

    <div v-if="loading" class="text-center py-8">
      <p class="text-gray-500">Carregant professors...</p>
    </div>

    <div v-else-if="teachers.length === 0" class="text-center py-8">
      <p class="text-gray-500">No hi ha professors assignats a aquest centre.</p>
    </div>

    <div v-else class="card overflow-hidden shadow-sm">
      <table class="w-full" style="margin-bottom: 2rem">
        <thead class="bg-gray-50" style="border-bottom: 2px solid var(--border-color)">
          <tr>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Nom</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Cognoms</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Email</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Estat</th>
            <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Accions</th>
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
            <td class="px-6 py-4">
              <div class="flex gap-3">
                <button
                  @click="openEditModal(teacher)"
                  class="text-blue-600 hover:text-blue-800 p-2 rounded hover:bg-blue-50 transition-colors"
                  title="Editar professor"
                >
                  <Pencil :size="18" />
                </button>
                <button
                  @click="confirmDelete(teacher)"
                  class="text-red-600 hover:text-red-800 p-2 rounded hover:bg-red-50 transition-colors"
                  title="Eliminar professor"
                >
                  <Trash2 :size="18" />
                </button>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Modal Creat/Editar -->
    <div
      v-if="showModal"
      class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50"
      @click.self="closeModal"
    >
      <div class="bg-white rounded-lg shadow-xl max-w-md w-full mx-4 p-6">
        <h3 class="text-lg font-semibold mb-4" style="color: var(--text-primary)">
          {{ isEditing ? 'Editar Professor' : 'Nou Professor' }}
        </h3>

        <form @submit.prevent="saveTeacher" class="space-y-4">
          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Nom *</label>
            <input
              v-model="form.first_name"
              type="text"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              required
            />
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Cognoms *</label>
            <input
              v-model="form.last_name"
              type="text"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              required
            />
          </div>

          <div>
            <label class="block text-sm font-medium text-gray-700 mb-1">Email *</label>
            <input
              v-model="form.email"
              type="email"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              required
            />
          </div>

          <div v-if="!isEditing">
            <label class="block text-sm font-medium text-gray-700 mb-1">Contrasenya *</label>
            <input
              v-model="form.password"
              type="password"
              class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
              required
              minlength="6"
            />
          </div>

          <div class="flex gap-3 pt-4">
            <button type="submit" class="flex-1 btn-primary py-2" :disabled="saving">
              {{ saving ? 'Guardant...' : 'Guardar' }}
            </button>
            <button type="button" @click="closeModal" class="flex-1 btn-outline py-2">
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
import { Plus, Pencil, Trash2 } from 'lucide-vue-next'
import * as centreService from '../../../services/centreService'
import { getCurrentUser } from '../../../services/authService'

const teachers = ref([])
const loading = ref(true)
const showModal = ref(false)
const saving = ref(false)
const isEditing = ref(false)
const centreId = ref(null)

const form = ref({
  id_user: null,
  first_name: '',
  last_name: '',
  email: '',
  password: ''
})

const sortTeachers = () => {
    teachers.value.sort((a, b) => {
    const lastNameCompare = (a.last_name || '').localeCompare(b.last_name || '', 'ca')
    if (lastNameCompare !== 0) return lastNameCompare
    return (a.first_name || '').localeCompare(b.first_name || '', 'ca')
  })
}

const loadTeachers = async () => {
  try {
    if (centreId.value) {
      teachers.value = await centreService.getTeachers(centreId.value)
      sortTeachers()
    }
  } catch (error) {
    console.error('Error fetching teachers:', error)
  }
}

const openCreateModal = () => {
  isEditing.value = false
  form.value = {
    id_user: null,
    first_name: '',
    last_name: '',
    email: '',
    password: ''
  }
  showModal.value = true
}

const openEditModal = (teacher) => {
  isEditing.value = true
  form.value = {
    id_user: teacher.id_user,
    first_name: teacher.first_name,
    last_name: teacher.last_name,
    email: teacher.email,
    password: '' // Password not required for edit
  }
  showModal.value = true
}

const closeModal = () => {
  showModal.value = false
}

const saveTeacher = async () => {
  saving.value = true
  try {
    if (isEditing.value) {
      await centreService.updateTeacher(centreId.value, form.value.id_user, {
        first_name: form.value.first_name,
        last_name: form.value.last_name,
        email: form.value.email
      })
      alert('Professor actualitzat correctament')
    } else {
      await centreService.createTeacher(centreId.value, {
        first_name: form.value.first_name,
        last_name: form.value.last_name,
        email: form.value.email,
        password: form.value.password
      })
      alert('Professor creat correctament')
    }
    await loadTeachers()
    closeModal()
  } catch (error) {
    console.error('Error saving teacher:', error)
    alert(error.response?.data?.error || 'Error al guardar el professor')
  } finally {
    saving.value = false
  }
}

const confirmDelete = async (teacher) => {
  if (confirm(`Estàs segur que vols eliminar el professor "${teacher.first_name} ${teacher.last_name}"?`)) {
    try {
      await centreService.deleteTeacher(centreId.value, teacher.id_user)
      alert('Professor eliminat correctament')
      await loadTeachers()
    } catch (error) {
      console.error('Error deleting teacher:', error)
      alert('Error al eliminar el professor')
    }
  }
}

onMounted(async () => {
  try {
    const user = getCurrentUser() || {}
    if (user.id) {
      centreId.value = user.id
      await loadTeachers()
    }
  } catch (error) {
    console.error('Error initializing:', error)
  } finally {
    loading.value = false
  }
})
</script>
