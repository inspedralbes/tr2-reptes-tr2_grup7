<template>
  <div class="space-y-6 pb-12 animate-fade-in">
    <!-- Header -->
    <div
      class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-b border-gray-200 pb-4 mb-6"
    >
      <div class="flex items-center gap-3">
        <button
          @click="goBack"
          class="p-2 rounded-lg hover:bg-gray-100 transition-colors text-gray-600 hover:text-primary"
          title="Tornar enrere"
        >
          <ArrowLeft :size="24" />
        </button>
        <div>
          <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Control d'Assistència</h1>
          <p class="text-sm text-gray-500 mt-1 flex items-center gap-1">
            <Calendar :size="14" /> {{ formattedDate }}
          </p>
        </div>
      </div>
      <button
        @click="saveAttendance"
        class="w-full sm:w-auto btn-primary py-2.5 px-6 flex items-center justify-center gap-2 shadow-sm transition-transform active:scale-95"
        :disabled="saving"
      >
        <Save :size="20" v-if="!saving" />
        <span
          v-if="saving"
          class="animate-spin h-5 w-5 border-2 border-white border-t-transparent rounded-full"
        ></span>
        <span>{{ saving ? 'Guardant...' : 'Guardar Assistència' }}</span>
      </button>
    </div>

    <!-- Summary Stats -->
    <div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
      <div class="card p-4 flex items-center justify-between border-l-4 border-l-gray-400">
        <div>
          <p class="text-xs text-gray-500 font-bold uppercase tracking-wider">Total</p>
          <p class="text-2xl font-bold text-gray-800 mt-1">{{ students.length }}</p>
        </div>
        <div class="p-2 bg-gray-50 rounded-lg">
          <Users :size="24" class="text-gray-600" />
        </div>
      </div>
      <div class="card p-4 flex items-center justify-between border-l-4 border-l-green-500">
        <div>
          <p class="text-xs text-gray-500 font-bold uppercase tracking-wider">Presents</p>
          <p class="text-2xl font-bold text-green-600 mt-1">{{ presentCount }}</p>
        </div>
        <div class="p-2 bg-green-50 rounded-lg">
          <CheckCircle :size="24" class="text-green-600" />
        </div>
      </div>
      <div class="card p-4 flex items-center justify-between border-l-4 border-l-red-500">
        <div>
          <p class="text-xs text-gray-500 font-bold uppercase tracking-wider">Absents</p>
          <p class="text-2xl font-bold text-red-600 mt-1">{{ absentCount }}</p>
        </div>
        <div class="p-2 bg-red-50 rounded-lg">
          <XCircle :size="24" class="text-red-600" />
        </div>
      </div>
      <div class="card p-4 flex items-center justify-between border-l-4 border-l-yellow-500">
        <div>
          <p class="text-xs text-gray-500 font-bold uppercase tracking-wider">Retards</p>
          <p class="text-2xl font-bold text-yellow-600 mt-1">{{ lateCount }}</p>
        </div>
        <div class="p-2 bg-yellow-50 rounded-lg">
          <Clock :size="24" class="text-yellow-600" />
        </div>
      </div>
    </div>

    <!-- Loading State -->
    <div v-if="loading" class="text-center py-12">
      <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-primary mx-auto mb-4"></div>
      <p class="text-gray-500 font-medium">Carregant llista d'alumnes...</p>
    </div>

    <!-- Students List Container -->
    <div v-else>
      <div
        v-if="students.length === 0"
        class="card p-12 text-center bg-gray-50 border-dashed border-2 border-gray-200"
      >
        <Users :size="48" class="mx-auto text-gray-300 mb-4" />
        <p class="text-gray-500 text-lg">No hi ha alumnes inscrits en aquest taller.</p>
      </div>

      <div v-else>
        <!-- Desktop Table View -->
        <div class="hidden md:block card overflow-hidden p-0 shadow-sm">
          <div class="overflow-x-auto">
            <table class="w-full">
              <thead class="bg-gray-50 border-b border-gray-200 text-gray-700">
                <tr>
                  <th class="px-6 py-4 text-left text-xs font-bold uppercase tracking-wider">
                    Alumne
                  </th>
                  <th class="px-6 py-4 text-center text-xs font-bold uppercase tracking-wider">
                    Estat
                  </th>
                  <th class="px-6 py-4 text-left text-xs font-bold uppercase tracking-wider">
                    Observacions
                  </th>
                </tr>
              </thead>
              <tbody class="divide-y divide-gray-100">
                <tr
                  v-for="student in students"
                  :key="'desktop-' + student.id_student"
                  class="hover:bg-gray-50/50 transition-colors"
                  :class="{
                    'bg-green-50/40': student.tempStatus === 'PRESENT',
                    'bg-red-50/40': student.tempStatus === 'ABSENT',
                    'bg-yellow-50/40': student.tempStatus === 'LATE',
                  }"
                >
                  <td class="px-6 py-4">
                    <div class="flex items-center gap-3">
                      <div
                        class="w-10 h-10 rounded-full flex items-center justify-center text-white font-bold text-sm shadow-sm ring-2 ring-white"
                        :style="{ backgroundColor: getAvatarColor(student.id_student) }"
                      >
                        {{ getInitials(student.first_name, student.last_name) }}
                      </div>
                      <div>
                        <div class="font-bold text-gray-800">
                          {{ student.first_name }} {{ student.last_name }}
                        </div>
                        <div class="text-sm text-gray-500">{{ student.email }}</div>
                      </div>
                    </div>
                  </td>
                  <td class="px-6 py-4">
                    <div
                      class="flex items-center justify-center gap-2 bg-white/50 p-1 rounded-xl w-fit mx-auto border border-gray-100 shadow-sm"
                    >
                      <button
                        @click="setStatus(student, 'PRESENT')"
                        :class="[
                          'p-2 rounded-lg transition-all duration-200 flex items-center gap-2',
                          student.tempStatus === 'PRESENT'
                            ? 'bg-green-100 text-green-700 shadow-sm font-bold'
                            : 'text-gray-400 hover:text-green-600 hover:bg-green-50',
                        ]"
                        title="Present"
                      >
                        <Check :size="18" />
                        <span v-if="student.tempStatus === 'PRESENT'" class="text-xs">Present</span>
                      </button>

                      <button
                        @click="setStatus(student, 'LATE')"
                        :class="[
                          'p-2 rounded-lg transition-all duration-200 flex items-center gap-2',
                          student.tempStatus === 'LATE'
                            ? 'bg-yellow-100 text-yellow-700 shadow-sm font-bold'
                            : 'text-gray-400 hover:text-yellow-600 hover:bg-yellow-50',
                        ]"
                        title="Retard"
                      >
                        <Clock :size="18" />
                        <span v-if="student.tempStatus === 'LATE'" class="text-xs">Retard</span>
                      </button>

                      <button
                        @click="setStatus(student, 'ABSENT')"
                        :class="[
                          'p-2 rounded-lg transition-all duration-200 flex items-center gap-2',
                          student.tempStatus === 'ABSENT'
                            ? 'bg-red-100 text-red-700 shadow-sm font-bold'
                            : 'text-gray-400 hover:text-red-600 hover:bg-red-50',
                        ]"
                        title="Absent"
                      >
                        <X :size="18" />
                        <span v-if="student.tempStatus === 'ABSENT'" class="text-xs">Absent</span>
                      </button>
                    </div>
                  </td>
                  <td class="px-6 py-4">
                    <div class="relative group">
                      <input
                        v-model="student.tempComments"
                        type="text"
                        placeholder="Afegir nota..."
                        class="w-full bg-white border border-gray-200 rounded-lg px-3 py-2 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all pr-8 group-hover:border-gray-300"
                      />
                      <button
                        v-if="hasComment(student)"
                        @click="student.tempComments = ''"
                        class="absolute right-2 top-1/2 -translate-y-1/2 text-gray-400 hover:text-red-500 transition-colors bg-white rounded-full p-0.5"
                      >
                        <X :size="14" />
                      </button>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- Mobile Card View -->
        <div class="md:hidden space-y-4">
          <div
            v-for="student in students"
            :key="'mobile-' + student.id_student"
            class="card p-4 transition-all duration-300 border-l-4"
            :class="{
              'border-l-green-500 bg-green-50/30': student.tempStatus === 'PRESENT',
              'border-l-red-500 bg-red-50/30': student.tempStatus === 'ABSENT',
              'border-l-yellow-500 bg-yellow-50/30': student.tempStatus === 'LATE',
              'border-l-gray-300': !student.tempStatus,
            }"
          >
            <!-- Student Info -->
            <div class="flex items-center gap-3 mb-4">
              <div
                class="w-12 h-12 rounded-full flex items-center justify-center text-white font-bold text-lg shadow-sm"
                :style="{ backgroundColor: getAvatarColor(student.id_student) }"
              >
                {{ getInitials(student.first_name, student.last_name) }}
              </div>
              <div>
                <h3 class="font-bold text-gray-800 text-lg">
                  {{ student.first_name }} {{ student.last_name }}
                </h3>
                <p class="text-sm text-gray-500">{{ student.email }}</p>
              </div>
            </div>

            <!-- Action Buttons -->
            <div
              class="grid grid-cols-3 gap-2 mb-4 bg-white p-1.5 rounded-xl border border-gray-100 shadow-sm"
            >
              <button
                @click="setStatus(student, 'PRESENT')"
                class="py-2 rounded-lg flex flex-col items-center justify-center gap-1 transition-all"
                :class="
                  student.tempStatus === 'PRESENT'
                    ? 'bg-green-100 text-green-700 font-bold shadow-sm'
                    : 'text-gray-400 hover:bg-gray-50'
                "
              >
                <Check :size="20" />
                <span class="text-[10px] uppercase font-bold tracking-wide">Present</span>
              </button>

              <button
                @click="setStatus(student, 'LATE')"
                class="py-2 rounded-lg flex flex-col items-center justify-center gap-1 transition-all"
                :class="
                  student.tempStatus === 'LATE'
                    ? 'bg-yellow-100 text-yellow-700 font-bold shadow-sm'
                    : 'text-gray-400 hover:bg-gray-50'
                "
              >
                <Clock :size="20" />
                <span class="text-[10px] uppercase font-bold tracking-wide">Retard</span>
              </button>

              <button
                @click="setStatus(student, 'ABSENT')"
                class="py-2 rounded-lg flex flex-col items-center justify-center gap-1 transition-all"
                :class="
                  student.tempStatus === 'ABSENT'
                    ? 'bg-red-100 text-red-700 font-bold shadow-sm'
                    : 'text-gray-400 hover:bg-gray-50'
                "
              >
                <X :size="20" />
                <span class="text-[10px] uppercase font-bold tracking-wide">Absent</span>
              </button>
            </div>

            <!-- Comment Input -->
            <div class="relative">
              <input
                v-model="student.tempComments"
                type="text"
                placeholder="Afegir nota o observació..."
                class="w-full bg-white border border-gray-200 rounded-lg pl-3 pr-8 py-3 text-sm focus:ring-2 focus:ring-primary/20 focus:border-primary outline-none transition-all"
              />
              <button
                v-if="hasComment(student)"
                @click="student.tempComments = ''"
                class="absolute right-3 top-1/2 -translate-y-1/2 text-gray-400 hover:text-red-500 transition-colors"
              >
                <X :size="16" />
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
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
const loading = ref(true)
const saving = ref(false)
const currentDate = new Date().toLocaleDateString('ca-ES', {
  weekday: 'long',
  year: 'numeric',
  month: 'long',
  day: 'numeric',
})

// Capitalize date
const formattedDate = computed(() => {
  return currentDate.charAt(0).toUpperCase() + currentDate.slice(1)
})

const fetchStudents = async () => {
  try {
    loading.value = true
    const workshopId = route.params.id
    const response = await apiClient.get(`/workshops/${workshopId}/students`)

    students.value = response.data.map((s) => ({
      ...s,
      tempStatus: s.last_status || 'PRESENT',
      tempComments: s.last_comments || '',
    }))
  } catch (error) {
    console.error('Error fetching students:', error)
  } finally {
    loading.value = false
  }
}

const setStatus = (student, status) => {
  student.tempStatus = status
}

const hasComment = (student) => {
  return student.tempComments && student.tempComments.trim().length > 0
}

const saveAttendance = async () => {
  try {
    saving.value = true
    const workshopId = route.params.id

    const attendanceData = {
      id_workshop: workshopId,
      date: new Date().toISOString().split('T')[0],
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
    // alert('Error al guardar l\'assistència.');
  } finally {
    saving.value = false
  }
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

onMounted(() => {
  fetchStudents()
})
</script>
