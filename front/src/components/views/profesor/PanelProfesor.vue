<template>
  <div class="space-y-6">
    <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">Els Meus Tallers</h1>

    <div v-if="loading" class="text-center py-10">
      <p style="color: var(--text-secondary);">Carregant tallers...</p>
    </div>

    <div v-else-if="workshops.length === 0" class="text-center py-10 card">
      <p style="color: var(--text-secondary);">No tens cap taller assignat actualment.</p>
    </div>

    <div v-else class="grid grid-cols-1 md:grid-cols-3 gap-5">
      <div v-for="workshop in workshops" :key="workshop.id_workshop" class="card p-5">
        <div class="flex items-center justify-between mb-3" style="border-bottom: 1px solid var(--border-color); padding-bottom: 0.75rem;">
          <div :style="{ backgroundColor: getCategoryColor(workshop.category).bg, padding: '0.5rem', borderRadius: '3px' }">
            <BookOpen :style="{ color: getCategoryColor(workshop.category).text }" :size="22" />
          </div>
          <span :class="getStatusBadgeClass(workshop.status)">
            {{ getStatusLabel(workshop.status) }}
          </span>
        </div>
        <h3 class="text-base font-semibold mb-2" style="color: var(--text-primary);">
          {{ workshop.title }}
        </h3>
        <p class="text-sm mb-4" style="color: var(--text-secondary);">
          {{ workshop.category }} - {{ workshop.duration_hours }}h
        </p>
        <div class="space-y-2 text-sm" style="margin-bottom: 1rem;">
          <div class="flex justify-between py-1">
            <span style="color: var(--text-secondary);">Places:</span>
            <span class="font-semibold" style="color: var(--text-primary);">{{ workshop.available_slots }} / {{ workshop.max_slots }}</span>
          </div>
          <div class="flex justify-between py-1">
            <span style="color: var(--text-secondary);">{{ isPast(workshop.end_date) ? 'Finalitzat el:' : 'Inici:' }}</span>
            <span class="font-semibold" style="color: var(--text-primary);">{{ formatDate(workshop.start_date) }}</span>
          </div>
        </div>
        <button v-if="!isPast(workshop.end_date)" 
                @click="goToDetail(workshop.id_workshop)" 
                class="w-full mt-3 btn-primary py-2" 
                :style="{ backgroundColor: getCategoryColor(workshop.category).text + ' !important' }">
          Veure Detalls
        </button>
        <button v-else class="w-full mt-3 btn-outline py-2">
          Veure Historial
        </button>
      </div>
    </div>

    <!-- Pròximes Sessions - Static for now but could be dynamic later -->
    <div class="card p-6">
      <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
        Pròximes Sessions
      </h2>
      <div v-if="workshops.length > 0" class="space-y-3">
        <div v-for="(workshop, index) in workshops.slice(0, 2)" :key="'session-' + workshop.id_workshop" 
             @click="goToDetail(workshop.id_workshop)"
             class="flex items-center gap-4 p-4 cursor-pointer hover:opacity-90 transition-opacity" 
             :style="{ backgroundColor: getCategoryColor(workshop.category).bg, borderLeft: '4px solid ' + getCategoryColor(workshop.category).text }">
          <Calendar :style="{ color: getCategoryColor(workshop.category).text }" :size="24" />
          <div class="flex-1">
            <p class="font-semibold" style="color: var(--text-primary); margin-bottom: 0.25rem;">
              {{ workshop.title }}
            </p>
            <p class="text-sm" style="color: var(--text-secondary);">
              {{ formatSessionDate(workshop.start_date) }}
            </p>
          </div>
          <button :style="{ color: getCategoryColor(workshop.category).text }">
            <ChevronRight :size="20" />
          </button>
        </div>
      </div>
      <p v-else style="color: var(--text-secondary);" class="text-center py-4">No hi ha sessions programades.</p>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { BookOpen, Calendar, ChevronRight } from 'lucide-vue-next';
import apiClient from '../../../services/apiClient';

const router = useRouter();
const workshops = ref([]);
const loading = ref(true);
const user = ref(JSON.parse(localStorage.getItem('user') || '{}'));

const fetchWorkshops = async () => {
  try {
    loading.value = true;
    const teacherId = user.value.teacher_id;
    if (!teacherId) {
      console.warn('No teacher_id found in user object');
      workshops.value = [];
      return;
    }
    const response = await apiClient.get(`/workshops/mine?teacher_id=${teacherId}`);
    workshops.value = response.data;
  } catch (error) {
    console.error('Error fetching workshops:', error);
  } finally {
    loading.value = false;
  }
};

const goToDetail = (id) => {
  router.push(`/profesor/detalle/${id}`);
};

onMounted(() => {
  fetchWorkshops();
});

// Helpers
const formatDate = (dateStr) => {
  if (!dateStr) return 'N/A';
  const date = new Date(dateStr);
  return date.toLocaleDateString('ca-ES', { day: '2-digit', month: '2-digit', year: 'numeric' });
};

const formatSessionDate = (dateStr) => {
  if (!dateStr) return 'N/A';
  const date = new Date(dateStr);
  return date.toLocaleDateString('ca-ES', { weekday: 'long', day: 'numeric', month: 'long', hour: '2-digit', minute: '2-digit' }) + 'h';
};

const isPast = (dateStr) => {
  if (!dateStr) return false;
  return new Date(dateStr) < new Date();
};

const getStatusBadgeClass = (status) => {
  if (status === 'OFFERED' || status === 'PENDING') return 'badge-success';
  if (status === 'FULL') return 'badge-warning';
  return 'badge-secondary';
};

const getStatusLabel = (status) => {
  switch (status) {
    case 'OFFERED': return 'Actiu';
    case 'PENDING': return 'Pendent';
    case 'FULL': return 'Complet';
    case 'ARCHIVED': return 'Finalitzat';
    default: return status;
  }
};

const getCategoryColor = (category) => {
  const colors = {
    'Tecnologia': { bg: '#e3f2fd', text: 'var(--primary)' },
    'Ciència': { bg: '#f3e5f5', text: '#7b1fa2' },
    'Arts': { bg: '#fff3e0', text: 'var(--secondary)' },
    'default': { bg: '#f5f5f5', text: '#666' }
  };
  return colors[category] || colors.default;
};
</script>

