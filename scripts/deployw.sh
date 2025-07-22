#!/bin/bash

# === Configuration ===
BASE_DIR="/c/Users/natha/Desktop/Projet_Docker/e-commerce-vue"
SERVICES=("auth-service" "product-service" "order-service")

# === PM2 ===
if ! command -v pm2 &> /dev/null; then
  echo "PM2 n'est pas installé. Installation..."
  npm install -g pm2
fi

# === Lancer les services backend ===
for SERVICE in "${SERVICES[@]}"
do
    SERVICE_PATH="$BASE_DIR/services/$SERVICE"
    if [ -d "$SERVICE_PATH" ]; then
        echo "🔧 Traitement du service: $SERVICE"
        cd "$SERVICE_PATH"
        npm install
        pm2 delete "$SERVICE" || true
        pm2 start npm --name "$SERVICE" -- start
    else
        echo "❌ Dossier manquant : $SERVICE_PATH"
    fi
done

# === Frontend ===
FRONTEND_PATH="$BASE_DIR/frontend"
if [ -d "$FRONTEND_PATH" ]; then
    echo "🎨 Lancement du frontend"
    cd "$FRONTEND_PATH"
    npm install
    pm2 delete "frontend" || true
    pm2 start npm --name "frontend" -- start
else
    echo "❌ Dossier frontend non trouvé : $FRONTEND_PATH"
fi

# === PM2 Save ===
pm2 save
