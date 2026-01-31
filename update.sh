#!/bin/bash

# Configuración de rutas
DOWNLOADER="./tools/hytale-downloader"
SERVER_ZIP="hytale_server_update.zip"

echo "🔍 Consultando última versión disponible de Hytale..."

# Intentar descargar la última versión
# El CLI detectará si ya tienes la versión 2026.01.28 y no bajará nada si no es necesario
$DOWNLOADER -download-path "$SERVER_ZIP"

if [ -f "$SERVER_ZIP" ]; then
    echo "📦 ¡Nueva actualización descargada! Aplicando cambios..."
    
    # Descomprimir sobreescribiendo archivos del sistema 
    # pero PROTEGIENDO tus datos (mundos, configuraciones y mods)
    unzip -o "$SERVER_ZIP" -x "universe/*" "config.json" "permissions.json" "mods/*" "whitelist.json"
    
    # Limpiar el archivo temporal
    rm "$SERVER_ZIP"
    
    # Dar permisos al ejecutable del servidor
    chmod +x run.sh
    echo "✅ Servidor actualizado con éxito."
else
    echo "🎉 Ya tienes la versión más reciente ($($DOWNLOADER -print-version))."
fi