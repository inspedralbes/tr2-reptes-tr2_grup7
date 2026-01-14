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
        {{ centerInfo.center_name || 'Tauler de Control' }}
      </h1>
      <button @click="goToNewRequest" class="btn-primary px-6 py-2 flex items-center gap-2">
        <Plus :size="18" /> Nova Petició
      </button>
    </div>

    <div v-if="loading" class="text-center py-10">
      <p>Carregant dades...</p>
    </div>

    <div v-else class="grid grid-cols-1 md:grid-cols-4 gap-5">
      <div class="stat-card-blue text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Peticions de Tallers Actives
            </p>
            <p class="text-3xl font-bold">{{ activeRequestsCount }}</p>
          </div>
          <FileText :size="32" style="opacity: 0.75" />
        </div>
      </div>

      <div class="stat-card-green text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Assignacions
            </p>
            <p class="text-3xl font-bold">{{ assignedWorkshopsCount }}</p>
          </div>
          <CheckCircle :size="32" style="opacity: 0.75" />
        </div>
      </div>

      <div class="stat-card-orange text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Pendents
            </p>
            <p class="text-3xl font-bold">{{ pendingRequestsCount }}</p>
          </div>
          <Clock :size="32" style="opacity: 0.75" />
        </div>
      </div>

      <div class="stat-card-purple text-white p-5">
        <div class="flex items-start justify-between">
          <div>
            <p class="text-sm" style="opacity: 0.9; margin-bottom: 0.5rem; font-weight: 500">
              Alumnes totals (acceptats)
            </p>
            <p class="text-3xl font-bold">{{ totalStudents }}</p>
          </div>
          <Users :size="32" style="opacity: 0.75" />
        </div>
      </div>
    </div>

    <div v-if="!loading" class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <div class="md:col-span-2 space-y-6">
        <div class="card p-6">
          <h2
            class="text-lg font-semibold mb-4"
            style="
              color: var(--text-primary);
              padding-bottom: 0.75rem;
              border-bottom: 1px solid var(--border-color);
            "
          >
            Tallers Assignats Recents
          </h2>
          <div v-if="activeWorkshopsList.length === 0" class="text-gray-500 italic">
            No tens tallers assignats encara.
          </div>
          <div v-else class="space-y-4">
            <div
              v-for="req in activeWorkshopsList"
              :key="req.id_request"
              class="p-4 border rounded bg-gray-50"
            >
              <div class="flex justify-between items-center mb-2">
                <h3 class="font-bold text-lg">{{ req.workshop_title }}</h3>
                <span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">ASSIGNAT</span>
              </div>
              <div class="grid grid-cols-2 gap-2 text-sm">
                <div>
                  <span class="text-gray-500">Places sol·licitades:</span> {{ req.requested_slots }}
                </div>
                <div>
                  <span class="text-gray-500">Data sol·licitud:</span>
                  {{ new Date(req.created_at).toLocaleDateString() }}
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- "Llista d'Alumnes" removed for now as we don't have individual student data linked yet -->
        <div class="card p-6">
          <h2
            class="text-lg font-semibold mb-4"
            style="
              color: var(--text-primary);
              padding-bottom: 0.75rem;
              border-bottom: 1px solid var(--border-color);
            "
          >
            Estat de les Peticions
          </h2>
          <div v-if="requests.length === 0" class="text-gray-500">No hi ha peticions.</div>
          <table v-else class="w-full text-sm">
            <thead>
              <tr class="text-left border-b">
                <th class="pb-2">Taller</th>
                <th class="pb-2">Estat</th>
                <th class="pb-2">Places</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="req in requests"
                :key="req.id_request"
                class="border-b last:border-0 hover:bg-gray-50"
              >
                <td class="py-2">{{ req.workshop_title }}</td>
                <td class="py-2">
                  <span
                    :class="{
                      'bg-yellow-100 text-yellow-800': req.status === 'PENDING',
                      'bg-green-100 text-green-800': req.status === 'ACCEPTED',
                      'bg-red-100 text-red-800': req.status === 'REJECTED',
                    }"
                    class="px-2 py-0.5 rounded text-xs font-semibold"
                  >
                    {{ req.status }}
                  </span>
                </td>
                <td class="py-2 text-center">{{ req.requested_slots }}</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>

      <div class="space-y-6">
        <div class="card p-5">
          <h3
            class="text-base font-semibold mb-3"
            style="
              color: var(--text-primary);
              padding-bottom: 0.5rem;
              border-bottom: 1px solid var(--border-color);
            "
          >
            Contacte Centre
          </h3>
          <div class="space-y-3">
            <div>
              <p
                class="text-xs"
                style="
                  color: var(--text-secondary);
                  text-transform: uppercase;
                  letter-spacing: 0.5px;
                  margin-bottom: 0.25rem;
                "
              >
                Persona de contacte
              </p>
              <p class="font-semibold" style="color: var(--text-primary)">
                {{ centerInfo.center_name || 'No especificat' }}
              </p>
            </div>
            <div>
              <p
                class="text-xs"
                style="
                  color: var(--text-secondary);
                  text-transform: uppercase;
                  letter-spacing: 0.5px;
                  margin-bottom: 0.25rem;
                "
              >
                Email
              </p>
              <p class="font-medium" style="color: var(--primary)">
                {{ centerInfo.email || 'No disponible' }}
              </p>
            </div>
            <div>
              <p
                class="text-xs"
                style="
                  color: var(--text-secondary);
                  text-transform: uppercase;
                  letter-spacing: 0.5px;
                  margin-bottom: 0.25rem;
                "
              >
                Telèfon
              </p>
              <p class="font-semibold" style="color: var(--text-primary)">
                {{ centerInfo.phone || 'No disponible' }}
              </p>
            </div>
          </div>
          <button class="w-full mt-4 btn-primary py-2.5">Enviar Missatge</button>
        </div>

        <div class="card p-5">
          <h3
            class="text-base font-semibold mb-3"
            style="
              color: var(--text-primary);
              padding-bottom: 0.5rem;
              border-bottom: 1px solid var(--border-color);
            "
          >
            Professor Co-Referent
          </h3>
          <div class="space-y-3">
            <div>
              <p
                class="text-xs"
                style="
                  color: var(--text-secondary);
                  text-transform: uppercase;
                  letter-spacing: 0.5px;
                  margin-bottom: 0.25rem;
                "
              >
                Nom
              </p>
              <p class="font-semibold" style="color: var(--text-primary)">Pere López</p>
            </div>
            <div>
              <p
                class="text-xs"
                style="
                  color: var(--text-secondary);
                  text-transform: uppercase;
                  letter-spacing: 0.5px;
                  margin-bottom: 0.25rem;
                "
              >
                Email
              </p>
              <p class="font-medium" style="color: var(--primary)">pere.lopez@edu.cat</p>
            </div>
          </div>
        </div>

        <button class="w-full btn-secondary py-3 flex items-center justify-center gap-2">
          <Award :size="18" /> Avaluar Taller
        </button>
      </div>
    </div>

    <div class="card p-6">
      <h2
        class="text-lg font-semibold mb-4"
        style="
          color: var(--text-primary);
          padding-bottom: 0.75rem;
          border-bottom: 1px solid var(--border-color);
        "
      >
        Notificacions Recents
      </h2>
      <div class="space-y-3">
        <div
          v-for="notif in notifications"
          :key="notif.id"
          class="flex items-start gap-3 p-4"
          :style="{
            backgroundColor: notif.type === 'success' ? '#e3f2fd' : '#fff3e0',
            borderLeft: `4px solid var(--${notif.type === 'success' ? 'info' : 'warning'})`,
          }"
        >
          <Bell
            :style="{ color: `var(--${notif.type === 'success' ? 'info' : 'warning'})` }"
            :size="20"
          />
          <div class="flex-1">
            <p class="font-semibold" style="color: var(--text-primary); margin-bottom: 0.25rem">
              {{ notif.title }}
            </p>
            <p class="text-sm" style="color: var(--text-secondary)">
              {{ notif.message }}
            </p>
            <p class="text-xs mt-1" style="color: var(--gray-500)">{{ notif.time }}</p>
          </div>
        </div>
        <div v-if="notifications.length === 0" class="text-gray-500 italic p-4">
          No hi ha noves notificacions.
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, computed } from 'vue'
import { useRouter } from 'vue-router'
import { FileText, CheckCircle, Clock, Users, Plus, Bell, Award } from 'lucide-vue-next'
import * as centreService from '@/services/centreService'
import * as requestService from '@/services/requestService'

const router = useRouter()

// State
const loading = ref(true)
const centerInfo = ref({
  center_name: '',
  email: '',
  phone: '',
  address: '',
  contact_person: '',
})
const requests = ref([])
const activeRequestsCount = ref(0)
const assignedWorkshopsCount = ref(0)
const pendingRequestsCount = ref(0)
const totalStudents = ref(0)

// Computed
const notifications = computed(() => {
  // Mock notifications based on status
  const list = []
  if (assignedWorkshopsCount.value > 0) {
    list.push({
      id: 1,
      type: 'success',
      title: 'Assignació confirmada',
      message: `Tens ${assignedWorkshopsCount.value} tallers assignats.`,
      time: 'Recentment',
    })
  }
  if (pendingRequestsCount.value > 0) {
    list.push({
      id: 2,
      type: 'warning',
      title: 'Peticions pendents',
      message: `Tens ${pendingRequestsCount.value} peticions esperant resposta.`,
      time: 'Ara mateix',
    })
  }
  return list
})

const activeWorkshopsList = computed(() => {
  return requests.value.filter((r) => r.status === 'ACCEPTED').slice(0, 5) // Show top 5
})

// Methods
const fetchDashboardData = async () => {
  try {
    loading.value = true
    const userStr = localStorage.getItem('user')
    if (!userStr) {
      router.push('/login')
      return
    }
    const user = JSON.parse(userStr)

    // 1. Get Center Profile
    // We need the center ID. The user.id is the center's user ID.
    const centerProfile = await centreService.getById(user.id)
    centerInfo.value = centerProfile

    // 2. Get Requests
    const myRequests = await requestService.getMyRequests()
    requests.value = myRequests

    // 3. Calculate Stats
    activeRequestsCount.value = myRequests.filter((r) => r.status === 'PENDING').length
    assignedWorkshopsCount.value = myRequests.filter((r) => r.status === 'ACCEPTED').length
    // "Pendents" in mockup might mean just "active" requests, or something else.
    // Let's assume Pending = PENDING status for now.
    pendingRequestsCount.value = activeRequestsCount.value

    // Calculate total students from ACCEPTED requests
    totalStudents.value = myRequests
      .filter((r) => r.status === 'ACCEPTED')
      .reduce((sum, r) => sum + (r.requested_slots || 0), 0)
  } catch (error) {
    console.error('Error fetching dashboard data:', error)
  } finally {
    loading.value = false
  }
}

const goToNewRequest = () => {
  router.push('/centro/nueva-peticion')
}

onMounted(() => {
  fetchDashboardData()
})
</script>
