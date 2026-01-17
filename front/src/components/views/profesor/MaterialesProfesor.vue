<template>
  <div class="space-y-6 pb-12">
    <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">
      Materials del Taller
    </h1>

    <div v-if="loading" class="text-center py-10">
      <p style="color: var(--text-secondary);">Carregant materials...</p>
    </div>

    <div v-else-if="workshops.length === 0" class="text-center py-10 card">
      <p style="color: var(--text-secondary);">No tens cap taller assignat amb materials.</p>
    </div>

    <div v-else class="space-y-6">
      <div v-for="workshop in workshops" :key="workshop.id_workshop" class="card p-6">
        <div class="flex items-center justify-between mb-4" style="border-bottom: 2px solid var(--border-color); padding-bottom: 1rem;">
          <div>
            <h2 class="text-xl font-semibold" style="color: var(--text-primary);">
              {{ workshop.title }}
            </h2>
            <p class="text-sm mt-1" style="color: var(--text-secondary);">
              {{ workshop.category }} - {{ workshop.duration_hours }}h
            </p>
          </div>
          <span :class="getStatusBadgeClass(workshop.status)">
            {{ getStatusLabel(workshop.status) }}
          </span>
        </div>

        <!-- Materials Section -->
        <div class="mt-4">
          <h3 class="text-lg font-semibold mb-3" style="color: var(--text-primary);">
            <FileText :size="20" class="inline mr-2" style="color: var(--primary);" />
            Materials del Taller
          </h3>
          
          <div class="space-y-2">
            <!-- Material didáctico -->
            <div class="flex items-center p-3" style="background-color: var(--card-background); border-left: 3px solid var(--primary);">
              <BookOpen :size="18" class="mr-3" style="color: var(--primary);" />
              <div class="flex-1">
                <p class="font-medium" style="color: var(--text-primary);">Material didàctic del taller</p>
                <p class="text-sm" style="color: var(--text-secondary);">Guia completa per al desenvolupament del taller</p>
              </div>
              <button class="btn-outline py-1 px-3 text-sm">
                Descarregar
              </button>
            </div>

            <!-- Recursos educatius -->
            <div class="flex items-center p-3" style="background-color: var(--card-background); border-left: 3px solid var(--secondary);">
              <Download :size="18" class="mr-3" style="color: var(--secondary);" />
              <div class="flex-1">
                <p class="font-medium" style="color: var(--text-primary);">Recursos educatius</p>
                <p class="text-sm" style="color: var(--text-secondary);">Fitxes i activitats complementàries</p>
              </div>
              <button class="btn-outline py-1 px-3 text-sm">
                Descarregar
              </button>
            </div>

            <!-- Presentació -->
            <div class="flex items-center p-3" style="background-color: var(--card-background); border-left: 3px solid var(--warning);">
              <Monitor :size="18" class="mr-3" style="color: var(--warning);" />
              <div class="flex-1">
                <p class="font-medium" style="color: var(--text-primary);">Presentació del taller</p>
                <p class="text-sm" style="color: var(--text-secondary);">Suport visual per a les sessions</p>
              </div>
              <button class="btn-outline py-1 px-3 text-sm">
                Veure
              </button>
            </div>
          </div>
        </div>

        <!-- Links útils -->
        <div class="mt-6 p-4" style="background-color: var(--background); border-radius: 8px;">
          <h4 class="text-sm font-semibold mb-2" style="color: var(--text-primary);">
            <Link :size="16" class="inline mr-2" />
            Enllaços d'interès
          </h4>
          <ul class="space-y-1 text-sm" style="color: var(--text-secondary);">
            <li>• Portal de recursos pedagògics</li>
            <li>• Plataforma d'activitats</li>
            <li>• Biblioteca de materials</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { FileText, BookOpen, Download, Monitor, Link } from 'lucide-vue-next';
import apiClient from '../../../services/apiClient';

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

onMounted(() => {
  fetchWorkshops();
});

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
</script>
