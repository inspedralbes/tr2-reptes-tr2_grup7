<template>
  <div class="flex flex-col items-center justify-center min-h-[60vh] text-center p-6">
    <div class="bg-blue-50 p-6 rounded-full mb-6">
      <Construction :size="64" class="text-blue-600 animate-pulse" />
    </div>
    <h1 class="text-3xl font-bold text-gray-800 mb-2">Secció en construcció</h1>
    <p class="text-lg text-gray-600 max-w-md">
      Aquesta funcionalitat s'implementarà properament per oferir una millor experiència en la gestió del programa ENGINY.
    </p>
    <button @click="$router.back()" class="mt-8 btn-outline px-6 py-2">
      Torna enrere
    </button>
  </div>
</template>

<script setup>
import { Construction } from 'lucide-vue-next';
</script>
