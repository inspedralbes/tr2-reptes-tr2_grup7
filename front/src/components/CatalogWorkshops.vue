<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center" style="border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">
        <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px;">Catàleg de Tallers</h1>
        <div class="flex gap-2">
          <button class="btn-outline px-4 py-2 flex items-center gap-2">
            <Filter :size="16" /> Filtrar
          </button>
          <button class="btn-outline px-4 py-2 flex items-center gap-2">
            <Search :size="16" /> Cercar
          </button>
        </div>
      </div>

      <div class="flex gap-2">
        <button class="btn-primary px-4 py-2">
          Tots
        </button>
        <button class="px-4 py-2" style="background: var(--gray-200); color: var(--text-primary); border-radius: 3px; font-weight: 500; transition: background-color 0.2s;" onmouseover="this.style.backgroundColor='var(--gray-300)'" onmouseout="this.style.backgroundColor='var(--gray-200)'">
          Modalitat A
        </button>
        <button class="px-4 py-2" style="background: var(--gray-200); color: var(--text-primary); border-radius: 3px; font-weight: 500; transition: background-color 0.2s;" onmouseover="this.style.backgroundColor='var(--gray-300)'" onmouseout="this.style.backgroundColor='var(--gray-200)'">
          Modalitat B
        </button>
      </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-5">
      <div
        v-for="workshop in workshops"
        :key="workshop.id"
        class="card overflow-hidden" style="padding: 0 !important;"
      >
        <div class="h-32" style="background-color: var(--primary);"></div>
        <div class="p-5">
          <div class="flex justify-between items-start mb-3" style="border-bottom: 1px solid var(--border-color); padding-bottom: 0.75rem;">
            <h3 class="text-base font-semibold" style="color: var(--text-primary);">
              {{ workshop.name }}
            </h3>
            <span class="badge-info">
              Mod. {{ workshop.modality }}
            </span>
          </div>
          <div class="space-y-2 mb-4">
            <div class="flex justify-between text-sm py-1">
              <span style="color: var(--text-secondary);">Places totals:</span>
              <span class="font-semibold" style="color: var(--text-primary);">{{ workshop.places }}</span>
            </div>
            <div class="flex justify-between text-sm py-1">
              <span style="color: var(--text-secondary);">Places disponibles:</span>
              <span class="font-semibold" style="color: var(--success);">
                {{ workshop.available }}
              </span>
            </div>
          </div>
          <button class="btn-primary w-full py-2.5">
            Sol·licitar Taller
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Filter, Search } from 'lucide-vue-next';
import { ref } from 'vue';

const workshops = ref([
  {
    id: 1,
    name: "Robòtica Educativa",
    modality: "A",
    places: 25,
    available: 15,
  },
  { id: 2, name: "Arts Plàstiques", modality: "B", places: 20, available: 8 },
  {
    id: 3,
    name: "Ciències Experimentals",
    modality: "C",
    places: 30,
    available: 20,
  },
]);
</script>
