import { defineStore } from 'pinia';
import { ref } from 'vue';

export const useAlertStore = defineStore('alert', () => {
  const alerts = ref([]);
  const confirmState = ref({
    show: false,
    title: '',
    message: '',
    resolve: null,
    confiormText: 'Confirmar',
    cancelText: 'Cancel·lar',
    type: 'danger' // danger, warning, info
  });

  const addAlert = (type, message, title = '') => {
    const id = Date.now();
    alerts.value.push({ id, type, message, title });
    setTimeout(() => {
      removeAlert(id);
    }, 5000);
  };

  const removeAlert = (id) => {
    alerts.value = alerts.value.filter(a => a.id !== id);
  };

  const confirm = (message, title = 'Confirmació', options = {}) => {
    return new Promise((resolve) => {
      confirmState.value = {
        show: true,
        title,
        message,
        resolve,
        confirmText: options.confirmText || 'Confirmar',
        cancelText: options.cancelText || 'Cancel·lar',
        type: options.type || 'danger'
      };
    });
  };

  const resolveConfirm = (value) => {
    if (confirmState.value.resolve) {
      confirmState.value.resolve(value);
    }
    confirmState.value.show = false;
    confirmState.value.resolve = null;
  };

  return {
    alerts,
    confirmState,
    addAlert,
    removeAlert,
    confirm,
    resolveConfirm
  };
});
