<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center">
      <h1 class="text-3xl font-bold text-gray-800">
        Gestió de Tallers
      </h1>
      <button @click="openModal()" class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 flex items-center gap-2">
        <Plus :size="20" /> Nou Taller
      </button>
    </div>

    <!-- Filtros / Buscador -->
    <div class="bg-white p-4 rounded-lg border border-gray-200 shadow-sm flex gap-4">
      <div class="flex-1 relative">
        <Search :size="20" class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400" />
        <input 
          v-model="searchQuery" 
          type="text" 
          placeholder="Cercar tallers per títol..." 
          class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
        >
      </div>
      <select v-model="filterStatus" class="border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
        <option value="ALL">Tots els estats</option>
        <option value="OFFERED">Oberts</option>
        <option value="FULL">Plens</option>
        <option value="PENDING">Pendents</option>
        <option value="ARCHIVED">Arxivats</option>
      </select>
    </div>

    <!-- Listado -->
    <div class="card overflow-hidden">
      <div class="overflow-auto">
        <table class="w-full">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Títol</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Categoria</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Dates</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Places</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Estat</th>
              <th class="px-6 py-4 text-right text-sm font-semibold text-gray-700">Accions</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr v-if="loading" class="animate-pulse">
              <td colspan="6" class="px-6 py-8 text-center text-gray-500">Carregant tallers...</td>
            </tr>
            <tr v-else-if="filteredWorkshops.length === 0">
              <td colspan="6" class="px-6 py-8 text-center text-gray-500">No s'han trobat tallers</td>
            </tr>
            <tr v-for="workshop in filteredWorkshops" :key="workshop.id_workshop" class="hover:bg-gray-50 transition-colors">
              <td class="px-6 py-4">
                <div class="font-medium text-gray-900">{{ workshop.title }}</div>
                <div class="text-sm text-gray-500 truncate max-w-xs">{{ workshop.short_description }}</div>
              </td>
              <td class="px-6 py-4">
                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                  {{ workshop.category || 'General' }}
                </span>
              </td>
              <td class="px-6 py-4 text-sm text-gray-500">
                <div>Inici: {{ formatDate(workshop.start_date) }}</div>
                <div>Fi: {{ formatDate(workshop.end_date) }}</div>
              </td>
              <td class="px-6 py-4 text-sm text-gray-500">
                <div>Max: {{ workshop.max_slots }}</div>
                <div v-if="workshop.available_slots !== null">Disp: {{ workshop.available_slots }}</div>
              </td>
              <td class="px-6 py-4">
                <span :class="getStatusClass(workshop.status)">
                  {{ workshop.status }}
                </span>
              </td>
              <td class="px-6 py-4 text-right space-x-2">
                <button @click="openModal(workshop)" class="text-blue-600 hover:text-blue-800" title="Editar">
                  <Edit :size="18" />
                </button>
                <button @click="confirmDelete(workshop)" class="text-red-600 hover:text-red-800" title="Eliminar">
                  <Trash2 :size="18" />
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Modal Formulario -->
    <div v-if="showModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
      <div class="bg-white rounded-xl shadow-xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
        <div class="p-6 border-b border-gray-200 flex justify-between items-center">
          <h2 class="text-xl font-bold text-gray-800">
            {{ isEditing ? 'Editar Taller' : 'Crear Nou Taller' }}
          </h2>
          <button @click="closeModal" class="text-gray-500 hover:text-gray-700">
            <X :size="24" />
          </button>
        </div>
        
        <form @submit.prevent="saveWorkshop" class="p-6 space-y-4">
          <div class="space-y-2">
            <label class="block text-sm font-medium text-gray-700">Títol</label>
            <input v-model="form.title" required type="text" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
          </div>
          
          <div class="space-y-2">
            <label class="block text-sm font-medium text-gray-700">Descripció</label>
            <textarea v-model="form.short_description" rows="3" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500"></textarea>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div class="space-y-2">
              <label class="block text-sm font-medium text-gray-700">Categoria</label>
              <input v-model="form.category" type="text" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
            </div>
            
            <div class="space-y-2">
              <label class="block text-sm font-medium text-gray-700">Places Màximes</label>
              <input v-model="form.max_slots" required type="number" min="1" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
            </div>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <div class="space-y-2">
              <label class="block text-sm font-medium text-gray-700">Data Inici</label>
              <input v-model="form.start_date" required type="datetime-local" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
            </div>
            
            <div class="space-y-2">
              <label class="block text-sm font-medium text-gray-700">Data Fi</label>
              <input v-model="form.end_date" required type="datetime-local" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
            </div>
          </div>

          <div class="space-y-2">
            <label class="block text-sm font-medium text-gray-700">Estat</label>
            <select v-model="form.status" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
              <option value="OFFERED">Obert (OFFERED)</option>
              <option value="FULL">Ple (FULL)</option>
              <option value="PENDING">Pendent (PENDING)</option>
              <option value="ARCHIVED">Arxivat (ARCHIVED)</option>
            </select>
          </div>

          <div class="flex justify-end gap-3 pt-4">
            <button type="button" @click="closeModal" class="px-4 py-2 text-gray-700 bg-gray-100 rounded-lg hover:bg-gray-200">
              Cancel·lar
            </button>
            <button type="submit" class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700 flex items-center gap-2">
              <Save :size="18" /> {{ isEditing ? 'Actualitzar' : 'Crear' }}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { Plus, Search, Edit, Trash2, X, Save } from 'lucide-vue-next';
import * as workshopService from '../../../services/workshopService.js';

const workshops = ref([]);
const loading = ref(true);
const searchQuery = ref('');
const filterStatus = ref('ALL');
const showModal = ref(false);
const isEditing = ref(false);
const editingId = ref(null);

const form = ref({
  title: '',
  short_description: '',
  category: '',
  max_slots: 16,
  start_date: '',
  end_date: '',
  status: 'OFFERED'
});

const loadWorkshops = async () => {
  loading.value = true;
  try {
    workshops.value = await workshopService.getAll();
  } catch (error) {
    console.error('Error loading workshops:', error);
    alert('Error al carregar els tallers');
  } finally {
    loading.value = false;
  }
};

const filteredWorkshops = computed(() => {
  return workshops.value.filter(w => {
    const matchesSearch = w.title.toLowerCase().includes(searchQuery.value.toLowerCase());
    const matchesStatus = filterStatus.value === 'ALL' || w.status === filterStatus.value;
    return matchesSearch && matchesStatus;
  });
});

const formatDate = (dateString) => {
  if (!dateString) return '-';
  return new Date(dateString).toLocaleString('ca-ES', { 
    year: 'numeric', month: '2-digit', day: '2-digit', 
    hour: '2-digit', minute: '2-digit' 
  });
};

const formatDateTimeLocal = (dateString) => {
  if (!dateString) return '';
  const date = new Date(dateString);
  // Adjust to local ISO string equivalent for input[type="datetime-local"]
  const offset = date.getTimezoneOffset() * 60000;
  return new Date(date.getTime() - offset).toISOString().slice(0, 16);
};

const getStatusClass = (status) => {
  const classes = 'px-2 py-1 rounded-full text-xs font-medium';
  switch (status) {
    case 'OFFERED': return `${classes} bg-green-100 text-green-800`;
    case 'FULL': return `${classes} bg-red-100 text-red-800`;
    case 'PENDING': return `${classes} bg-yellow-100 text-yellow-800`;
    case 'ARCHIVED': return `${classes} bg-gray-100 text-gray-800`;
    default: return `${classes} bg-gray-100 text-gray-800`;
  }
};

const openModal = (workshop = null) => {
  if (workshop) {
    isEditing.value = true;
    editingId.value = workshop.id_workshop;
    form.value = {
      title: workshop.title,
      short_description: workshop.short_description,
      category: workshop.category,
      max_slots: workshop.max_slots,
      start_date: formatDateTimeLocal(workshop.start_date),
      end_date: formatDateTimeLocal(workshop.end_date),
      status: workshop.status
    };
  } else {
    isEditing.value = false;
    editingId.value = null;
    form.value = {
      title: '',
      short_description: '',
      category: '',
      max_slots: 16,
      start_date: '',
      end_date: '',
      status: 'OFFERED'
    };
  }
  showModal.value = true;
};

const closeModal = () => {
  showModal.value = false;
};

const saveWorkshop = async () => {
  try {
    if (isEditing.value) {
      await workshopService.update(editingId.value, form.value);
      alert('Taller actualitzat correctament');
    } else {
      await workshopService.create(form.value);
      alert('Taller creat correctament');
    }
    closeModal();
    loadWorkshops();
  } catch (error) {
    console.error('Error saving workshop:', error);
    alert('Error al guardar el taller');
  }
};

const confirmDelete = async (workshop) => {
  if (confirm(`Estàs segur que vols eliminar el taller "${workshop.title}"?`)) {
    try {
      await workshopService.remove(workshop.id_workshop);
      alert('Taller eliminat correctament');
      loadWorkshops();
    } catch (error) {
      console.error('Error deleting workshop:', error);
      alert('Error en eliminar el taller');
    }
  }
};

onMounted(() => {
  loadWorkshops();
});
</script>
