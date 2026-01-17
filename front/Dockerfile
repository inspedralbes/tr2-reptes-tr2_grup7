# Dockerfile en la carpeta 'frontend/'
# --- Etapa 1: Compilación de la aplicación Vue.js ---
FROM node:20-alpine as build
WORKDIR /app
COPY package*.json ./

# Recibimos el argumento de construcción (pasa desde docker-compose.prod.yml)
ARG VITE_API_URL
# Lo establecemos como variable de entorno durante el build
ENV VITE_API_URL=$VITE_API_URL

RUN npm install
COPY . .
RUN npm run build # Asume que tu script de build genera los archivos estáticos en '/app/dist'

# --- Etapa 2: Servir con Nginx (Servidor de Producción) ---
FROM nginx:alpine as production
# Copia la configuración personalizada de Nginx (si la tienes, para Vue Router 'history mode')
# COPY nginx.conf /etc/nginx/conf.d/default.conf
# Copia los archivos estáticos compilados de la etapa 'build'
COPY --from=build /app/dist /usr/share/nginx/html
# Nginx expone el puerto 80 por defecto
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]