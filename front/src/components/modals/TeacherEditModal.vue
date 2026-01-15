<template>
  <div v-if="isOpen" class="modal-backdrop" @click.self="close">
    <div class="modal-content max-w-md">
      <!-- Header -->
      <div class="flex items-center justify-between p-6 border-b border-gray-200">
        <h2 class="text-xl font-bold text-gray-800">Editar Professor</h2>
        <button @click="close" class="text-gray-400 hover:text-gray-600 transition-colors">
          <X :size="24" />
        </button>
      </div>

      <!-- Content -->
      <form @submit.prevent="handleSubmit" class="p-6">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4">
          <div>
            <label for="first_name" class="block text-sm font-medium text-gray-700 mb-1">
              Nom *
            </label>
            <input
              v-model="formData.first_name"
              type="text"
              id="first_name"
              required
              class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              placeholder="Nom del professor"
            />
          </div>

          <div>
            <label for="last_name" class="block text-sm font-medium text-gray-700 mb-1">
              Cognoms *
            </label>
            <input
              v-model="formData.last_name"
              type="text"
              id="last_name"
              required
              class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              placeholder="Cognoms del professor"
            />
          </div>

          <div class="md:col-span-2">
            <label for="email" class="block text-sm font-medium text-gray-700 mb-1">
              Email *
            </label>
            <input
              v-model="formData.email"
              type="email"
              id="email"
              required
              class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
              placeholder="email@exemple.com"
            />
          </div>
        </div>

        <div v-if="error" class="p-3 bg-red-50 border border-red-200 rounded-lg mb-4">
          <p class="text-sm text-red-600">{{ error }}</p>
        </div>

        <!-- Footer -->
        <div class="flex justify-end gap-3 pt-4 border-t border-gray-200">
          <button
            type="button"
            @click="close"
            class="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
          >
            Cancel·lar
          </button>
          <button
            type="submit"
            :disabled="loading"
            class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {{ loading ? 'Guardant...' : 'Guardar' }}
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { X } from 'lucide-vue-next'
import { adminService } from '../../services/adminService.js'

const props = defineProps({
  isOpen: Boolean,
  teacher: Object
})

const emit = defineEmits(['close', 'updated'])

const formData = ref({
  first_name: '',
  last_name: '',
  email: ''
})

const loading = ref(false)
const error = ref('')

watch(() => props.teacher, (newTeacher) => {
  if (newTeacher) {
    formData.value = {
      first_name: newTeacher.first_name || '',
      last_name: newTeacher.last_name || '',
      email: newTeacher.email || ''
    }
  }
}, { immediate: true })

const handleSubmit = async () => {
  error.value = ''
  loading.value = true

  try {
    await adminService.updateTeacher(props.teacher.id_user, formData.value)
    emit('updated')
    close()
  } catch (err) {
    console.error('Error updating teacher:', err)
    error.value = err.response?.data?.error || 'Error al actualitzar el professor'
  } finally {
    loading.value = false
  }
}

const close = () => {
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

.max-w-md {
  max-width: 28rem;
}


.flex {
  display: flex;
}

.items-center {
  align-items: center;
}

.justify-center {
  justify-content: center;
}

.justify-between {
  justify-content: space-between;
}

.justify-end {
  justify-content: flex-end;
}

.gap-3 {
  gap: 0.75rem;
}

.p-3 {
  padding: 0.75rem;
}

.p-4 {
  padding: 1rem;
}

.p-6 {
  padding: 1.5rem;
}

.bg-black {
  background-color: black;
}

.bg-opacity-50 {
  opacity: 0.5;
}

.bg-white {
  background-color: white;
}

.rounded-lg {
  border-radius: 0.5rem;
}

.shadow-xl {
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

.max-w-md {
  max-width: 28rem;
}

.w-full {
  width: 100%;
}

.border-b {
  border-bottom-width: 1px;
}

.border {
  border-width: 1px;
}

.border-gray-200 {
  border-color: #e5e7eb;
}

.border-gray-300 {
  border-color: #d1d5db;
}

.border-red-200 {
  border-color: #fecaca;
}

.space-y-4 > * + * {
  margin-top: 1rem;
}

.block {
  display: block;
}

.text-sm {
  font-size: 0.875rem;
}

.text-xl {
  font-size: 1.25rem;
}

.font-medium {
  font-weight: 500;
}

.font-bold {
  font-weight: 700;
}

.text-gray-400 {
  color: #9ca3af;
}

.text-gray-600 {
  color: #4b5563;
}

.text-gray-700 {
  color: #374151;
}

.text-gray-800 {
  color: #1f2937;
}

.text-white {
  color: white;
}

.text-red-600 {
  color: #dc2626;
}

.hover\:text-gray-600:hover {
  color: #4b5563;
}

.hover\:bg-gray-50:hover {
  background-color: #f9fafb;
}

.hover\:bg-blue-700:hover {
  background-color: #1d4ed8;
}

.transition-colors {
  transition-property: color, background-color, border-color;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 150ms;
}

.mb-1 {
  margin-bottom: 0.25rem;
}

.px-3 {
  padding-left: 0.75rem;
  padding-right: 0.75rem;
}

.px-4 {
  padding-left: 1rem;
  padding-right: 1rem;
}

.py-2 {
  padding-top: 0.5rem;
  padding-bottom: 0.5rem;
}

.pt-4 {
  padding-top: 1rem;
}

.bg-blue-600 {
  background-color: #2563eb;
}

.bg-red-50 {
  background-color: #fef2f2;
}

.focus\:ring-2:focus {
  box-shadow: 0 0 0 2px rgba(37, 99, 235, 0.5);
}

.focus\:ring-blue-500:focus {
  --tw-ring-color: #3b82f6;
}

.focus\:border-blue-500:focus {
  border-color: #3b82f6;
}

.disabled\:opacity-50:disabled {
  opacity: 0.5;
}

.disabled\:cursor-not-allowed:disabled {
  cursor: not-allowed;
}

input:focus {
  outline: none;
}
</style>
