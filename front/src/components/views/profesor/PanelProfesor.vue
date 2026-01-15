<template>
  <div class="space-y-6 pb-12">
    <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">Els meus tallers</h1>

    <div v-if="loading" class="text-center py-10">
      <p style="color: var(--text-secondary);">Carregant tallers...</p>
    </div>

    <div v-else-if="workshops.length === 0" class="text-center py-10 card">
      <p style="color: var(--text-secondary);">Actualment no tens cap taller assignat.</p>
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
            <span style="color: var(--text-secondary);">Inscrits:</span>
            <span class="font-semibold" style="color: var(--text-primary);">{{ workshop.enrolled_count || 0 }} / {{ workshop.max_slots }}</span>
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
          Veure detalls
        </button>
        <button v-else 
                @click="goToDetail(workshop.id_workshop)" 
                class="w-full mt-3 btn-outline py-2">
          Veure historial
        </button>
      </div>
    </div>

    <!-- Pròximes Sessions -->
    <div class="card p-6">
      <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
        Pròximes sessions
      </h2>
      <div v-if="upcomingWorkshops.length > 0" class="space-y-3">
        <div v-for="(workshop, index) in upcomingWorkshops" :key="'session-' + workshop.id_workshop" 
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
          <button 
            @click.stop="goToAttendance(workshop.id_workshop)"
            class="p-2 rounded-full hover:bg-gray-100 transition-colors"
            style="margin-right: -0.5rem;"
            title="Gestionar Assistència">
            <ClipboardList :size="20" :style="{ color: getCategoryColor(workshop.category).text }" />
          </button>
          <button :style="{ color: getCategoryColor(workshop.category).text }">
            <ChevronRight :size="20" />
          </button>
        </div>
      </div>
      <p v-else style="color: var(--text-secondary);" class="text-center py-4">No hi ha sessions programades pròximament.</p>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue';
import { useRouter } from 'vue-router';
import { BookOpen, Calendar, ChevronRight, ClipboardList } from 'lucide-vue-next';
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

const upcomingWorkshops = computed(() => {
  return workshops.value
    .filter(w => !isPast(w.end_date))
    .sort((a, b) => new Date(a.start_date) - new Date(b.start_date))
    .slice(0, 2);
});

const goToDetail = (id) => {
  router.push(`/profesor/detalle/${id}`);
};

const goToAttendance = (id) => {
  router.push(`/profesor/asistencia/${id}`);
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
    'Arts escèniques': { bg: '#f3e5f5', text: '#7b1fa2' },
    'Indústria-manufactura': { bg: '#efebe9', text: '#5d4037' },
    'Hostaleria': { bg: '#fff3e0', text: '#e65100' },
    'Indústria 4.0': { bg: '#e3f2fd', text: '#0d47a1' },
    'Esportiu': { bg: '#e8f5e9', text: '#2e7d32' },
    'default': { bg: '#f5f5f5', text: '#666' }
  };
  return colors[category] || colors.default;
};
</script>
