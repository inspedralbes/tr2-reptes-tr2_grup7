<template>
  <div class="space-y-6">
    <!-- Header -->
    <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
      <h1 class="text-2xl sm:text-3xl font-bold text-gray-800">
        Gestió de Centres
      </h1>
      <button @click="openModal()" class="bg-blue-600 text-white px-4 sm:px-6 py-2 rounded-lg hover:bg-blue-700 transition-colors flex items-center justify-center gap-2 shadow-sm">
        <Plus :size="20" /> 
        <span>Nou Centre</span>
      </button>
    </div>

    <!-- Filters -->
    <div class="bg-white p-4 rounded-lg border border-gray-200 shadow-sm">
      <div class="relative">
        <Search :size="18" class="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400" />
        <input 
          v-model="searchQuery" 
          type="text" 
          placeholder="Cercar centres per nom o codi..." 
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
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Nom del Centre</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Codi</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Contacte</th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">Estat</th>
              <th class="px-6 py-4 text-right text-sm font-semibold text-gray-700">Accions</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr v-if="loading" class="animate-pulse">
              <td colspan="5" class="px-6 py-8 text-center text-gray-500">Carregant centres...</td>
            </tr>
            <tr v-else-if="filteredCentres.length === 0">
              <td colspan="5" class="px-6 py-8 text-center text-gray-500">No s'han trobat centres</td>
            </tr>
            <tr v-for="center in filteredCentres" :key="center.id_user" class="hover:bg-gray-50 transition-colors">
              <td class="px-6 py-4">
                <div class="font-medium text-gray-900">{{ center.center_name }}</div>
                <div class="text-sm text-gray-500 truncate max-w-xs">{{ center.address }}</div>
              </td>
              <td class="px-6 py-4 text-sm text-gray-800">
                {{ center.center_code }}
              </td>
              <td class="px-6 py-4 text-sm text-gray-500">
                <div>{{ center.email }}</div>
                <div>{{ center.phone }}</div>
              </td>
              <td class="px-6 py-4">
                <span :class="['px-2 py-1 rounded-full text-xs font-medium', center.is_active ? 'bg-green-100 text-green-800' : 'bg-red-100 text-red-800']">
                  {{ center.is_active ? 'Actiu' : 'Inactiu' }}
                </span>
              </td>
              <td class="px-6 py-4 text-right space-x-2">
                <button @click="openModal(center)" class="text-blue-600 hover:text-blue-800" title="Editar">
                  <Edit :size="18" />
                </button>
                <button @click="confirmDelete(center)" class="text-red-600 hover:text-red-800" title="Eliminar">
                  <Trash2 :size="18" />
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Modal Formulario -->
    <Modal :show="showModal" :title="isEditing ? 'Editar Centre' : 'Registrar Nou Centre'" @close="closeModal">
      <form id="centerForm" @submit.prevent="saveCentre" class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div class="space-y-2">
          <label class="block text-sm font-medium text-gray-700">Nom del Centre</label>
          <input v-model="form.center_name" required type="text" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
        </div>
        
        <div class="space-y-2">
          <label class="block text-sm font-medium text-gray-700">Codi Centre</label>
          <input v-model="form.center_code" required type="text" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
        </div>

        <div class="space-y-2 md:col-span-2">
          <label class="block text-sm font-medium text-gray-700">Adreça</label>
          <input v-model="form.address" type="text" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
        </div>

        <div class="space-y-2">
          <label class="block text-sm font-medium text-gray-700">Email</label>
          <input v-if="!isEditing" v-model="form.email" required type="email" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
          <input v-else v-model="form.email" disabled type="email" class="w-full border border-gray-300 rounded-lg px-4 py-2 bg-gray-100 cursor-not-allowed" title="L'email no es pot modificar aquí">
        </div>
        
        <div class="space-y-2">
          <label class="block text-sm font-medium text-gray-700">Telèfon</label>
          <input v-model="form.phone" type="text" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
        </div>

        <div v-if="!isEditing" class="space-y-2 md:col-span-2">
          <label class="block text-sm font-medium text-gray-700">Contrasenya</label>
          <input v-model="form.password" required type="password" class="w-full border border-gray-300 rounded-lg px-4 py-2 focus:ring-2 focus:ring-blue-500">
        </div>
      </form>

      <template #footer>
        <button type="button" @click="closeModal" class="px-4 py-2 text-gray-700 bg-gray-100 rounded-lg hover:bg-gray-200 transition-colors">
          Cancel·lar
        </button>
        <button type="submit" form="centerForm" class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700 flex items-center gap-2 transition-colors">
          <Save :size="18" /> {{ isEditing ? 'Actualitzar' : 'Crear' }}
        </button>
      </template>
    </Modal>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue';
import { Plus, Search, Edit, Trash2, Save } from 'lucide-vue-next';
import * as centreService from '../../../services/centreService.js';
import Modal from '../../shared/Modal.vue';
import { useAlertStore } from '../../../stores/alert';

const alertStore = useAlertStore();

const centers = ref([]);
const loading = ref(true);
const searchQuery = ref('');
const showModal = ref(false);
const isEditing = ref(false);
const editingId = ref(null);

const form = ref({
  center_name: '',
  center_code: '',
  address: '',
  phone: '',
  email: '',
  password: ''
});

const loadCenters = async () => {
  loading.value = true;
  try {
    centers.value = await centreService.getAll();
  } catch (error) {
    console.error('Error loading centers:', error);
    alertStore.addAlert('error', 'Error al carregar els centres');
  } finally {
    loading.value = false;
  }
};

const filteredCentres = computed(() => {
  return centers.value.filter(c => {
    const query = searchQuery.value.toLowerCase();
    return (
      c.center_name.toLowerCase().includes(query) ||
      c.center_code.toLowerCase().includes(query)
    );
  });
});

const openModal = (center = null) => {
  if (center) {
    isEditing.value = true;
    editingId.value = center.id_user;
    form.value = {
      center_name: center.center_name,
      center_code: center.center_code,
      address: center.address,
      phone: center.phone,
      email: center.email, // Read-only in edit
      password: '' // Not needed for edit
    };
  } else {
    isEditing.value = false;
    editingId.value = null;
    form.value = {
      center_name: '',
      center_code: '',
      address: '',
      phone: '',
      email: '',
      password: ''
    };
  }
  showModal.value = true;
};

const closeModal = () => {
  showModal.value = false;
};

const saveCentre = async () => {
  try {
    if (isEditing.value) {
      await centreService.update(editingId.value, {
        center_name: form.value.center_name,
        center_code: form.value.center_code,
        address: form.value.address,
        phone: form.value.phone
      });
      alertStore.addAlert('success', 'Centre actualitzat correctament');
    } else {
      await centreService.create(form.value);
      alertStore.addAlert('success', 'Centre creat correctament');
    }
    closeModal();
    loadCenters();
  } catch (error) {
    console.error('Error saving center:', error);
    alertStore.addAlert('error', 'Error al guardar el centre');
  }
};

const confirmDelete = async (center) => {
  if (await alertStore.confirm(`Estàs segur que vols eliminar el centre "${center.center_name}"? Aquesta acció també eliminarà l'usuari associat.`)) {
    try {
      await centreService.remove(center.id_user);
      alertStore.addAlert('success', 'Centre eliminat correctament');
      loadCenters();
    } catch (error) {
      console.error('Error deleting center:', error);
      alertStore.addAlert('error', 'Error en eliminar el centre');
    }
  }
};

onMounted(() => {
  loadCenters();
});
</script>
