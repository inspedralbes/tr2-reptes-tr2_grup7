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

onMounted(() => {
  loadPendingRequests();
  loadTeachers();
});
</script>
