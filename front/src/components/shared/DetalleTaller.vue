<template>
  <div class="space-y-6">
    <div v-if="loading" class="text-center py-10">
      <p style="color: var(--text-secondary);">Carregant detalls del taller...</p>
    </div>

    <div v-else-if="!workshop" class="text-center py-10 card">
      <p style="color: var(--text-secondary);">No s'ha trobat el taller.</p>
      <button @click="goBack" class="mt-4 btn-outline px-4 py-2">Tornar al panell</button>
    </div>

    <div v-else class="space-y-6">
      <div class="flex items-center gap-4">
        <button
          @click="goBack"
          class="text-gray-600 hover:text-gray-800 flex items-center gap-1"
        >
          &larr; Tornar
        </button>
        <h1 class="text-3xl font-bold text-gray-800">{{ workshop.title }}</h1>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div class="md:col-span-2 space-y-6">
          <div class="card p-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">
              Informació del Taller
            </h2>
            <div class="grid grid-cols-2 gap-4">
              <div>
                <p class="text-sm text-gray-600">Centre Educatiu</p>
                <p class="font-medium">{{ workshop.center_name || 'No assignat' }}</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Categoria</p>
                <p class="font-medium">{{ workshop.category }}</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Alumnes inscrits</p>
                <p class="font-medium">{{ workshop.available_slots }} / {{ workshop.max_slots }}</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Data inici</p>
                <p class="font-medium">{{ formatDate(workshop.start_date) }}</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Data finalització</p>
                <p class="font-medium">{{ formatDate(workshop.end_date) }}</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Durada total</p>
                <p class="font-medium">{{ workshop.duration_hours }} hores</p>
              </div>
            </div>
          </div>

          <div class="card p-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">
              Descripció
            </h2>
            <p class="text-gray-700 leading-relaxed">
              {{ workshop.short_description || 'Sense descripció disponible.' }}
            </p>
          </div>
        </div>

        <div class="space-y-6">
          <div class="card p-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">
              Contacte Centre
            </h2>
            <div class="space-y-3">
              <div>
                <p class="text-sm text-gray-600">Ubicació</p>
                <p class="font-medium">{{ workshop.center_address || 'No disponible' }}</p>
              </div>
              <div>
                <p class="text-sm text-gray-600">Telèfon</p>
                <p class="font-medium">{{ workshop.center_phone || 'No disponible' }}</p>
              </div>
            </div>
            <button class="w-full mt-4 btn-primary py-2">
              Contactar Centre
            </button>
          </div>

          <div class="card p-6">
            <h2 class="text-xl font-semibold text-gray-800 mb-4">
              Materials
            </h2>
            <div class="space-y-2">
              <button class="w-full flex items-center justify-between p-3 bg-gray-50 rounded-lg hover:bg-gray-100">
                <div class="flex items-center gap-3">
                  <FileText class="text-gray-600" :size="20" />
                  <span class="text-sm">Guia del taller</span>
                </div>
                <Download :size="18" class="text-gray-600" />
              </button>
            </div>
          </div>

          <button class="w-full bg-green-600 text-white py-3 rounded-lg hover:bg-green-700 flex items-center justify-center gap-2">
            <Award :size="20" /> Avaluar Sessió
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import {
  FileText,
  Download,
  Award
} from 'lucide-vue-next';
import apiClient from '../../services/apiClient';

const route = useRoute();
const router = useRouter();
const workshop = ref(null);
const loading = ref(true);

const fetchWorkshop = async () => {
  try {
    loading.value = true;
    const id = route.params.id;
    if (!id) return;
    const response = await apiClient.get(`/workshops/${id}`);
    workshop.value = response.data;
  } catch (error) {
    console.error('Error fetching workshop details:', error);
  } finally {
    loading.value = false;
  }
};

const goBack = () => {
  router.back();
};

const formatDate = (dateStr) => {
  if (!dateStr) return 'N/A';
  return new Date(dateStr).toLocaleDateString('ca-ES', {
    day: '2-digit',
    month: 'long',
    year: 'numeric'
  });
};

onMounted(() => {
  fetchWorkshop();
});
</script>

