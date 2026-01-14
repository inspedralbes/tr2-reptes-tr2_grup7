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
      <!-- Step 1: Form -->
      <div v-if="!showConfirmation" class="space-y-5">
        <!-- Workshop Info -->
        <h2 class="text-lg font-semibold text-gray-700 border-b pb-2">Dades del Taller</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
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
            <input
              v-model="form.requested_slots"
              type="number"
              class="w-full"
              placeholder="Ex: 25"
            />
          </div>
          <div>
            <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
              Curs / Nivell
            </label>
            <input
              v-model="form.course_level"
              type="text"
              class="w-full"
              placeholder="Ex: 3r ESO"
            />
          </div>
        </div>

        <!-- Referent Info -->
        <h2 class="text-lg font-semibold text-gray-700 border-b pb-2 pt-4">Dades del Referent</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
              Nom del Referent
            </label>
            <input
              v-model="form.referent_name"
              type="text"
              class="w-full"
              placeholder="Nom del professor responsable"
            />
          </div>
          <div>
            <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
              Email del Referent
            </label>
            <input
              v-model="form.referent_email"
              type="email"
              class="w-full"
              placeholder="email@escola.cat"
            />
          </div>
        </div>

        <!-- Details -->
        <h2 class="text-lg font-semibold text-gray-700 border-b pb-2 pt-4">Detalls i Alumnes</h2>
        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Preferències de Dates
          </label>
          <textarea
            v-model="form.date_preferences"
            class="w-full"
            rows="2"
            placeholder="Indica les teves preferències de dates i horaris..."
          ></textarea>
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Llista d'Alumnes
          </label>
          <textarea
            v-model="form.student_list"
            class="w-full"
            rows="4"
            placeholder="Introdueix la llista d'alumnes (un per línia o separat per comes)..."
          ></textarea>
          <p class="text-xs text-gray-500 mt-1">Opcional. Pots adjuntar-la més tard.</p>
        </div>

        <div>
          <label class="block text-sm font-semibold mb-2" style="color: var(--text-primary)">
            Comentaris Addicionals
          </label>
          <textarea
            v-model="form.comments"
            class="w-full"
            rows="3"
            placeholder="Qualsevol informació addicional rellevant..."
          ></textarea>
        </div>

        <div v-if="error" class="bg-red-100 text-red-700 p-3 rounded">
          {{ error }}
        </div>

        <div
          class="flex gap-4"
          style="padding-top: 1.5rem; border-top: 1px solid var(--border-color)"
        >
          <button @click="validateAndShowConfirmation" class="flex-1 btn-primary py-3">
            Següent: Confirmar
          </button>
          <button @click="cancel" class="px-8 btn-outline py-3">Cancel·lar</button>
        </div>
      </div>

      <!-- Step 2: Confirmation -->
      <div v-else class="space-y-6">
        <h2 class="text-xl font-bold text-center text-gray-800">Confirmació de la Petició</h2>

        <div class="bg-gray-50 p-6 rounded-lg space-y-4 text-sm">
          <h3 class="font-semibold text-lg border-b pb-2">Resum de la sol·licitud</h3>

          <div class="grid grid-cols-2 gap-4">
            <div>
              <span class="text-gray-500 block">Taller:</span>
              <span class="font-medium">{{ getWorkshopTitle(form.id_workshop) }}</span>
            </div>
            <div>
              <span class="text-gray-500 block">Alumnes:</span>
              <span class="font-medium">{{ form.requested_slots }} ({{ form.course_level }})</span>
            </div>
            <div>
              <span class="text-gray-500 block">Referent:</span>
              <span class="font-medium">{{ form.referent_name }}</span>
            </div>
            <div>
              <span class="text-gray-500 block">Email:</span>
              <span class="font-medium">{{ form.referent_email }}</span>
            </div>
          </div>

          <div>
            <span class="text-gray-500 block">Preferències:</span>
            <p class="font-medium">{{ form.date_preferences || 'Cap preference indicada' }}</p>
          </div>
          <div>
            <span class="text-gray-500 block">Comentaris:</span>
            <p class="font-medium">{{ form.comments || 'Sense comentaris' }}</p>
          </div>
        </div>

        <div class="flex gap-4">
          <button @click="showConfirmation = false" class="px-8 btn-outline py-3">Enrere</button>
          <button @click="submitForm" :disabled="submitting" class="flex-1 btn-primary py-3">
            {{ submitting ? 'Enviant...' : 'Confirmar i Enviar' }}
          </button>
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
const showConfirmation = ref(false)

const form = ref({
  id_workshop: '',
  requested_slots: '',
  course_level: '',
  date_preferences: '',
  comments: '',
  referent_name: '',
  referent_email: '',
  student_list: '',
})

const loadWorkshops = async () => {
  try {
    loading.value = true
    const data = await workshopService.getAll()
    workshops.value = data
  } catch (err) {
    console.error('Error loading workshops', err)
    error.value = 'Error carregant la llista de tallers.'
  } finally {
    loading.value = false
  }
}

const getWorkshopTitle = (id) => {
  const w = workshops.value.find((w) => w.id_workshop === id)
  return w ? w.title : 'Desconegut'
}

const validateAndShowConfirmation = () => {
  error.value = ''
  if (!form.value.id_workshop || !form.value.requested_slots) {
    error.value = "Si us plau, omple els camps obligatoris (Taller i Nom d'alumnes)."
    return
  }
  showConfirmation.value = true
}

const submitForm = async () => {
  try {
    submitting.value = true

    // Combine extra fields if needed, but we now have specific fields in DB (assumed based on user request)
    // Actually the user updated the controller to accept referent_name, etc.
    // But verify if `course_level` and `date_preferences` are in the controller?
    // User change to controller: const { id_workshop, requested_slots, comments, referent_name, referent_email, student_list } = req.body;
    // So `course_level` and `date_preferences` STILL need to go into comments or be ignored.

    let finalComments = form.value.comments || ''
    if (form.value.course_level) {
      finalComments += `\nCurs/Nivell: ${form.value.course_level}`
    }
    if (form.value.date_preferences) {
      finalComments += `\nPreferències: ${form.value.date_preferences}`
    }

    const payload = {
      id_workshop: form.value.id_workshop,
      requested_slots: parseInt(form.value.requested_slots),
      comments: finalComments,
      referent_name: form.value.referent_name,
      referent_email: form.value.referent_email,
      student_list: form.value.student_list,
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
    showConfirmation.value = false // Go back to edit on error
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
