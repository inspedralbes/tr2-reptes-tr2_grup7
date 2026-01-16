<template>
  <div v-if="isOpen" class="modal-backdrop" @click.self="close">
    <div class="modal-content max-w-2xl">
      <!-- Header -->
      <div class="flex items-center justify-between p-6 border-b border-gray-200">
        <h2 class="text-2xl font-bold text-gray-800">Detalls del Professor</h2>
        <button @click="close" class="text-gray-400 hover:text-gray-600 transition-colors">
          <X :size="24" />
        </button>
      </div>

      <!-- Content -->
      <div v-if="loading" class="p-8 text-center">
        <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
        <p class="mt-4 text-gray-600">Carregant...</p>
      </div>

      <div v-else-if="teacher" class="p-6 space-y-6">
        <!-- Personal Info -->
        <div>
          <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
            <User :size="20" class="text-blue-600" />
            Informació Personal
          </h3>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-4 bg-gray-50 p-4 rounded-lg">
            <div>
              <p class="text-sm text-gray-600">Nom</p>
              <p class="font-semibold text-gray-900">{{ teacher.first_name }} {{ teacher.last_name }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-600">Email</p>
              <p class="font-semibold text-gray-900">{{ teacher.email }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-600">Estat</p>
              <span v-if="teacher.is_active" class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                Actiu
              </span>
              <span v-else class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800">
                Inactiu
              </span>
            </div>
            <div>
              <p class="text-sm text-gray-600">ID Usuari</p>
              <p class="font-semibold text-gray-900">{{ teacher.id_user }}</p>
            </div>
          </div>
        </div>

        <!-- Assigned Center -->
        <div>
          <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
            <Building :size="20" class="text-blue-600" />
            Centre Assignat
          </h3>
          <div class="bg-gray-50 p-4 rounded-lg">
            <div v-if="teacher.center_name">
              <p class="font-semibold text-gray-900">{{ teacher.center_name }}</p>
              <p class="text-sm text-gray-600">Codi: {{ teacher.center_code }}</p>
            </div>
            <p v-else class="text-gray-500 italic">Sense centre assignat</p>
          </div>
        </div>

        <!-- Assigned Workshops -->
        <div>
          <h3 class="text-lg font-semibold text-gray-800 mb-4 flex items-center gap-2">
            <BookOpen :size="20" class="text-blue-600" />
            Tallers Assignats
          </h3>
          <div v-if="teacher.workshops && teacher.workshops.length > 0" class="space-y-2">
            <div v-for="workshop in teacher.workshops" :key="workshop.id_workshop" 
                 class="bg-gray-50 p-4 rounded-lg border-l-4 border-blue-500">
              <p class="font-semibold text-gray-900">{{ workshop.title }}</p>
              <div class="flex gap-4 mt-2 text-sm text-gray-600">
                <span>Inici: {{ formatDate(workshop.start_date) }}</span>
                <span>Fi: {{ formatDate(workshop.end_date) }}</span>
                <span class="inline-flex items-center px-2 py-0.5 rounded text-xs font-medium"
                      :class="getStatusClass(workshop.status)">
                  {{ workshop.status }}
                </span>
              </div>
            </div>
          </div>
          <p v-else class="text-gray-500 italic bg-gray-50 p-4 rounded-lg">No té tallers assignats</p>
        </div>
      </div>

      <!-- Footer -->
      <div class="flex justify-end gap-3 p-6 border-t border-gray-200 bg-gray-50">
        <button @click="close" class="px-4 py-2 text-gray-700 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors">
          Tancar
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { X, User, Building, BookOpen } from 'lucide-vue-next'
import { adminService } from '../../services/adminService.js'

const props = defineProps({
  isOpen: Boolean,
  teacherId: Number
})

const emit = defineEmits(['close'])

const teacher = ref(null)
const loading = ref(false)

const loadTeacherDetails = async () => {
  if (!props.teacherId) return
  
  loading.value = true
  try {
    teacher.value = await adminService.getTeacherById(props.teacherId)
  } catch (error) {
    console.error('Error loading teacher details:', error)
  } finally {
    loading.value = false
  }
}

watch(() => props.isOpen, (newVal) => {
  if (newVal) {
    loadTeacherDetails()
  }
})

const close = () => {
  emit('close')
}

const formatDate = (dateString) => {
  if (!dateString) return '-'
  const date = new Date(dateString)
  return date.toLocaleDateString('ca-ES', { year: 'numeric', month: 'long', day: 'numeric' })
}

const getStatusClass = (status) => {
  const classes = {
    'OFFERED': 'bg-green-100 text-green-800',
    'FULL': 'bg-yellow-100 text-yellow-800',
    'PENDING': 'bg-blue-100 text-blue-800',
    'ARCHIVED': 'bg-gray-100 text-gray-800'
  }
  return classes[status] || 'bg-gray-100 text-gray-800'
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

.gap-2 {
  gap: 0.5rem;
}

.gap-3 {
  gap: 0.75rem;
}

.gap-4 {
  gap: 1rem;
}

.p-4 {
  padding: 1rem;
}

.p-6 {
  padding: 1.5rem;
}

.p-8 {
  padding: 2rem;
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

.max-w-2xl {
  max-width: 42rem;
}

.w-full {
  width: 100%;
}

.max-h-\[90vh\] {
  max-height: 90vh;
}

.overflow-y-auto {
  overflow-y: auto;
}

.border-b {
  border-bottom-width: 1px;
}

.border-t {
  border-top-width: 1px;
}

.border-l-4 {
  border-left-width: 4px;
}

.border-gray-200 {
  border-color: #e5e7eb;
}

.border-gray-300 {
  border-color: #d1d5db;
}

.border-blue-500 {
  border-color: #3b82f6;
}

.text-center {
  text-align: center;
}

.space-y-2 > * + * {
  margin-top: 0.5rem;
}

.space-y-6 > * + * {
  margin-top: 1.5rem;
}

.grid {
  display: grid;
}

.grid-cols-1 {
  grid-template-columns: repeat(1, minmax(0, 1fr));
}

@media (min-width: 768px) {
  .md\:grid-cols-2 {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }
}

.bg-gray-50 {
  background-color: #f9fafb;
}

.text-sm {
  font-size: 0.875rem;
}

.text-lg {
  font-size: 1.125rem;
}

.text-2xl {
  font-size: 1.5rem;
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

.text-gray-500 {
  color: #6b7280;
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

.text-blue-600 {
  color: #2563eb;
}

.hover\:text-gray-600:hover {
  color: #4b5563;
}

.hover\:bg-gray-50:hover {
  background-color: #f9fafb;
}

.transition-colors {
  transition-property: color, background-color, border-color;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 150ms;
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

.h-12 {
  height: 3rem;
}

.w-12 {
  width: 3rem;
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

.mt-2 {
  margin-top: 0.5rem;
}

.mt-4 {
  margin-top: 1rem;
}

.mb-4 {
  margin-bottom: 1rem;
}

.inline-flex {
  display: inline-flex;
}

.px-2 {
  padding-left: 0.5rem;
  padding-right: 0.5rem;
}

.px-2\.5 {
  padding-left: 0.625rem;
  padding-right: 0.625rem;
}

.px-4 {
  padding-left: 1rem;
  padding-right: 1rem;
}

.py-0\.5 {
  padding-top: 0.125rem;
  padding-bottom: 0.125rem;
}

.py-2 {
  padding-top: 0.5rem;
  padding-bottom: 0.5rem;
}

.text-xs {
  font-size: 0.75rem;
}

.font-medium {
  font-weight: 500;
}

.bg-green-100 {
  background-color: #d1fae5;
}

.text-green-800 {
  color: #065f46;
}

.bg-red-100 {
  background-color: #fee2e2;
}

.text-red-800 {
  color: #991b1b;
}

.bg-yellow-100 {
  background-color: #fef3c7;
}

.text-yellow-800 {
  color: #92400e;
}

.bg-blue-100 {
  background-color: #dbeafe;
}

.text-blue-800 {
  color: #1e40af;
}

.bg-gray-100 {
  background-color: #f3f4f6;
}

.text-gray-800 {
  color: #1f2937;
}

.italic {
  font-style: italic;
}

.border {
  border-width: 1px;
}
</style>
