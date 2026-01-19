<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">
        Gestió de Peticions
      </h1>
      <button @click="autoAssign" class="bg-green-600 text-white px-4 sm:px-6 py-2 rounded-lg hover:bg-green-700 transition-colors flex items-center justify-center gap-2 shadow-sm">
        <Settings :size="20" /> 
        <span class="hidden sm:inline">Assignació Automàtica</span>
        <span class="sm:hidden">Auto-assignar</span>
      </button>
    </div>

    <!-- Filters -->
    <div class="bg-white p-4 rounded-lg border border-gray-200 shadow-sm">
      <div class="grid grid-cols-1 sm:grid-cols-3 gap-4">
        <div class="relative">
          <Search :size="18" class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400" />
          <input 
            v-model="searchQuery" 
            type="text" 
            placeholder="Cercar per centre o taller..." 
            class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          >
        </div>
        <select v-model="filterStatus" class="border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
          <option value="ALL">Tots els estats</option>
          <option value="PENDING">Pendents</option>
          <option value="ACCEPTED">Assignades</option>
          <option value="REJECTED">Rebutjades</option>
        </select>
        <div class="text-sm text-gray-600 flex items-center justify-end">
          Total: <span class="font-semibold ml-1">{{ filteredRequests.length }}</span>
        </div>
      </div>
    </div>

    <!-- Table -->
    <div class="bg-white rounded-lg border border-gray-200 shadow-sm overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="px-4 sm:px-6 py-4 text-left text-xs sm:text-sm font-semibold text-gray-700">
                Centre
              </th>
              <th class="px-4 sm:px-6 py-4 text-left text-xs sm:text-sm font-semibold text-gray-700">
                Taller
              </th>
              <th class="hidden md:table-cell px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Alumnes
              </th>
              <th class="hidden lg:table-cell px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Data
              </th>
              <th class="px-4 sm:px-6 py-4 text-left text-xs sm:text-sm font-semibold text-gray-700">
                Estat
              </th>
              <th class="px-4 sm:px-6 py-4 text-right text-xs sm:text-sm font-semibold text-gray-700">
                Accions
              </th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr v-if="loading">
              <td colspan="6" class="px-6 py-8 text-center text-gray-500">
                <div class="flex items-center justify-center gap-2">
                  <div class="animate-spin rounded-full h-5 w-5 border-b-2 border-blue-600"></div>
                  Carregant peticions...
                </div>
              </td>
            </tr>
            <tr v-else-if="filteredRequests.length === 0">
              <td colspan="6" class="px-6 py-8 text-center text-gray-500">
                No s'han trobat peticions
              </td>
            </tr>
            <tr v-for="req in filteredRequests" :key="req.id" class="hover:bg-gray-50 transition-colors">
              <td class="px-4 sm:px-6 py-4 text-xs sm:text-sm text-gray-800">
                <div class="font-medium">{{ req.centre }}</div>
              </td>
              <td class="px-4 sm:px-6 py-4 text-xs sm:text-sm text-gray-800">
                <div class="max-w-xs truncate">{{ req.workshop }}</div>
              </td>
              <td class="hidden md:table-cell px-6 py-4 text-sm text-gray-800">
                <span class="font-medium">
                  {{ req.acceptedStudents }}/{{ req.totalStudents }}
                </span>
              </td>
              <td class="hidden lg:table-cell px-6 py-4 text-sm text-gray-600">
                {{ req.date }}
              </td>
              <td class="px-4 sm:px-6 py-4">
                <span :class="getStatusClass(req.status)">
                  {{ req.status }}
                </span>
              </td>
              <td class="px-4 sm:px-6 py-4">
                <div class="flex gap-1 sm:gap-2 justify-end">
                  <button
                    @click="viewRequest(req)"
                    class="p-2 hover:bg-blue-50 rounded-lg transition-colors"
                    title="Veure"
                  >
                    <Eye :size="18" class="text-blue-600" />
                  </button>
                  <button
                    @click="deleteRequest(req.id)"
                    class="p-2 hover:bg-red-50 rounded-lg transition-colors"
                    title="Eliminar"
                  >
                    <Trash2 :size="18" class="text-red-600" />
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Request Details Modal -->
    <RequestDetailsModal 
      :isOpen="showModal" 
      :request="selectedRequest"
      @close="showModal = false"
    />
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { Settings, Eye, Trash2, Search } from 'lucide-vue-next';
import { adminService } from '../../../services/adminService.js';
import { useAlertStore } from '../../../stores/alert';
import RequestDetailsModal from '../../modals/RequestDetailsModal.vue';

const alertStore = useAlertStore();

const requests = ref([]);
const loading = ref(true);
const searchQuery = ref('');
const filterStatus = ref('ALL');
const showModal = ref(false);
const selectedRequest = ref(null);

const loadRequests = async () => {
  loading.value = true;
  try {
    const data = await adminService.getAllRequests();
    requests.value = data.map(req => ({
      id: req.id_request,
      centre: req.center_name,
      workshop: req.workshop_title,
      students: req.requested_slots,
      totalStudents: parseInt(req.total_students) || req.requested_slots,
      acceptedStudents: parseInt(req.accepted_students) || 0,
      status: req.status === 'ACCEPTED' ? 'Assignada' : req.status === 'PENDING' ? 'Pendent' : req.status === 'REJECTED' ? 'Rebutjada' : req.status,
      statusRaw: req.status,
      date: new Date(req.created_at).toLocaleDateString('ca-ES')
    }));
  } catch (error) {
    console.error('Error loading requests:', error);
  } finally {
    loading.value = false;
  }
};

const filteredRequests = computed(() => {
  return requests.value.filter(req => {
    const matchesSearch = 
      req.centre.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
      req.workshop.toLowerCase().includes(searchQuery.value.toLowerCase());
    
    const matchesStatus = filterStatus.value === 'ALL' || req.statusRaw === filterStatus.value;
    
    return matchesSearch && matchesStatus;
  });
});

const getStatusClass = (status) => {
  const baseClass = 'px-2 sm:px-3 py-1 rounded-full text-xs font-medium whitespace-nowrap';
  if (status === 'Assignada') return `${baseClass} bg-green-100 text-green-700`;
  if (status === 'Pendent') return `${baseClass} bg-orange-100 text-orange-700`;
  if (status === 'Rebutjada') return `${baseClass} bg-red-100 text-red-700`;
  return `${baseClass} bg-gray-100 text-gray-700`;
};

const viewRequest = (request) => {
  selectedRequest.value = request;
  showModal.value = true;
};



const deleteRequest = async (requestId) => {
  if (await alertStore.confirm('Estàs segur que vols eliminar aquesta petició?')) {
    try {
      await adminService.deleteRequest(requestId);
      await loadRequests();
      alertStore.addAlert('success', 'Petició eliminada correctament');
    } catch (error) {
      console.error('Error deleting request:', error);
      alertStore.addAlert('error', 'Error en eliminar la petició');
    }
  }
};

const autoAssign = async () => {
  if (await alertStore.confirm('Estàs segur que vols realitzar l\'assignació automàtica? Això acceptarà totes les peticions pendents.')) {
    try {
      const result = await adminService.autoAssign();
      await loadRequests();
      alertStore.addAlert('success', `Assignació automàtica completada. ${result.updatedRequests} peticions assignades.`);
    } catch (error) {
      console.error('Error in auto assignment:', error);
      alertStore.addAlert('error', 'Error en l\'assignació automàtica');
    }
  }
};

onMounted(() => {
  loadRequests();
});
</script>
