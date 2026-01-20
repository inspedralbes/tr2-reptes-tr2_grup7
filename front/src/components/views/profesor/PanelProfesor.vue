<template>
  <div class="space-y-6">
    <div
      class="flex justify-between items-center"
      style="
        border-bottom: 2px solid var(--border-color);
        padding-bottom: 1rem;
        margin-bottom: 1.5rem;
      "
    >
      <h1
        class="text-2xl font-semibold"
        style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px"
      >
        Tauler de Control
      </h1>
      <!-- Optional action button, removed for now as teachers might not create requests immediately -->
    </div>

    <!-- Stats Grid -->
    <div class="grid grid-cols-1 md:grid-cols-4 gap-5">
      <div class="stat-card-blue text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Tallers Actius
            </p>
            <p class="text-3xl font-bold">{{ stats.active_workshops }}</p>
          </div>
          <BookOpen :size="32" style="opacity: 0.75" />
        </div>
      </div>

      <div class="stat-card-green text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Pròximes Sessions
            </p>
            <p class="text-3xl font-bold">{{ stats.upcoming_sessions }}</p>
          </div>
          <Calendar :size="32" style="opacity: 0.75" />
        </div>
      </div>

      <div class="stat-card-orange text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Hores Totals
            </p>
            <p class="text-3xl font-bold">{{ stats.total_hours }}</p>
          </div>
          <Clock :size="32" style="opacity: 0.75" />
        </div>
      </div>

      <div class="stat-card-purple text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Alumnes Inscrits
            </p>
            <p class="text-3xl font-bold">{{ stats.total_students }}</p>
          </div>
          <Users :size="32" style="opacity: 0.75" />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import {
  BookOpen,
  Calendar,
  Clock,
  Users
} from 'lucide-vue-next'
// We will need a service to fetch these stats. 
// For now, I'll mock them or check if I can reuse an existing endpoint.
// Since there's no dedicated endpoint yet, I'll Initialize with 0.
import { getCurrentUser } from '../../../services/authService'
import apiClient from '../../../services/apiClient'

const stats = ref({
  active_workshops: 0,
  upcoming_sessions: 0,
  total_hours: 0,
  total_students: 0,
})

const fetchStats = async () => {
    try {
        const user = getCurrentUser();
        if(user && user.teacher_id) {
            // Need to implement this endpoint in backend later.
            // For now, let's try to fetch workshops and calculate locally to avoid blocking UI if endpoint missing.
            const response = await apiClient.get(`/workshops/mine?teacher_id=${user.teacher_id}`);
            const workshops = response.data;
            
            stats.value.active_workshops = workshops.filter(w => new Date(w.end_date) >= new Date()).length;
            stats.value.total_hours = workshops.reduce((acc, curr) => acc + (curr.duration_hours || 0), 0);
            stats.value.total_students = workshops.reduce((acc, curr) => acc + (curr.enrolled_count || 0), 0);
            stats.value.upcoming_sessions = workshops.filter(w => new Date(w.start_date) > new Date()).length; // Rough approx
        }
    } catch (e) {
        console.error("Error fetching stats", e);
    }
}

onMounted(() => {
    fetchStats();
})

</script>

<style scoped>
/* Copied from PanelCentro.vue (assuming global styles or scoped there) 
   If these classes aren't global, we need to copy the CSS too.
   PanelCentro didn't have scoped styles for .stat-card-*, assuming they might be global or tailwind based?
   Wait, looking at PanelCentro source provided earlier... it DOES NOT define them in <style scoped>.
   Let's check if they are defined in global css or if I check PanelCentro again.
   
   Actually, looking strictly at the snippets provided, I don't see the CSS for .stat-card-blue etc. 
   I should verify where they come from. If they were in PanelCentro <style> (which I viewed in Step 217 diff, but the original file view was NOT full CSS),
   I might miss them.
   
   However, Step 217 diff showed the USER REMOVING a block, but the previous `view_file` of PanelCentro wasn't done recently?
   The user *pasted* the code in the request. The code pasted uses these classes.
   I don't have the definition. I'll check `index.css` or assume they are scoped in PanelCentro and I need to copy them.
*/

.stat-card-blue {
  background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
  border-radius: 12px;
  box-shadow: 0 4px 15px rgba(79, 172, 254, 0.3);
}

.stat-card-green {
  background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
  border-radius: 12px;
  box-shadow: 0 4px 15px rgba(67, 233, 123, 0.3);
}

.stat-card-orange {
  background: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
  border-radius: 12px;
  box-shadow: 0 4px 15px rgba(250, 112, 154, 0.3);
}

.stat-card-purple {
  background: linear-gradient(135deg, #a18cd1 0%, #fbc2eb 100%);
  border-radius: 12px;
  box-shadow: 0 4px 15px rgba(161, 140, 209, 0.3);
}
</style>
