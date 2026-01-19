<template>
  <div class="space-y-6">
    <div class="space-y-4 mb-6">
      <div
        class="flex justify-between items-center"
        style="
          border-bottom: 2px solid var(--border-color);
          padding-bottom: 1rem;
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

    <div v-else class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div v-for="workshop in filteredWorkshops" :key="workshop.id_workshop" class="card p-6">
        <h2
          class="text-lg font-semibold mb-4"
          style="
            color: var(--text-primary);
            padding-bottom: 0.75rem;
            border-bottom: 1px solid var(--border-color);
          "
        >
          {{ workshop.title }}
        </h2>
        <div class="space-y-2">
          <div
            class="flex justify-between py-2.5"
            style="border-bottom: 1px solid var(--border-color)"
          >
            <span style="color: var(--text-secondary); font-size: 0.9rem">Categoria:</span>
            <span class="font-semibold" style="color: var(--text-primary)">{{ workshop.category }}</span>
          </div>

          <div
             class="py-2.5"
             style="border-bottom: 1px solid var(--border-color)"
             v-if="workshop.short_description"
          >
             <p class="text-sm text-gray-600 italic">"{{ workshop.short_description }}"</p>
          </div>

          <div
            class="flex justify-between py-2.5"
            style="border-bottom: 1px solid var(--border-color)"
          >
            <span style="color: var(--text-secondary); font-size: 0.9rem">Durada:</span>
            <span class="font-semibold" style="color: var(--text-primary)">
               {{ workshop.duration_hours || 30 }} hores
            </span>
          </div>
          
           <div
            class="flex justify-between py-2.5"
            style="border-bottom: 1px solid var(--border-color)"
          >
            <span style="color: var(--text-secondary); font-size: 0.9rem">Horari:</span>
            <span class="font-semibold" style="color: var(--text-primary)">Dijous (3h/setmana)</span>
          </div>

          <div
            class="flex justify-between py-2.5"
            style="border-bottom: 1px solid var(--border-color)"
          >
            <span style="color: var(--text-secondary); font-size: 0.9rem">Places Disponibles:</span>
            <span class="font-semibold" :class="workshop.available_slots > 0 ? 'text-green-600' : 'text-red-500'">
                {{ workshop.available_slots }} / {{ workshop.max_slots }}
            </span>
          </div>

          <div class="pt-4">
               <button
                  @click="requestWorkshop(workshop.id_workshop)"
                  class="btn-primary w-full py-2.5 flex justify-center items-center gap-2"
                  :disabled="workshop.available_slots === 0"
                  :class="{'opacity-50 cursor-not-allowed': workshop.available_slots === 0}"
                >
                  {{ workshop.available_slots === 0 ? 'Complet' : 'Solicitar Taller' }}
                </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Filter, Search, Clock, MapPin } from 'lucide-vue-next'
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
