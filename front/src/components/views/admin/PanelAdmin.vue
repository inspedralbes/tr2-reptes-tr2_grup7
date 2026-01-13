<template>
  <div class="space-y-6 pb-12">
    <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">
      Tauler d'Administració
    </h1>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-5">
      <div class="stat-card-blue text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Total de peticions</p>
            <p class="text-3xl font-bold">24</p>
          </div>
          <FileText :size="32" style="opacity: 0.75;" />
        </div>
      </div>

      <div class="stat-card-green text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Assignades</p>
            <p class="text-3xl font-bold">18</p>
          </div>
          <CheckCircle :size="32" style="opacity: 0.75;" />
        </div>
      </div>

      <div class="stat-card-orange text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Pendents</p>
            <p class="text-3xl font-bold">6</p>
          </div>
          <Clock :size="32" style="opacity: 0.75;" />
        </div>
      </div>

      <div class="stat-card-purple text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Centres actius</p>
            <p class="text-3xl font-bold">12</p>
          </div>
          <Users :size="32" style="opacity: 0.75;" />
        </div>
      </div>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
      <div class="card p-6">
        <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
          Peticions per estat
        </h2>
        <div class="space-y-3">
          <div class="flex items-center justify-between p-3" style="background-color: #e8f5e9; border-left: 4px solid var(--success);">
            <span style="color: var(--text-primary); font-weight: 500;">Assignades</span>
            <span class="font-bold" style="color: var(--success); font-size: 1.25rem;">75%</span>
          </div>
          <div class="flex items-center justify-between p-3" style="background-color: #fff3e0; border-left: 4px solid var(--warning);">
            <span style="color: var(--text-primary); font-weight: 500;">Pendents</span>
            <span class="font-bold" style="color: var(--warning); font-size: 1.25rem;">25%</span>
          </div>
        </div>
      </div>

      <div class="card p-6">
        <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
          Tallers més sol·licitats
        </h2>
        <div class="space-y-3">
          <div class="flex items-center justify-between py-2" style="border-bottom: 1px solid var(--border-color);">
            <span style="color: var(--text-primary); font-weight: 500;">Robòtica Educativa</span>
            <span class="badge-info" style="min-width: 2.5rem; text-align: center;">
              12
            </span>
          </div>
          <div class="flex items-center justify-between py-2" style="border-bottom: 1px solid var(--border-color);">
            <span style="color: var(--text-primary); font-weight: 500;">Ciències Experimentals</span>
            <span class="badge-info" style="min-width: 2.5rem; text-align: center;">
              8
            </span>
          </div>
          <div class="flex items-center justify-between py-2">
            <span style="color: var(--text-primary); font-weight: 500;">Arts Plàstiques</span>
            <span class="badge-info" style="min-width: 2.5rem; text-align: center;">
              4
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { FileText, CheckCircle, Clock, Users } from 'lucide-vue-next';
</script>
