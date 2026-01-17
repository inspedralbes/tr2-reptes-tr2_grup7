<template>
  <div class="max-w-4xl mx-auto">
    <h1
      class="text-2xl font-semibold mb-6"
      style="
        color: var(--text-primary);
        text-transform: uppercase;
        letter-spacing: 0.5px;
        border-bottom: 2px solid var(--border-color);
        padding-bottom: 1rem;
      "
    >
      Sol·licitud de Tallers (Curs 2025-2026)
    </h1>

    <div v-if="isBlocked" class="bg-yellow-50 border-l-4 border-yellow-400 p-4 mb-6">
      <div class="flex">
        <div class="flex-shrink-0">
          <!-- Icon -->
          <svg class="h-5 w-5 text-yellow-400" viewBox="0 0 20 20" fill="currentColor">
            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
          </svg>
        </div>
        <div class="ml-3">
          <p class="text-sm text-yellow-700">
            <strong>Atenció:</strong> Ja has enviat una sol·licitud per a aquest curs ({{ currentPeriod }}).
            No pots crear-ne una altra de nova, però pots consultar l'estat de la teva sol·licitud a l'historial.
          </p>
          <p class="mt-2 text-sm">
             <button @click="$router.push('/centro/historial')" class="font-medium text-yellow-700 underline hover:text-yellow-600">
                Torna a l'historial
             </button>
          </p>
        </div>
      </div>
    </div>

    <form @submit.prevent="submitRequests" class="space-y-8">
      <fieldset :disabled="isBlocked" class="contents">
      <!-- Loop through requests -->
      <div
        v-for="(req, index) in requests"
        :key="index"
        class="card p-8 relative shadow-sm border border-gray-100"
        :class="{ 'opacity-75': isBlocked }"
      >
        <!-- Header for each request card (only if > 1) -->
        <div v-if="requests.length > 1 && index > 0 && !isBlocked" class="absolute top-0 right-0 p-4">
          <button
            type="button"
            @click="removeRequest(index)"
            class="btn-primary px-4 py-2"
            title="Eliminar aquesta petició"
          >
            Eliminar &times;
          </button>
        </div>

        <h2 v-if="requests.length > 1" class="text-lg font-bold mb-4 text-gray-700 border-b pb-2">
          Taller {{ index + 1 }}
        </h2>

        <div class="space-y-5">
          <div>
            <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
              Selecciona Taller *
            </label>
            <select v-model="req.id_workshop" class="w-full" required>
              <option value="" disabled>Selecciona un taller...</option>
              <option
                v-for="workshop in workshops"
                :key="workshop.id_workshop"
                :value="workshop.id_workshop"
              >
                {{ workshop.title }} ({{ workshop.category }})
              </option>
            </select>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <div>
              <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
                Selecciona Alumnes (Màx 4) *
              </label>
              <div class="space-y-4">
                <div class="flex gap-2">
                  <select
                    v-model="req.selectedStudentToAdd"
                    class="flex-1 w-full"
                    :disabled="req.students.length >= 4 || isBlocked"
                  >
                    <option value="" disabled>Selecciona un alumne...</option>
                    <option
                      v-for="student in getAvailableStudentsForRequest(index)"
                      :key="student.id_user"
                      :value="student.id_user"
                    >
                      {{ student.first_name }} {{ student.last_name }}
                    </option>
                  </select>
                  <button
                    v-if="!isBlocked"
                    type="button"
                    @click="addStudentToRequest(index)"
                    class="btn-primary px-4 py-2"
                    :disabled="!req.selectedStudentToAdd || req.students.length >= 4"
                  >
                    Afegir
                  </button>
                </div>

                <!-- Lista de seleccionados -->
                <div
                  v-if="req.students.length > 0"
                  class="border p-4 rounded bg-gray-50"
                  style="border-color: var(--border-color)"
                >
                  <p class="text-sm font-semibold mb-2" style="color: var(--text-primary)">
                    Alumnes Seleccionats ({{ req.students.length }}/4):
                  </p>
                  <div class="space-y-2">
                    <div
                      v-for="studentId in req.students"
                      :key="studentId"
                      class="flex justify-between items-center bg-white p-2 rounded shadow-sm border"
                    >
                      <span class="text-sm">
                        {{ getStudentName(studentId) }}
                      </span>
                      <button
                        v-if="!isBlocked"
                        type="button"
                        @click="removeStudentFromRequest(index, studentId)"
                        class="text-red-500 hover:text-red-700 text-sm font-bold"
                      >
                        &times;
                      </button>
                    </div>
                  </div>
                </div>
                <p v-else class="text-sm text-gray-500 italic">Cap alumne seleccionat (Màxim 4).</p>
              </div>
            </div>

            <div>
              <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
                Curs / Nivell *
              </label>
              <select v-model="req.course_level" class="w-full" required>
                <option value="" disabled>Selecciona un curs...</option>
                <option value="3 ESO">3r ESO</option>
                <option value="4 ESO">4r ESO</option>
              </select>
            </div>
          </div>

          <div>
            <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
              Professor Referent *
            </label>
            <select v-model="req.id_teacher" class="w-full" required>
              <option value="" disabled>Selecciona un professor ref...</option>
              <option v-for="teacher in teachers" :key="teacher.id_user" :value="teacher.id_user">
                {{ teacher.first_name }} {{ teacher.last_name }} ({{ teacher.email }})
              </option>
            </select>
            <p v-if="teachers.length === 0" class="text-xs text-red-500 mt-1">
              No s'han trobat professors assignats al teu centre. Contacta amb l'administrador.
            </p>
          </div>

          <div>
            <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
              Preferències de Dates / Comentaris
            </label>
            <textarea
              v-model="req.comments"
              class="w-full"
              rows="3"
              placeholder="Indica preferències de dates, horaris o qualsevol informació addicional..."
            ></textarea>
          </div>
        </div>
      </div>

      <!-- Add Request Button -->
      <div v-if="!isBlocked" class="text-center py-4">
        <button
          type="button"
          @click="addNewRequest"
          class="btn-outline px-6 py-3 border-dashed border-2 flex items-center gap-2 mx-auto hover:bg-gray-50 bg-white"
        >
          <span class="text-xl font-bold text-blue-600">+</span>
          <span class="font-medium">Afegir Taller al llistat</span>
        </button>
      </div>


      <div
        v-if="!isBlocked"
        class="flex gap-4 sticky bottom-4 bg-white p-4 shadow-lg rounded-lg border border-gray-200"
        style="z-index: 50"
      >
        <button type="submit" class="flex-1 btn-primary py-3 font-bold text-lg" :disabled="loading">
          {{ loading ? 'Enviant...' : `Enviar Sol·licitud Única` }}
        </button>
        <button type="button" @click="$router.push('/centro/panel')" class="px-8 btn-outline py-3">
          Cancel·lar
        </button>
      </div>
      </fieldset>
    </form>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import * as workshopService from '../../../services/workshopService'
import * as centreService from '../../../services/centreService'
import * as schoolApplicationService from '../../../services/schoolApplicationService'

const getUser = () => JSON.parse(localStorage.getItem('user') || '{}')

const router = useRouter()
const route = useRoute()
const workshops = ref([])
const teachers = ref([])
const students = ref([])
const loading = ref(false)
const isBlocked = ref(false)

// State: Array of Request Objects
const requests = ref([createEmptyRequest()])
const globalComments = ref('')

function createEmptyRequest() {
  return {
    id_workshop: '',
    students: [],
    course_level: '',
    id_teacher: '',
    comments: '',
    requested_slots: 1,
    selectedStudentToAdd: '', // Helper for UI specific to this request
  }
}

// Helpers
const getAvailableStudentsForRequest = (index) => {
  const currentRequest = requests.value[index]
  // Return all students EXCEPT those already in THIS specific request
  // We allow the same student in different requests for simpler logic/flexibility
  return students.value.filter((student) => !currentRequest.students.includes(student.id_user))
}

const getStudentName = (id) => {
  const s = students.value.find((student) => student.id_user === id)
  return s ? `${s.first_name} ${s.last_name}` : 'Desconegut'
}

const addStudentToRequest = (index) => {
  const req = requests.value[index]
  if (req.selectedStudentToAdd && req.students.length < 4) {
    req.students.push(req.selectedStudentToAdd)
    req.selectedStudentToAdd = ''
  }
}

const removeStudentFromRequest = (reqIndex, studentId) => {
  const req = requests.value[reqIndex]
  req.students = req.students.filter((id) => id !== studentId)
}

const addNewRequest = () => {
  requests.value.push(createEmptyRequest())
  // Optional: scroll to bottom logic could go here
}

const removeRequest = (index) => {
  if (confirm('Estàs segur de voler eliminar aquesta petició?')) {
    requests.value.splice(index, 1)
    if (requests.value.length === 0) {
      addNewRequest() // Always keep at least one
    }
  }
}

// Helper to calculate academic year
const getCurrentSchoolYear = () => {
  const today = new Date();
  const month = today.getMonth(); // 0-11
  const year = today.getFullYear();
  // If we are in September (8) or later, it's the start of a year (e.g., Sept 2025 -> 2025-2026)
  // If we are before September, it's the end of a year (e.g., Jan 2026 -> 2025-2026)
  return month >= 8 ? `${year}-${year + 1}` : `${year - 1}-${year}`;
}

const currentPeriod = getCurrentSchoolYear();

onMounted(async () => {
  try {
    const user = getUser()
    if (user && user.id) {
      console.log('Fetching data for user:', user.id);
      
      // Parallel fetch
      const [workshopsData, teachersData, studentsData, myApps] = await Promise.all([
        workshopService.getAll(),
        centreService.getTeachers(user.id),
        centreService.getStudents(user.id),
        schoolApplicationService.getMyApplications()
      ])

      console.log('Fetched Applications:', myApps);
      console.log('Current Computed Period:', currentPeriod);

      // Check if already has application for this period
      const existingApp = myApps.find(app => app.year_period === currentPeriod);
      
      if (existingApp) {
        // BLOCKED STATE
        console.log('Found existing application:', existingApp);
        isBlocked.value = true;
        // Don't redirect, just show blocked state
      } else {
        console.log('No existing application found for period:', currentPeriod);
      }

      workshops.value = workshopsData
      teachers.value = teachersData
      students.value = studentsData

      // Check for pre-selected workshop from query params
      if (route.query.workshopId) {
        const preSelectedId = parseInt(route.query.workshopId)
        if (!isNaN(preSelectedId)) {
          requests.value[0].id_workshop = preSelectedId
        }
      }
    } else {
      console.error('User not found in local storage')
      router.push('/login')
    }
  } catch (error) {
    console.error('Error loading data:', error)
  }
})

const submitRequests = async () => {
  // Validate ALL requests
  for (let i = 0; i < requests.value.length; i++) {
    const req = requests.value[i]
    if (!req.id_workshop) {
      alert(`La petició #${i + 1} no té taller seleccionat.`)
      return
    }
    if (req.students.length === 0) {
      alert(`La petició #${i + 1} no té alumnes seleccionats.`)
      return
    }
    if (!req.course_level) {
      alert(`La petició #${i + 1} no té curs/nivell.`)
      return
    }
    if (!req.id_teacher) {
      alert(`La petició #${i + 1} no té professor referent.`)
      return
    }
  }

  loading.value = true
  try {
    // Construct the single application object
    const applicationPayload = {
      year_period: currentPeriod, 
      comments: globalComments.value,
      items: requests.value.map(req => {
         // eslint-disable-next-line no-unused-vars
         const { selectedStudentToAdd, ...data } = req
         return data
      })
    };

    await schoolApplicationService.createApplication(applicationPayload);
    
    alert(`Sol·licitud creada correctament amb ${requests.value.length} tallers!`)
    router.push('/centro/historial') // Redirect to history to see the new app
  } catch (error) {
    console.error('Error submitting application:', error)
    if (error.response && error.response.data && error.response.data.error) {
        alert('Error: ' + error.response.data.error);
    } else {
        alert('Error al crear la sol·licitud. Si us plau, torna-ho a provar.')
    }
  } finally {
    loading.value = false
  }
}
</script>
