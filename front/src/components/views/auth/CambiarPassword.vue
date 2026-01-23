<template>
  <div class="min-h-screen flex items-center justify-center bg-gray-50 py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8 bg-white p-8 rounded-lg shadow-md">
      <div>
        <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Canvi de Contrasenya Obligatori
        </h2>
        <p class="mt-2 text-center text-sm text-gray-600">
          Per seguretat, has de canviar la teva contrasenya inicial abans de continuar.
        </p>
      </div>
      <form class="mt-8 space-y-6" @submit.prevent="handleSubmit">
        <input type="hidden" name="remember" value="true" />
        <div class="rounded-md shadow-sm -space-y-px">
          <div class="mb-4">
            <label for="new-password" class="sr-only">Nova Contrasenya</label>
            <input
              id="new-password"
              name="new-password"
              type="password"
              v-model="newPassword"
              required
              class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-t-md focus:outline-none focus:ring-blue-500 focus:border-blue-500 focus:z-10 sm:text-sm"
              placeholder="Nova Contrasenya"
            />
          </div>
          <div>
            <label for="confirm-password" class="sr-only">Confirmar Contrasenya</label>
            <input
              id="confirm-password"
              name="confirm-password"
              type="password"
              v-model="confirmPassword"
              required
              class="appearance-none rounded-none relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 rounded-b-md focus:outline-none focus:ring-blue-500 focus:border-blue-500 focus:z-10 sm:text-sm"
              placeholder="Confirmar Contrasenya"
            />
          </div>
        </div>

        <div v-if="error" class="text-red-500 text-sm text-center">
          {{ error }}
        </div>

        <div>
          <button
            type="submit"
            :disabled="loading"
            class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
          >
            <span v-if="loading">Processant...</span>
            <span v-else>Canviar Contrasenya</span>
          </button>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
// We'll import apiClient directly or via authService depending on where changePassword is
import apiClient from '../../../services/apiClient'; 
// If you prefer adding it to authService, you can do that too, but direct call is fine for this specific utility

const router = useRouter();
const newPassword = ref('');
const confirmPassword = ref('');
const error = ref('');
const loading = ref(false);

const handleSubmit = async () => {
  error.value = '';
  
  if (newPassword.value !== confirmPassword.value) {
    error.value = "Les contrasenyes no coincideixen.";
    return;
  }

  if (newPassword.value.length < 4) {
    error.value = "La contrasenya ha de tenir almenys 4 caràcters.";
    return;
  }



  loading.value = true;

  try {
    await apiClient.post('/auth/change-password', {
      newPassword: newPassword.value
    });
    
    // On success
    alert('Contrasenya actualitzada correctament. Si us plau, torna a iniciar sessió.');
    
    // Clear Token and Redirect to Login
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    localStorage.removeItem('mustChangePassword');
    router.push('/login');

  } catch (err) {
    console.error(err);
    if (err.response && err.response.data && err.response.data.error) {
       error.value = err.response.data.error;
    } else {
       error.value = "Error al canviar la contrasenya.";
    }
  } finally {
    loading.value = false;
  }
};
</script>
