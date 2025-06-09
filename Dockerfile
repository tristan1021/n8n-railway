FROM node:18-alpine

ARG N8N_VERSION=1.97.1

# Instala dependencias necesarias
RUN apk add --no-cache \
    graphicsmagick \
    tzdata \
    python3 \
    make \
    g++ \
    libc6-compat

# Instala n8n y el nodo de Wassenger
RUN npm_config_user=root \
    npm install --location=global n8n@${N8N_VERSION} n8n-nodes-wassenger

# Define el directorio de trabajo
WORKDIR /data

# Configura variables necesarias para Railway
ENV N8N_USER_ID=0
ENV N8N_GROUP_ID=0
ENV N8N_PORT=5678

EXPOSE 5678

# Comando de inicio
CMD ["n8n"]
