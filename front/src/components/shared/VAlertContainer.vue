<template>
  <Teleport to="body">
    <div class="alert-container">
      <!-- Toasts -->
      <TransitionGroup 
        name="toast" 
        tag="div" 
        class="toast-wrapper"
      >
        <div 
          v-for="alert in store.alerts" 
          :key="alert.id"
          class="toast-card"
          :class="getAlertClass(alert.type)"
        >
          <div class="toast-content">
            <div class="toast-icon">
              <CheckCircle v-if="alert.type === 'success'" :size="20" />
              <AlertCircle v-else-if="alert.type === 'error'" :size="20" />
              <AlertTriangle v-else-if="alert.type === 'warning'" :size="20" />
              <Info v-else :size="20" />
            </div>
            <div class="toast-text">
              <h3 v-if="alert.title" class="toast-title">
                {{ alert.title }}
              </h3>
              <p class="toast-message">
                {{ alert.message }}
              </p>
            </div>
            <button 
              @click="store.removeAlert(alert.id)" 
              class="toast-close"
            >
              <X :size="16" />
            </button>
          </div>
          <!-- Progress Bar -->
          <div class="toast-progress-track">
            <div class="toast-progress-bar" :class="getProgressClass(alert.type)"></div>
          </div>
        </div>
      </TransitionGroup>
    </div>

    <!-- Confirmation Modal (centered with backdrop) -->
    <Transition name="confirm">
      <div 
        v-if="store.confirmState.show" 
        class="confirm-overlay"
      >
        <div 
          class="confirm-card"
          :class="store.confirmState.type === 'danger' ? 'confirm-danger' : 'confirm-info'"
        >
          <div class="confirm-content">
            <div class="confirm-icon">
              <AlertTriangle v-if="store.confirmState.type === 'danger' || store.confirmState.type === 'warning'" :size="28" />
              <HelpCircle v-else :size="28" />
            </div>
            <div class="confirm-text">
              <h3 class="confirm-title">
                {{ store.confirmState.title }}
              </h3>
              <p class="confirm-message">
                {{ store.confirmState.message }}
              </p>
            </div>
          </div>
          <div class="confirm-actions">
            <button 
              @click="store.resolveConfirm(false)"
              class="confirm-btn confirm-btn-cancel"
            >
              {{ store.confirmState.cancelText }}
            </button>
            <button 
              @click="store.resolveConfirm(true)"
              class="confirm-btn confirm-btn-confirm"
              :class="store.confirmState.type === 'danger' ? 'confirm-btn-danger' : 'confirm-btn-primary'"
            >
              {{ store.confirmState.confirmText }}
            </button>
          </div>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup>
import { useAlertStore } from '../../stores/alert';
import { CheckCircle, AlertCircle, AlertTriangle, Info, X, HelpCircle } from 'lucide-vue-next';

const store = useAlertStore();

const getAlertClass = (type) => {
  const classes = {
    success: 'toast-success',
    error: 'toast-error',
    warning: 'toast-warning',
    info: 'toast-info'
  };
  return classes[type] || 'toast-info';
};

const getProgressClass = (type) => {
  const classes = {
    success: 'progress-success',
    error: 'progress-error',
    warning: 'progress-warning',
    info: 'progress-info'
  };
  return classes[type] || 'progress-info';
};
</script>

<style scoped>
/* Container */
.alert-container {
  position: fixed;
  top: 1.5rem;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10000;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  pointer-events: none;
  width: 100%;
  max-width: 28rem;
  gap: 0.75rem;
}

.toast-wrapper {
  display: flex;
  flex-direction: column;
  gap: 0.75rem;
  width: 100%;
  pointer-events: auto;
}

/* Toast Card - Diseño moderno plano */
.toast-card {
  position: relative;
  width: 100%;
  border-radius: 0.75rem;
  overflow: hidden;
  box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15), 
              0 4px 10px rgba(0, 0, 0, 0.1);
  backdrop-filter: blur(10px);
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.toast-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2), 
              0 5px 15px rgba(0, 0, 0, 0.12);
}

/* Colores institucionales planos */
.toast-success {
  background: linear-gradient(135deg, #43a047 0%, #388e3c 100%);
  color: white;
}

.toast-error {
  background: linear-gradient(135deg, #e53935 0%, #c62828 100%);
  color: white;
}

.toast-warning {
  background: linear-gradient(135deg, #fb8c00 0%, #f57c00 100%);
  color: white;
}

.toast-info {
  background: linear-gradient(135deg, #00426b 0%, #003050 100%);
  color: white;
}

/* Content */
.toast-content {
  display: flex;
  align-items: flex-start;
  gap: 0.875rem;
  padding: 1rem 1.25rem;
  position: relative;
  z-index: 1;
}

.toast-icon {
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 2rem;
  height: 2rem;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.2);
  color: white;
}

.toast-text {
  flex: 1;
  min-width: 0;
}

.toast-title {
  font-size: 0.875rem;
  font-weight: 600;
  margin: 0 0 0.25rem 0;
  color: white;
  letter-spacing: -0.01em;
}

.toast-message {
  font-size: 0.8125rem;
  line-height: 1.5;
  margin: 0;
  color: rgba(255, 255, 255, 0.95);
  word-wrap: break-word;
}

.toast-close {
  flex-shrink: 0;
  background: rgba(255, 255, 255, 0.15);
  border: none;
  color: white;
  width: 1.75rem;
  height: 1.75rem;
  border-radius: 0.375rem;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.2s ease;
  padding: 0;
}

.toast-close:hover {
  background: rgba(255, 255, 255, 0.25);
  transform: scale(1.05);
}

/* Progress Bar Track */
.toast-progress-track {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: rgba(0, 0, 0, 0.15);
  overflow: hidden;
}

/* Progress Bar Animation */
.toast-progress-bar {
  height: 100%;
  width: 100%;
  transform-origin: left;
  animation: progressShrink 5s linear forwards;
}

.progress-success {
  background: rgba(255, 255, 255, 0.9);
}

.progress-error {
  background: rgba(255, 255, 255, 0.9);
}

.progress-warning {
  background: rgba(255, 255, 255, 0.9);
}

.progress-info {
  background: rgba(255, 255, 255, 0.9);
}

@keyframes progressShrink {
  from {
    transform: scaleX(1);
  }
  to {
    transform: scaleX(0);
  }
}

/* Animations */
.toast-enter-active {
  transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
}

.toast-leave-active {
  transition: all 0.3s cubic-bezier(0.4, 0, 1, 1);
}

.toast-enter-from {
  opacity: 0;
  transform: translateY(-20px) scale(0.95);
}

.toast-leave-to {
  opacity: 0;
  transform: translateX(100%) scale(0.9);
}

.toast-move {
  transition: transform 0.3s ease;
}

/* Fade transition for modal */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* Confirmation Alert Styles */
.confirm-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.75);
  backdrop-filter: blur(8px);
  z-index: 10001; /* Higher than toasts */
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 1rem;
  pointer-events: auto;
}

.confirm-card {
  width: 100%;
  max-width: 28rem;
  border-radius: 1rem;
  overflow: hidden;
  box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4), 
              0 10px 20px rgba(0, 0, 0, 0.25);
  backdrop-filter: blur(10px);
  animation: confirmPulse 0.3s ease-out;
  transform: scale(1);
}

.confirm-danger {
  background: linear-gradient(135deg, #e53935 0%, #c62828 100%);
  color: white;
}

.confirm-info {
  background: linear-gradient(135deg, #00426b 0%, #003050 100%);
  color: white;
}

.confirm-content {
  display: flex;
  align-items: flex-start;
  gap: 1.25rem;
  padding: 1.75rem 2rem;
}

.confirm-icon {
  flex-shrink: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 3rem;
  height: 3rem;
  border-radius: 50%;
  background: rgba(255, 255, 255, 0.2);
  color: white;
}

.confirm-text {
  flex: 1;
  min-width: 0;
}

.confirm-title {
  font-size: 1.125rem;
  font-weight: 600;
  margin: 0 0 0.625rem 0;
  color: white;
  letter-spacing: -0.01em;
}

.confirm-message {
  font-size: 0.9375rem;
  line-height: 1.6;
  margin: 0;
  color: rgba(255, 255, 255, 0.95);
  word-wrap: break-word;
}

.confirm-actions {
  display: flex;
  justify-content: flex-end;
  gap: 0.875rem;
  padding: 1.25rem 2rem 1.75rem;
  background: rgba(0, 0, 0, 0.15);
  border-top: 1px solid rgba(255, 255, 255, 0.15);
}

.confirm-btn {
  padding: 0.75rem 1.5rem;
  border-radius: 0.5rem;
  font-size: 0.9375rem;
  font-weight: 500;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
  outline: none;
  min-width: 5rem;
}

.confirm-btn-cancel {
  background: rgba(255, 255, 255, 0.15);
  color: white;
  border: 1px solid rgba(255, 255, 255, 0.3);
}

.confirm-btn-cancel:hover {
  background: rgba(255, 255, 255, 0.25);
  transform: translateY(-1px);
}

.confirm-btn-confirm {
  color: white;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
}

.confirm-btn-danger {
  background: rgba(255, 255, 255, 0.95);
  color: #c62828;
  font-weight: 600;
}

.confirm-btn-danger:hover {
  background: white;
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

.confirm-btn-primary {
  background: rgba(255, 255, 255, 0.95);
  color: #003050;
  font-weight: 600;
}

.confirm-btn-primary:hover {
  background: white;
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

/* Confirm Animation */
.confirm-enter-active {
  transition: all 0.3s cubic-bezier(0.34, 1.56, 0.64, 1);
}

.confirm-leave-active {
  transition: all 0.25s cubic-bezier(0.4, 0, 1, 1);
}

.confirm-enter-from {
  opacity: 0;
}

.confirm-enter-from .confirm-card {
  transform: scale(0.9) translateY(-20px);
}

.confirm-leave-to {
  opacity: 0;
}

.confirm-leave-to .confirm-card {
  transform: scale(0.95);
}

@keyframes confirmPulse {
  0% {
    transform: scale(0.92);
  }
  50% {
    transform: scale(1.02);
  }
  100% {
    transform: scale(1);
  }
}
</style>
