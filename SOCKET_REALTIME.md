# 🔄 Actualización en Tiempo Real con Socket.io

## ✅ Implementación Completada

El dashboard de administración ahora se actualiza **automáticamente en tiempo real** cuando cambian los datos de las peticiones.

## 📋 Cómo Funciona

### Backend (Node.js + Socket.io)

1. **Servidor Socket.io** configurado en `server.js`
2. **Eventos emitidos** cuando se modifican peticiones:
   - `acceptRequest()` - Cuando se acepta una petición
   - `rejectRequest()` - Cuando se rechaza una petición
   - `deleteRequest()` - Cuando se elimina una petición
   - `updateRequest()` - Cuando se actualiza una petición

### Frontend (Vue 3 + Socket.io Client)

1. **Servicio Socket.io** (`socketService.js`) gestiona la conexión
2. **PanelAdmin.vue** escucha el evento `stats_updated`
3. **Actualización automática** de estadísticas cuando llega el evento

## 🎯 Eventos en Tiempo Real

Cuando un administrador realiza cualquiera de estas acciones:

- ✅ Acepta una petición
- ❌ Rechaza una petición
- 🗑️ Elimina una petición
- ✏️ Edita una petición

**Todos los dashboards abiertos se actualizan automáticamente** sin necesidad de recargar la página.

## 🔧 Instalación

### Backend

```bash
cd back
npm install socket.io
```

### Frontend

```bash
cd front
npm install socket.io-client
```

## 📊 Datos Actualizados en Tiempo Real

- **Total Peticions** - Contador total
- **Assignades** - Peticiones aceptadas
- **Pendents** - Peticiones pendientes
- **Centres Actius** - Centros activos
- **Tallers Més Sol·licitats** - Top talleres

## 🚀 Uso

No se requiere ninguna acción adicional. El sistema funciona automáticamente:

1. Abre el dashboard de admin
2. Socket.io se conecta automáticamente
3. Los cambios se reflejan en tiempo real
4. Al cerrar la página, la conexión se limpia automáticamente

## 🔍 Debugging

Para ver los eventos en consola:

- **Frontend**: Abre DevTools → Console
- **Backend**: Verás logs cuando se emiten eventos

Mensajes que verás:

- `✅ Conectado a Socket.io: [socket-id]`
- `📊 Actualizando estadísticas en tiempo real...`
- `❌ Desconectado de Socket.io`

## 📝 Notas Técnicas

- **Reconexión automática**: Si se pierde la conexión, Socket.io reintenta automáticamente
- **Transporte**: WebSocket con fallback a polling
- **Limpieza**: Los listeners se eliminan cuando se desmonta el componente
- **Performance**: Solo se actualizan los datos cuando hay cambios reales
