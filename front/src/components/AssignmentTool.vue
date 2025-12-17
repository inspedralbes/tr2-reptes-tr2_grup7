<template>
  <div class="space-y-6">
    <h1 class="text-3xl font-bold text-gray-800">Eina d'Assignació</h1>

    <div class="card p-6">
      <h2 class="text-xl font-semibold text-gray-800 mb-4">
        Assignació Manual
      </h2>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Petició
          </label>
          <select class="w-full border border-gray-300 rounded-lg px-4 py-2">
            <option>IES Terrassa - Robòtica (22 alumnes)</option>
            <option>Col·legi Sant Jordi - Arts (18 alumnes)</option>
          </select>
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Places Assignades
          </label>
          <input
            type="number"
            class="w-full border border-gray-300 rounded-lg px-4 py-2"
            placeholder="22"
          />
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Professor Referent 1
          </label>
          <select class="w-full border border-gray-300 rounded-lg px-4 py-2">
            <option>Selecciona professor...</option>
            <option>Maria García</option>
            <option>Joan Martínez</option>
          </select>
        </div>

        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">
            Professor Referent 2
          </label>
          <select class="w-full border border-gray-300 rounded-lg px-4 py-2">
            <option>Selecciona professor...</option>
            <option>Laura Sánchez</option>
            <option>Pere López</option>
          </select>
        </div>
      </div>

      <div class="mt-6">
        <label class="block text-sm font-medium text-gray-700 mb-2">
          Observacions
        </label>
        <textarea
          class="w-full border border-gray-300 rounded-lg px-4 py-2"
          rows="3"
          placeholder="Notes sobre l'assignació..."
        ></textarea>
      </div>

      <div class="flex gap-4 mt-6">
        <button class="bg-green-600 text-white px-6 py-2 rounded-lg hover:bg-green-700 flex items-center gap-2">
          <CheckCircle :size="20" /> Confirmar Assignació
        </button>
        <button class="bg-blue-600 text-white px-6 py-2 rounded-lg hover:bg-blue-700 flex items-center gap-2">
          <Send :size="20" /> Enviar Notificació
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { CheckCircle, Send } from 'lucide-vue-next';
</script>
