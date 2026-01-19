<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">
        Professors Disponibles
      </h1>
      <div class="text-sm text-gray-600">
        Total: <span class="font-semibold">{{ teachers.length }}</span>
      </div>
    </div>

    <!-- Filters -->
    <div class="bg-white p-4 rounded-lg border border-gray-200 shadow-sm">
      <div class="relative">
        <Search :size="18" class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400" />
        <input 
          v-model="searchQuery" 
          type="text" 
          placeholder="Cercar professors per nom o centre..." 
          class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
        >
      </div>
    </div>

    <!-- Table -->
    <div class="bg-white rounded-lg border border-gray-200 shadow-sm overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Nom</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Email</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Centre Assignat</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Estat</th>
              <th class="px-6 py-4 text-right text-sm font-semibold text-gray-700">Accions</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr v-if="loading" class="animate-pulse">
              <td colspan="5" class="px-6 py-8 text-center text-gray-500">Carregant professors...</td>
            </tr>
            <tr v-else-if="filteredTeachers.length === 0">
              <td colspan="5" class="px-6 py-8 text-center text-gray-500">No s'han trobat professors</td>
            </tr>
            <tr v-for="teacher in filteredTeachers" :key="teacher.id_user" class="hover:bg-gray-50 transition-colors">
              <td class="px-6 py-4">
                <div class="flex items-center gap-3">
                  <div class="w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center text-blue-600 font-bold">
                    {{ teacher.first_name.charAt(0) }}
                  </div>
                  <div class="font-medium text-gray-900">{{ teacher.first_name }} {{ teacher.last_name }}</div>
                </div>
              </td>
              <td class="px-6 py-4 text-sm text-gray-500">
                {{ teacher.email }}
              </td>
              <td class="px-6 py-4 text-sm text-gray-600">
                <span v-if="teacher.center_name" class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-gray-100 text-gray-800">
                  {{ teacher.center_name }}
                </span>
                <span v-else class="text-gray-400 italic">Sense assignar</span>
              </td>
              <td class="px-6 py-4">
                <span :class="['px-2 py-1 rounded-full text-xs font-medium', teacher.is_active ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800']">
                  {{ teacher.is_active ? 'Actiu' : 'Inactiu' }}
                </span>
              </td>
              <td class="px-6 py-4 text-right space-x-2">
                <button @click="openDetailsModal(teacher)" class="text-blue-600 hover:text-blue-800" title="Veure Detalls">
                  <Eye :size="18" />
                </button>
                <button @click="openEditModal(teacher)" class="text-blue-600 hover:text-blue-800" title="Editar">
                  <Edit :size="18" />
                </button>
                <button @click="toggleTeacherStatus(teacher)" :class="teacher.is_active ? 'text-red-600 hover:text-red-800' : 'text-green-600 hover:text-green-800'" :title="teacher.is_active ? 'Desactivar' : 'Activar'">
                  <component :is="teacher.is_active ? UserX : UserCheck" :size="18" />
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Modals -->
    <TeacherDetailsModal 
      :isOpen="modals.details" 
      :teacherId="selectedTeacher?.id_user"
      @close="modals.details = false"
    />
    
    <TeacherEditModal 
      :isOpen="modals.edit" 
      :teacher="selectedTeacher"
      @close="modals.edit = false"
      @updated="handleTeacherUpdated"
    />
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { Search, Eye, Edit, UserX, UserCheck } from 'lucide-vue-next';
import { adminService } from '../../../services/adminService.js';
import TeacherDetailsModal from '../../modals/TeacherDetailsModal.vue';
import TeacherEditModal from '../../modals/TeacherEditModal.vue';
import { useAlertStore } from '../../../stores/alert';

const alertStore = useAlertStore();

const teachers = ref([]);
const loading = ref(true);
const searchQuery = ref('');
const selectedTeacher = ref(null);

const modals = ref({
  details: false,
  edit: false
});

const loadTeachers = async () => {
  loading.value = true;
  try {
    const data = await adminService.getAvailableTeachers();
    teachers.value = data;
  } catch (error) {
    console.error('Error loading teachers:', error);
    alertStore.addAlert('error', 'Error al carregar els professors');
  } finally {
    loading.value = false;
  }
};

const filteredTeachers = computed(() => {
  return teachers.value.filter(t => {
    const query = searchQuery.value.toLowerCase();
    const fullName = `${t.first_name} ${t.last_name}`.toLowerCase();
    const center = t.center_name ? t.center_name.toLowerCase() : '';
    
    return fullName.includes(query) || center.includes(query);
  });
});

const openDetailsModal = (teacher) => {
  selectedTeacher.value = teacher;
  modals.value.details = true;
};

const openEditModal = (teacher) => {
  selectedTeacher.value = teacher;
  modals.value.edit = true;
};



const toggleTeacherStatus = async (teacher) => {
  const action = teacher.is_active ? 'desactivar' : 'activar';
  if (await alertStore.confirm(`Estàs segur que vols ${action} aquest professor?`)) {
    try {
      await adminService.toggleTeacherActive(teacher.id_user);
      alertStore.addAlert('success', `Professor ${action === 'activar' ? 'activat' : 'desactivat'} correctament`);
      await loadTeachers();
    } catch (error) {
      console.error('Error toggling teacher status:', error);
      alertStore.addAlert('error', 'Error al canviar l\'estat del professor');
    }
  }
};

const handleTeacherUpdated = () => {
  alertStore.addAlert('success', 'Professor actualitzat correctament');
  loadTeachers();
};

onMounted(() => {
  loadTeachers();
});
</script>
