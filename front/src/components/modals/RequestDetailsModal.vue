<template>
  <div v-if="isOpen" class="modal-backdrop" @click.self="close">
    <div class="modal-content max-w-2xl">
      <!-- Header -->
      <div class="flex items-center justify-between p-6 border-b border-gray-200">
        <h2 class="text-xl font-bold text-gray-800">
          {{ isEditing ? 'Editar Petició' : 'Detalls de la Petició' }}
        </h2>
        <button @click="close" class="text-gray-400 hover:text-gray-600 transition-colors">
          <X :size="24" />
        </button>
      </div>

      <!-- Content -->
      <div class="p-6">
        <form v-if="isEditing" @submit.prevent="handleSave" class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div class="space-y-2">
            <label class="block text-sm font-medium text-gray-700">Centre</label>
            <input 
              v-model="formData.centre" 
              type="text" 
              disabled
              class="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-100 cursor-not-allowed"
            />
          </div>

          <div class="space-y-2">
            <label class="block text-sm font-medium text-gray-700">Taller</label>
            <input 
              v-model="formData.workshop" 
              type="text" 
              disabled
              class="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-100 cursor-not-allowed"
            />
          </div>

          <div class="space-y-2">
            <label class="block text-sm font-medium text-gray-700">Nombre d'Alumnes *</label>
            <input 
              v-model.number="formData.students" 
              type="number" 
              min="1"
              required
              class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
            />
          </div>

          <div class="space-y-2">
            <label class="block text-sm font-medium text-gray-700">Estat</label>
            <select 
              v-model="formData.statusRaw"
              disabled
              class="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-100 cursor-not-allowed"
            >
              <option value="PENDING">Pendent</option>
              <option value="ACCEPTED">Assignada</option>
              <option value="REJECTED">Rebutjada</option>
            </select>
          </div>

          <div class="space-y-2 md:col-span-2">
            <label class="block text-sm font-medium text-gray-700">Data de Creació</label>
            <input 
              v-model="formData.date" 
              type="text" 
              disabled
              class="w-full px-3 py-2 border border-gray-300 rounded-lg bg-gray-100 cursor-not-allowed"
            />
          </div>

          <div v-if="error" class="md:col-span-2 p-3 bg-red-50 border border-red-200 rounded-lg">
            <p class="text-sm text-red-600">{{ error }}</p>
          </div>
        </form>

        <!-- View Mode -->
        <div v-else class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div class="space-y-2">
            <label class="block text-sm font-medium text-gray-700">Centre</label>
            <p class="text-gray-900 font-medium">{{ request?.centre }}</p>
          </div>

          <div class="space-y-2">
            <label class="block text-sm font-medium text-gray-700">Taller</label>
            <p class="text-gray-900 font-medium">{{ request?.workshop }}</p>
          </div>

          <div class="space-y-2">
            <label class="block text-sm font-medium text-gray-700">Nombre d'Alumnes</label>
            <p class="text-gray-900 font-medium">{{ request?.students }}</p>
          </div>

          <div class="space-y-2">
            <label class="block text-sm font-medium text-gray-700">Estat</label>
            <span :class="getStatusClass(request?.status)">
              {{ request?.status }}
            </span>
          </div>

          <div class="space-y-2 md:col-span-2">
            <label class="block text-sm font-medium text-gray-700">Data de Creació</label>
            <p class="text-gray-900 font-medium">{{ request?.date }}</p>
          </div>
        </div>

        <!-- Footer -->
        <div class="flex justify-end gap-3 pt-6 mt-6 border-t border-gray-200">
          <button
            v-if="!isEditing"
            type="button"
            @click="close"
            class="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
          >
            Tancar
          </button>
          <button
            v-if="!isEditing"
            type="button"
            @click="startEditing"
            class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition-colors flex items-center gap-2"
          >
            <Edit :size="18" />
            Editar
          </button>

          <template v-if="isEditing">
            <button
              type="button"
              @click="cancelEditing"
              class="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
            >
              Cancel·lar
            </button>
            <button
              type="submit"
              @click="handleSave"
              :disabled="loading"
              class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed flex items-center gap-2"
            >
              <Save :size="18" />
              {{ loading ? 'Guardant...' : 'Guardar' }}
            </button>
          </template>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { X, Edit, Save } from 'lucide-vue-next'
import { adminService } from '../../services/adminService.js'

const props = defineProps({
  isOpen: Boolean,
  request: Object
})

const emit = defineEmits(['close', 'updated'])

const isEditing = ref(false)
const loading = ref(false)
const error = ref('')

const formData = ref({
  centre: '',
  workshop: '',
  students: 0,
  statusRaw: 'PENDING',
  date: ''
})

watch(() => props.request, (newRequest) => {
  if (newRequest) {
    formData.value = {
      centre: newRequest.centre,
      workshop: newRequest.workshop,
      students: newRequest.students,
      statusRaw: newRequest.statusRaw,
      date: newRequest.date
    }
    isEditing.value = false
    error.value = ''
  }
}, { immediate: true })

const getStatusClass = (status) => {
  const baseClass = 'px-3 py-1 rounded-full text-xs font-medium inline-block'
  if (status === 'Assignada') return `${baseClass} bg-green-100 text-green-700`
  if (status === 'Pendent') return `${baseClass} bg-orange-100 text-orange-700`
  if (status === 'Rebutjada') return `${baseClass} bg-red-100 text-red-700`
  return `${baseClass} bg-gray-100 text-gray-700`
}

const startEditing = () => {
  isEditing.value = true
}

const cancelEditing = () => {
  isEditing.value = false
  error.value = ''
  // Reset form data
  formData.value = {
    centre: props.request.centre,
    workshop: props.request.workshop,
    students: props.request.students,
    statusRaw: props.request.statusRaw,
    date: props.request.date
  }
}

const handleSave = async () => {
  error.value = ''
  loading.value = true

  try {
    await adminService.updateRequest(props.request.id, {
      requested_slots: formData.value.students
      // No enviamos el status, se cambia con los botones de aceptar/rechazar
    })
    emit('updated')
    isEditing.value = false
    close()
  } catch (err) {
    console.error('Error updating request:', err)
    error.value = err.response?.data?.error || 'Error al actualitzar la petició'
  } finally {
    loading.value = false
  }
}

const close = () => {
  isEditing.value = false
  error.value = ''
  emit('close')
}
</script>

<style scoped>
.modal-backdrop {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 9999;
  padding: 1rem;
}

.modal-content {
  background-color: white;
  border-radius: 0.5rem;
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
  width: 100%;
  max-height: 90vh;
  overflow-y: auto;
  position: relative;
}

.max-w-2xl {
  max-width: 42rem;
}
</style>
