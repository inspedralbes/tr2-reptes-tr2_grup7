# Dockerfile en la carpeta 'backend/'
# --- Etapa 1: Instalación de dependencias (para aprovechar la caché) ---
FROM node:20-slim as dependencies
WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev 

# --- Etapa 2: Imagen Final de Producción (más ligera) ---
# --- Etapa 2: Imagen Final de Producción (Debian Slim para compatibilidad Puppeteer) ---
FROM node:20-slim as production

# Instalar dependencias del sistema para Puppeteer/Chromium
# https://pptr.dev/troubleshooting#chrome-doesnt-launch-on-linux
RUN apt-get update && apt-get install -y \
    chromium \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgcc1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    lsb-release \
    wget \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Configurar Puppeteer para usar Chromium del sistema
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

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