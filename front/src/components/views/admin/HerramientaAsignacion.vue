<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">Eina d'Assignació</h1>
    </div>

    <!-- Form Card -->
    <div class="bg-white rounded-lg border border-gray-200 shadow-sm p-6">
      <h2 class="text-lg sm:text-xl font-semibold text-gray-800 mb-4 pb-3 border-b border-gray-200">
        Assignació Manual
      </h2>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Petició
          </label>
          <select v-model="selectedRequest" class="w-full border border-gray-300 rounded-lg px-4 py-2">
            <option value="">Selecciona una petición...</option>
            <option v-for="req in pendingRequests" :key="req.id_request" :value="req.id_request">
              {{ req.center_name }} - {{ req.workshop_title }} ({{ req.requested_slots }} alumnes)
            </option>
          </select>
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Places Assignades
          </label>
          <input
            v-model="assignedSlots"
            type="number"
            class="w-full border border-gray-300 rounded-lg px-4 py-2"
            placeholder="Número de plazas"
          />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Professor Referent 1
          </label>
          <select v-model="selectedTeacher1" class="w-full border border-gray-300 rounded-lg px-4 py-2">
            <option value="">Selecciona professor...</option>
            <option v-for="teacher in teachers" :key="teacher.id_user" :value="teacher.id_user">
              {{ teacher.first_name }} {{ teacher.last_name }}
            </option>
          </select>
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Professor Referent 2
          </label>
          <select v-model="selectedTeacher2" class="w-full border border-gray-300 rounded-lg px-4 py-2">
            <option value="">Selecciona professor (opcional)...</option>
            <option v-for="teacher in teachers" :key="teacher.id_user" :value="teacher.id_user">
              {{ teacher.first_name }} {{ teacher.last_name }}
            </option>
          </select>
        </div>
      </div>

      <div class="mt-6">
        <label class="block text-sm font-medium text-gray-700 mb-2">
          Observacions
        </label>
        <textarea
          v-model="comments"
          class="w-full border border-gray-300 rounded-lg px-4 py-2"
          rows="3"
          placeholder="Notes sobre l'assignació..."
        ></textarea>
      </div>

      <div class="flex gap-4 mt-6">
        <button @click="confirmAssignment" class="bg-green-600 text-white px-6 py-2 rounded-lg hover:bg-green-700 flex items-center gap-2">
          <CheckCircle :size="20" /> Confirmar Assignació
        </button>
        <button @click="sendNotification" class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 flex items-center gap-2">
          <Send :size="20" /> Enviar Notificació
        </button>
      </div>
    </div>
    <!-- EDDSON ASIGNACIÓN AUTOMÁTICA -->
    <!-- Automatic Matching Card -->
    <div class="bg-white rounded-lg border border-gray-200 shadow-sm p-6 mt-6">
      <h2 class="text-lg sm:text-xl font-semibold text-gray-800 mb-4 pb-3 border-b border-gray-200">
        Assignació Automàtica (Motor de Matching)
      </h2>
      
      <p class="text-gray-600 mb-4">Configura els filtres actius per a l'assignació automàtica:</p>
      
      <div class="flex flex-col sm:flex-row gap-6 mb-6">
        <label class="flex items-center gap-2 cursor-pointer">
          <input type="checkbox" v-model="filters.risk_enabled" class="w-5 h-5 text-blue-600 rounded focus:ring-blue-500">
          <span class="text-gray-700">Prioritzar Alumnes en Risc (x1M)</span>
        </label>
        
        <label class="flex items-center gap-2 cursor-pointer">
          <input type="checkbox" v-model="filters.eso4_enabled" class="w-5 h-5 text-blue-600 rounded focus:ring-blue-500">
          <span class="text-gray-700">Prioritzar 4rt ESO (x10k)</span>
        </label>
        
        <label class="flex items-center gap-2 cursor-pointer">
          <input type="checkbox" v-model="filters.age_enabled" class="w-5 h-5 text-blue-600 rounded focus:ring-blue-500">
          <span class="text-gray-700">Prioritzar Edat (Desempat)</span>
        </label>
      </div>

      <button 
        @click="runMatchingProcess" 
        :disabled="isMatching"
        class="bg-purple-600 text-white px-6 py-3 rounded-lg hover:bg-purple-700 flex items-center gap-2 font-semibold disabled:opacity-50 disabled:cursor-not-allowed"
      >
        <svg v-if="!isMatching" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M12 2v4"/><path d="m16.2 7.8 2.9-2.9"/><path d="M18 12h4"/><path d="m16.2 16.2 2.9 2.9"/><path d="M12 18v4"/><path d="m4.9 19.1 2.9-2.9"/><path d="M2 12h4"/><path d="m4.9 4.9 2.9 2.9"/></svg>
        <svg v-else class="animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24"><circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle><path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path></svg>
        {{ isMatching ? 'Executant Matching...' : 'Executar Motor d\'Assignació' }}
      </button>
    </div>

    <!-- Matching Overlay -->
    <div v-if="isMatching" class="fixed inset-0 bg-white/80 backdrop-blur-sm z-50 flex flex-col items-center justify-center p-4">
      <div class="w-full max-w-md bg-white border border-gray-200 rounded-xl shadow-2xl p-8 text-center">
        <div class="mb-6">
          <div class="relative w-20 h-20 mx-auto">
            <div class="absolute inset-0 border-4 border-gray-200 rounded-full"></div>
            <div class="absolute inset-0 border-4 border-purple-600 rounded-full border-t-transparent animate-spin"></div>
          </div>
        </div>
        <h3 class="text-2xl font-bold text-gray-800 mb-2">Assignació en Curs</h3>
        <p class="text-gray-500 mb-6">El motor està processant les inscripcions i aplicant els filtres seleccionats...</p>
        
        <!-- Progress Bar -->
        <div class="w-full bg-gray-200 rounded-full h-4 mb-2 overflow-hidden">
          <div 
            class="bg-purple-600 h-4 rounded-full transition-all duration-300 ease-out relative"
            :style="{ width: progress + '%' }"
          >
            <div class="absolute inset-0 bg-white/30 animate-[shimmer_2s_infinite] w-full h-full" 
                 style="background-image: linear-gradient(90deg, transparent 0%, rgba(255,255,255,0.5) 50%, transparent 100%)">
            </div>
          </div>
        </div>
        <div class="flex justify-between text-sm text-gray-500 font-medium">
          <span>Processant...</span>
          <span>{{ progress }}%</span>
        </div>
      </div>
    </div>

  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { CheckCircle, Send } from 'lucide-vue-next';
import { adminService } from '../../../services/adminService.js';

const pendingRequests = ref([]);
const teachers = ref([]);
const selectedRequest = ref('');
const assignedSlots = ref('');
const selectedTeacher1 = ref('');
const selectedTeacher2 = ref('');
const comments = ref('');

// Matching State
const isMatching = ref(false);
const progress = ref(0);
const filters = ref({
  risk_enabled: true,
  eso4_enabled: true,
  age_enabled: true
});

const loadPendingRequests = async () => {
  try {
    const data = await adminService.getPendingRequests();
    pendingRequests.value = data;
  } catch (error) {
    console.error('Error loading pending requests:', error);
  }
};

const loadTeachers = async () => {
  try {
    const data = await adminService.getAvailableTeachers();
    teachers.value = data;
  } catch (error) {
    console.error('Error loading teachers:', error);
  }
};

const confirmAssignment = async () => {
  if (!selectedRequest.value || !assignedSlots.value || !selectedTeacher1.value) {
    alert('Por favor, completa todos los campos obligatorios');
    return;
  }

  try {
    const assignmentData = {
      requestId: selectedRequest.value,
      assignedSlots: parseInt(assignedSlots.value),
      teacher1Id: selectedTeacher1.value,
      teacher2Id: selectedTeacher2.value || null,
      comments: comments.value
    };

    await adminService.manualAssign(assignmentData);
    
    // Limpiar formulario
    selectedRequest.value = '';
    assignedSlots.value = '';
    selectedTeacher1.value = '';
    selectedTeacher2.value = '';
    comments.value = '';
    
    // Recargar datos
    await loadPendingRequests();
    
    alert('Asignación completada correctamente');
  } catch (error) {
    console.error('Error in assignment:', error);
    alert('Error al realizar la asignación');
  }
};

const sendNotification = () => {
  // Aquí implementarías el envío de notificaciones
  alert('Funcionalidad de notificación próximamente disponible');
};

const runMatchingProcess = async () => {
  if (!confirm('Segur que vols executar el motor d\'assignació? Això processarà totes les inscripcions pendents.')) return;

  isMatching.value = true;
  progress.value = 0;

  // Fake progress animation since backend is async/fast mostly
  const interval = setInterval(() => {
    if (progress.value < 90) {
      progress.value += Math.floor(Math.random() * 5) + 1;
    }
  }, 200);

  try {
    const result = await adminService.runMatching(filters.value);
    console.log("DEBUG: Result from matching:", result);
    
    clearInterval(interval);
    progress.value = 100;
    
    // Small delay to show 100%
    setTimeout(() => {
      isMatching.value = false;
      
      // DOWNLOAD REPORT IF AVAILABLE
      if (result.report) {
        const blob = new Blob([result.report], { type: 'text/html' });
        const url = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = url;
        a.download = `informe_assignacio_${new Date().toISOString().slice(0,10)}.html`;
        document.body.appendChild(a);
        a.click();
        window.URL.revokeObjectURL(url);
        document.body.removeChild(a);
        
        alert('Procés de matching finalitzat correctament! L\'informe HTML s\'ha descarregat.');
      } else {
        alert('Procés de matching finalitzat correctament!');
      }

      // Reload whatever data needs reloading (maybe requests or enrollments view, but this page is for manual requests)
    }, 500);
    
  } catch (error) {
    clearInterval(interval);
    isMatching.value = false;
    console.error('Error matching:', error);
    alert('Hi ha hagut un error en el procés de matching.');
  }
};

onMounted(() => {
  loadPendingRequests();
  loadTeachers();
});
</script>
