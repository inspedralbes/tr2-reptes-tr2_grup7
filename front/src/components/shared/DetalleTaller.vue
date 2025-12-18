<template>
  <div class="space-y-6">
    <div class="flex items-center gap-4">
      <button
        @click="$emit('back')"
        class="text-gray-600 hover:text-gray-800"
      >
        &larr; Tornar
      </button>
      <h1 class="text-3xl font-bold text-gray-800">Robòtica Educativa</h1>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <div class="md:col-span-2 space-y-6">
        <div class="card p-6">
          <h2 class="text-xl font-semibold text-gray-800 mb-4">
            Informació del Taller
          </h2>
          <div class="grid grid-cols-2 gap-4">
            <div>
              <p class="text-sm text-gray-600">Centre Educatiu</p>
              <p class="font-medium">IES Terrassa</p>
            </div>
            <div>
              <p class="text-sm text-gray-600">Curs</p>
              <p class="font-medium">3r ESO</p>
            </div>
            <div>
              <p class="text-sm text-gray-600">Nombre d'alumnes</p>
              <p class="font-medium">22</p>
            </div>
            <div>
              <p class="text-sm text-gray-600">Data inici</p>
              <p class="font-medium">15/01/2026</p>
            </div>
            <div>
              <p class="text-sm text-gray-600">Sessions</p>
              <p class="font-medium">8 sessions</p>
            </div>
          </div>
        </div>

        <div class="card p-6">
          <h2 class="text-xl font-semibold text-gray-800 mb-4">
            Calendari de Sessions
          </h2>
          <div class="space-y-2">
            <div class="flex items-center justify-between p-3 bg-green-50 rounded-lg border border-green-200">
              <div class="flex items-center gap-3">
                <CheckCircle class="text-green-600" :size="20" />
                <div>
                  <p class="font-medium text-gray-800">
                    Sessió 1 - Introducció
                  </p>
                  <p class="text-sm text-gray-600">15/01/2026 - 10:00h</p>
                </div>
              </div>
              <span class="text-green-600 text-sm font-medium">
                Completada
              </span>
            </div>
            <div class="flex items-center justify-between p-3 bg-blue-50 rounded-lg border border-blue-200">
              <div class="flex items-center gap-3">
                <Clock class="text-blue-600" :size="20" />
                <div>
                  <p class="font-medium text-gray-800">
                    Sessió 2 - Conceptes bàsics
                  </p>
                  <p class="text-sm text-gray-600">17/12/2025 - 10:00h</p>
                </div>
              </div>
              <span class="text-blue-600 text-sm font-medium">
                Propera
              </span>
            </div>
            <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg border border-gray-200">
              <div class="flex items-center gap-3">
                <Calendar class="text-gray-400" :size="20" />
                <div>
                  <p class="font-medium text-gray-800">
                    Sessió 3 - Programació I
                  </p>
                  <p class="text-sm text-gray-600">22/01/2026 - 10:00h</p>
                </div>
              </div>
              <span class="text-gray-500 text-sm font-medium">
                Pendent
              </span>
            </div>
          </div>
        </div>
      </div>

      <div class="space-y-6">
        <div class="card p-6">
          <h2 class="text-xl font-semibold text-gray-800 mb-4">
            Contacte
          </h2>
          <div class="space-y-3">
            <div>
              <p class="text-sm text-gray-600">Professor co-referent</p>
              <p class="font-medium">Pere López</p>
              <p class="text-sm text-blue-600">pere.lopez@edu.cat</p>
            </div>
            <div>
              <p class="text-sm text-gray-600">Contacte centre</p>
              <p class="font-medium">Anna Ferrer</p>
              <p class="text-sm text-blue-600">
                anna.ferrer@ies-terrassa.cat
              </p>
            </div>
          </div>
          <button class="w-full mt-4 bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700">
            Enviar Missatge
          </button>
        </div>

        <div class="card p-6">
          <h2 class="text-xl font-semibold text-gray-800 mb-4">
            Materials
          </h2>
          <div class="space-y-2">
            <button class="w-full flex items-center justify-between p-3 bg-gray-50 rounded-lg hover:bg-gray-100">
              <div class="flex items-center gap-3">
                <FileText class="text-gray-600" :size="20" />
                <span class="text-sm">Guia del taller</span>
              </div>
              <Download :size="18" class="text-gray-600" />
            </button>
            <button class="w-full flex items-center justify-between p-3 bg-gray-50 rounded-lg hover:bg-gray-100">
              <div class="flex items-center gap-3">
                <FileText class="text-gray-600" :size="20" />
                <span class="text-sm">Fitxes activitats</span>
              </div>
              <Download :size="18" class="text-gray-600" />
            </button>
          </div>
        </div>

        <button class="w-full bg-green-600 text-white py-3 rounded-lg hover:bg-green-700 flex items-center justify-center gap-2">
          <Award :size="20" /> Avaluar Sessió
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import {
  CheckCircle,
  Clock,
  Calendar,
  FileText,
  Download,
  Award
} from 'lucide-vue-next';

defineEmits(['back']);
</script>
