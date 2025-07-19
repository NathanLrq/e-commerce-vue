# Builder Node.js
FROM node:18-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev

# Image finale sécurisée
FROM node:18-alpine

# Créer un utilisateur non-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY . .

# Environnement de production
ENV NODE_ENV=production

# Exécuter en tant que non-root
USER appuser

EXPOSE 3001

CMD ["node", "src/app.js"]
