<template>
  <div class="space-y-6 pb-12">
    <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">
      Avaluacions
    </h1>

    <div v-if="loading" class="text-center py-10">
      <p style="color: var(--text-secondary);">Carregant avaluacions...</p>
    </div>

    <div v-else-if="workshops.length === 0" class="text-center py-10 card">
      <p style="color: var(--text-secondary);">No tens tallers amb alumnes per avaluar.</p>
    </div>

    <div v-else class="space-y-6">
      <div v-for="workshop in activeWorkshops" :key="workshop.id_workshop" class="card p-6">
        <div class="flex items-center justify-between mb-4" style="border-bottom: 2px solid var(--border-color); padding-bottom: 1rem;">
          <div>
            <h2 class="text-xl font-semibold" style="color: var(--text-primary);">
              {{ workshop.title }}
            </h2>
            <p class="text-sm mt-1" style="color: var(--text-secondary);">
              {{ workshop.category }} | {{ formatDate(workshop.start_date) }} - {{ formatDate(workshop.end_date) }}
            </p>
          </div>
          <div class="flex items-center gap-2">
            <Users :size="18" style="color: var(--text-secondary);" />
            <span class="font-semibold" style="color: var(--text-primary);">
              {{ workshop.max_slots - workshop.available_slots }} alumnes
            </span>
          </div>
        </div>

        <!-- Estadístiques del taller -->
        <div class="grid grid-cols-2 gap-4 mb-6">
          <div class="text-center p-4" style="background-color: var(--background); border-radius: 8px;">
            <UserCheck :size="24" class="mx-auto mb-2" style="color: var(--success);" />
            <p class="text-2xl font-bold" style="color: var(--text-primary);">
              {{ workshop.enrolled_count || 0 }}
            </p>
            <p class="text-xs" style="color: var(--text-secondary);">Alumnes Inscrits</p>
          </div>
          <div class="text-center p-4" style="background-color: var(--background); border-radius: 8px;">
            <Clock :size="24" class="mx-auto mb-2" style="color: var(--warning);" />
            <p class="text-2xl font-bold" style="color: var(--text-primary);">
              {{ workshop.duration_hours }}
            </p>
            <p class="text-xs" style="color: var(--text-secondary);">Hores totals</p>
          </div>
        </div>

        <!-- Criteris d'avaluació -->
        <div class="mb-4">
          <h3 class="text-sm font-semibold mb-3 flex items-center gap-2" style="color: var(--text-primary);">
            <ClipboardList :size="18" />
            Criteris d'avaluació
          </h3>
          <div class="grid grid-cols-1 md:grid-cols-2 gap-2">
            <div class="flex items-center gap-2 p-2" style="background-color: var(--background); border-radius: 6px;">
              <div class="w-2 h-2 rounded-full" style="background-color: var(--success);"></div>
              <span class="text-sm" style="color: var(--text-secondary);">Assistència i puntualitat</span>
            </div>
            <div class="flex items-center gap-2 p-2" style="background-color: var(--background); border-radius: 6px;">
              <div class="w-2 h-2 rounded-full" style="background-color: var(--primary);"></div>
              <span class="text-sm" style="color: var(--text-secondary);">Participació activa</span>
            </div>
            <div class="flex items-center gap-2 p-2" style="background-color: var(--background); border-radius: 6px;">
              <div class="w-2 h-2 rounded-full" style="background-color: var(--warning);"></div>
              <span class="text-sm" style="color: var(--text-secondary);">Treball en equip</span>
            </div>
            <div class="flex items-center gap-2 p-2" style="background-color: var(--background); border-radius: 6px;">
              <div class="w-2 h-2 rounded-full" style="background-color: var(--secondary);"></div>
              <span class="text-sm" style="color: var(--text-secondary);">Qualitat del treball</span>
            </div>
          </div>
        </div>

        <!-- Botones de acción -->
        <div class="flex gap-3 mt-4">
          <button 
            class="btn-primary py-2 px-4 flex items-center gap-2"
            :style="{ backgroundColor: getCategoryColor(workshop.category).text + ' !important' }">
            <Edit :size="18" />
            Gestionar avaluacions
          </button>
          <button 
            @click="goToDetail(workshop.id_workshop)"
            class="btn-outline py-2 px-4 flex items-center gap-2">
            <Eye :size="18" />
            Veure detalls del taller
          </button>
        </div>
      </div>
    </div>

    <!-- Info adicional -->
    <div class="card p-6" style="background: linear-gradient(135deg, var(--primary-light) 0%, var(--card-background) 100%); border-left: 4px solid var(--primary);">
      <div class="flex items-start gap-3">
        <Info :size="24" style="color: var(--primary); flex-shrink: 0;" />
        <div>
          <h3 class="font-semibold mb-2" style="color: var(--text-primary);">
            Informació sobre avaluacions
          </h3>
          <p class="text-sm" style="color: var(--text-secondary);">
            Les avaluacions es poden realitzar durant o després de finalitzar el taller. 
            Recorda que els criteris d'avaluació han d'estar alineats amb els objectius del taller.
          </p>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { Users, UserCheck, Clock, Star, ClipboardList, Edit, Eye, Info } from 'lucide-vue-next';
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

const activeWorkshops = computed(() => {
  const now = new Date();
  return workshops.value.filter(w => {
    const startDate = new Date(w.start_date);
    const endDate = new Date(w.end_date);
    return startDate <= now && endDate >= now || w.status === 'OFFERED' || w.status === 'FULL';
  });
});

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
