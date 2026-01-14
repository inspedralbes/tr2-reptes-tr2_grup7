<template>
  <div class="max-w-3xl mx-auto">
    <h1
      class="text-2xl font-semibold mb-6"
      style="
        color: var(--text-primary);
        text-transform: uppercase;
        letter-spacing: 0.5px;
        border-bottom: 2px solid var(--border-color);
        padding-bottom: 1rem;
      "
    >
      Nova Petició de Taller
    </h1>

    <div class="card p-8">
      <form @submit.prevent="submitRequest" class="space-y-5">
        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Selecciona Taller *
          </label>
          <select v-model="form.id_workshop" class="w-full" required>
            <option value="" disabled>Selecciona un taller...</option>
            <option
              v-for="workshop in workshops"
              :key="workshop.id_workshop"
              :value="workshop.id_workshop"
            >
              {{ workshop.title }} ({{ workshop.category }})
            </option>
          </select>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
          <div>
            <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
              Nombre d'Alumnes *
            </label>
            <input
              v-model.number="form.student_count"
              type="number"
              class="w-full"
              placeholder="Ex: 25"
              required
              min="1"
            />
          </div>

          <div>
            <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
              Curs / Nivell *
            </label>
            <input
              v-model="form.course_level"
              type="text"
              class="w-full"
              placeholder="Ex: 3r ESO"
              required
            />
          </div>
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Professor Referent *
          </label>
          <select v-model="form.id_teacher" class="w-full" required>
            <option value="" disabled>Selecciona un professor ref...</option>
            <option v-for="teacher in teachers" :key="teacher.id_user" :value="teacher.id_user">
              {{ teacher.first_name }} {{ teacher.last_name }} ({{ teacher.email }})
            </option>
          </select>
          <p v-if="teachers.length === 0" class="text-xs text-red-500 mt-1">
            No s'han trobat professors assignats al teu centre. Contacta amb l'administrador.
          </p>
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Preferències de Dates / Comentaris
          </label>
          <textarea
            v-model="form.comments"
            class="w-full"
            rows="4"
            placeholder="Indica preferències de dates, horaris o qualsevol informació addicional..."
          ></textarea>
        </div>

        <!-- Hidden field for requested_slots logic if needed, defaulting to 1 group -->

        <div
          class="flex gap-4"
          style="padding-top: 1.5rem; border-top: 1px solid var(--border-color)"
        >
          <button type="submit" class="flex-1 btn-primary py-3" :disabled="loading">
            {{ loading ? 'Enviant...' : 'Enviar Petició' }}
          </button>
          <button
            type="button"
            @click="$router.push('/centro/panel')"
            class="px-8 btn-outline py-3"
          >
            Cancel·lar
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, reactive } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import * as workshopService from '../../../services/workshopService'
import * as requestService from '../../../services/requestService'
import * as centreService from '../../../services/centreService'
// Assuming we have an auth store or service to get current user ID.
const getUser = () => JSON.parse(localStorage.getItem('user') || '{}')

const router = useRouter()
const route = useRoute()
const workshops = ref([])
const teachers = ref([])
const loading = ref(false)

const form = reactive({
  id_workshop: '',
  student_count: null,
  course_level: '',
  id_teacher: '',
  comments: '',
  requested_slots: 1,
})

onMounted(async () => {
  try {
    const user = getUser()
    if (user && user.id) {
      // Parallel fetch
      const [workshopsData, teachersData] = await Promise.all([
        workshopService.getAll(),
        centreService.getTeachers(user.id),
      ])
      workshops.value = workshopsData
      teachers.value = teachersData

      // Check for pre-selected workshop from query params
      if (route.query.workshopId) {
        const preSelectedId = parseInt(route.query.workshopId)
        if (!isNaN(preSelectedId)) {
          form.id_workshop = preSelectedId
        }
      }
    } else {
      console.error('User not found in local storage')
      router.push('/login')
    }
  } catch (error) {
    console.error('Error loading data:', error)
  }
})

const submitRequest = async () => {
  loading.value = true
  try {
    await requestService.create(form)
    alert('Petició creada correctament!')
    router.push('/centro/panel')
  } catch (error) {
    console.error('Error submitting request:', error)
    alert('Error al crear la petició. Si us plau, torna-ho a provar.')
  } finally {
    loading.value = false
  }
}
</script>
