#!/bin/bash

# 1. Definir variables de memoria
# Xms es la memoria inicial, Xmx es la máxima
MEM_START="4G"
MEM_MAX="4G"

# 2. Comando de ejecución
echo "🚀 Iniciando servidor de Hytale en Codespaces..."

java -Xms$MEM_START -Xmx$MEM_MAX \
     -XX:+UseG1GC \
     -jar Server/HytaleServer.jar \
     --assets Assets.zip \
     --port 5520 \
     --data ./world_data

# Nota: El flag --data enviará los mapas a una carpeta específica