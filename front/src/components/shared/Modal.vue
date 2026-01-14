<template>
  <Teleport to="body">
    <Transition name="modal">
      <div 
        v-if="show" 
        class="modal-overlay"
        @click="closeOnBackdrop ? emit('close') : null"
      >
        <div 
          class="modal-content custom-scrollbar"
          :class="maxWidthClass"
          @click.stop
        >
          <!-- Header -->
          <div class="modal-header">
            <h2 class="text-xl font-bold text-gray-800 tracking-tight">
              {{ title }}
            </h2>
            <button 
              @click="emit('close')" 
              class="text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-full p-1 transition-colors"
            >
              <X :size="20" />
            </button>
          </div>
          
          <!-- Content -->
          <div class="modal-body">
            <slot></slot>
          </div>

          <!-- Footer -->
          <div v-if="$slots.footer" class="modal-footer">
            <slot name="footer"></slot>
          </div>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<script setup>
import { computed } from 'vue';
import { X } from 'lucide-vue-next';

const props = defineProps({
  show: {
    type: Boolean,
    default: false
  },
  title: {
    type: String,
    default: ''
  },
  maxWidth: {
    type: String,
    default: '2xl' // sm, md, lg, xl, 2xl, 3xl, 4xl, full
  },
  closeOnBackdrop: {
    type: Boolean,
    default: true
  }
});

const emit = defineEmits(['close']);

const maxWidthClass = computed(() => {
  const widths = {
    'sm': 'max-w-sm',
    'md': 'max-w-md',
    'lg': 'max-w-lg',
    'xl': 'max-w-xl',
    '2xl': 'max-w-2xl',
    '3xl': 'max-w-3xl',
    '4xl': 'max-w-4xl',
    'full': 'max-w-full'
  };
  return widths[props.maxWidth] || 'max-w-2xl';
});
</script>

<style scoped>

.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(0, 0, 0, 0.75); /* Darker backdrop */
  backdrop-filter: blur(8px); /* Blurrier background */
  z-index: 9950;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 1.5rem;
}

.modal-content {
  background-color: white;
  border-radius: 1rem; /* rounded-2xl */
  box-shadow: 0 0 0 1px rgba(255, 255, 255, 0.1), 0 25px 50px -12px rgba(0, 0, 0, 0.5); 
  width: auto; /* Allow auto width */
  min-width: min(100%, 400px); /* Minimum reasonable width */
  max-width: 90vw; /* Never wider than viewport */
  max-height: 85vh;
  display: flex;
  flex-direction: column;
  transform: scale(1);
  overflow: hidden;
  position: relative;
  /* Optional: Add a subtle border for contrast */
  border: 1px solid rgba(0,0,0,0.05);
}

/* Explicit widths mapped from props using pure CSS if needed, 
   but we rely on classes injected by Vue for specific max-widths.
   Here we ensure they work with centered layout */
.modal-content.max-w-sm { width: 100%; max-width: 24rem; }
.modal-content.max-w-md { width: 100%; max-width: 28rem; }
.modal-content.max-w-lg { width: 100%; max-width: 32rem; }
.modal-content.max-w-xl { width: 100%; max-width: 36rem; }
.modal-content.max-w-2xl { width: 100%; max-width: 42rem; }
.modal-content.max-w-3xl { width: 100%; max-width: 48rem; }
.modal-content.max-w-4xl { width: 100%; max-width: 56rem; }
.modal-content.max-w-full { width: 100%; max-width: 100%; }


.modal-header {
  padding: 1.25rem 1.5rem;
  /* Premium Header Gradient */
  background: white;
  border-bottom: 1px solid #e5e7eb;
  display: flex;
  justify-content: space-between;
  align-items: center;
  position: relative;
}

.modal-header h2 {
  font-size: 1.25rem; /* text-xl */
  font-weight: 600;
  color: #111827; /* text-gray-900 */
  letter-spacing: -0.025em; /* tracking-tight */
  margin: 0;
}

.modal-body {
  padding: 1.5rem 2rem;
  overflow-y: auto;
  line-height: 1.5;
  color: #374151; /* text-gray-700 */
}

.modal-footer {
  padding: 1.25rem 1.5rem;
  border-top: 1px solid #e5e7eb;
  background-color: #f9fafb; /* bg-gray-50 */
  display: flex;
  justify-content: flex-end;
  gap: 1rem;
}

/* Animations */
.modal-enter-active,
.modal-leave-active {
  transition: opacity 0.3s ease;
}

.modal-enter-active .modal-content,
.modal-leave-active .modal-content {
  transition: transform 0.3s ease;
}

.modal-enter-from,
.modal-leave-to {
  opacity: 0;
}

.modal-enter-from .modal-content,
.modal-leave-to .modal-content {
  transform: scale(0.95) translateY(10px);
}

.custom-scrollbar::-webkit-scrollbar {
  width: 8px;
}

.custom-scrollbar::-webkit-scrollbar-track {
  background: transparent;
}

.custom-scrollbar::-webkit-scrollbar-thumb {
  background-color: #cbd5e1;
  border-radius: 4px;
}

.custom-scrollbar::-webkit-scrollbar-thumb:hover {
  background-color: #94a3b8;
}
</style>
