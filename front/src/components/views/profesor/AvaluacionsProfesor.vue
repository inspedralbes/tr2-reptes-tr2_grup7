<template>
  <div class="space-y-6 pb-12">
    <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">
      Avaluacions
    </h1>

    <div v-if="gradingMode" class="card p-6 fade-in">
        <button @click="gradingMode = false" class="mb-4 flex items-center text-sm font-medium hover:underline" style="color: var(--text-secondary);">
          <ArrowLeft :size="16" class="mr-1" /> Tornar a la llista
        </button>
        
        <h2 class="text-xl font-bold mb-2" style="color: var(--text-primary);">Avaluant: {{ currentWorkshop?.title }}</h2>
        <p class="mb-6 text-sm" style="color: var(--text-secondary);">Assigna una nota de l'1 al 5 i un comentari per a cada alumne.</p>

        <div v-if="loadingStudents" class="text-center py-8">
          <p style="color: var(--text-secondary);">Carregant estudiants...</p>
        </div>

        <div v-else-if="students.length === 0" class="text-center py-8 bg-gray-50 rounded-lg">
          <p style="color: var(--text-secondary);">No hi ha alumnes inscrits en aquest taller.</p>
        </div>

        <div v-else class="overflow-x-auto">
          <table class="w-full text-left border-collapse">
            <thead>
              <tr style="border-bottom: 2px solid var(--border-color);">
                <th class="p-3 font-semibold" style="color: var(--text-primary);">Alumne</th>
                <th class="p-3 font-semibold" style="color: var(--text-primary);">Nota (1-5)</th>
                <th class="p-3 font-semibold" style="color: var(--text-primary);">Comentaris</th>
                <th class="p-3 font-semibold" style="color: var(--text-primary);">Acció</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="student in students" :key="student.id_student" style="border-bottom: 1px solid var(--border-color);">
                <td class="p-3">
                  <div class="font-medium" style="color: var(--text-primary);">{{ student.first_name }} {{ student.last_name }}</div>
                  <div class="text-xs" style="color: var(--text-secondary);">{{ student.email }}</div>
                </td>
                <td class="p-3">
                  <select v-model="student.grade" class="p-2 border rounded" style="background-color: var(--background); color: var(--text-primary);">
                    <option value="" disabled>Nota</option>
                    <option value="1">1 - Insuficient</option>
                    <option value="2">2 - Suficient</option>
                    <option value="3">3 - Bé</option>
                    <option value="4">4 - Notable</option>
                    <option value="5">5 - Excel·lent</option>
                  </select>
                </td>
                <td class="p-3 w-1/2">
                  <input type="text" v-model="student.comments" placeholder="Afegeix un comentari..." class="w-full p-2 border rounded" style="background-color: var(--background); color: var(--text-primary);" />
                </td>
                <td class="p-3">
                  <button @click="saveEvaluation(student)" :disabled="student.isSaving" class="btn-primary py-1 px-3 text-sm flex items-center gap-1" :class="{'opacity-50': student.isSaving}">
                    <Save :size="14" />
                    {{ student.isSaving ? 'Desant...' : 'Desar' }}
                  </button>
                  <span v-if="student.saved" class="ml-2 text-xs text-green-600 font-medium">✓ Desat</span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
    </div>

    <!-- MAIN VIEW: Workshop List -->
    <div v-else class="space-y-6">
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
              @click="manageEvaluations(workshop)"
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
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { Users, UserCheck, Clock, Star, ClipboardList, Edit, Eye, Info, ArrowLeft, Save } from 'lucide-vue-next';
import apiClient from '../../../services/apiClient';
import { getCurrentUser } from '../../../services/authService'

const router = useRouter();
const workshops = ref([]);
const loading = ref(true);
const user = ref(getCurrentUser() || {});

// Grading Mode State
const gradingMode = ref(false);
const currentWorkshop = ref(null);
const students = ref([]);
const loadingStudents = ref(false);

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

const manageEvaluations = async (workshop) => {
  currentWorkshop.value = workshop;
  gradingMode.value = true;
  loadingStudents.value = true;
  students.value = [];
  
  try {
    // Fetch students with their evaluation status
    const response = await apiClient.get(`/evaluations/workshop/${workshop.id_workshop}`);
    // Map response to handle null grades
    students.value = response.data.map(s => ({
      ...s,
      grade: s.grade || '',
      comments: s.comments || '',
      isSaving: false,
      saved: !!s.id_evaluation
    }));
  } catch (error) {
    console.error('Error fetching students:', error);
    alert('Error carregant estudiants.');
  } finally {
    loadingStudents.value = false;
  }
};

const saveEvaluation = async (student) => {
  if (!student.grade) {
    alert('Selecciona una nota abans de desar.');
    return;
  }
  
  try {
    student.isSaving = true;
    const payload = {
      id_workshop: currentWorkshop.value.id_workshop,
      id_student: student.id_student,
      grade: parseInt(student.grade),
      comments: student.comments
    };
    
    await apiClient.post('/evaluations', payload);
    
    student.saved = true;
    // Optional: could show a toast
  } catch (error) {
    console.error('Error saving evaluation:', error);
    alert('Error desant l\'avaluació.');
  } finally {
    student.isSaving = false;
  }
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
