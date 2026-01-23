<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Eina d'Assignació</h1>
    </div>

    <!-- EDDSON ASIGNACIÓN AUTOMÁTICA -->
    <!-- Automatic Matching Card -->
    <div class="bg-white rounded-lg border border-gray-200 shadow-sm p-6 mb-6">
      <h2 class="text-lg sm:text-xl font-semibold text-gray-800 mb-4 pb-3 border-b border-gray-200">
        Assignació Automàtica (Motor de Matching)
      </h2>

      <p class="text-gray-600 mb-4">Configura els filtres actius per a l'assignació automàtica:</p>

      <div class="flex flex-col sm:flex-row gap-6 mb-6">
        <label class="flex items-center gap-2 cursor-pointer">
          <input
            type="checkbox"
            v-model="filters.risk_enabled"
            class="w-5 h-5 text-blue-600 rounded focus:ring-blue-500"
          />
          <span class="text-gray-700">Prioritzar Alumnes en Risc (x1M)</span>
        </label>

        <label class="flex items-center gap-2 cursor-pointer">
          <input
            type="checkbox"
            v-model="filters.eso4_enabled"
            class="w-5 h-5 text-blue-600 rounded focus:ring-blue-500"
          />
          <span class="text-gray-700">Prioritzar 4rt ESO (x10k)</span>
        </label>

        <label class="flex items-center gap-2 cursor-pointer">
          <input
            type="checkbox"
            v-model="filters.age_enabled"
            class="w-5 h-5 text-blue-600 rounded focus:ring-blue-500"
          />
          <span class="text-gray-700">Prioritzar Edat (Desempat)</span>
        </label>
      </div>

      <button
        @click="runMatchingProcess"
        :disabled="isMatching"
        class="bg-purple-600 text-white px-6 py-3 rounded-lg hover:bg-purple-700 flex items-center gap-2 font-semibold disabled:opacity-50 disabled:cursor-not-allowed"
      >
        <svg
          v-if="!isMatching"
          xmlns="http://www.w3.org/2000/svg"
          width="20"
          height="20"
          viewBox="0 0 24 24"
          fill="none"
          stroke="currentColor"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        >
          <path d="M12 2v4" />
          <path d="m16.2 7.8 2.9-2.9" />
          <path d="M18 12h4" />
          <path d="m16.2 16.2 2.9 2.9" />
          <path d="M12 18v4" />
          <path d="m4.9 19.1 2.9-2.9" />
          <path d="M2 12h4" />
          <path d="m4.9 4.9 2.9 2.9" />
        </svg>
        <svg
          v-else
          class="animate-spin h-5 w-5 text-white"
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
        >
          <circle
            class="opacity-25"
            cx="12"
            cy="12"
            r="10"
            stroke="currentColor"
            stroke-width="4"
          ></circle>
          <path
            class="opacity-75"
            fill="currentColor"
            d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
          ></path>
        </svg>
        {{ isMatching ? 'Executant Matching...' : "Executar Motor d'Assignació" }}
      </button>
    </div>

    <!-- STATUS CARD: PROPOSAL READY (PENDING CONFIRMATION) -->
    <div v-if="proposal" class="mb-6 border border-orange-200 rounded-lg overflow-hidden shadow-lg">
      <!-- Header (Clickable to toggle details if needed, but here always open per request) -->
      <div
        class="bg-orange-50 p-4 border-b border-orange-200 flex justify-between items-center cursor-pointer"
        @click="showDetails = !showDetails"
      >
        <div class="flex items-center gap-3">
          <div class="bg-orange-100 p-2 rounded-full text-orange-600">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"
            >
              <path
                d="M10.29 3.86L1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"
              />
              <line x1="12" y1="9" x2="12" y2="13" />
              <line x1="12" y1="17" x2="12.01" y2="17" />
            </svg>
          </div>
          <div>
            <h3 class="text-lg font-bold text-orange-900">
              Propuesta Generada - Pendent de Confirmació
            </h3>
            <p class="text-sm text-orange-700">
              Revisa els resultats i confirma per aplicar els canvis.
            </p>
          </div>
        </div>
        <button 
          class="text-sm font-medium text-orange-700 bg-orange-100 hover:bg-orange-200 border border-orange-200 px-4 py-2 rounded-lg transition-colors"
        >
          {{ showDetails ? 'Amagar Detalls' : 'Veure Detalls' }}
        </button>
      </div>

      <!-- DETAILS BODY -->
      <div v-if="showDetails" class="bg-white p-6">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
          <!-- Students Column -->
          <div class="border rounded-lg p-4">
            <h4 class="font-bold text-gray-700 mb-3 border-b pb-2">
              Alumnes Assignats ({{ proposal.details.students.length }})
            </h4>
            <ul class="space-y-2 max-h-60 overflow-y-auto pr-2">
              <li
                v-for="(s, i) in proposal.details.students"
                :key="i"
                class="text-sm p-2 bg-gray-50 rounded flex justify-between"
              >
                <span
                  ><strong>{{ s.studentName }}</strong>
                  <span class="text-gray-500">({{ s.centerId }})</span></span
                >
                <span class="text-gray-500 text-xs self-center">➔ {{ s.workshopTitle }}</span>
              </li>
            </ul>
          </div>

          <!-- Teachers Column -->
          <div class="border rounded-lg p-4">
            <h4 class="font-bold text-gray-700 mb-3 border-b pb-2">
              Professors Assignats ({{ proposal.details.teachers.length }})
            </h4>
            <ul class="space-y-2 max-h-60 overflow-y-auto pr-2">
              <li
                v-for="(t, i) in proposal.details.teachers"
                :key="i"
                class="text-sm p-2 rounded border"
                :class="t.conflict ? 'bg-red-50 border-red-200' : 'bg-gray-50 border-gray-100'"
              >
                <div class="flex justify-between items-start">
                  <div>
                    <div class="font-bold" :class="{ 'text-red-700': t.conflict }">
                      <span v-if="t.conflict">⚠️ </span>
                      Prof. {{ t.teacherName }}
                    </div>
                    <div class="text-xs text-gray-500">
                      Centre: {{ t.centerId }} ➔ Taller {{ t.workshopId }}
                    </div>
                  </div>
                  <span v-if="t.conflict" class="bg-red-100 text-red-800 text-xs px-2 py-1 rounded"
                    >CONFLICTE</span
                  >
                </div>
                <div class="text-xs text-gray-400 mt-1 italic">{{ t.reason }}</div>
              </li>
            </ul>
          </div>
        </div>

        <!-- ACTIONS -->
        <div class="flex justify-end gap-4 border-t pt-6">
          <button
            @click="proposal = null"
            class="px-6 py-2 text-gray-600 hover:bg-gray-100 rounded-lg transition-colors"
          >
            Descartar
          </button>
          <button
            @click="confirmMatchingProcess"
            class="bg-green-600 text-white px-6 py-3 rounded-lg hover:bg-green-700 shadow-lg flex items-center gap-2 font-bold transform hover:scale-105 transition-all"
          >
            <CheckCircle :size="20" /> Confirmar i Aplicar
          </button>
        </div>
      </div>
    </div>

    <!-- Form Card -->
    <div class="bg-white rounded-lg border border-gray-200 shadow-sm p-6">
      <h2 class="text-lg sm:text-xl font-semibold text-gray-800 mb-4 pb-3 border-b border-gray-200">
        Assignació Manual
      </h2>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2"> Petició </label>
          <select
            v-model="selectedRequest"
            class="w-full border border-gray-300 rounded-lg px-4 py-2"
          >
            <option value="">Selecciona una petición...</option>
            <option v-for="req in pendingRequests" :key="req.id_request" :value="req.id_request">
              {{ req.center_name }} - {{ req.workshop_title }} ({{ req.requested_slots }} alumnes)
            </option>
          </select>
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2"> Places assignades </label>
          <input
            v-model="assignedSlots"
            type="number"
            class="w-full border border-gray-300 rounded-lg px-4 py-2"
            placeholder="Número de plazas"
          />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2"> Professor referent 1 </label>
          <select
            v-model="selectedTeacher1"
            class="w-full border border-gray-300 rounded-lg px-4 py-2"
          >
            <option value="">Selecciona professor...</option>
            <option v-for="teacher in teachers" :key="teacher.id_user" :value="teacher.id_user">
              {{ teacher.first_name }} {{ teacher.last_name }}
            </option>
          </select>
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2"> Professor referent 2 </label>
          <select
            v-model="selectedTeacher2"
            class="w-full border border-gray-300 rounded-lg px-4 py-2"
          >
            <option value="">Selecciona professor (opcional)...</option>
            <option v-for="teacher in teachers" :key="teacher.id_user" :value="teacher.id_user">
              {{ teacher.first_name }} {{ teacher.last_name }}
            </option>
          </select>
        </div>
      </div>

      <div class="mt-6">
        <label class="block text-sm font-medium text-gray-700 mb-2"> Observacions </label>
        <textarea
          v-model="comments"
          class="w-full border border-gray-300 rounded-lg px-4 py-2"
          rows="3"
          placeholder="Notes sobre l'assignació..."
        ></textarea>
      </div>

      <div class="flex gap-4 mt-6">
        <button
          @click="confirmAssignment"
          class="bg-green-600 text-white px-6 py-2 rounded-lg hover:bg-green-700 flex items-center gap-2"
        >
          <CheckCircle :size="20" /> Confirmar Assignació
        </button>
        <button
          @click="sendNotification"
          class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 flex items-center gap-2"
        >
          <Send :size="20" /> Enviar Notificació
        </button>
      </div>
    </div>
  </div>
</template>
<script setup>
import { ref, onMounted } from 'vue'
import { CheckCircle, Send } from 'lucide-vue-next'
import { adminService } from '../../../services/adminService.js'
import { useAlertStore } from '../../../stores/alert'

const alertStore = useAlertStore()

// Existing Refs
const pendingRequests = ref([])
const teachers = ref([])
const selectedRequest = ref('')
const assignedSlots = ref('')
const selectedTeacher1 = ref('')
const selectedTeacher2 = ref('')
const comments = ref('')

// Matching State
const isMatching = ref(false)
const isConfirming = ref(false) // NEW: Separate state for confirmation
const progress = ref(0)
const filters = ref({
  risk_enabled: true,
  eso4_enabled: true,
  age_enabled: true,
})

// NEW: Proposal State
// NEW: Proposal State
const proposal = ref(null)
const showDetails = ref(true)

const loadPendingRequests = async () => {
  try {
    const data = await adminService.getPendingRequests()
    pendingRequests.value = data
  } catch (error) {
    console.error('Error loading pending requests:', error)
  }
}

const loadTeachers = async () => {
  // Left empty/as logic from reading file
  try {
    const data = await adminService.getAvailableTeachers()
    teachers.value = data
  } catch (e) {
    console.error(e)
  }
}

const confirmAssignment = async () => {
  // Keep existing Manual logic
  if (!selectedRequest.value || !assignedSlots.value || !selectedTeacher1.value) {
    alertStore.addAlert('warning', 'Falten camps obligatoris')
    return
  }
  // ... logic same as before, simplified for diff ...
  try {
    await adminService.manualAssign({
      requestId: selectedRequest.value,
      assignedSlots: assignedSlots.value,
      teacher1Id: selectedTeacher1.value,
      teacher2Id: selectedTeacher2.value,
      comments: comments.value,
    })
    alertStore.addAlert('success', 'Assignació manual correcta')
    loadPendingRequests()
    selectedRequest.value = ''
    assignedSlots.value = ''
    selectedTeacher1.value = ''
    selectedTeacher2.value = ''
  } catch (e) {
    alertStore.addAlert('error', 'Error assigning')
  }
}

const sendNotification = () => alertStore.addAlert('info', 'Not implemented')

// 1. GENERATE PROPOSAL
const runMatchingProcess = async () => {
  const confirmed = await alertStore.confirm(
    "Vols generar una nova proposta d'assignació? Això pot trigar uns segons.",
    'Generar Proposta',
    { confirmText: 'Generar', type: 'info' },
  )
  if (!confirmed) return

  isMatching.value = true
  proposal.value = null

  try {
    const result = await adminService.runMatching(filters.value)
    console.log('Proposal:', result)

    if (result.success && result.proposalId) {
      // Fix: Map 'data' from backend to 'details' for frontend template
      proposal.value = {
        ...result,
        details: result.data,
      }
      alertStore.addAlert('success', 'Propuesta generada. Revise los resultados abajo.')
    } else {
      alertStore.addAlert('warning', 'No se generó propuesta (¿Quizás no hay talleres cerrados?)')
    }
  } catch (error) {
    console.error('Error generating proposal:', error)
    alertStore.addAlert('error', 'Error al generar la propuesta')
  } finally {
    isMatching.value = false
  }
}

// 2. CONFIRM PROPOSAL
const confirmMatchingProcess = async () => {
  if (!proposal.value || !proposal.value.proposalId) return
  const confirmed = await alertStore.confirm(
    'Això aplicarà els canvis a la base de dades i enviarà correus. Aquesta acció no es pot desfer.',
    'Confirmar Assignació',
    { confirmText: 'Aplicar Canvis', type: 'warning' },
  )
  if (!confirmed) return

  isConfirming.value = true
  try {
    const result = await adminService.confirmMatching(proposal.value.proposalId)

    if (result.pdf_report) {
      // Download PDF
      const byteCharacters = atob(result.pdf_report)
      const byteNumbers = new Array(byteCharacters.length)
      for (let i = 0; i < byteCharacters.length; i++) {
        byteNumbers[i] = byteCharacters.charCodeAt(i)
      }
      const byteArray = new Uint8Array(byteNumbers)
      const blob = new Blob([byteArray], { type: 'application/pdf' })

      const url = window.URL.createObjectURL(blob)
      const a = document.createElement('a')
      a.href = url
      a.download = `informe_assignacio_${new Date().toISOString().slice(0, 10)}.pdf`
      document.body.appendChild(a)
      a.click()
      window.URL.revokeObjectURL(url)
      document.body.removeChild(a)
    }

    alertStore.addAlert('success', 'Assignació Confirmada i Emails Enviats!')
    proposal.value = null // Clear proposal
    loadPendingRequests() // Refresh requests list
  } catch (error) {
    console.error('Error confirming:', error)
    alertStore.addAlert('error', 'Error confirmant la proposta: ' + error.message)
  } finally {
    isConfirming.value = false
  }
}

onMounted(() => {
  loadPendingRequests()
  loadTeachers()
})
</script>
