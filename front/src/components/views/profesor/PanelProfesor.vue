<template>
  <div class="space-y-6">
    <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">Els Meus Tallers</h1>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-5">
      <div class="card p-5">
        <div class="flex items-center justify-between mb-3" style="border-bottom: 1px solid var(--border-color); padding-bottom: 0.75rem;">
          <div style="background-color: #e3f2fd; padding: 0.5rem; border-radius: 3px;">
            <BookOpen style="color: var(--primary);" :size="22" />
          </div>
          <span class="badge-success">
            Actiu
          </span>
        </div>
        <h3 class="text-base font-semibold mb-2" style="color: var(--text-primary);">
          Robòtica Educativa
        </h3>
        <p class="text-sm mb-4" style="color: var(--text-secondary);">IES Terrassa - 3r ESO</p>
        <div class="space-y-2 text-sm" style="margin-bottom: 1rem;">
          <div class="flex justify-between py-1">
            <span style="color: var(--text-secondary);">Alumnes:</span>
            <span class="font-semibold" style="color: var(--text-primary);">22</span>
          </div>
          <div class="flex justify-between py-1">
            <span style="color: var(--text-secondary);">Data inici:</span>
            <span class="font-semibold" style="color: var(--text-primary);">15/01/2026</span>
          </div>
        </div>
        <button class="w-full mt-3 btn-primary py-2">
          Veure Detalls
        </button>
      </div>

      <div class="card p-5">
        <div class="flex items-center justify-between mb-3" style="border-bottom: 1px solid var(--border-color); padding-bottom: 0.75rem;">
          <div style="background-color: #f3e5f5; padding: 0.5rem; border-radius: 3px;">
            <BookOpen style="color: #7b1fa2;" :size="22" />
          </div>
          <span class="badge-success">
            Actiu
          </span>
        </div>
        <h3 class="text-base font-semibold mb-2" style="color: var(--text-primary);">
          Ciències Experimentals
        </h3>
        <p class="text-sm mb-4" style="color: var(--text-secondary);">
          Escola Montserrat - 4t ESO
        </p>
        <div class="space-y-2 text-sm" style="margin-bottom: 1rem;">
          <div class="flex justify-between py-1">
            <span style="color: var(--text-secondary);">Alumnes:</span>
            <span class="font-semibold" style="color: var(--text-primary);">25</span>
          </div>
          <div class="flex justify-between py-1">
            <span style="color: var(--text-secondary);">Data inici:</span>
            <span class="font-semibold" style="color: var(--text-primary);">20/01/2026</span>
          </div>
        </div>
        <button class="w-full mt-3 btn-primary py-2" style="background-color: #7b1fa2 !important;">
          Veure Detalls
        </button>
      </div>

      <div class="card p-5">
        <div class="flex items-center justify-between mb-3" style="border-bottom: 1px solid var(--border-color); padding-bottom: 0.75rem;">
          <div style="background-color: #fff3e0; padding: 0.5rem; border-radius: 3px;">
            <BookOpen style="color: var(--secondary);" :size="22" />
          </div>
          <span style="background-color: var(--gray-200); color: var(--text-secondary); font-weight: 600; padding: 0.25rem 0.75rem; border-radius: 3px; font-size: 0.8125rem; text-transform: uppercase; letter-spacing: 0.5px;">
            Finalitzat
          </span>
        </div>
        <h3 class="text-base font-semibold mb-2" style="color: var(--text-primary);">
          Arts Plàstiques
        </h3>
        <p class="text-sm mb-4" style="color: var(--text-secondary);">
          Col·legi Sant Jordi - 2n ESO
        </p>
        <div class="space-y-2 text-sm" style="margin-bottom: 1rem;">
          <div class="flex justify-between py-1">
            <span style="color: var(--text-secondary);">Alumnes:</span>
            <span class="font-semibold" style="color: var(--text-primary);">18</span>
          </div>
          <div class="flex justify-between py-1">
            <span style="color: var(--text-secondary);">Data fi:</span>
            <span class="font-semibold" style="color: var(--text-primary);">10/12/2025</span>
          </div>
        </div>
        <button class="w-full mt-3 btn-outline py-2">
          Veure Historial
        </button>
      </div>
    </div>

    <div class="card p-6">
      <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
        Pròximes Sessions
      </h2>
      <div class="space-y-3">
        <div class="flex items-center gap-4 p-4" style="background-color: #e3f2fd; border-left: 4px solid var(--primary);">
          <Calendar style="color: var(--primary);" :size="24" />
          <div class="flex-1">
            <p class="font-semibold" style="color: var(--text-primary); margin-bottom: 0.25rem;">
              Robòtica Educativa - IES Terrassa
            </p>
            <p class="text-sm" style="color: var(--text-secondary);">
              Dimarts, 17 de desembre a les 10:00h
            </p>
          </div>
          <button style="color: var(--primary);">
            <ChevronRight :size="20" />
          </button>
        </div>
        <div class="flex items-center gap-4 p-4" style="background-color: #f3e5f5; border-left: 4px solid #7b1fa2;">
          <Calendar style="color: #7b1fa2;" :size="24" />
          <div class="flex-1">
            <p class="font-semibold" style="color: var(--text-primary); margin-bottom: 0.25rem;">
              Ciències Experimentals - Escola Montserrat
            </p>
            <p class="text-sm" style="color: var(--text-secondary);">
              Dijous, 19 de desembre a les 15:30h
            </p>
          </div>
          <button style="color: #7b1fa2;">
            <ChevronRight :size="20" />
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { BookOpen, Calendar, ChevronRight } from 'lucide-vue-next';
</script>
