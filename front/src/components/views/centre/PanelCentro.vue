<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center" style="border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">
      <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px;">Tauler de control</h1>
      <button @click="$router.push('/centro/nueva-peticion')" class="btn-primary px-6 py-2 flex items-center gap-2">
        <Plus :size="18" /> Nova petició
      </button>
    </div>

    <div v-if="loading" class="text-center py-10 card">
      <p style="color: var(--text-secondary);">Carregant dades...</p>
    </div>

    <div v-else class="grid grid-cols-1 lg:grid-cols-3 gap-6">
      <div class="md:col-span-2 space-y-6">
        <div class="card p-6">
          <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
            Informació del taller
          </h2>
          <div class="space-y-2">
            <div class="flex justify-between py-2.5" style="border-bottom: 1px solid var(--border-color);">
              <span style="color: var(--text-secondary); font-size: 0.9rem;">Centre:</span>
              <span class="font-semibold" style="color: var(--text-primary);">IES Pedralbes</span>
            </div>
            <div class="flex justify-between py-2.5" style="border-bottom: 1px solid var(--border-color);">
              <span style="color: var(--text-secondary); font-size: 0.9rem;">Curs:</span>
              <span class="font-semibold" style="color: var(--text-primary);">3r ESO</span>
            </div>
            <div class="flex justify-between py-2.5" style="border-bottom: 1px solid var(--border-color);">
              <span style="color: var(--text-secondary); font-size: 0.9rem;">Nombre d'alumnes:</span>
              <span class="font-semibold" style="color: var(--text-primary);">22</span>
            </div>
            <div class="flex justify-between py-2.5">
              <span style="color: var(--text-secondary); font-size: 0.9rem;">Sessions:</span>
              <span class="font-semibold" style="color: var(--text-primary);">8 sessions de 2h</span>
            </div>
          </div>
        </div>

        <div class="card p-6">
          <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
            Llista d'alumnes (22)
          </h2>
          <div class="max-h-96 overflow-y-auto" style="scroll-behavior: smooth; scrollbar-width: thin;">
            <table class="w-full">
              <thead class="bg-gray-50 sticky top-0">
                <tr>
                  <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700">
                    Nom
                  </th>
                  <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700">
                    Email
                  </th>
                  <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700">
                    Assistència
                  </th>
                </tr>
              </thead>
              <tbody class="divide-y">
                <tr class="hover:bg-gray-50">
                  <td class="px-4 py-3 text-sm">Maria López García</td>
                  <td class="px-4 py-3 text-sm text-gray-600">
                    maria.lopez@ies-pedralbes.cat
                  </td>
                  <td class="px-4 py-3">
                    <span class="bg-green-100 text-green-700 text-xs px-2 py-1 rounded">
                      100%
                    </span>
                  </td>
                </tr>
                <tr class="hover:bg-gray-50">
                  <td class="px-4 py-3 text-sm">Joan Martínez Pérez</td>
                  <td class="px-4 py-3 text-sm text-gray-600">
                    joan.martinez@ies-pedralbes.cat
                  </td>
                  <td class="px-4 py-3">
                    <span class="bg-green-100 text-green-700 text-xs px-2 py-1 rounded">
                      100%
                    </span>
                  </td>
                </tr>
                <tr class="hover:bg-gray-50">
                  <td class="px-4 py-3 text-sm">Laura Sánchez Vila</td>
                  <td class="px-4 py-3 text-sm text-gray-600">
                    laura.sanchez@ies-pedralbes.cat
                  </td>
                  <td class="px-4 py-3">
                    <span class="bg-yellow-100 text-yellow-700 text-xs px-2 py-1 rounded">
                      87%
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="space-y-6">
        <div class="card p-5">
          <h3 class="text-base font-semibold mb-3" style="color: var(--text-primary); padding-bottom: 0.5rem; border-bottom: 1px solid var(--border-color);">
            Contacte del centre
          </h3>
          <div class="space-y-3">
            <div>
              <p class="text-xs" style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.25rem;">Persona de contacte</p>
              <p class="font-semibold" style="color: var(--text-primary);">Anna Ferrer</p>
            </div>
            <div>
              <p class="text-xs" style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.25rem;">Email</p>
              <p class="font-medium" style="color: var(--primary);">
                anna.ferrer@ies-pedralbes.cat
              </p>
            </div>
            <div>
              <p class="text-xs" style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.25rem;">Telèfon</p>
              <p class="font-semibold" style="color: var(--text-primary);">937 123 456</p>
            </div>
          </div>
          <button @click="handleContact" class="w-full mt-4 btn-primary py-2.5">
            Enviar missatge
          </button>
        </div>

        <div class="card p-5">
          <h3 class="text-base font-semibold mb-3" style="color: var(--text-primary); padding-bottom: 0.5rem; border-bottom: 1px solid var(--border-color);">
            Professor co-referent
          </h3>
          <div class="space-y-3">
            <div>
              <p class="text-xs" style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.25rem;">Nom</p>
              <p class="font-semibold" style="color: var(--text-primary);">Pere López</p>
            </div>
            <div>
              <p class="text-xs" style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.25rem;">Email</p>
              <p class="font-medium" style="color: var(--primary);">pere.lopez@edu.cat</p>
            </div>
          </div>
        </div>

        <button @click="handleEvaluation" class="w-full btn-secondary py-3 flex items-center justify-center gap-2">
          <Award :size="18" /> Avaluar taller
        </button>
      </div>
    </div>

    <div class="card p-6">
      <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
        Peticions recents
      </h2>
      <div v-if="requests.length === 0" class="text-center py-4">
        <p style="color: var(--text-secondary);">No hi ha peticions recents.</p>
      </div>
      <div v-else class="space-y-3">
        <div v-for="req in requests.slice(0, 3)" :key="'notif-' + req.id" class="flex items-start gap-3 p-4" :style="{ backgroundColor: req.status === 'Assignada' ? '#e8f5e9' : '#fff3e0', borderLeft: '4px solid ' + (req.status === 'Assignada' ? 'var(--success)' : 'var(--warning)') }">
          <Bell v-if="req.status === 'Assignada'" style="color: var(--success);" :size="20" />
          <AlertCircle v-else style="color: var(--warning);" :size="20" />
          <div class="flex-1">
            <p class="font-semibold" style="color: var(--text-primary); margin-bottom: 0.25rem;">
              {{ req.status === 'Assignada' ? 'Assignació confirmada' : 'Petició pendent' }}
            </p>
            <p class="text-sm" style="color: var(--text-secondary);">
              S'ha sol·licitat el taller de {{ req.workshop }} amb {{ req.slots }} places.
            </p>
            <p class="text-xs mt-1" style="color: var(--gray-500);">Data: {{ req.date }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import {
  FileText,
  CheckCircle,
  Clock,
  Users,
  Plus,
  Bell,
  AlertCircle,
  Award
} from 'lucide-vue-next';
import { useRouter } from 'vue-router';

const router = useRouter();

import apiClient from '../../../services/apiClient';
import { onMounted, ref } from 'vue';

const requests = ref([]);
const loading = ref(true);

const fetchMyRequests = async () => {
  try {
    loading.value = true;
    const response = await apiClient.get('/requests');
    requests.value = response.data.map(req => ({
      id: req.id_request,
      workshop: req.workshop_title,
      slots: req.requested_slots,
      status: req.status === 'PENDING' ? 'Pendent' : (req.status === 'ACCEPTED' ? 'Assignada' : req.status),
      date: new Date(req.created_at).toLocaleDateString('ca-ES')
    }));
  } catch (error) {
    console.error('Error fetching center requests:', error);
  } finally {
    loading.value = false;
  }
};

const handleContact = () => {
  alert('Funcionalitat de contacte: El sistema enviarà una notificació al centre.');
};

const handleEvaluation = () => {
  alert('Funcionalitat d\'avaluació: Properament podràs avaluar el taller directament des d\'aquí.');
};

onMounted(() => {
  fetchMyRequests();
});
</script>
