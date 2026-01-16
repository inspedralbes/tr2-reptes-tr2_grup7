<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
      <div class="flex items-center gap-3">
        <button
          @click="goBack"
          class="p-2 rounded-lg hover:bg-gray-100 transition-colors text-gray-600"
          title="Tornar enrere"
        >
          <ArrowLeft :size="24" />
        </button>
        <div>
          <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">
            Control d'Assistència
          </h1>
          <p class="text-sm text-gray-500 mt-1">{{ currentDate }}</p>
        </div>
      </div>
      <button 
        @click="saveAttendance" 
        class="bg-blue-600 text-white px-4 sm:px-6 py-2 rounded-lg hover:bg-blue-700 transition-colors flex items-center justify-center gap-2 shadow-sm"
        :disabled="saving"
      >
        <Save :size="20" />
        <span>{{ saving ? 'Guardant...' : 'Guardar Assistència' }}</span>
      </button>
    </div>

    <!-- Summary Stats -->
    <div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
      <div class="bg-white p-4 rounded-lg border border-gray-200 shadow-sm">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-xs text-gray-500 font-medium uppercase">Total</p>
            <p class="text-2xl font-bold text-gray-800 mt-1">{{ students.length }}</p>
          </div>
          <Users :size="24" class="text-blue-500" />
        </div>
      </div>
      <div class="bg-white p-4 rounded-lg border border-gray-200 shadow-sm">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-xs text-gray-500 font-medium uppercase">Presents</p>
            <p class="text-2xl font-bold text-green-600 mt-1">{{ presentCount }}</p>
          </div>
          <CheckCircle :size="24" class="text-green-500" />
        </div>
      </div>
      <div class="bg-white p-4 rounded-lg border border-gray-200 shadow-sm">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-xs text-gray-500 font-medium uppercase">Absents</p>
            <p class="text-2xl font-bold text-red-600 mt-1">{{ absentCount }}</p>
          </div>
          <XCircle :size="24" class="text-red-500" />
        </div>
      </div>
      <div class="bg-white p-4 rounded-lg border border-gray-200 shadow-sm">
        <div class="flex items-center justify-between">
          <div>
            <p class="text-xs text-gray-500 font-medium uppercase">Retards</p>
            <p class="text-2xl font-bold text-yellow-600 mt-1">{{ lateCount }}</p>
          </div>
          <Clock :size="24" class="text-yellow-500" />
        </div>
      </div>
    </div>

    <!-- Loading State -->
    <div v-if="loading" class="bg-white rounded-lg border border-gray-200 shadow-sm p-12">
      <div class="text-center">
        <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto mb-4"></div>
        <p class="text-gray-500">Carregant llista d'alumnes...</p>
      </div>
    </div>

    <!-- Students Table -->
    <div v-else class="bg-white rounded-lg border border-gray-200 shadow-sm overflow-hidden">
      <div v-if="students.length === 0" class="p-12 text-center">
        <Users :size="48" class="mx-auto text-gray-300 mb-4" />
        <p class="text-gray-500">No hi ha alumnes inscrits en aquest taller.</p>
      </div>
      
      <div v-else class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Alumne</th>
              <th class="px-6 py-4 text-center text-sm font-semibold text-gray-700">Estat</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Comentaris</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr 
              v-for="student in students" 
              :key="student.id_student" 
              class="hover:bg-gray-50 transition-colors"
              :class="{
                'bg-green-50': student.tempStatus === 'PRESENT',
                'bg-red-50': student.tempStatus === 'ABSENT',
                'bg-yellow-50': student.tempStatus === 'LATE'
              }"
            >
              <td class="px-6 py-4">
                <div class="flex items-center gap-3">
                  <div 
                    class="w-10 h-10 rounded-full flex items-center justify-center text-white font-semibold text-sm"
                    :style="{ backgroundColor: getAvatarColor(student.id_student) }"
                  >
                    {{ getInitials(student.first_name, student.last_name) }}
                  </div>
                  <div>
                    <div class="font-medium text-gray-900">{{ student.first_name }} {{ student.last_name }}</div>
                    <div class="text-sm text-gray-500">{{ student.email }}</div>
                  </div>
                </div>
              </td>
              <td class="px-6 py-4">
                <div class="flex items-center justify-center gap-2">
                  <button 
                    @click="setStatus(student, 'PRESENT')"
                    :class="student.tempStatus === 'PRESENT' 
                      ? 'bg-green-600 text-white' 
                      : 'bg-gray-100 text-gray-600 hover:bg-green-50 hover:text-green-600'"
                    class="px-3 py-1.5 rounded-lg text-sm font-medium transition-colors flex items-center gap-1"
                  >
                    <Check :size="16" /> Present
                  </button>
                  <button 
                    @click="setStatus(student, 'ABSENT')"
                    :class="student.tempStatus === 'ABSENT' 
                      ? 'bg-red-600 text-white' 
                      : 'bg-gray-100 text-gray-600 hover:bg-red-50 hover:text-red-600'"
                    class="px-3 py-1.5 rounded-lg text-sm font-medium transition-colors flex items-center gap-1"
                  >
                    <X :size="16" /> Absent
                  </button>
                  <button 
                    @click="setStatus(student, 'LATE')"
                    :class="student.tempStatus === 'LATE' 
                      ? 'bg-yellow-600 text-white' 
                      : 'bg-gray-100 text-gray-600 hover:bg-yellow-50 hover:text-yellow-600'"
                    class="px-3 py-1.5 rounded-lg text-sm font-medium transition-colors flex items-center gap-1"
                  >
                    <Clock :size="16" /> Retard
                  </button>
                </div>
              </td>
              <td class="px-6 py-4">
                <div class="flex items-center gap-2">
                  <input 
                    v-model="student.tempComments" 
                    type="text" 
                    placeholder="Afegir observacions..."
                    class="flex-1 border border-gray-300 rounded-lg px-3 py-1.5 text-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
                  />
                  <button 
                    v-if="hasComment(student)"
                    @click="student.tempComments = ''"
                    class="text-gray-400 hover:text-gray-600"
                    title="Esborrar comentari"
                  >
                    <X :size="18" />
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { 
  ArrowLeft, Save, Users, CheckCircle, XCircle, Clock, 
  Check, X
} from 'lucide-vue-next';
import apiClient from '../../../services/apiClient';

const route = useRoute();
const router = useRouter();
const students = ref([]);
const loading = ref(true);
const saving = ref(false);
const currentDate = new Date().toLocaleDateString('ca-ES', { 
  weekday: 'long', 
  year: 'numeric', 
  month: 'long', 
  day: 'numeric' 
});

const fetchStudents = async () => {
  try {
    loading.value = true;
    const workshopId = route.params.id;
    const response = await apiClient.get(`/workshops/${workshopId}/students`);
    
    students.value = response.data.map(s => ({
      ...s,
      tempStatus: s.last_status || 'PRESENT',
      tempComments: s.last_comments || ''
    }));
  } catch (error) {
    console.error('Error fetching students:', error);
  } finally {
    loading.value = false;
  }
};

const setStatus = (student, status) => {
  student.tempStatus = status;
};

const hasComment = (student) => {
  return student.tempComments && student.tempComments.trim().length > 0;
};

const saveAttendance = async () => {
  try {
    saving.value = true;
    const workshopId = route.params.id;
    
    const attendanceData = {
      id_workshop: workshopId,
      date: new Date().toISOString().split('T')[0],
      students: students.value.map(s => ({
        id_student: s.id_student,
        status: s.tempStatus,
        comments: s.tempComments
      }))
    };

    await apiClient.post('/workshops/attendance', attendanceData);
    router.back();
  } catch (error) {
    console.error('Error saving attendance:', error);
    alert('Error al guardar l\'assistència.');
  } finally {
    saving.value = false;
  }
};

const goBack = () => {
  router.back();
};

// Computed Stats
const presentCount = computed(() => students.value.filter(s => s.tempStatus === 'PRESENT').length);
const absentCount = computed(() => students.value.filter(s => s.tempStatus === 'ABSENT').length);
const lateCount = computed(() => students.value.filter(s => s.tempStatus === 'LATE').length);

// Helpers
const getInitials = (first, last) => {
  return `${first.charAt(0)}${last.charAt(0)}`.toUpperCase();
};

const getAvatarColor = (id) => {
  const colors = ['#3b82f6', '#10b981', '#f59e0b', '#ef4444', '#8b5cf6', '#ec4899'];
  return colors[id % colors.length];
};

onMounted(() => {
  fetchStudents();
});
</script>
