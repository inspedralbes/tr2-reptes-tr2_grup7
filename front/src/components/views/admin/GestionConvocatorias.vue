<template>
  <div class="gestion-convocatorias">
    <h1>Gestión de Convocatorias</h1>

    <!-- Sección de Crear Nueva -->
    <div class="card create-card">
      <h2>Abrir Nueva Convocatoria</h2>
      <div v-if="activePeriod" class="warning-msg">
        ⚠️ Ya existe una convocatoria abierta: <strong>{{ activePeriod.name }}</strong>. 
        Debes cerrarla antes de abrir una nueva.
      </div>
      <form v-else @submit.prevent="createPeriod" class="form-create">
        <div class="form-group">
          <label>Nombre:</label>
          <input v-model="newItem.name" type="text" placeholder="Ej: Convocatoria Mayo 2026" required />
        </div>
        <div class="form-group-row">
            <div class="form-group">
            <label>Inicio:</label>
            <input v-model="newItem.start_date" type="datetime-local" required />
            </div>
            <div class="form-group">
            <label>Fin:</label>
            <input v-model="newItem.end_date" type="datetime-local" required />
            </div>
        </div>
        <button type="submit" class="btn-primary">Abrir Convocatoria</button>
      </form>
    </div>

    <!-- Lista de Convocatorias -->
    <div class="card list-card">
      <h2>Historial de Convocatorias</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Inicio</th>
            <th>Fin</th>
            <th>Estado</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="period in periods" :key="period.id_period">
            <td>{{ period.id_period }}</td>
            <td>{{ period.name }}</td>
            <td>{{ formatDate(period.start_date) }}</td>
            <td>{{ formatDate(period.end_date) }}</td>
            <td>
                <span :class="['status-badge', period.status.toLowerCase()]">{{ period.status }}</span>
            </td>
            <td>
              <button 
                v-if="period.status === 'OPEN'" 
                @click="confirmClose(period)" 
                class="btn-danger"
              >
                Cerrar
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      periods: [],
      activePeriod: null,
      newItem: {
        name: '',
        start_date: '',
        end_date: ''
      }
    };
  },
  mounted() {
    this.fetchPeriods();
    this.fetchActivePeriod();
  },
  methods: {
    async fetchPeriods() {
      try {
        const token = sessionStorage.getItem('token') || localStorage.getItem('token');
        const res = await fetch(`${import.meta.env.VITE_API_URL}/periods`, {
            headers: { 'Authorization': `Bearer ${token}` }
        });
        if (!res.ok) throw new Error('Error fetching periods');
        this.periods = await res.json();
      } catch (e) {
        console.error(e);
      }
    },
    async fetchActivePeriod() {
        try {
            const token = sessionStorage.getItem('token') || localStorage.getItem('token');
            const res = await fetch(`${import.meta.env.VITE_API_URL}/periods/active`, {
                headers: { 'Authorization': `Bearer ${token}` }
            });
            if (res.ok) {
                const data = await res.json();
                this.activePeriod = data;
            }
        } catch (e) {
            console.error(e);
        }
    },
    async createPeriod() {
        try {
            const token = sessionStorage.getItem('token') || localStorage.getItem('token');
            const res = await fetch(`${import.meta.env.VITE_API_URL}/periods`, {
                method: 'POST',
                headers: { 
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}` 
                },
                body: JSON.stringify(this.newItem)
            });
            
            if (!res.ok) {
                const err = await res.json();
                alert(err.error || 'Error creando periodo');
                return;
            }

            this.newItem = { name: '', start_date: '', end_date: '' };
            this.fetchPeriods();
            this.fetchActivePeriod();
            alert('Convocatoria creada exitosamente');
        } catch (e) {
            console.error(e);
            alert('Error de conexión');
        }
    },
    async confirmClose(period) {
        if (!confirm(`¿Seguro que quieres cerrar "${period.name}"? \n⚠️ Esto rechazará automáticamente todas las solicitudes pendientes.`)) {
            return;
        }

        try {
            const token = sessionStorage.getItem('token') || localStorage.getItem('token');
            const res = await fetch(`${import.meta.env.VITE_API_URL}/periods/${period.id_period}/close`, {
                method: 'PUT',
                headers: { 'Authorization': `Bearer ${token}` }
            });
            
            const data = await res.json();
            if (!res.ok) {
                alert(data.error || 'Error cerrando');
                return;
            }

            alert(data.message);
            this.fetchPeriods();
            this.fetchActivePeriod();
        } catch (e) {
            console.error(e);
        }
    },
    formatDate(d) {
        if (!d) return '-';
        return new Date(d).toLocaleString();
    }
  }
};
</script>

<style scoped>
.gestion-convocatorias {
  padding: 20px;
}
.card {
  background: white;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  margin-bottom: 20px;
}
.form-group {
  margin-bottom: 15px;
}
.form-group label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
}
.form-group input {
  width: 100%;
  padding: 8px;
  border: 1px solid #ddd;
  border-radius: 4px;
}
.form-group-row {
    display: flex;
    gap: 20px;
}
.btn-primary {
  background: #3498db;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 4px;
  cursor: pointer;
}
.btn-danger {
  background: #e74c3c;
  color: white;
  border: none;
  padding: 5px 10px;
  border-radius: 4px;
  cursor: pointer;
}
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 15px;
}
th, td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #eee;
}
.status-badge {
    padding: 4px 8px;
    border-radius: 12px;
    font-size: 0.85em;
    font-weight: bold;
}
.status-badge.open {
    background: #d4edda;
    color: #155724;
}
.status-badge.closed {
    background: #f8d7da;
    color: #721c24;
}
.warning-msg {
    background: #fff3cd;
    color: #856404;
    padding: 10px;
    border-radius: 4px;
    margin-bottom: 15px;
}
</style>
