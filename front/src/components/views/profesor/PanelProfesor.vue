<template>
  <div class="space-y-6">
    <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">Els Meus Tallers</h1>

    <!-- Loading State -->
    <div v-if="workshopStore.loading" class="text-center py-8">
      <span class="text-lg">Carregant tallers...</span>
    </div>

    <!-- Error State -->
    <div v-else-if="workshopStore.error" class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative">
      {{ workshopStore.error }}
    </div>

    <!-- Empty State -->
    <div v-else-if="workshopStore.workshops.length === 0" class="text-center py-8 text-gray-500">
      No tens tallers assignats actualment.
    </div>

    <!-- Content -->
    <div v-else class="grid grid-cols-1 md:grid-cols-3 gap-5">
      <div v-for="workshop in workshopStore.workshops" :key="workshop.id_workshop" class="card p-5">
        <div class="flex items-center justify-between mb-3" style="border-bottom: 1px solid var(--border-color); padding-bottom: 0.75rem;">
          <div :style="{ backgroundColor: getCategoryColor(workshop.category).bg, padding: '0.5rem', borderRadius: '3px' }">
            <BookOpen :style="{ color: getCategoryColor(workshop.category).text }" :size="22" />
          </div>
          <span :class="getStatusClass(workshop.status)">
            {{ formatStatus(workshop.status) }}
          </span>
        </div>
        <h3 class="text-base font-semibold mb-2" style="color: var(--text-primary);">
          {{ workshop.title }}
        </h3>
        <p class="text-sm mb-4" style="color: var(--text-secondary);">
           {{ workshop.center_name || 'Centre desconegut' }} - {{ workshop.duration_hours }}h
        </p>
        <div class="space-y-2 text-sm" style="margin-bottom: 1rem;">
          <div class="flex justify-between py-1">
            <span style="color: var(--text-secondary);">Categoria:</span>
            <span class="font-semibold" style="color: var(--text-primary);">{{ workshop.category }}</span>
          </div>
          <div class="flex justify-between py-1">
            <span style="color: var(--text-secondary);">Alumnes inscrits:</span>
            <span class="font-semibold" style="color: var(--text-primary);">{{ workshop.enrolled_count || 0 }}</span>
          </div>
          <div class="flex justify-between py-1">
            <span style="color: var(--text-secondary);">Horari:</span>
            <span class="font-semibold" style="color: var(--text-primary);">{{ workshop.schedule || 'Per definir' }}</span>
          </div>
        </div>
        <button class="w-full mt-3 btn-primary py-2" :style="workshop.bgStyle">
          Veure Detalls
        </button>
      </div>
    </div>

    <!-- Upcoming Sessions (Dynamic) -->
    <div v-if="upcomingSessions.length > 0" class="card p-6">
      <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
        Pròximes Sessions
      </h2>
      <div class="space-y-3">
        <div v-for="session in upcomingSessions" :key="session.id_workshop" class="flex items-center gap-4 p-4" :style="{ backgroundColor: getCategoryColor(session.category).bg, borderLeft: '4px solid ' + getCategoryColor(session.category).text }">
          <Calendar :style="{ color: getCategoryColor(session.category).text }" :size="24" />
          <div class="flex-1">
            <p class="font-semibold" style="color: var(--text-primary); margin-bottom: 0.25rem;">
              {{ session.title }} - {{ session.center_name || 'Centre' }}
            </p>
            <p class="text-sm" style="color: var(--text-secondary);">
              {{ formatSessionDate(session.start_date) }}
            </p>
          </div>
          <button :style="{ color: getCategoryColor(session.category).text }">
            <ChevronRight :size="20" />
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { onMounted, computed } from 'vue';
import { BookOpen, Calendar, ChevronRight } from 'lucide-vue-next';
import { useAuthStore } from '@/stores/auth';
import { useWorkshopStore } from '@/stores/workshop';

const authStore = useAuthStore();
const workshopStore = useWorkshopStore();

onMounted(async () => {
    // Simulate login if needed (since we skipped login view)
    if (!authStore.isAuthenticated) {
        authStore.devLogin();
    }
    
    // Fetch data
    await workshopStore.fetchMyWorkshops();
});

// Computed: Upcoming Sessions
// Filters workshops that have a start_date in the future (or today)
// Since we don't have separate sessions table, we treat the workshop start as the next session.
const upcomingSessions = computed(() => {
    if (!workshopStore.workshops) return [];
    
    const now = new Date();
    return workshopStore.workshops
        .filter(w => w.start_date && new Date(w.start_date) > now)
        .sort((a, b) => new Date(a.start_date) - new Date(b.start_date))
        .slice(0, 3); // Show top 3
});

const formatSessionDate = (dateString) => {
    if (!dateString) return '';
    const date = new Date(dateString);
    // Format: "Dimarts, 17 de desembre a les 10:00h"
    return new Intl.DateTimeFormat('ca-ES', {
        weekday: 'long',
        day: 'numeric',
        month: 'long',
        hour: '2-digit',
        minute: '2-digit'
    }).format(date) + 'h';
};

// Helper functions for styling
const getCategoryColor = (category) => {
    // Simple mock logic for colors
    const map = {
        'TEC': { bg: '#e3f2fd', text: 'var(--primary)' },
        'SCI': { bg: '#f3e5f5', text: '#7b1fa2' },
        'ART': { bg: '#fff3e0', text: 'var(--secondary)' }
    };
    // Default to blue if unknown
    return map[category] || map['TEC'];
};

const getStatusClass = (status) => {
    return status === 'ACTIVE' ? 'badge-success' : 'badge-gray';
};

const formatStatus = (status) => {
    const map = {
        'ACTIVE': 'Actiu',
        'FINISHED': 'Finalitzat',
        'PENDING': 'Pendent',
        'OFFERED': 'Ofert'
    };
    return map[status] || status;
};
</script>
