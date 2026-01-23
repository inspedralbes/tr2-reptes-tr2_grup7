<template>
  <div class="space-y-6 pb-12">
    <!-- Header -->
    <div
      class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-b border-gray-200 pb-4 mb-6"
    >
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Avaluacions</h1>
    </div>

    <!-- GRADING VIEW (Student List) -->
    <div v-if="gradingMode" class="card p-6 border-l-4 border-l-primary animate-fade-in">
      <button
        @click="gradingMode = false"
        class="mb-6 flex items-center text-sm font-medium text-gray-500 hover:text-primary transition-colors"
      >
        <ArrowLeft :size="16" class="mr-1" /> Tornar a la llista
      </button>

      <div class="mb-8 p-4 bg-gray-50 rounded-lg border border-gray-100">
        <h2 class="text-xl font-bold text-gray-800 mb-2">Avaluant: {{ currentWorkshop?.title }}</h2>
        <p class="text-sm text-gray-600 flex items-center gap-2">
          <Info :size="16" class="text-primary" />
          Assigna una nota de l'1 al 5 i un comentari per a cada alumne.
        </p>
      </div>

      <div v-if="loadingStudents" class="text-center py-12">
        <p class="text-gray-500">Carregant estudiants...</p>
      </div>

      <div
        v-else-if="students.length === 0"
        class="text-center py-12 bg-gray-50 rounded-lg border border-gray-100"
      >
        <p class="text-gray-500">No hi ha alumnes inscrits en aquest taller.</p>
      </div>

      <div v-else class="overflow-x-auto rounded-lg border border-gray-200">
        <table class="w-full text-left">
          <thead class="bg-gray-50 text-gray-700">
            <tr>
              <th class="p-4 font-semibold border-b border-gray-200">Alumne</th>
              <th class="p-4 font-semibold border-b border-gray-200 w-48">Nota (1-5)</th>
              <th class="p-4 font-semibold border-b border-gray-200">Comentaris</th>
              <th class="p-4 font-semibold border-b border-gray-200 w-32">Acció</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-100">
            <tr
              v-for="student in students"
              :key="student.id_student"
              class="hover:bg-gray-50/50 transition-colors"
            >
              <td class="p-4">
                <div class="font-bold text-gray-800">
                  {{ student.first_name }} {{ student.last_name }}
                </div>
                <div class="text-sm text-gray-500">{{ student.email }}</div>
              </td>
              <td class="p-4">
                <select
                  v-model="student.grade"
                  class="w-full p-2 border border-gray-300 rounded focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all"
                >
                  <option value="" disabled>Selecciona...</option>
                  <option value="1">1 - Insuficient</option>
                  <option value="2">2 - Suficient</option>
                  <option value="3">3 - Bé</option>
                  <option value="4">4 - Notable</option>
                  <option value="5">5 - Excel·lent</option>
                </select>
              </td>
              <td class="p-4">
                <input
                  type="text"
                  v-model="student.comments"
                  placeholder="Escriu un comentari..."
                  class="w-full p-2 border border-gray-300 rounded focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all"
                />
              </td>
              <td class="p-4">
                <button
                  @click="saveEvaluation(student)"
                  :disabled="student.isSaving"
                  class="btn-primary py-1.5 px-3 text-sm flex items-center justify-center gap-2 w-full"
                  :class="{ 'opacity-75 cursor-not-allowed': student.isSaving }"
                >
                  <Save :size="14" v-if="!student.isSaving" />
                  <span
                    v-if="student.isSaving"
                    class="animate-spin h-3 w-3 border-2 border-white border-t-transparent rounded-full"
                  ></span>
                  {{ student.isSaving ? 'Desant...' : 'Desar' }}
                </button>
                <div
                  v-if="student.saved"
                  class="mt-1 text-center text-xs text-green-600 font-bold flex items-center justify-center gap-1 animate-fade-in"
                >
                  <CheckCircle :size="10" /> Desat
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- MAIN VIEW: Workshop List -->
    <div v-else class="space-y-6">
      <div v-if="loading" class="text-center py-12">
        <p class="text-gray-500">Carregant avaluacions...</p>
      </div>

      <div
        v-else-if="workshops.length === 0"
        class="text-center py-12 card bg-gray-50 border-gray-100"
      >
        <p class="text-gray-500">No tens tallers amb alumnes per avaluar.</p>
      </div>

      <div v-else class="grid grid-cols-1 lg:grid-cols-2 gap-6">
        <div
          v-for="workshop in activeWorkshops"
          :key="workshop.id_workshop"
          class="card hover:shadow-md transition-all"
        >
          <div class="flex items-start justify-between mb-4 border-b border-gray-100 pb-4">
            <div>
              <h2 class="text-xl font-bold text-gray-800 mb-1">
                {{ workshop.title }}
              </h2>
              <p class="text-sm font-medium text-gray-500 flex items-center gap-2">
                <Tag :size="14" /> {{ workshop.category }}
              </p>
            </div>
            <div
              class="bg-blue-50 text-blue-700 px-3 py-1 rounded-full text-sm font-bold flex items-center gap-2"
            >
              <Users :size="16" />
              {{ workshop.max_slots - workshop.available_slots }} alumnes
            </div>
          </div>

          <!-- Estadístiques del taller -->
          <div class="grid grid-cols-2 gap-4 mb-6">
            <div class="text-center p-4 bg-gray-50 rounded-lg border border-gray-100">
              <UserCheck :size="24" class="mx-auto mb-2 text-green-600" />
              <p class="text-2xl font-bold text-gray-800">
                {{ workshop.enrolled_count || 0 }}
              </p>
              <p class="text-xs text-gray-500 uppercase tracking-wide">Inscrits</p>
            </div>
            <div class="text-center p-4 bg-gray-50 rounded-lg border border-gray-100">
              <Clock :size="24" class="mx-auto mb-2 text-orange-500" />
              <p class="text-2xl font-bold text-gray-800">
                {{ workshop.duration_hours }}
              </p>
              <p class="text-xs text-gray-500 uppercase tracking-wide">Hores Totals</p>
            </div>
          </div>

          <!-- Criteris d'avaluació -->
          <div class="mb-6 p-4 border border-gray-100 rounded-lg bg-white">
            <h3
              class="text-sm font-bold text-gray-700 mb-3 flex items-center gap-2 uppercase tracking-wide"
            >
              <ClipboardList :size="16" class="text-primary" />
              Criteris d'avaluació
            </h3>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
              <div class="flex items-center gap-2 text-sm text-gray-600">
                <span class="w-2 h-2 rounded-full bg-green-500"></span>
                Assistència i puntualitat
              </div>
              <div class="flex items-center gap-2 text-sm text-gray-600">
                <span class="w-2 h-2 rounded-full bg-blue-500"></span>
                Participació activa
              </div>
              <div class="flex items-center gap-2 text-sm text-gray-600">
                <span class="w-2 h-2 rounded-full bg-orange-500"></span>
                Treball en equip
              </div>
              <div class="flex items-center gap-2 text-sm text-gray-600">
                <span class="w-2 h-2 rounded-full bg-purple-500"></span>
                Qualitat del treball
              </div>
            </div>
          </div>

          <!-- Botones de acción -->
          <div class="flex gap-3 mt-auto pt-2 border-t border-gray-100">
            <button
              @click="manageEvaluations(workshop)"
              class="flex-1 btn-primary py-2 px-4 flex items-center justify-center gap-2"
              :style="{ backgroundColor: getCategoryColor(workshop.category).text + ' !important' }"
            >
              <Edit :size="18" />
              Avaluar
            </button>
            <button
               @click="goToAttendance(workshop.id_workshop)"
               class="flex-1 btn-outline py-2 px-4 flex items-center justify-center gap-2 text-orange-600 border-orange-200 hover:bg-orange-50"
            >
              <ClipboardList :size="18" />
              Passar Llista
            </button>
            <button
              @click="goToDetail(workshop.id_workshop)"
              class="flex-1 btn-outline py-2 px-4 flex items-center justify-center gap-2"
            >
              <Eye :size="18" />
              Detalls
            </button>
          </div>
        </div>
      </div>

      <!-- Info adicional -->
      <div
        v-if="activeWorkshops.length > 0"
        class="card bg-blue-50 border-blue-100 p-4 flex items-start gap-4"
      >
        <Info :size="24" class="text-blue-600 flex-shrink-0 mt-1" />
        <div>
          <h3 class="font-bold text-blue-800 mb-1">Informació sobre avaluacions</h3>
          <p class="text-sm text-blue-700">
            Les avaluacions es poden realitzar durant o després de finalitzar el taller. Recorda que
            els criteris d'avaluació han d'estar alineats amb els objectius del taller.
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import {
  Users,
  UserCheck,
  Clock,
  Star,
  ClipboardList,
  Edit,
  Eye,
  Info,
  ArrowLeft,
  Save,
  Tag,
  CheckCircle,
} from 'lucide-vue-next'
import apiClient from '../../../services/apiClient'
import { getCurrentUser } from '../../../services/authService'

const router = useRouter()
const workshops = ref([])
const loading = ref(true)
const user = ref(getCurrentUser() || {})

// Grading Mode State
const gradingMode = ref(false)
const currentWorkshop = ref(null)
const students = ref([])
const loadingStudents = ref(false)

const fetchWorkshops = async () => {
  try {
    loading.value = true
    const teacherId = user.value.teacher_id
    if (!teacherId) {
      console.warn('No teacher_id found in user object')
      workshops.value = []
      return
    }
    const response = await apiClient.get(`/workshops/mine?teacher_id=${teacherId}`)
    workshops.value = response.data
  } catch (error) {
    console.error('Error fetching workshops:', error)
  } finally {
    loading.value = false
  }
}

const activeWorkshops = computed(() => {
  const now = new Date()
  return workshops.value.filter((w) => {
    const startDate = new Date(w.start_date)
    const endDate = new Date(w.end_date)
    // Mostrar talleres activos, finalizados o futuros si son relevantes
    return true
  })
})

const goToDetail = (id) => {
  router.push(`/profesor/detalle/${id}`)
}

const goToAttendance = (id) => {
  router.push(`/profesor/asistencia/${id}`)
}

const manageEvaluations = async (workshop) => {
  currentWorkshop.value = workshop
  gradingMode.value = true
  loadingStudents.value = true
  students.value = []

  try {
    // Fetch students with their evaluation status
    // MOCK DATA for now as endpoints might not be fully populated
    // Replace with actual API call: const response = await apiClient.get(`/evaluations/workshop/${workshop.id_workshop}`);

    // Simulate API call for robust UI testing even if backend empty
    try {
      const response = await apiClient.get(`/evaluations/workshop/${workshop.id_workshop}`)
      students.value = response.data.map((s) => ({
        ...s,
        grade: s.grade || '',
        comments: s.comments || '',
        isSaving: false,
        saved: !!s.id_evaluation,
      }))
    } catch (err) {
      console.warn('Backend endpoint might be missing, using mock for UI check if needed')
      students.value = []
    }
  } catch (error) {
    console.error('Error fetching students:', error)
    // alert('Error carregant estudiants.'); // Removed alerts for better UX
  } finally {
    loadingStudents.value = false
  }
}

const saveEvaluation = async (student) => {
  if (!student.grade) {
    // alert('Selecciona una nota abans de desar.');
    return
  }

  try {
    student.isSaving = true
    const payload = {
      id_workshop: currentWorkshop.value.id_workshop,
      id_student: student.id_student,
      grade: parseInt(student.grade),
      comments: student.comments,
    }

    await apiClient.post('/evaluations', payload)

    student.saved = true
    setTimeout(() => (student.saved = false), 3000) // Hide saved message after 3s
  } catch (error) {
    console.error('Error saving evaluation:', error)
    // alert('Error desant l\'avaluació.');
  } finally {
    student.isSaving = false
  }
}

onMounted(() => {
  fetchWorkshops()
})

// Helpers
const formatDate = (dateStr) => {
  if (!dateStr) return 'N/A'
  const date = new Date(dateStr)
  return date.toLocaleDateString('ca-ES', { day: '2-digit', month: '2-digit', year: 'numeric' })
}

const getCategoryColor = (category) => {
  const colors = {
    'Arts escèniques': { bg: '#f3e5f5', text: '#7b1fa2' },
    'Indústria-manufactura': { bg: '#efebe9', text: '#5d4037' },
    Hostaleria: { bg: '#fff3e0', text: '#e65100' },
    'Indústria 4.0': { bg: '#e3f2fd', text: '#0d47a1' },
    Esportiu: { bg: '#e8f5e9', text: '#2e7d32' },
    default: { bg: '#f5f5f5', text: '#666' },
  }
  return colors[category] || colors.default
}
</script>
