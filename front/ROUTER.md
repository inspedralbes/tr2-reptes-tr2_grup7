# Rutas de la Aplicación

La aplicación ahora usa **Vue Router** para la navegación entre vistas.

## Estructura de Rutas

### Centro Educativo (`/centro`)
- `/centro/panel` - Panel principal del centro
- `/centro/catalogo` - Catálogo de talleres disponibles
- `/centro/nueva-peticion` - Formulario para crear nueva petición

### Administración (`/admin`)
- `/admin/panel` - Panel principal de administración
- `/admin/peticiones` - Gestión de todas las peticiones
- `/admin/asignacion` - Herramienta de asignación de profesores

### Profesor (`/profesor`)
- `/profesor/talleres` - Lista de talleres del profesor
- `/profesor/detalle/:id?` - Detalle de un taller específico

## Navegación

La navegación se realiza a través del componente `MainLayout.vue` que incluye:
- **Header superior**: Selector de rol y navegación principal
- **Sidebar izquierdo**: Submenú con las opciones de cada sección
- **Contenido principal**: `<router-view />` que muestra el componente correspondiente

## Componentes por Vista

### Admin
- `views/admin/PanelAdmin.vue`
- `views/admin/GestionPeticiones.vue`
- `views/admin/HerramientaAsignacion.vue`

### Centro
- `views/centre/PanelCentro.vue`
- `views/centre/NuevaPeticion.vue`

### Profesor
- `views/teacher/PanelProfesor.vue`

### Compartidos
- `shared/CatalogoTalleres.vue`
- `shared/DetalleTaller.vue`

## Cómo añadir nuevas rutas

1. Añade la ruta en `/front/src/router/index.js`
2. Actualiza la estructura de navegación en `MainLayout.vue` añadiendo la propiedad `route` a la subsección
3. El componente se cargará automáticamente mediante lazy loading
