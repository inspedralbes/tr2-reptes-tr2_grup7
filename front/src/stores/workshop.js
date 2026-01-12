import { defineStore } from 'pinia';
import { ref } from 'vue';
import { useAuthStore } from './auth';

export const useWorkshopStore = defineStore('workshop', () => {
    const workshops = ref([]);
    const loading = ref(false);
    const error = ref(null);

    async function fetchMyWorkshops() {
        const authStore = useAuthStore();
        if (!authStore.token) {
            error.value = "No autenticado";
            return;
        }

        loading.value = true;
        error.value = null;

        try {
            // Use VITE_API_URL or default to localhost
            const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000';
            
            const response = await fetch(`${API_URL}/api/workshops/mine`, {
                headers: {
                    'Authorization': `Bearer ${authStore.token}`
                }
            });

            if (!response.ok) {
                if (response.status === 401) throw new Error("Sesión expirada");
                throw new Error("Error al cargar talleres");
            }

            const data = await response.json();
            workshops.value = data;
        } catch (err) {
            console.error(err);
            error.value = err.message;
        } finally {
            loading.value = false;
        }
    }

    return {
        workshops,
        loading,
        error,
        fetchMyWorkshops
    };
});
