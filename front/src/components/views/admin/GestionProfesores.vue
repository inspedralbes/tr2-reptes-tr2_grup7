<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center">
      <h1 class="text-3xl font-bold text-gray-800">
        Professors Disponibles
      </h1>
      <div class="text-sm text-gray-500">
        Total: {{ teachers.length }}
      </div>
    </div>

    <!-- Filtros / Buscador -->
    <div class="bg-white p-4 rounded-lg border border-gray-200 shadow-sm flex gap-4">
      <div class="flex-1 relative">
        <Search :size="20" class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400" />
        <input 
          v-model="searchQuery" 
          type="text" 
          placeholder="Cercar professors per nom o centre..." 
          class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
        >
      </div>
    </div>

    <!-- Listado -->
    <div class="card overflow-hidden">
      <div class="overflow-auto">
        <table class="w-full">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Nom</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Email</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Centre Assignat</th>
              <th class="px-6 py-4 text-right text-sm font-semibold text-gray-700">Accions</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr v-if="loading" class="animate-pulse">
              <td colspan="4" class="px-6 py-8 text-center text-gray-500">Carregant professors...</td>
            </tr>
            <tr v-else-if="filteredTeachers.length === 0">
              <td colspan="4" class="px-6 py-8 text-center text-gray-500">No s'han trobat professors</td>
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
              <td class="px-6 py-4 text-right">
                <button class="text-blue-600 hover:text-blue-800" title="Ver detalle (Próximamente)">
                  <MoreHorizontal :size="18" />
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { Search, MoreHorizontal } from 'lucide-vue-next';
import { adminService } from '../../../services/adminService.js';

const teachers = ref([]);
const loading = ref(true);
const searchQuery = ref('');

const loadTeachers = async () => {
  loading.value = true;
  try {
    const data = await adminService.getAvailableTeachers();
    teachers.value = data;
  } catch (error) {
    console.error('Error loading teachers:', error);
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

onMounted(() => {
  loadTeachers();
});
</script>
