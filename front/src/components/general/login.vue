<template>
  <div class="min-h-screen" style="background-color: var(--background-alt)">
    <!-- Capçalera Superior - Navbar sense funcionalitat -->
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

      <!-- Barra de navegació visual (sense funcionalitat) -->
      <div
        style="background-color: rgba(0, 0, 0, 0.1); border-top: 1px solid rgba(255, 255, 255, 0.1)"
      >
        <nav class="flex px-6">
          <button class="px-6 py-3 text-sm font-medium text-white" style="cursor: default" disabled>
            Inici
          </button>
        </nav>
      </div>
    </header>

    <!-- Contingut Principal - Formulari de Login Centrat -->
    <div
      class="flex items-center justify-center"
      style="min-height: calc(100vh - 160px); padding: 2rem"
    >
      <div class="card login-card" style="max-width: 450px; width: 100%; padding: 3rem !important">
        <!-- Títol -->
        <div style="text-align: center; margin-bottom: 2rem">
          <h2 class="text-2xl font-semibold" style="color: var(--primary); margin-bottom: 0.5rem">
            Iniciar Sessió
          </h2>
          <p class="text-sm" style="color: var(--text-secondary)">
            Introdueix les teves credencials per accedir
          </p>
        </div>

        <!-- Formulari -->
        <form @submit.prevent="handleLogin" class="space-y-5">
          <!-- Camp Email -->
          <div>
            <label
              for="email"
              class="block text-sm font-semibold mb-2"
              style="color: var(--text-primary)"
            >
              Correu Electrònic *
            </label>
            <input
              v-model="email"
              type="email"
              id="email"
              class="w-full"
              placeholder="exemple@correu.com"
              required
              style="
                padding: 0.75rem;
                border: 1px solid var(--border-color);
                font-size: 0.875rem;
                transition: all 0.25s ease;
              "
            />
          </div>

          <!-- Camp Contrasenya -->
          <div>
            <label
              for="password"
              class="block text-sm font-semibold mb-2"
              style="color: var(--text-primary)"
            >
              Contrasenya *
            </label>
            <input
              v-model="password"
              type="password"
              id="password"
              class="w-full"
              placeholder="Introdueix la teva contrasenya"
              required
              style="
                padding: 0.75rem;
                border: 1px solid var(--border-color);
                font-size: 0.875rem;
                transition: all 0.25s ease;
              "
            />
          </div>

          <!-- Opciones adicionales -->
          <div class="flex items-center justify-between" style="padding-top: 0.5rem">
            <label class="flex items-center gap-2" style="cursor: pointer">
              <input
                type="checkbox"
                v-model="rememberMe"
                style="width: 16px; height: 16px; cursor: pointer"
              />
              <span class="text-sm" style="color: var(--text-secondary)">Recordar-me</span>
            </label>
            <a href="#" class="text-sm" style="color: var(--primary); text-decoration: none">
              Has oblidat la contrasenya?
            </a>
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

          <!-- Botón de login -->
          <div style="padding-top: 1rem">
            <button
              type="submit"
              class="btn-primary w-full py-3"
              :disabled="loading"
              :style="loading ? 'opacity: 0.7; cursor: not-allowed;' : ''"
            >
              {{ loading ? 'Iniciant sessió...' : 'Iniciar sessió' }}
            </button>
          </div>

          <!-- Mensaje informativo -->
          <div
            class="text-center"
            style="
              padding-top: 1rem;
              border-top: 1px solid var(--border-color);
              margin-top: 1.5rem !important;
            "
          >
            <p class="text-xs" style="color: var(--text-secondary); line-height: 1.5">
              Accés exclusiu per a personal docent i centres educatius.
              <strong>Utilitza el teu correu @xtec.cat</strong> per accedir.
            </p>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { login } from '../../services/authService'

const router = useRouter()

const email = ref('')
const password = ref('')
const rememberMe = ref(false)
const error = ref('')
const loading = ref(false)

const handleLogin = async () => {
  // Netejar errors previs
  error.value = ''

  // Validació de domini (Req: només xtec o similar, mantenim edu.com per dev)
  const allowedDomains = ['xtec.cat', 'edu.com', 'workshop.com']
  const emailDomain = email.value.split('@')[1]

  if (!emailDomain || !allowedDomains.includes(emailDomain)) {
    error.value = 'Accés restringit: Només es permeten correus xtec.cat'
    return
  }

  loading.value = true

  try {

    // Cridar al servei d'autenticació
    const response = await login(email.value, password.value, rememberMe.value)

    console.log('Login correcte:', response)

    // Redirigir segons el rol de l'usuari
    if (response.user.role === 'ADMIN') {
      router.push('/admin/panel')
    } else if (response.user.role === 'CENTER') {
      router.push('/centro/panel')
    } else if (response.user.role === 'TEACHER') {
      router.push('/profesor/talleres')
    } else {
      error.value = "Rol d'usuari no reconegut"
    }
  } catch (err) {
    console.error('Error en login:', err)
    error.value = err.error || 'Error en iniciar la sessió. Verifica les teves credencials.'
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
input[type='email']:focus,
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

input[type='email']:hover,
input[type='password']:hover {
  border-color: var(--gray-300);
}

/* Ajuste para el checkbox */
input[type='checkbox']:checked {
  accent-color: var(--primary);
}

/* Link hover */
a:hover {
  color: var(--primary-dark) !important;
  text-decoration: underline !important;
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
