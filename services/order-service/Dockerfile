# Build
FROM node:18-alpine AS builder

# Crée un utilisateur non-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

# Copie et installation sans les dépendances de dev
COPY package*.json ./
RUN npm install --omit=dev

# Copie du code et des fichiers .env
COPY . .
COPY .env.production ./
COPY .env.development ./

# Excution
FROM node:18-alpine

WORKDIR /app

# Copie les fichiers de l'étape précédente
COPY --from=builder /app /app

#Utilisateur non-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
ENV NODE_ENV=production
USER appuser

EXPOSE 3002

CMD ["node", "src/app.js"]
