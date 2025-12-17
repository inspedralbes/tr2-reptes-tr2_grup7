<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center">
      <h1 class="text-3xl font-bold text-gray-800">
        Bandeja de Peticions
      </h1>
      <button class="bg-green-600 text-white px-6 py-2 rounded-lg hover:bg-green-700 flex items-center gap-2">
        <Settings :size="20" /> Assignació Automàtica
      </button>
    </div>

    <div class="card overflow-hidden">
      <div class="overflow-x-auto">
        <table class="w-full">
          <thead class="bg-gray-50 border-b border-gray-200">
            <tr>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Centre
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Taller
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Alumnes
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Data
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Estat
              </th>
              <th class="px-6 py-4 text-left text-sm font-semibold text-gray-700">
                Accions
              </th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <tr
              v-for="req in requests"
              :key="req.id"
              class="hover:bg-gray-50"
            >
              <td class="px-6 py-4 text-sm text-gray-800">
                {{ req.centre }}
              </td>
              <td class="px-6 py-4 text-sm text-gray-800">
                {{ req.workshop }}
              </td>
              <td class="px-6 py-4 text-sm text-gray-800">
                {{ req.students }}
              </td>
              <td class="px-6 py-4 text-sm text-gray-600">
                {{ req.date }}
              </td>
              <td class="px-6 py-4">
                <span
                  :class="[
                    'px-3 py-1 rounded-full text-xs font-medium',
                    req.status === 'Assignada'
                      ? 'bg-green-100 text-green-700'
                      : 'bg-orange-100 text-orange-700'
                  ]"
                >
                  {{ req.status }}
                </span>
              </td>
              <td class="px-6 py-4">
                <div class="flex gap-2">
                  <button
                    class="p-2 hover:bg-blue-50 rounded-lg"
                    title="Veure"
                  >
                    <Eye :size="18" class="text-blue-600" />
                  </button>
                  <button
                    class="p-2 hover:bg-green-50 rounded-lg"
                    title="Assignar"
                  >
                    <CheckCircle :size="18" class="text-green-600" />
                  </button>
                  <button
                    class="p-2 hover:bg-red-50 rounded-lg"
                    title="Eliminar"
                  >
                    <Trash2 :size="18" class="text-red-600" />
                  </button>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script setup>
import { Settings, Eye, CheckCircle, Trash2 } from 'lucide-vue-next';
import { ref } from 'vue';

const requests = ref([
  {
    id: 1,
    centre: "IES Terrassa",
    workshop: "Robòtica",
    students: 22,
    status: "Pendent",
    date: "15/12/2025",
  },
  {
    id: 2,
    centre: "Col·legi Sant Jordi",
    workshop: "Arts",
    students: 18,
    status: "Assignada",
    date: "14/12/2025",
  },
  {
    id: 3,
    centre: "Escola Montserrat",
    workshop: "Ciències",
    students: 25,
    status: "Pendent",
    date: "16/12/2025",
  },
]);
</script>
