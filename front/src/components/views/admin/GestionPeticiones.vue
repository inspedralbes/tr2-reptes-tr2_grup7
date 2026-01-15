<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center">
      <h1 class="text-3xl font-bold text-gray-800">
        Bústia de peticions
      </h1>
      <button class="bg-green-600 text-white px-6 py-2 rounded-lg hover:bg-green-700 flex items-center gap-2">
        <Settings :size="20" /> Assignació Automàtica
      </button>
    </div>

    <div v-if="loading" class="text-center py-10 card">
      <p style="color: var(--text-secondary);">Carregant peticions...</p>
    </div>

    <div v-else-if="requests.length === 0" class="text-center py-10 card">
      <p style="color: var(--text-secondary);">No hi ha peticions pendents.</p>
    </div>

    <div v-else class="card overflow-hidden" style="max-height: calc(100vh - 250px);">
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
                    @click="viewRequest(req.id)"
                    class="p-2 hover-bg-blue rounded-lg"
                    title="Veure"
                  >
                    <Eye :size="18" class="text-blue-600" />
                  </button>
                  <button
                    @click="assignRequest(req.id)"
                    class="p-2 hover-bg-green rounded-lg"
                    title="Assignar"
                  >
                    <CheckCircle :size="18" class="text-green-600" />
                  </button>
                  <button
                    @click="deleteRequest(req.id)"
                    class="p-2 hover-bg-red rounded-lg"
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
import { Settings, Eye, CheckCircle, Trash2 } from 'lucide-vue-next';
import { ref } from 'vue';

import apiClient from '../../../services/apiClient';
import { onMounted } from 'vue';

const requests = ref([]);
const loading = ref(true);

const fetchRequests = async () => {
  try {
    loading.value = true;
    const response = await apiClient.get('/requests/all');
    // Mapear campos si es necesario (el model devuelve center_name y workshop_title)
    requests.value = response.data.map(req => ({
      id: req.id_request,
      centre: req.center_name,
      workshop: req.workshop_title,
      students: req.requested_slots,
      status: req.status === 'PENDING' ? 'Pendent' : (req.status === 'ACCEPTED' ? 'Assignada' : req.status),
      date: new Date(req.created_at).toLocaleDateString('ca-ES')
    }));
  } catch (error) {
    console.error('Error fetching requests:', error);
  } finally {
    loading.value = false;
  }
};

onMounted(() => {
  fetchRequests();
});
import { useRouter } from 'vue-router';

const router = useRouter();

const viewRequest = (id) => {
  // Redirigir al detalle del taller (compartido)
  // En una app real usaríamos el ID de la petición para cargar datos específicos
  router.push('/profesor/detalle/1'); 
};

const assignRequest = (id) => {
  alert(`Assignant petició #${id}...`);
};

const deleteRequest = (id) => {
  if (confirm('Estàs segur que vols eliminar aquesta petició?')) {
    alert(`Petició #${id} eliminada.`);
  }
};
</script>
