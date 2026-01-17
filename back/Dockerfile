# Dockerfile en la carpeta 'backend/'
# --- Etapa 1: Instalación de dependencias (para aprovechar la caché) ---
FROM node:20-slim as dependencies
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev 

# --- Etapa 2: Imagen Final de Producción (más ligera) ---
FROM node:20-alpine as production
WORKDIR /app
# Copia las dependencias pre-instaladas
COPY --from=dependencies /app/node_modules ./node_modules
# Copia el código de la aplicación
COPY . .
# Configura el ambiente de producción
ENV NODE_ENV=production
# Puerto de escucha del Back-end
EXPOSE 3000
# Comando de inicio
CMD ["node", "server.js"] 