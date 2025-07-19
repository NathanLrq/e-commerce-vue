# Base
FROM node:18

# Dossier de travail
WORKDIR /app

# Copie des fichiers
COPY package*.json ./
RUN npm install

COPY . .

# Port
EXPOSE 3002

# Commande de lancement
CMD ["npm", "start"]
