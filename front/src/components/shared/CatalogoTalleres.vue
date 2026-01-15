<script setup>
import { Filter, Search } from 'lucide-vue-next';
import { ref, onMounted } from 'vue';
import apiClient from '../../services/apiClient';

const workshops = ref([]);
const loading = ref(true);

const fetchWorkshops = async () => {
  try {
    const response = await apiClient.get('/workshops');
    workshops.value = response.data;
  } catch (error) {
    console.error('Error carregant tallers:', error);
  } finally {
    loading.value = false;
  }
};

const getCategoryColor = (category) => {
  const colors = {
    'Arts escèniques': { bg: '#f3e5f5', text: '#7b1fa2' },
    'Indústria-manufactura': { bg: '#efebe9', text: '#5d4037' },
    'Hostaleria': { bg: '#fff3e0', text: '#e65100' },
    'Indústria 4.0': { bg: '#e3f2fd', text: '#0d47a1' },
    'Esportiu': { bg: '#e8f5e9', text: '#2e7d32' },
    'default': { bg: '#f5f5f5', text: '#666' }
  };
  return colors[category] || colors.default;
};

onMounted(() => {
  fetchWorkshops();
});
</script>

<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center" style="border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">
      <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px;">Catàleg de tallers</h1>
      <div class="flex gap-2">
        <button class="btn-outline px-4 py-2 flex items-center gap-2">
          <Filter :size="16" /> Filtrar
        </button>
        <button class="btn-outline px-4 py-2 flex items-center gap-2">
          <Search :size="16" /> Cercar
        </button>
      </div>
    </div>

    <div v-if="loading" class="text-center py-10">
      <p style="color: var(--text-secondary);">Carregant tallers...</p>
    </div>

    <div v-else-if="workshops.length === 0" class="text-center py-10 card">
      <p style="color: var(--text-secondary);">No hi ha tallers disponibles al catàleg.</p>
    </div>

    <div v-else class="grid grid-cols-1 md:grid-cols-3 gap-5">
      <div
        v-for="workshop in workshops"
        :key="workshop.id_workshop"
        class="card overflow-hidden" style="padding: 0 !important;"
      >
        <div class="h-32" :style="{ backgroundColor: getCategoryColor(workshop.category).bg, display: 'flex', alignItems: 'center', justifyContent: 'center' }">
          <span class="text-xs font-bold px-3 py-1 rounded-full" :style="{ backgroundColor: 'white', color: getCategoryColor(workshop.category).text, border: '1px solid ' + getCategoryColor(workshop.category).text }">
            {{ workshop.category }}
          </span>
        </div>
        <div class="p-5">
          <div class="flex justify-between items-start mb-3" style="border-bottom: 1px solid var(--border-color); padding-bottom: 0.75rem;">
            <h3 class="text-base font-bold" style="color: var(--text-primary);">
              {{ workshop.title }}
            </h3>
          </div>
          <p class="text-sm text-gray-600 mb-4 line-clamp-2 min-h-[40px]">
            {{ workshop.short_description || 'Sense descripció.' }}
          </p>
          <div class="space-y-2 mb-4">
            <div class="flex justify-between text-sm py-1">
              <span style="color: var(--text-secondary);">Places totals:</span>
              <span class="font-semibold" style="color: var(--text-primary);">{{ workshop.max_slots }}</span>
            </div>
            <div class="flex justify-between text-sm py-1">
              <span style="color: var(--text-secondary);">Places disponibles:</span>
              <span class="font-semibold" :style="{ color: workshop.available_slots > 0 ? 'var(--success)' : 'var(--error)' }">
                {{ workshop.available_slots }}
              </span>
            </div>
          </div>
          <button 
            @click="$router.push('/centro/nueva-peticion')"
            class="btn-primary w-full py-2.5" 
            :disabled="workshop.available_slots === 0"
            :style="{ backgroundColor: getCategoryColor(workshop.category).text + ' !important', borderColor: getCategoryColor(workshop.category).text + ' !important' }"
          >
            {{ workshop.available_slots > 0 ? 'Sol·licitar taller' : 'Taller complet' }}
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
