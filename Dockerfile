FROM node:18-alpine

ARG N8N_VERSION=1.97.1

# Dependencias necesarias
RUN apk add --no-cache \
    graphicsmagick \
    tzdata \
    python3 \
    make \
    g++ \
    libc6-compat

# Instala n8n globalmente
RUN npm install -g n8n@${N8N_VERSION}

# Define el working directory
WORKDIR /data

# Expone el puerto por defecto de n8n
EXPOSE 5678

# Variables necesarias para que funcione como root en Railway
ENV N8N_USER_ID=0
ENV N8N_GROUP_ID=0
ENV N8N_PORT=5678

# Comando de inicio
CMD ["n8n"]
