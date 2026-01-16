<script setup>
import { Filter, Search } from 'lucide-vue-next'
import { ref, onMounted } from 'vue'
import apiClient from '../../services/apiClient'

const workshops = ref([])
const loading = ref(true)

const fetchWorkshops = async () => {
  try {
    const response = await apiClient.get('/workshops')
    workshops.value = response.data
  } catch (error) {
    console.error('Error carregant tallers:', error)
  } finally {
    loading.value = false
  }
}

const getCategoryColor = (category) => {
  const colors = {
    'Arts escèniques': { bg: '#f3e5f5', text: '#7b1fa2' },
    'Indústria-manufactura': { bg: '#efebe9', text: '#5d4037' },
    Hostaleria: { bg: '#fff3e0', text: '#e65100' },
    'Indústria 4.0': { bg: '#e3f2fd', text: '#0d47a1' },
    Esportiu: { bg: '#e8f5e9', text: '#2e7d32' },
    default: { bg: '#f5f5f5', text: '#666' },
  }
  return colors[category] || colors.default
}

onMounted(() => {
  fetchWorkshops()
})
</script>

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
        Catàleg de Tallers
      </h1>
      <div class="flex gap-2">
        <button
          @click="toggleFilter"
          class="btn-outline px-4 py-2 flex items-center gap-2"
          :class="{ 'bg-gray-100': showFilters }"
        >
          <Filter :size="16" /> Filtrar
        </button>
        <button
          @click="toggleSearch"
          class="btn-outline px-4 py-2 flex items-center gap-2"
          :class="{ 'bg-gray-100': showSearch }"
        >
          <Search :size="16" /> Cercar
        </button>
      </div>
    </div>

    <!-- Search and Filter Inputs -->
    <div
      v-if="showSearch || showFilters"
      class="flex gap-4 p-4 bg-gray-50 rounded-lg animate-fade-in"
    >
      <div v-if="showSearch" class="flex-1">
        <label class="block text-sm font-medium text-gray-700 mb-1">Cercar per nom</label>
        <input
          v-model="searchQuery"
          type="text"
          placeholder="Escriu per cercar..."
          class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
        />
      </div>
      <div v-if="showFilters" class="flex-1">
        <label class="block text-sm font-medium text-gray-700 mb-1">Filtrar per categoria</label>
        <select
          v-model="selectedCategory"
          class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500"
        >
          <option value="">Totes les categories</option>
          <option v-for="category in uniqueCategories" :key="category" :value="category">
            {{ category }}
          </option>
        </select>
      </div>
    </div>
  </div>

  <div v-if="loading" class="text-center py-8">
    <p class="text-gray-500">Carregant tallers...</p>
  </div>

  <div v-else-if="filteredWorkshops.length === 0" class="text-center py-8">
    <p class="text-gray-500">No s'han trobat tallers amb els criteris seleccionats.</p>
  </div>

  <div v-else class="grid grid-cols-1 md:grid-cols-3 gap-5">
    <div
      v-for="workshop in filteredWorkshops"
      :key="workshop.id_workshop"
      class="card overflow-hidden flex flex-col"
      style="padding: 0 !important"
    >
      <div class="h-32 bg-gray-200" style="background-color: var(--primary)"></div>
      <div class="p-5">
        <div
          class="flex justify-between items-start mb-3"
          style="border-bottom: 1px solid var(--border-color); padding-bottom: 0.75rem"
        >
          <h3 class="text-base font-semibold" style="color: var(--text-primary)">
            {{ workshop.title }}
          </h3>
        </div>

        <div class="space-y-2 mb-4 flex-1">
          <div class="text-sm text-gray-500 mb-2">
            {{ workshop.category }}
          </div>
          <p class="text-sm text-gray-600 line-clamp-2" v-if="workshop.short_description">
            {{ workshop.short_description }}
          </p>
          <div class="flex justify-between text-sm py-1 mt-2">
            <span style="color: var(--text-secondary)">Places totals:</span>
            <span class="font-semibold" style="color: var(--text-primary)">{{
              workshop.max_slots
            }}</span>
          </div>
          <div class="flex justify-between text-sm py-1">
            <span style="color: var(--text-secondary)">Places disponibles:</span>
            <span class="font-semibold" style="color: var(--success)">
              {{ workshop.available_slots }}
            </span>
          </div>
        </div>

        <button
          @click="requestWorkshop(workshop.id_workshop)"
          class="btn-primary w-full py-2.5 mt-auto"
        >
          Sol·licitar Taller
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Filter, Search } from 'lucide-vue-next'
import { ref, onMounted, computed } from 'vue'
import { useRouter } from 'vue-router'
import * as workshopService from '../../services/workshopService'

const router = useRouter()
const workshops = ref([])
const loading = ref(true)

// Filter & Search State
const showSearch = ref(false)
const showFilters = ref(false)
const searchQuery = ref('')
const selectedCategory = ref('')

const toggleSearch = () => {
  showSearch.value = !showSearch.value
  if (!showSearch.value) searchQuery.value = ''
}

const toggleFilter = () => {
  showFilters.value = !showFilters.value
  if (!showFilters.value) selectedCategory.value = ''
}

// Computed Properties
const uniqueCategories = computed(() => {
  const categories = new Set(workshops.value.map((w) => w.category).filter(Boolean))
  return Array.from(categories)
})

const filteredWorkshops = computed(() => {
  return workshops.value.filter((workshop) => {
    // Search Filter
    const matchesSearch =
      workshop.title.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
      (workshop.short_description &&
        workshop.short_description.toLowerCase().includes(searchQuery.value.toLowerCase()))

    // Category Filter
    const matchesCategory =
      selectedCategory.value === '' || workshop.category === selectedCategory.value

    return matchesSearch && matchesCategory
  })
})

const requestWorkshop = (id) => {
  router.push({ path: '/centro/nueva-peticion', query: { workshopId: id } })
}

onMounted(async () => {
  try {
    const data = await workshopService.getAll()
    workshops.value = data
  } catch (error) {
    console.error('Error fetching workshops:', error)
  } finally {
    loading.value = false
  }
})
</script>
