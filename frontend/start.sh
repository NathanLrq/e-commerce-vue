#!/bin/sh

echo "Attente des services backend..."
sleep 10

echo "Lancement de Nginx..."
nginx -g "daemon off;"
