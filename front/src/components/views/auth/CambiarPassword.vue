<template>
  <div class="min-h-screen" style="background-color: var(--background-alt)">
    <!-- Capçalera Superior - Copied from login.vue -->
    <header
      class="header"
      style="position: sticky; top: 0; z-index: 100; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1)"
    >
      <div class="flex items-center justify-between px-6 py-3">
        <!-- Logo y Título -->
        <div class="flex items-center gap-4">
          <img src="/img/logo.jpg" alt="Logo" style="height: 70px" />
          <div>
            <h1 class="text-lg font-semibold text-white">Sistema Tallers Educatius</h1>
            <p class="text-xs text-white" style="opacity: 0.85">Consorci d'Educació de Barcelona</p>
          </div>
        </div>

        <!-- Info visual sense enllaços -->
        <div class="flex items-center gap-3">
          <div class="flex items-center gap-2"></div>
        </div>
      </div>

      <!-- Barra de navegació visual -->
      <div
        style="background-color: rgba(0, 0, 0, 0.1); border-top: 1px solid rgba(255, 255, 255, 0.1)"
      >
        <nav class="flex px-6">
          <button class="px-6 py-3 text-sm font-medium text-white" style="cursor: default" disabled>
            Canvi de Contrasenya
          </button>
        </nav>
      </div>
    </header>

    <!-- Contingut Principal - Formulari Centrat -->
    <div
      class="flex items-center justify-center"
      style="min-height: calc(100vh - 160px); padding: 2rem"
    >
      <div class="card login-card" style="max-width: 450px; width: 100%; padding: 3rem !important">
        <!-- Títol -->
        <div style="text-align: center; margin-bottom: 2rem">
          <h2 class="text-2xl font-semibold" style="color: var(--primary); margin-bottom: 0.5rem">
            Canvi de Contrasenya Obligatori
          </h2>
          <p class="text-sm" style="color: var(--text-secondary)">
            Per seguretat, has de canviar la teva contrasenya inicial abans de continuar.
          </p>
        </div>

        <!-- Formulari -->
        <form @submit.prevent="handleSubmit" class="space-y-5">
          <!-- Nova Contrasenya -->
          <div>
            <label
              for="new-password"
              class="block text-sm font-semibold mb-2"
              style="color: var(--text-primary)"
            >
              Nova Contrasenya *
            </label>
            <input
              v-model="newPassword"
              type="password"
              id="new-password"
              class="w-full"
              placeholder="Introdueix la nova contrasenya"
              required
              style="
                padding: 0.75rem;
                border: 1px solid var(--border-color);
                font-size: 0.875rem;
                transition: all 0.25s ease;
              "
            />
          </div>

          <!-- Confirmar Contrasenya -->
          <div>
            <label
              for="confirm-password"
              class="block text-sm font-semibold mb-2"
              style="color: var(--text-primary)"
            >
              Confirmar Contrasenya *
            </label>
            <input
              v-model="confirmPassword"
              type="password"
              id="confirm-password"
              class="w-full"
              placeholder="Repeteix la nova contrasenya"
              required
              style="
                padding: 0.75rem;
                border: 1px solid var(--border-color);
                font-size: 0.875rem;
                transition: all 0.25s ease;
              "
            />
          </div>

          <!-- Mensaje de error -->
          <div
            v-if="error"
            style="
              padding: 0.75rem;
              background-color: #fee;
              border: 1px solid #fcc;
              border-radius: 4px;
              margin-top: 1rem;
            "
          >
            <p class="text-sm" style="color: #c33; text-align: center">
              {{ error }}
            </p>
          </div>

          <!-- Botón -->
          <div style="padding-top: 1rem">
            <button
              type="submit"
              class="btn-primary w-full py-3"
              :disabled="loading"
              :style="loading ? 'opacity: 0.7; cursor: not-allowed;' : ''"
            >
              {{ loading ? 'Processant...' : 'Canviar Contrasenya' }}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import apiClient from '../../../services/apiClient'
import { useAlertStore } from '../../../stores/alert'

const router = useRouter()
const alertStore = useAlertStore()
const newPassword = ref('')
const confirmPassword = ref('')
const error = ref('')
const loading = ref(false)

const handleSubmit = async () => {
  error.value = ''

  if (newPassword.value !== confirmPassword.value) {
    error.value = 'Les contrasenyes no coincideixen.'
    return
  }

  if (newPassword.value.length < 4) {
    error.value = 'La contrasenya ha de tenir almenys 4 caràcters.'
    return
  }

  loading.value = true

  try {
    await apiClient.post('/auth/change-password', {
      newPassword: newPassword.value,
    })

    // On success
    alertStore.addAlert(
      'success',
      'Contrasenya actualitzada correctament. Si us plau, torna a iniciar sessió.',
    )

    // Clear Token and Redirect to Login
    localStorage.removeItem('token')
    localStorage.removeItem('user')
    localStorage.removeItem('mustChangePassword')
    router.push('/login')
  } catch (err) {
    console.error(err)
    if (err.response && err.response.data && err.response.data.error) {
      error.value = err.response.data.error
    } else {
      error.value = 'Error al canviar la contrasenya.'
    }
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
input[type='password']:focus {
  outline: none;
  border-color: var(--primary);
  box-shadow: 0 0 0 4px rgba(0, 66, 107, 0.15);
  background-color: white !important;
}

.login-card {
  transition:
    transform 0.3s ease,
    box-shadow 0.3s ease !important;
}

.login-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05) !important;
}

input[type='password']:hover {
  border-color: var(--gray-300);
}

/* Utilidades Tailwind que necesitamos */
.min-h-screen {
  min-height: 100vh;
}

.flex {
  display: flex;
}

.items-center {
  align-items: center;
}

.justify-between {
  justify-content: space-between;
}

.justify-center {
  justify-content: center;
}

.gap-2 {
  gap: 0.5rem;
}

.gap-3 {
  gap: 0.75rem;
}

.gap-4 {
  gap: 1rem;
}

.px-6 {
  padding-left: 1.5rem;
  padding-right: 1.5rem;
}

.py-3 {
  padding-top: 0.75rem;
  padding-bottom: 0.75rem;
}

.text-lg {
  font-size: 1.125rem;
}

.text-sm {
  font-size: 0.875rem;
}

.text-xs {
  font-size: 0.75rem;
}

.text-2xl {
  font-size: 1.5rem;
}

.font-semibold {
  font-weight: 600;
}

.font-medium {
  font-weight: 500;
}

.text-white {
  color: white;
}

.space-y-5 > * + * {
  margin-top: 1.25rem;
}

.w-full {
  width: 100%;
}

.block {
  display: block;
}

.mb-2 {
  margin-bottom: 0.5rem;
}

.text-center {
  text-align: center;
}
</style>
