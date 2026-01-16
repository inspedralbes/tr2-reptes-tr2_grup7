<template>
  <div class="space-y-6 pb-12">
    <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">
      Sessions Programades
    </h1>

    <div v-if="loading" class="text-center py-10">
      <p style="color: var(--text-secondary);">Carregant sessions...</p>
    </div>

    <div v-else-if="upcomingSessions.length === 0" class="text-center py-10 card">
      <p style="color: var(--text-secondary);">No tens sessions programades properament.</p>
    </div>

    <div v-else class="space-y-4">
      <!-- Timeline de sessions -->
      <div v-for="session in upcomingSessions" :key="session.id_workshop" class="card p-5">
        <div class="flex items-start gap-4">
          <div class="flex flex-col items-center" style="min-width: 80px;">
            <div class="text-center p-3" :style="{ backgroundColor: getCategoryColor(session.category).bg, borderRadius: '8px', width: '70px' }">
              <p class="text-2xl font-bold" :style="{ color: getCategoryColor(session.category).text }">
                {{ formatDay(session.start_date) }}
              </p>
              <p class="text-xs" :style="{ color: getCategoryColor(session.category).text, opacity: 0.8 }">
                {{ formatMonth(session.start_date) }}
              </p>
            </div>
          </div>

          <div class="flex-1">
            <div class="flex items-center justify-between mb-2">
              <h3 class="text-lg font-semibold" style="color: var(--text-primary);">
                {{ session.title }}
              </h3>
              <span :class="getStatusBadgeClass(session.status)">
                {{ getStatusLabel(session.status) }}
              </span>
            </div>
            
            <div class="space-y-2 text-sm">
              <div class="flex items-center gap-2">
                <Clock :size="16" style="color: var(--text-secondary);" />
                <span style="color: var(--text-secondary);">
                  {{ formatTime(session.start_date) }} - {{ formatTime(session.end_date) }}
                  <span class="ml-2 font-semibold">({{ session.duration_hours }}h)</span>
                </span>
              </div>

              <div class="flex items-center gap-2">
                <Users :size="16" style="color: var(--text-secondary);" />
                <span style="color: var(--text-secondary);">
                  {{ session.max_slots - session.available_slots }} / {{ session.max_slots }} alumnes inscrits
                </span>
              </div>

              <div class="flex items-center gap-2">
                <Tag :size="16" style="color: var(--text-secondary);" />
                <span style="color: var(--text-secondary);">{{ session.category }}</span>
              </div>

              <div v-if="session.short_description" class="mt-3 p-3" style="background-color: var(--background); border-radius: 6px;">
                <p style="color: var(--text-primary); font-size: 0.875rem;">
                  {{ session.short_description }}
                </p>
              </div>
            </div>

            <div class="flex gap-2 mt-4">
              <button 
                @click="goToDetail(session.id_workshop)" 
                class="btn-primary py-2 px-4"
                :style="{ backgroundColor: getCategoryColor(session.category).text + ' !important' }">
                Veure detalls
              </button>
              <button 
                @click="goToAttendance(session.id_workshop)"
                class="btn-outline py-2 px-4">
                Gestionar assistència
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Sessions passades -->
    <div v-if="pastSessions.length > 0" class="mt-8">
      <h2 class="text-xl font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
        Sessions realitzades
      </h2>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div v-for="session in pastSessions" :key="'past-' + session.id_workshop" 
             class="card p-4 opacity-75 hover:opacity-100 transition-opacity cursor-pointer"
             @click="goToDetail(session.id_workshop)">
          <div class="flex items-center gap-3">
            <CheckCircle :size="20" style="color: var(--success);" />
            <div class="flex-1">
              <p class="font-semibold" style="color: var(--text-primary);">{{ session.title }}</p>
              <p class="text-sm" style="color: var(--text-secondary);">
                {{ formatDate(session.start_date) }}
              </p>
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
import { Clock, Users, Tag, CheckCircle } from 'lucide-vue-next';
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

const upcomingSessions = computed(() => {
  const now = new Date();
  return workshops.value
    .filter(w => new Date(w.end_date) >= now)
    .sort((a, b) => new Date(a.start_date) - new Date(b.start_date));
});

const pastSessions = computed(() => {
  const now = new Date();
  return workshops.value
    .filter(w => new Date(w.end_date) < now)
    .sort((a, b) => new Date(b.start_date) - new Date(a.start_date))
    .slice(0, 6);
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
const formatDay = (dateStr) => {
  if (!dateStr) return '';
  return new Date(dateStr).getDate();
};

const formatMonth = (dateStr) => {
  if (!dateStr) return '';
  const date = new Date(dateStr);
  return date.toLocaleDateString('ca-ES', { month: 'short' }).toUpperCase();
};

const formatTime = (dateStr) => {
  if (!dateStr) return '';
  return new Date(dateStr).toLocaleTimeString('ca-ES', { hour: '2-digit', minute: '2-digit' });
};

const formatDate = (dateStr) => {
  if (!dateStr) return 'N/A';
  const date = new Date(dateStr);
  return date.toLocaleDateString('ca-ES', { day: '2-digit', month: '2-digit', year: 'numeric' });
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
