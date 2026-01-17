<template>
  <div v-if="isOpen" class="modal-backdrop" @click.self="close">
    <div class="modal-content max-w-md">
      <!-- Header -->
      <div class="flex items-center justify-between p-6 border-b border-gray-200">
        <h2 class="text-xl font-bold text-gray-800">Assignar Centre</h2>
        <button @click="close" class="text-gray-400 hover:text-gray-600 transition-colors">
          <X :size="24" />
        </button>
      </div>

      <!-- Content -->
      <div class="p-6 space-y-4">
        <div v-if="teacher">
          <p class="text-sm text-gray-600 mb-4">
            Assignar centre al professor: <span class="font-semibold text-gray-900">{{ teacher.first_name }} {{ teacher.last_name }}</span>
          </p>

          <div v-if="teacher.center_name" class="mb-4 p-3 bg-blue-50 border border-blue-200 rounded-lg">
            <p class="text-sm text-white-800">
              <strong class="text-white">Centre actual:</strong class="text-white"> {{ teacher.center_name }}
            </p>
          </div>
        </div>

        <div>
          <label for="center" class="block text-sm font-medium text-gray-700 mb-2">
            Selecciona un centre
          </label>
          <select
            v-model="selectedCenterId"
            id="center"
            class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
            <option :value="null">-- Sense centre assignat --</option>
            <option v-for="center in centers" :key="center.id_user" :value="center.id_user">
              {{ center.center_name }} ({{ center.center_code }})
            </option>
          </select>
        </div>

        <div v-if="loading" class="text-center py-4">
          <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600 mx-auto"></div>
        </div>

        <div v-if="error" class="p-3 bg-red-50 border border-red-200 rounded-lg">
          <p class="text-sm text-red-600">{{ error }}</p>
        </div>

        <!-- Footer -->
        <div class="flex justify-end gap-3 pt-4">
          <button
            type="button"
            @click="close"
            class="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
          >
            Cancel·lar
          </button>
          <button
            type="button"
            @click="handleAssign"
            :disabled="loading"
            class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed"
          >
            {{ loading ? 'Assignant...' : 'Assignar' }}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watch, onMounted } from 'vue'
import { X } from 'lucide-vue-next'
import { adminService } from '../../services/adminService.js'

const props = defineProps({
  isOpen: Boolean,
  teacher: Object
})

const emit = defineEmits(['close', 'assigned'])

const centers = ref([])
const selectedCenterId = ref(null)
const loading = ref(false)
const error = ref('')

const loadCenters = async () => {
  try {
    centers.value = await adminService.getAllCenters()
  } catch (err) {
    console.error('Error loading centers:', err)
    error.value = 'Error al carregar els centres'
  }
}

watch(() => props.isOpen, (newVal) => {
  if (newVal) {
    loadCenters()
    selectedCenterId.value = props.teacher?.id_center_assigned || null
    error.value = ''
  }
})

const handleAssign = async () => {
  error.value = ''
  loading.value = true

  try {
    await adminService.assignCenterToTeacher(props.teacher.id_user, selectedCenterId.value)
    emit('assigned')
    close()
  } catch (err) {
    console.error('Error assigning center:', err)
    error.value = err.response?.data?.error || 'Error al assignar el centre'
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

.border-blue-200 {
  border-color: #bfdbfe;
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

.font-semibold {
  font-weight: 600;
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

.text-gray-900 {
  color: #111827;
}

.text-white {
  color: white;
}

.text-blue-800 {
  color: #1e40af;
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

.mb-2 {
  margin-bottom: 0.5rem;
}

.mb-4 {
  margin-bottom: 1rem;
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

.py-4 {
  padding-top: 1rem;
  padding-bottom: 1rem;
}

.pt-4 {
  padding-top: 1rem;
}

.bg-blue-50 {
  background-color: #eff6ff;
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

select:focus {
  outline: none;
}

.text-center {
  text-align: center;
}

.animate-spin {
  animation: spin 1s linear infinite;
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

.rounded-full {
  border-radius: 9999px;
}

.h-8 {
  height: 2rem;
}

.w-8 {
  width: 2rem;
}

.border-b-2 {
  border-bottom-width: 2px;
}

.border-blue-600 {
  border-color: #2563eb;
}

.mx-auto {
  margin-left: auto;
  margin-right: auto;
}
</style>
