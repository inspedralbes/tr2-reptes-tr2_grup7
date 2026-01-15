<template>
  <div class="space-y-6 pb-12">
    <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">
      Historial de Tallers
    </h1>

    <div v-if="loading" class="text-center py-10">
      <p style="color: var(--text-secondary);">Carregant historial...</p>
    </div>

    <div v-else-if="completedWorkshops.length === 0" class="text-center py-10 card">
      <p style="color: var(--text-secondary);">No tens tallers finalitzats encara.</p>
    </div>

    <div v-else>
      <!-- Estadístiques generals -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
        <div class="stat-card-blue text-white p-5">
          <div class="flex items-start justify-between">
            <div>
              <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Total de tallers</p>
              <p class="text-3xl font-bold">{{ completedWorkshops.length }}</p>
            </div>
            <BookOpen :size="28" style="opacity: 0.75;" />
          </div>
        </div>

        <div class="stat-card-green text-white p-5">
          <div class="flex items-start justify-between">
            <div>
              <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Alumnes totals</p>
              <p class="text-3xl font-bold">{{ totalStudents }}</p>
            </div>
            <Users :size="28" style="opacity: 0.75;" />
          </div>
        </div>

        <div class="stat-card-purple text-white p-5">
          <div class="flex items-start justify-between">
            <div>
              <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Hores impartides</p>
              <p class="text-3xl font-bold">{{ totalHours }}h</p>
            </div>
            <Clock :size="28" style="opacity: 0.75;" />
          </div>
        </div>

        <div class="stat-card-orange text-white p-5">
          <div class="flex items-start justify-between">
            <div>
              <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Valoració mitjana</p>
              <p class="text-3xl font-bold">{{ averageRating }}</p>
            </div>
            <Star :size="28" style="opacity: 0.75;" />
          </div>
        </div>
      </div>

      <!-- Llistat de tallers finalitzats -->
      <div class="space-y-4">
        <h2 class="text-lg font-semibold" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
          Tallers finalitzats
        </h2>

        <div v-for="workshop in completedWorkshops" :key="workshop.id_workshop" class="card p-5 hover:shadow-lg transition-shadow">
          <div class="flex items-start gap-4">
            <div class="flex-shrink-0 p-3" :style="{ backgroundColor: getCategoryColor(workshop.category).bg, borderRadius: '8px' }">
              <Check :size="24" :style="{ color: getCategoryColor(workshop.category).text }" />
            </div>

            <div class="flex-1">
              <div class="flex items-start justify-between mb-3">
                <div>
                  <h3 class="text-lg font-semibold" style="color: var(--text-primary);">
                    {{ workshop.title }}
                  </h3>
                  <p class="text-sm mt-1" style="color: var(--text-secondary);">
                    {{ workshop.category }} | {{ workshop.duration_hours }}h
                  </p>
                </div>
                <span class="badge-secondary">Finalitzat</span>
              </div>

              <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-4">
                <div class="flex items-center gap-2">
                  <CalendarCheck :size="16" style="color: var(--text-secondary);" />
                  <div>
                    <p class="text-xs" style="color: var(--text-secondary);">Data finalització</p>
                    <p class="text-sm font-semibold" style="color: var(--text-primary);">
                      {{ formatDate(workshop.end_date) }}
                    </p>
                  </div>
                </div>

                <div class="flex items-center gap-2">
                  <Users :size="16" style="color: var(--text-secondary);" />
                  <div>
                    <p class="text-xs" style="color: var(--text-secondary);">Alumnes</p>
                    <p class="text-sm font-semibold" style="color: var(--text-primary);">
                      {{ workshop.max_slots - workshop.available_slots }} / {{ workshop.max_slots }}
                    </p>
                  </div>
                </div>

                <div class="flex items-center gap-2">
                  <Award :size="16" style="color: var(--text-secondary);" />
                  <div>
                    <p class="text-xs" style="color: var(--text-secondary);">Taxa d'èxit</p>
                    <p class="text-sm font-semibold" style="color: var(--success);">
                      {{ Math.floor(Math.random() * 20 + 80) }}%
                    </p>
                  </div>
                </div>

                <div class="flex items-center gap-2">
                  <Star :size="16" style="color: var(--text-secondary);" />
                  <div>
                    <p class="text-xs" style="color: var(--text-secondary);">Valoració</p>
                    <p class="text-sm font-semibold" style="color: var(--primary);">
                      {{ (Math.random() * 2 + 3).toFixed(1) }} / 5.0
                    </p>
                  </div>
                </div>
              </div>

              <div class="flex gap-2">
                <button 
                  @click="goToDetail(workshop.id_workshop)"
                  class="btn-outline py-2 px-4 text-sm flex items-center gap-2">
                  <Eye :size="16" />
                  Veure detalls
                </button>
                <button class="btn-outline py-2 px-4 text-sm flex items-center gap-2">
                  <Download :size="16" />
                  Descarregar informe
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Timeline per any -->
      <div class="card p-6 mt-6">
        <h3 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
          Timeline per categories
        </h3>
        <div class="space-y-3">
          <div v-for="(count, category) in categoryCounts" :key="category" class="flex items-center gap-4">
            <div class="w-32 text-sm font-medium" style="color: var(--text-primary);">{{ category }}</div>
            <div class="flex-1 h-8 rounded-full overflow-hidden" style="background-color: var(--background);">
              <div 
                class="h-full flex items-center justify-end px-3 text-sm font-bold text-white"
                :style="{ 
                  width: (count / completedWorkshops.length * 100) + '%',
                  backgroundColor: getCategoryColor(category).text 
                }">
                {{ count }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { BookOpen, Users, Clock, Star, Check, CalendarCheck, Award, Eye, Download } from 'lucide-vue-next';
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

const completedWorkshops = computed(() => {
  const now = new Date();
  return workshops.value
    .filter(w => new Date(w.end_date) < now || w.status === 'ARCHIVED')
    .sort((a, b) => new Date(b.end_date) - new Date(a.end_date));
});

const totalStudents = computed(() => {
  return completedWorkshops.value.reduce((sum, w) => sum + (w.max_slots - w.available_slots), 0);
});

const totalHours = computed(() => {
  return completedWorkshops.value.reduce((sum, w) => sum + (w.duration_hours || 0), 0);
});

const averageRating = computed(() => {
  if (completedWorkshops.value.length === 0) return '0.0';
  return (Math.random() * 1.5 + 3.5).toFixed(1);
});

const categoryCounts = computed(() => {
  const counts = {};
  completedWorkshops.value.forEach(w => {
    counts[w.category] = (counts[w.category] || 0) + 1;
  });
  return counts;
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
