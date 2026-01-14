<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center">
      <h1 class="text-3xl font-bold text-gray-800">
        Bandeja de Peticions
      </h1>
      <button @click="autoAssign" class="bg-green-600 text-white px-6 py-2 rounded-lg hover:bg-green-700 flex items-center gap-2">
        <Settings :size="20" /> Assignació Automàtica
      </button>
    </div>

    <div class="card overflow-hidden" style="max-height: calc(100vh - 250px);">
      <div class="overflow-auto" style="scroll-behavior: smooth;">
        <table class="w-full">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Centre
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Taller
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Alumnes
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Data
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Estat
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Accions
              </th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr
              v-for="req in requests"
              :key="req.id"
              class="hover:bg-gray-50"
            >
              <td class="px-6 py-4 text-sm text-gray-800">
                {{ req.centre }}
              </td>
              <td class="px-6 py-4 text-sm text-gray-800">
                {{ req.workshop }}
              </td>
              <td class="px-6 py-4 text-sm text-gray-800">
                {{ req.students }}
              </td>
              <td class="px-6 py-4 text-sm text-gray-600">
                {{ req.date }}
              </td>
              <td class="px-6 py-4">
                <span
                  :class="[
                    'px-3 py-1 rounded-full text-xs font-medium',
                    req.status === 'Assignada'
                      ? 'bg-green-100 text-green-700'
                      : 'bg-orange-100 text-orange-700'
                  ]"
                >
                  {{ req.status }}
                </span>
              </td>
              <td class="px-6 py-4">
                <div class="flex gap-2">
                  <button
                    @click="viewRequest(req)"
                    class="p-2 hover:bg-blue-50 rounded-lg"
                    title="Veure"
                  >
                    <Eye :size="18" class="text-blue-600" />
                  </button>
                  <button
                    v-if="req.status === 'Pendent'"
                    @click="acceptRequest(req.id)"
                    class="p-2 hover:bg-green-50 rounded-lg"
                    title="Assignar"
                  >
                    <CheckCircle :size="18" class="text-green-600" />
                  </button>
                  <button
                    v-if="req.status === 'Pendent'"
                    @click="rejectRequest(req.id)"
                    class="p-2 hover:bg-orange-50 rounded-lg"
                    title="Rechazar"
                  >
                    <X :size="18" class="text-orange-600" />
                  </button>
                  <button
                    @click="deleteRequest(req.id)"
                    class="p-2 hover:bg-red-50 rounded-lg"
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
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { Settings, Eye, CheckCircle, Trash2, X } from 'lucide-vue-next';
import { adminService } from '../../../services/adminService.js';

const requests = ref([]);

const loadRequests = async () => {
  try {
    const data = await adminService.getAllRequests();
    requests.value = data.map(req => ({
      id: req.id_request,
      centre: req.center_name,
      workshop: req.workshop_title,
      students: req.requested_slots,
      status: req.status === 'ACCEPTED' ? 'Assignada' : req.status === 'PENDING' ? 'Pendent' : req.status,
      date: new Date(req.created_at).toLocaleDateString('es-ES')
    }));
  } catch (error) {
    console.error('Error loading requests:', error);
  }
};

const acceptRequest = async (requestId) => {
  try {
    await adminService.acceptRequest(requestId);
    await loadRequests(); // Recargar la lista
    alert('Petición aceptada correctamente');
  } catch (error) {
    console.error('Error accepting request:', error);
    alert('Error al aceptar la petición');
  }
};

const rejectRequest = async (requestId) => {
  try {
    await adminService.rejectRequest(requestId);
    await loadRequests(); // Recargar la lista
    alert('Petición rechazada correctamente');
  } catch (error) {
    console.error('Error rejecting request:', error);
    alert('Error al rechazar la petición');
  }
};

const deleteRequest = async (requestId) => {
  if (confirm('¿Estás seguro de que quieres eliminar esta petición?')) {
    try {
      await adminService.deleteRequest(requestId);
      await loadRequests(); // Recargar la lista
      alert('Petición eliminada correctamente');
    } catch (error) {
      console.error('Error deleting request:', error);
      alert('Error al eliminar la petición');
    }
  }
};

const viewRequest = (request) => {
  // Aquí podrías abrir un modal con detalles de la petición
  alert(`Detalles de la petición:\nCentro: ${request.centre}\nTaller: ${request.workshop}\nAlumnos: ${request.students}\nEstado: ${request.status}\nFecha: ${request.date}`);
};

const autoAssign = async () => {
  if (confirm('¿Estás seguro de que quieres realizar la asignación automática? Esto aceptará todas las peticiones pendientes.')) {
    try {
      const result = await adminService.autoAssign();
      await loadRequests(); // Recargar la lista
      alert(`Asignación automática completada. ${result.updatedRequests} peticiones asignadas.`);
    } catch (error) {
      console.error('Error in auto assignment:', error);
      alert('Error en la asignación automática');
    }
  }
};

onMounted(() => {
  loadRequests();
});
</script>
