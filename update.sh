#!/bin/bash

echo "🔄 Comprobando si hay una nueva versión de Hytale Server..."

# 1. Traer información del repositorio oficial
git fetch upstream main --quiet

# 2. Comparar versiones (Hashes de Git)
LOCAL_VER=$(git rev-parse HEAD)
UPSTREAM_VER=$(git rev-parse upstream/main)

if [ "$LOCAL_VER" != "$UPSTREAM_VER" ]; then
    echo "✨ ¡Nueva versión detectada!"
    
    # Guardar tus mundos y configs locales para que no haya conflictos
    echo "📦 Protegiendo archivos locales (mundos y configs)..."
    git stash
    
    # Descargar lo nuevo
    echo "📥 Descargando actualización..."
    git pull upstream main --rebase
    
    # Restaurar tus archivos
    git stash pop
    
    # Dar permisos al script de arranque
    chmod +x run.sh
    echo "✅ Servidor actualizado correctamente."
else
    echo "🎉 Ya tienes la versión más reciente del servidor."
fi