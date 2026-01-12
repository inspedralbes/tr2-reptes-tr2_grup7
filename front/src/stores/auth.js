import { defineStore } from 'pinia';
import { ref, computed } from 'vue';

export const useAuthStore = defineStore('auth', () => {
  const token = ref(localStorage.getItem('token') || '');
  const user = ref(JSON.parse(localStorage.getItem('user') || 'null'));

  const isAuthenticated = computed(() => !!token.value);
  const isTeacher = computed(() => user.value?.role === 'TEACHER');

  function setSession(newToken, newUser) {
    token.value = newToken;
    user.value = newUser;
    localStorage.setItem('token', newToken);
    localStorage.setItem('user', JSON.stringify(newUser));
  }

  function logout() {
    token.value = '';
    user.value = null;
    localStorage.removeItem('token');
    localStorage.removeItem('user');
  }

  function devLogin() {
    // Generated valid token for ID 1 (Teacher)
    const validToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZSI6IlRFQUNIRVIiLCJpYXQiOjE3Njc5NTY0ODksImV4cCI6MTc2ODA0Mjg4OX0.sVD077v2JwMAF4sMZDRumpO2altoklYimTb6nAkxCbQ";
    
    const devUser = {
        role: 'TEACHER',
        id: 1, 
        name: 'Profesor Test',
        id_center: null // Assuming teacher belongs to a center but for now null is fine or we can guess
    };
    
    setSession(validToken, devUser);
  }

  return { 
    token, 
    user, 
    isAuthenticated, 
    isTeacher, 
    setSession, 
    logout,
    devLogin
  };
});
