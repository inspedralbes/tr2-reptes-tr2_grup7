<template>
  <div class="h-full flex flex-col pb-4 animate-fade-in">
    <!-- Compact Header & Actions -->
    <div class="bg-white shadow-sm border-b border-gray-200 px-4 py-3">
      <div class="flex flex-col lg:flex-row lg:items-center justify-between gap-4">
        <!-- Left: Navigation & Title & Session -->
        <div class="flex items-center gap-3">
          <button
            @click="goBack"
            class="p-2 rounded-lg hover:bg-gray-100 transition-colors text-gray-600 hover:text-primary"
            title="Tornar enrere"
          >
            <ArrowLeft :size="20" />
          </button>
          
          <div class="flex flex-col sm:flex-row sm:items-center gap-2 sm:gap-4">
            <h1 class="text-xl font-bold text-gray-800 whitespace-nowrap">Control d'Assistència</h1>
            
            <div class="flex items-center gap-2">
              <Calendar :size="16" class="text-gray-500" />
              <select
                  v-if="sessions.length > 0"
                  v-model="selectedSession"
                  class="bg-gray-50 border-none text-gray-700 text-sm font-medium rounded-lg focus:ring-2 focus:ring-primary py-1 px-3 cursor-pointer hover:bg-gray-100"
              >
                  <option v-for="session in sessions" :key="session.id_session" :value="session">
                      Sessió {{ session.session_number }} - {{ formatDate(session.date) }}
                  </option>
              </select>
              <span v-else class="text-gray-500 italic text-xs">Sense sessions.</span>
            </div>
          </div>
        </div>

        <!-- Right: Actions & Compact Stats -->
        <div class="flex flex-col sm:flex-row items-center gap-3">
           <!-- Compact Stats -->
          <div class="flex items-center gap-3 bg-gray-50 px-3 py-1.5 rounded-lg border border-gray-100 text-sm font-medium order-2 sm:order-1 w-full sm:w-auto justify-between sm:justify-start">
             <div class="flex items-center gap-1.5 text-gray-600" title="Total Alumnes">
               <Users :size="16" />
               <span>{{ students.length }}</span>
             </div>
             <div class="w-px h-4 bg-gray-300"></div>
             <div class="flex items-center gap-1.5 text-green-600" title="Presents">
               <CheckCircle :size="16" />
               <span>{{ presentCount }}</span>
             </div>
             <div class="flex items-center gap-1.5 text-red-600" title="Absents">
               <XCircle :size="16" />
               <span>{{ absentCount }}</span>
             </div>
             <div class="flex items-center gap-1.5 text-yellow-600" title="Retards">
               <Clock :size="16" />
               <span>{{ lateCount }}</span>
             </div>
          </div>

          <!-- Buttons -->
          <div class="flex items-center gap-2 order-1 sm:order-2 w-full sm:w-auto">
             <button
               @click="markAllPresent"
               class="flex-1 sm:flex-none px-4 py-2 bg-white border border-gray-300 text-gray-700 text-sm rounded-lg hover:bg-gray-50 font-medium transition-colors flex items-center justify-center gap-2"
               title="Marcar tots com a presents"
             >
               <CheckCircle :size="18" class="text-green-600" />
               <span class="sm:hidden lg:inline">Tot Present</span>
             </button>
             <button
               @click="saveAttendance"
               class="flex-1 sm:flex-none btn-primary py-2 px-6 flex items-center justify-center gap-2 shadow-sm text-sm"
               :disabled="saving"
             >
               <Save :size="18" v-if="!saving" />
               <span
                 v-if="saving"
                 class="animate-spin h-4 w-4 border-2 border-white border-t-transparent rounded-full"
               ></span>
               <span>{{ saving ? 'Guardant...' : 'Guardar' }}</span>
             </button>
          </div>
        </div>
      </div>
    </div>

    <!-- Main Content: Scrollable Table -->
    <div class="flex-1 overflow-auto bg-gray-50 p-4">
      
      <!-- Loading State -->
      <div v-if="loading" class="h-64 flex flex-col items-center justify-center">
        <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-primary mb-4"></div>
        <p class="text-gray-500 font-medium">Carregant...</p>
      </div>

      <!-- Students List -->
      <div v-else class="max-w-6xl mx-auto">
        <div
          v-if="students.length === 0"
          class="bg-white rounded-xl shadow-sm p-12 text-center border border-gray-100"
        >
          <Users :size="48" class="mx-auto text-gray-300 mb-4" />
          <p class="text-gray-500">No hi ha alumnes inscrits en aquest taller.</p>
        </div>

        <div v-else class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
             <div class="overflow-x-auto">
               <table class="w-full">
                 <thead class="bg-gray-50 border-b border-gray-200 text-gray-700">
                   <tr>
                     <th class="px-6 py-3 text-left text-xs font-bold uppercase tracking-wider text-gray-500 w-1/4">
                       Alumne
                     </th>
                     <th class="px-6 py-3 text-center text-xs font-bold uppercase tracking-wider text-gray-500 w-1/3">
                       Estat
                     </th>
                     <th class="px-6 py-3 text-left text-xs font-bold uppercase tracking-wider text-gray-500">
                       Observacions
                     </th>
                   </tr>
                 </thead>
                 <tbody class="divide-y divide-gray-100">
                   <tr
                     v-for="student in students"
                     :key="student.id_student"
                     class="group hover:bg-blue-50/30 transition-colors"
                     :class="{
                       'bg-green-50/30': student.tempStatus === 'PRESENT',
                       'bg-red-50/30': student.tempStatus === 'ABSENT',
                       'bg-yellow-50/30': student.tempStatus === 'LATE',
                     }"
                   >
                     <td class="px-6 py-3">
                       <div class="flex items-center gap-3">
                         <div
                           class="w-9 h-9 rounded-full flex items-center justify-center text-white font-bold text-xs shadow-sm ring-2 ring-white"
                           :style="{ backgroundColor: getAvatarColor(student.id_student) }"
                         >
                           {{ getInitials(student.first_name, student.last_name) }}
                         </div>
                         <div>
                           <div class="font-bold text-gray-800 text-sm">
                             {{ student.first_name }} {{ student.last_name }}
                           </div>
                           <div class="text-xs text-gray-500">{{ student.email }}</div>
                         </div>
                       </div>
                     </td>
                     <td class="px-6 py-3">
                       <div
                         class="flex items-center justify-center gap-1 bg-white p-1 rounded-lg border border-gray-100 shadow-sm w-fit mx-auto"
                       >
                         <button
                           @click="setStatus(student, 'PRESENT')"
                           :class="[
                             'p-1.5 px-3 rounded-md transition-all duration-200 flex items-center gap-1.5',
                             student.tempStatus === 'PRESENT'
                               ? 'bg-green-100 text-green-700 font-bold shadow-sm'
                               : 'text-gray-400 hover:text-green-600 hover:bg-green-50',
                           ]"
                           title="Present"
                         >
                           <Check :size="16" />
                           <span v-if="student.tempStatus === 'PRESENT'" class="text-xs">Present</span>
                         </button>
   
                         <button
                           @click="setStatus(student, 'LATE')"
                           :class="[
                             'p-1.5 px-3 rounded-md transition-all duration-200 flex items-center gap-1.5',
                             student.tempStatus === 'LATE'
                               ? 'bg-yellow-100 text-yellow-700 font-bold shadow-sm'
                               : 'text-gray-400 hover:text-yellow-600 hover:bg-yellow-50',
                           ]"
                           title="Retard"
                         >
                           <Clock :size="16" />
                           <span v-if="student.tempStatus === 'LATE'" class="text-xs">Retard</span>
                         </button>
   
                         <button
                           @click="setStatus(student, 'ABSENT')"
                           :class="[
                             'p-1.5 px-3 rounded-md transition-all duration-200 flex items-center gap-1.5',
                             student.tempStatus === 'ABSENT'
                               ? 'bg-red-100 text-red-700 font-bold shadow-sm'
                               : 'text-gray-400 hover:text-red-600 hover:bg-red-50',
                           ]"
                           title="Absent"
                         >
                           <X :size="16" />
                           <span v-if="student.tempStatus === 'ABSENT'" class="text-xs">Absent</span>
                         </button>
                       </div>
                     </td>
                     <td class="px-6 py-3">
                       <div class="relative">
                         <input
                           v-model="student.tempComments"
                           type="text"
                           placeholder="..."
                           class="w-full bg-white/50 border border-transparent hover:border-gray-200 focus:border-primary focus:bg-white rounded px-2 py-1.5 text-sm outline-none transition-all placeholder-gray-300 focus:ring-2 focus:ring-primary/10"
                         />
                       </div>
                     </td>
                   </tr>
                 </tbody>
               </table>
            </div>
         </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import {
  ArrowLeft,
  Save,
  Users,
  CheckCircle,
  XCircle,
  Clock,
  Check,
  X,
  Calendar,
} from 'lucide-vue-next'
import apiClient from '../../../services/apiClient'

const route = useRoute()
const router = useRouter()
const students = ref([])
const sessions = ref([])
const selectedSession = ref(null)
const loading = ref(true)
const saving = ref(false)

// Fetch all sessions for this workshop
const fetchSessions = async () => {
    try {
        const workshopId = route.params.id;
        const response = await apiClient.get(`/workshops/${workshopId}/sessions`);
        sessions.value = response.data;
        
        // Auto-select logic:
        // 1. If today matches a session, select it.
        // 2. Else select the next upcoming session.
        // 3. Else select the last session.
        if (sessions.value.length > 0) {
            const today = new Date().toISOString().split('T')[0];
            const match = sessions.value.find(s => s.date.split('T')[0] === today);
            
            if (match) {
                selectedSession.value = match;
            } else {
                 // Find first session in future
                 const future = sessions.value.find(s => s.date > today);
                 selectedSession.value = future || sessions.value[sessions.value.length - 1];
            }
        }
    } catch (error) {
        console.error("Error fetching sessions:", error);
    }
}

const fetchStudents = async () => {
  if (!selectedSession.value) return;

  try {
    loading.value = true
    const workshopId = route.params.id
    // Pass the selected date to get status for THAT day
    const dateQuery = selectedSession.value.date.split('T')[0];
    const response = await apiClient.get(`/workshops/${workshopId}/students?date=${dateQuery}`)

    students.value = response.data.map((s) => ({
      ...s,
      tempStatus: s.last_status || null, // Default to null (neutral) if no record
      tempComments: s.last_comments || '',
    }))
  } catch (error) {
    console.error('Error fetching students:', error)
  } finally {
    loading.value = false
  }
}

// Watch for session change to reload students status
watch(selectedSession, (newVal) => {
    if (newVal) fetchStudents();
});

const setStatus = (student, status) => {
  student.tempStatus = status
}

const hasComment = (student) => {
  return student.tempComments && student.tempComments.trim().length > 0
}

const saveAttendance = async () => {
  if (!selectedSession.value) return;
  
  try {
    saving.value = true
    const workshopId = route.params.id

    const attendanceData = {
      id_workshop: workshopId,
      date: selectedSession.value.date.split('T')[0],
      students: students.value.map((s) => ({
        id_student: s.id_student,
        status: s.tempStatus,
        comments: s.tempComments,
      })),
    }

    await apiClient.post('/workshops/attendance', attendanceData)
    router.back()
  } catch (error) {
    console.error('Error saving attendance:', error)
  } finally {
    saving.value = false
  }
}

const markAllPresent = () => {
  students.value.forEach(student => {
    // Only mark as present if they don't have a status yet or we want to overwrite?
    // Usually "Mark All Present" is a convenience to set everyone. 
    // If someone is already marked Absent, should we overwrite?
    // Yes, usually "Mark All" implies setting all of them.
    student.tempStatus = 'PRESENT';
  });
}


const goBack = () => {
  router.back()
}

// Computed Stats
const presentCount = computed(() => students.value.filter((s) => s.tempStatus === 'PRESENT').length)
const absentCount = computed(() => students.value.filter((s) => s.tempStatus === 'ABSENT').length)
const lateCount = computed(() => students.value.filter((s) => s.tempStatus === 'LATE').length)

// Helpers
const getInitials = (first, last) => {
  return `${first.charAt(0)}${last.charAt(0)}`.toUpperCase()
}

const getAvatarColor = (id) => {
  const colors = ['#3b82f6', '#10b981', '#f59e0b', '#ef4444', '#8b5cf6', '#ec4899']
  return colors[id % colors.length]
}

const formatDate = (dateStr) => {
    if (!dateStr) return '';
    return new Date(dateStr).toLocaleDateString('ca-ES', { weekday: 'long', day: 'numeric', month: 'long' });
}

onMounted(async () => {
  await fetchSessions();
  // fetchStudents called by watcher
})
</script>
