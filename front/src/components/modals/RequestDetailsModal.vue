<template>
  <div v-if="isOpen" class="modal-backdrop" @click.self="close">
    <div class="modal-content max-w-3xl">
      <!-- Header -->
      <div class="flex items-center justify-between p-6 border-b border-gray-200">
        <h2 class="text-xl font-bold text-gray-800">
          Detalls de la Petició
        </h2>
        <button @click="close" class="text-gray-400 hover:text-gray-600 transition-colors">
          <X :size="24" />
        </button>
      </div>

      <!-- Content -->
      <div class="p-6">
        <div v-if="loading" class="flex items-center justify-center py-8">
          <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-blue-600"></div>
        </div>

        <div v-else-if="requestDetails">
          <!-- Request Info -->
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
            <div class="space-y-2">
              <label class="block text-sm font-medium text-gray-700">Centre</label>
              <p class="text-gray-900 font-medium">{{ requestDetails.center_name }}</p>
            </div>

            <div class="space-y-2">
              <label class="block text-sm font-medium text-gray-700">Taller</label>
              <p class="text-gray-900 font-medium">{{ requestDetails.workshop_title }}</p>
            </div>

            <div class="space-y-2">
              <label class="block text-sm font-medium text-gray-700">Alumnes Assignats</label>
              <p class="text-gray-900 font-medium">
                <span class="text-blue-600 text-lg">{{ requestDetails.accepted_students }}</span>
                <span class="text-gray-500"> / {{ requestDetails.total_students }}</span>
              </p>
            </div>

            <div class="space-y-2">
              <label class="block text-sm font-medium text-gray-700">Estat</label>
              <span :class="getStatusClass(requestDetails.status)">
                {{ getStatusLabel(requestDetails.status) }}
              </span>
            </div>

            <div class="space-y-2 md:col-span-2">
              <label class="block text-sm font-medium text-gray-700">Data de Creació</label>
              <p class="text-gray-900 font-medium">{{ formatDate(requestDetails.created_at) }}</p>
            </div>
          </div>

          <!-- Students List -->
          <div class="border-t border-gray-200 pt-6">
            <h3 class="text-lg font-semibold text-gray-800 mb-4">Alumnes de la Petició</h3>
            
            <div v-if="requestDetails.students && requestDetails.students.length > 0" class="space-y-2">
              <div 
                v-for="student in requestDetails.students" 
                :key="student.id_user"
                class="flex items-center justify-between p-3 rounded-lg border transition-all"
                :class="student.is_accepted 
                  ? 'bg-green-50 border-green-200' 
                  : 'bg-gray-50 border-gray-200'"
              >
                <div class="flex items-center gap-3">
                  <div 
                    class="w-10 h-10 rounded-full flex items-center justify-center text-white font-semibold"
                    :class="student.is_accepted ? 'bg-green-500' : 'bg-gray-400'"
                  >
                    {{ student.first_name.charAt(0) }}{{ student.last_name.charAt(0) }}
                  </div>
                  <div>
                    <p class="font-medium text-gray-900">
                      {{ student.first_name }} {{ student.last_name }}
                    </p>
                    <p class="text-sm text-gray-600">{{ student.eso_grade }}º ESO</p>
                  </div>
                </div>
                <div>
                  <span 
                    v-if="student.is_accepted"
                    class="px-3 py-1 bg-green-100 text-green-700 rounded-full text-xs font-medium flex items-center gap-1"
                  >
                    <CheckCircle :size="14" />
                    Acceptat
                  </span>
                  <span 
                    v-else
                    class="px-3 py-1 bg-gray-200 text-gray-600 rounded-full text-xs font-medium"
                  >
                    No acceptat
                  </span>
                </div>
              </div>
            </div>
            
            <div v-else class="text-center py-8 text-gray-500">
              No hi ha alumnes associats a aquesta petició
            </div>
          </div>
        </div>

        <!-- Footer -->
        <div class="flex justify-end gap-3 pt-6 mt-6 border-t border-gray-200">
          <button
            type="button"
            @click="close"
            class="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
          >
            Tancar
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { X, CheckCircle } from 'lucide-vue-next'
import { adminService } from '../../services/adminService.js'

const props = defineProps({
  isOpen: Boolean,
  request: Object
})

const emit = defineEmits(['close'])

const loading = ref(false)
const requestDetails = ref(null)

watch(() => props.isOpen, async (newValue) => {
  if (newValue && props.request) {
    await loadRequestDetails()
  }
}, { immediate: true })

const loadRequestDetails = async () => {
  if (!props.request?.id) return
  
  loading.value = true
  try {
    const data = await adminService.getRequestById(props.request.id)
    requestDetails.value = data
  } catch (error) {
    console.error('Error loading request details:', error)
  } finally {
    loading.value = false
  }
}

const getStatusClass = (status) => {
  const baseClass = 'px-3 py-1 rounded-full text-xs font-medium inline-block'
  if (status === 'ACCEPTED') return `${baseClass} bg-green-100 text-green-700`
  if (status === 'PENDING') return `${baseClass} bg-orange-100 text-orange-700`
  if (status === 'REJECTED') return `${baseClass} bg-red-100 text-red-700`
  return `${baseClass} bg-gray-100 text-gray-700`
}

const getStatusLabel = (status) => {
  if (status === 'ACCEPTED') return 'Assignada'
  if (status === 'PENDING') return 'Pendent'
  if (status === 'REJECTED') return 'Rebutjada'
  return status
}

const formatDate = (dateString) => {
  return new Date(dateString).toLocaleDateString('ca-ES')
}

const close = () => {
  requestDetails.value = null
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

.max-w-3xl {
  max-width: 48rem;
}
</style>
