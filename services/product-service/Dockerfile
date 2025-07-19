# Build
FROM node:18-alpine AS builder

# Crée un utilisateur non-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY package*.json ./

RUN npm install --omit=dev

COPY . .

COPY .env.production ./
COPY .env.development ./

# Exécution
FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
ENV NODE_ENV=production

USER appuser


EXPOSE 3000

CMD ["node", "src/app.js"]
