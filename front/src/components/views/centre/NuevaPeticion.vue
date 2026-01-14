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
      <div class="space-y-5">
        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Selecciona Taller *
          </label>
          <select v-model="form.id_workshop" class="w-full">
            <option value="">Selecciona un taller...</option>
            <option v-for="w in workshops" :key="w.id_workshop" :value="w.id_workshop">
              {{ w.title }}
            </option>
          </select>
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Nombre d'Alumnes *
          </label>
          <input type="number" class="w-full" placeholder="Ex: 25" />
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Curs / Nivell
          </label>
          <input type="text" class="w-full" placeholder="Ex: 3r ESO" />
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Preferències de Dates
          </label>
          <textarea
            v-model="form.date_preferences"
            class="w-full"
            rows="3"
            placeholder="Indica les teves preferències de dates i horaris..."
          ></textarea>
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Comentaris Addicionals
          </label>
          <textarea
            class="w-full"
            rows="4"
            placeholder="Qualsevol informació addicional rellevant..."
          ></textarea>
        </div>

        <div
          class="flex gap-4"
          style="padding-top: 1.5rem; border-top: 1px solid var(--border-color)"
        >
          <button @click="submitForm" :disabled="submitting" class="flex-1 btn-primary py-3">
            {{ submitting ? 'Enviant...' : 'Enviar Petició' }}
          </button>
          <button @click="cancel" class="px-8 btn-outline py-3">Cancel·lar</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import * as requestService from '@/services/requestService'
import * as workshopService from '@/services/workshopService'

const router = useRouter()

const workshops = ref([])
const loading = ref(false)
const submitting = ref(false)
const error = ref('')

const form = ref({
  id_workshop: '',
  requested_slots: '',
  /* 
     Backend expects: id_center (from token/session), id_workshop, requested_slots, comments.
     "Curs/Nivell" and "Preferències" are not in the createRequest model explicitly?
     Let's check back/controllers/centreRequestController.js.
     -> const { id_workshop, requested_slots, comments } = req.body;
     So we can combine extra info into 'comments' or ignore them for now.
     I will append them to comments.
  */
  course_level: '',
  date_preferences: '',
  comments: '',
})

const loadWorkshops = async () => {
  try {
    loading.value = true
    const data = await workshopService.getAll()
    // Filter active workshops if needed? For now show all.
    workshops.value = data
  } catch (err) {
    console.error('Error loading workshops', err)
    error.value = 'Error carregant la llista de tallers.'
  } finally {
    loading.value = false
  }
}

const submitForm = async () => {
  error.value = ''
  if (!form.value.id_workshop || !form.value.requested_slots) {
    error.value = 'Si us plau, omple els camps obligatoris.'
    return
  }

  try {
    submitting.value = true

    // Combine extra fields into comments
    let combinedComments = form.value.comments
    if (form.value.course_level) {
      combinedComments += `\nCurs/Nivell: ${form.value.course_level}`
    }
    if (form.value.date_preferences) {
      combinedComments += `\nPreferències: ${form.value.date_preferences}`
    }

    const payload = {
      id_workshop: form.value.id_workshop,
      requested_slots: parseInt(form.value.requested_slots),
      comments: combinedComments,
    }

    await requestService.create(payload)
    router.push('/centro/panel')
  } catch (err) {
    console.error('Error creating request', err)
    if (err.response && err.response.data && err.response.data.error) {
      error.value = err.response.data.error
    } else {
      error.value = 'Error enviant la petició.'
    }
  } finally {
    submitting.value = false
  }
}

const cancel = () => {
  router.push('/centro/panel')
}

onMounted(() => {
  loadWorkshops()
})
</script>
