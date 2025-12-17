<template>
  <div class="space-y-6">
    <div class="flex justify-between items-center" style="border-bottom: 2px solid var(--border-color); padding-bottom: 1rem; margin-bottom: 1.5rem;">
      <h1 class="text-2xl font-semibold" style="color: var(--text-primary); text-transform: uppercase; letter-spacing: 0.5px;">Tauler de Control</h1>
      <button class="btn-primary px-6 py-2 flex items-center gap-2">
        <Plus :size="18" /> Nova Petició
      </button>
    </div>

    <div class="grid grid-cols-1 md:grid-cols-4 gap-5">
      <div class="stat-card-blue text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Peticions Actives</p>
            <p class="text-3xl font-bold">5</p>
          </div>
          <FileText :size="32" style="opacity: 0.75;" />
        </div>
      </div>

      <div class="stat-card-green text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Assignacions</p>
            <p class="text-3xl font-bold">3</p>
          </div>
          <CheckCircle :size="32" style="opacity: 0.75;" />
        </div>
      </div>

      <div class="stat-card-orange text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Pendents</p>
            <p class="text-3xl font-bold">2</p>
          </div>
          <Clock :size="32" style="opacity: 0.75;" />
        </div>
      </div>

      <div class="stat-card-purple text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500;">Alumnes Total</p>
            <p class="text-3xl font-bold">87</p>
          </div>
          <Users :size="32" style="opacity: 0.75;" />
        </div>
      </div>
    </div>


    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <div class="md:col-span-2 space-y-6">
        <div class="card p-6">
          <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
            Informació del Taller
          </h2>
          <div class="space-y-2">
            <div class="flex justify-between py-2.5" style="border-bottom: 1px solid var(--border-color);">
              <span style="color: var(--text-secondary); font-size: 0.9rem;">Centre:</span>
              <span class="font-semibold" style="color: var(--text-primary);">IES Terrassa</span>
            </div>
            <div class="flex justify-between py-2.5" style="border-bottom: 1px solid var(--border-color);">
              <span style="color: var(--text-secondary); font-size: 0.9rem;">Curs:</span>
              <span class="font-semibold" style="color: var(--text-primary);">3r ESO</span>
            </div>
            <div class="flex justify-between py-2.5" style="border-bottom: 1px solid var(--border-color);">
              <span style="color: var(--text-secondary); font-size: 0.9rem;">Nombre d'alumnes:</span>
              <span class="font-semibold" style="color: var(--text-primary);">22</span>
            </div>
            <div class="flex justify-between py-2.5" style="border-bottom: 1px solid var(--border-color);">
              <span style="color: var(--text-secondary); font-size: 0.9rem;">Modalitat:</span>
              <span class="font-semibold" style="color: var(--text-primary);">Modalitat A</span>
            </div>
            <div class="flex justify-between py-2.5">
              <span style="color: var(--text-secondary); font-size: 0.9rem;">Sessions:</span>
              <span class="font-semibold" style="color: var(--text-primary);">8 sessions de 2h</span>
            </div>
          </div>
        </div>

        <div class="card p-6">
          <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
            Llista d'Alumnes (22)
          </h2>
          <div class="max-h-96 overflow-y-auto">
            <table class="w-full">
              <thead class="bg-gray-50 sticky top-0">
                <tr>
                  <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700">
                    Nom
                  </th>
                  <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700">
                    Email
                  </th>
                  <th class="px-4 py-3 text-left text-sm font-semibold text-gray-700">
                    Assistència
                  </th>
                </tr>
              </thead>
              <tbody class="divide-y">
                <tr class="hover:bg-gray-50">
                  <td class="px-4 py-3 text-sm">Maria López García</td>
                  <td class="px-4 py-3 text-sm text-gray-600">
                    maria.lopez@ies-terrassa.cat
                  </td>
                  <td class="px-4 py-3">
                    <span class="bg-green-100 text-green-700 text-xs px-2 py-1 rounded">
                      100%
                    </span>
                  </td>
                </tr>
                <tr class="hover:bg-gray-50">
                  <td class="px-4 py-3 text-sm">Joan Martínez Pérez</td>
                  <td class="px-4 py-3 text-sm text-gray-600">
                    joan.martinez@ies-terrassa.cat
                  </td>
                  <td class="px-4 py-3">
                    <span class="bg-green-100 text-green-700 text-xs px-2 py-1 rounded">
                      100%
                    </span>
                  </td>
                </tr>
                <tr class="hover:bg-gray-50">
                  <td class="px-4 py-3 text-sm">Laura Sánchez Vila</td>
                  <td class="px-4 py-3 text-sm text-gray-600">
                    laura.sanchez@ies-terrassa.cat
                  </td>
                  <td class="px-4 py-3">
                    <span class="bg-yellow-100 text-yellow-700 text-xs px-2 py-1 rounded">
                      87%
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <div class="space-y-6">
        <div class="card p-5">
          <h3 class="text-base font-semibold mb-3" style="color: var(--text-primary); padding-bottom: 0.5rem; border-bottom: 1px solid var(--border-color);">
            Contacte Centre
          </h3>
          <div class="space-y-3">
            <div>
              <p class="text-xs" style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.25rem;">Persona de contacte</p>
              <p class="font-semibold" style="color: var(--text-primary);">Anna Ferrer</p>
            </div>
            <div>
              <p class="text-xs" style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.25rem;">Email</p>
              <p class="font-medium" style="color: var(--primary);">
                anna.ferrer@ies-terrassa.cat
              </p>
            </div>
            <div>
              <p class="text-xs" style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.25rem;">Telèfon</p>
              <p class="font-semibold" style="color: var(--text-primary);">937 123 456</p>
            </div>
          </div>
          <button class="w-full mt-4 btn-primary py-2.5">
            Enviar Missatge
          </button>
        </div>

        <div class="card p-5">
          <h3 class="text-base font-semibold mb-3" style="color: var(--text-primary); padding-bottom: 0.5rem; border-bottom: 1px solid var(--border-color);">
            Professor Co-Referent
          </h3>
          <div class="space-y-3">
            <div>
              <p class="text-xs" style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.25rem;">Nom</p>
              <p class="font-semibold" style="color: var(--text-primary);">Pere López</p>
            </div>
            <div>
              <p class="text-xs" style="color: var(--text-secondary); text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 0.25rem;">Email</p>
              <p class="font-medium" style="color: var(--primary);">pere.lopez@edu.cat</p>
            </div>
          </div>
        </div>

        <button class="w-full btn-secondary py-3 flex items-center justify-center gap-2">
          <Award :size="18" /> Avaluar Taller
        </button>
      </div>
    </div>

    <div class="card p-6">
      <h2 class="text-lg font-semibold mb-4" style="color: var(--text-primary); padding-bottom: 0.75rem; border-bottom: 1px solid var(--border-color);">
        Notificacions Recents
      </h2>
      <div class="space-y-3">
        <div class="flex items-start gap-3 p-4" style="background-color: #e3f2fd; border-left: 4px solid var(--info);">
          <Bell style="color: var(--info);" :size="20" />
          <div class="flex-1">
            <p class="font-semibold" style="color: var(--text-primary); margin-bottom: 0.25rem;">Assignació confirmada</p>
            <p class="text-sm" style="color: var(--text-secondary);">
              S'ha assignat el taller de Robòtica Educativa amb 22 places
            </p>
            <p class="text-xs mt-1" style="color: var(--gray-500);">Fa 2 hores</p>
          </div>
        </div>
        <div class="flex items-start gap-3 p-4" style="background-color: #fff3e0; border-left: 4px solid var(--warning);">
          <AlertCircle style="color: var(--warning);" :size="20" />
          <div class="flex-1">
            <p class="font-semibold" style="color: var(--text-primary); margin-bottom: 0.25rem;">Checklist pendent</p>
            <p class="text-sm" style="color: var(--text-secondary);">
              Cal completar el checklist final abans del 20/12/2025
            </p>
            <p class="text-xs mt-1" style="color: var(--gray-500);">Fa 1 dia</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import {
  FileText,
  CheckCircle,
  Clock,
  Users,
  Plus,
  Bell,
  AlertCircle,
  Award
} from 'lucide-vue-next';
</script>
