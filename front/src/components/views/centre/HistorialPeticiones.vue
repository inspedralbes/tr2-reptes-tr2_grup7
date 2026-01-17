<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex justify-between items-center mb-6">
      <h1 class="text-2xl font-semibold text-gray-800 uppercase tracking-wide">
        La Meva Sol·licitud
      </h1>
      <button
        v-if="!loading && !hasCurrentApplication"
        @click="$router.push('/centro/nueva-peticion')"
        class="btn-primary px-4 py-2 text-sm"
      >
        + Nova Sol·licitud
      </button>
    </div>

    <!-- Loading State -->
    <div v-if="loading" class="text-center py-12">
      <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600 mx-auto"></div>
      <p class="mt-4 text-gray-500">Carregant la teva sol·licitud...</p>
    </div>

    <!-- Empty State -->
    <div v-else-if="!application" class="text-center py-12 bg-gray-50 rounded-lg border border-dashed border-gray-300">
      <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
      </svg>
      <h3 class="mt-2 text-sm font-medium text-gray-900">Cap sol·licitud trobada</h3>
      <p class="mt-1 text-sm text-gray-500">Encara no has creat la sol·licitud per a aquest curs.</p>
    </div>

    <!-- Detail View -->
    <div v-else class="space-y-6 animate-fade-in-up">
      
      <!-- 1. HEADER & GLOBAL INFO CARD -->
      <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
        <!-- Blue Gradient Top -->
        <div class="bg-gradient-to-r from-blue-600 to-indigo-700 px-6 py-5 text-white flex justify-between items-center">
            <div>
                 <p class="text-blue-100 text-xs font-bold uppercase tracking-wider mb-1">Curs Acadèmic</p>
                 <h2 class="text-2xl font-bold">{{ application.year_period }}</h2>
            </div>
            <div class="text-right">
                <span class="bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full text-xs font-bold border border-white/30 shadow-sm">
                    {{ getStatusLabel(application.status) }}
                </span>
                <p class="text-blue-100/80 text-[10px] mt-1">Creat el {{ formatDate(application.created_at) }}</p>
            </div>
        </div>
        
        <!-- Global Comments (Compact) -->
        <div class="px-6 py-4 bg-gray-50/50 border-b border-gray-100">
            <div class="flex items-start gap-3">
                 <div class="mt-0.5 text-gray-400">
                    <!-- FIXED ICON SIZE -->
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-5 h-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 8h10M7 12h4m1 8l-4-4H5a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v8a2 2 0 01-2 2h-3l-4 4z" />
                    </svg>
                 </div>
                 <div>
                    <h3 class="text-xs font-bold text-gray-500 uppercase tracking-wide mb-1">Comentaris Globals</h3>
                    <p class="text-sm text-gray-700 italic">
                        {{ application.global_comments || 'Sense comentaris addicionals.' }}
                    </p>
                 </div>
            </div>
        </div>
      </div>

      <!-- 2. WORKSHOPS GROUP CONTAINER -->
      <div class="bg-gray-50 rounded-xl border border-gray-200 p-5">
           <div class="flex items-center justify-between mb-4">
                <h2 class="text-lg font-bold text-gray-800 flex items-center gap-2">
                    <span class="w-2 h-6 bg-blue-600 rounded-sm"></span>
                    Tallers Sol·licitats
                </h2>
                <span class="text-xs font-bold bg-white text-gray-600 px-2 py-1 rounded border border-gray-200 shadow-sm">
                    {{ matchingRequests.length }} Tallers
                </span>
           </div>

           <div class="space-y-4"> <!-- Tighter spacing between cards -->
               
                <div v-for="(req, index) in matchingRequests" :key="req.id_request" class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden hover:shadow-md transition-shadow">
                    
                    <!-- Header Strip -->
                    <div class="px-5 py-3 border-b border-gray-100 bg-gray-50/30 flex justify-between items-center">
                        <div class="flex items-center gap-3">
                             <div class="bg-blue-100 text-blue-700 w-6 h-6 flex items-center justify-center rounded-full text-xs font-bold">
                                {{ index + 1 }}
                             </div>
                             <div>
                                 <h3 class="text-base font-bold text-gray-800 leading-none">{{ req.workshop_title }}</h3>
                                 <span class="text-[10px] font-bold text-gray-500 uppercase mt-0.5 block">
                                    {{ req.course_level }} • {{ req.workshop_category }}
                                 </span>
                             </div>
                        </div>
                    </div>

                    <!-- Body Grid -->
                    <div class="grid grid-cols-1 md:grid-cols-12 divide-y md:divide-y-0 md:divide-x divide-gray-100">
                        
                        <!-- Teacher / Comments (Col 5) -->
                        <div class="md:col-span-5 p-4 space-y-3">
                             <div>
                                <h4 class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-1">Professor Referent</h4>
                                <div class="flex items-center gap-2">
                                    <div class="w-8 h-8 rounded-full bg-indigo-50 text-indigo-600 flex items-center justify-center font-bold text-xs">
                                        {{ (req.teacher_name || 'T')[0] }}
                                    </div>
                                    <p class="text-sm font-medium text-gray-700">{{ req.teacher_name }} {{ req.teacher_surname }}</p>
                                </div>
                             </div>
                             <div class="pt-2 border-t border-dashed border-gray-100">
                                <p class="text-[10px] font-bold text-gray-400 uppercase tracking-wider mb-1">Notes</p>
                                <p class="text-xs text-gray-600 italic">"{{ req.comments || 'Sense comentaris.' }}"</p>
                             </div>
                        </div>

                        <!-- Students (Col 7) -->
                        <div class="md:col-span-7 p-4 bg-gray-50/30">
                            <div class="flex justify-between items-center mb-2">
                                <h4 class="text-[10px] font-bold text-gray-400 uppercase tracking-wider">Alumnes ({{ req.students?.length || 0 }}/4)</h4>
                            </div>
                            
                            <div class="grid grid-cols-2 gap-2">
                                <div v-for="student in req.students" :key="student.id_user" class="bg-white border border-gray-100 rounded px-2 py-1.5 flex items-center justify-between shadow-sm">
                                    <span class="text-xs font-medium text-gray-700 truncate mr-1">
                                        {{ student.first_name }} {{ student.last_name }}
                                    </span>
                                    <span :class="['w-2 h-2 rounded-full', getStudentStatusDot(student.interest_status)]" :title="getStatusLabel(student.interest_status)"></span>
                                </div>
                                <div v-if="!req.students || req.students.length === 0" class="col-span-2 text-center py-2 text-xs text-gray-400 italic border border-dashed border-gray-200 rounded">
                                    Cap alumne
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

           </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { useRouter } from 'vue-router'
import * as schoolApplicationService from '../../../services/schoolApplicationService'
import { getCurrentUser } from '../../../services/authService'

const applications = ref([]) // Keep for raw fetch
const application = ref(null) // selected/main application
const matchingRequests = ref([]) // requests for the selected app
const loading = ref(true)

// Helper to calculate academic year
const getCurrentSchoolYear = () => {
  const today = new Date();
  const month = today.getMonth(); // 0-11
  const year = today.getFullYear();
  return month >= 8 ? `${year}-${year + 1}` : `${year - 1}-${year}`;
}
const currentPeriod = getCurrentSchoolYear();

const hasCurrentApplication = computed(() => {
    return application.value && application.value.year_period === currentPeriod;
})

const formatDate = (dateString) => {
  if (!dateString) return '-'
  return new Date(dateString).toLocaleDateString('es-ES', {
    hour: '2-digit', minute: '2-digit', day: '2-digit', month: '2-digit', year: 'numeric'
  })
}

const getStatusLabel = (status) => {
  const labels = {
    ACCEPTED: 'Acceptada', REJECTED: 'Rebutjada', PENDING: 'Pendent',
    SUBMITTED: 'Enviada', PARTIAL: 'Parcial', DRAFT: 'Esborrany',
    WAITING: 'En Espera', CONFIRMED: 'Asignat', CANCELLED: 'Cancel·lat'
  }
  return labels[status] || status
}

const getStudentStatusDot = (status) => {
     switch (status) {
    case 'CONFIRMED': return 'bg-green-500'
    case 'WAITING': return 'bg-yellow-400'
    case 'CANCELLED': return 'bg-red-500'
    default: return 'bg-gray-400'
  }
}

onMounted(async () => {
  try {
    const user = getCurrentUser() || {}
    if (user.id) {
        // Fetch list
        const apps = await schoolApplicationService.getMyApplications()
        
        // Find current period app logic
        const existingApp = apps.find(app => app.year_period === currentPeriod);
        
        if (existingApp) {
             // Fetch FULL DETAILS for this app
             const fullData = await schoolApplicationService.getApplicationById(existingApp.id_application);
             application.value = fullData; // Contains basic info
             matchingRequests.value = fullData.requests || [];
        } else if (apps.length > 0) {
             // Fallback: Show the most recent one if current period doesn't exist? 
             // Or just show first. Let's show first for now.
             const fullData = await schoolApplicationService.getApplicationById(apps[0].id_application);
             application.value = fullData;
             matchingRequests.value = fullData.requests || [];
        }
    }
  } catch (error) {
    console.error('Error loading application:', error)
  } finally {
    loading.value = false
  }
})
</script>

<style scoped>
.animate-fade-in-up {
  animation: fade-in-up 0.5s ease-out;
}
@keyframes fade-in-up {
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
}
</style>
