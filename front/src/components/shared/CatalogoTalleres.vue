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
        <button class="btn-outline px-4 py-2 flex items-center gap-2">
          <Filter :size="16" /> Filtrar
        </button>
        <button class="btn-outline px-4 py-2 flex items-center gap-2">
          <Search :size="16" /> Cercar
        </button>
      </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-5">
      <div
        v-for="workshop in workshops"
        :key="workshop.id_workshop"
        class="card overflow-hidden flex flex-col"
        style="padding: 0 !important"
      >
        <div class="h-32" style="background-color: var(--primary)"></div>
        <div class="p-5 flex-1">
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
              <span class="font-semibold" style="color: var(--sucasss)">
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
  </div>
</template>

<script setup>
import { Filter, Search } from 'lucide-vue-next'
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import * as workshopService from '../../services/workshopService'

const router = useRouter()
const workshops = ref([])
const loading = ref(true)

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
