#!/bin/bash

MEM_START="4G"
MEM_MAX="4G"

echo "🚀 Iniciando servidor de Hytale..."

# Asegúrate de que la ruta a Assets.zip sea correcta. 
# Si el archivo está en la raíz, usa ../Assets.zip desde la carpeta Server
java -Xms$MEM_START -Xmx$MEM_MAX \
     --enable-native-access=ALL-UNNAMED \
     -XX:+UseG1GC \
     -jar Server/HytaleServer.jar \
     --assets ./Assets.zip
     --ip 0.0.0.0 \
     --port 5520