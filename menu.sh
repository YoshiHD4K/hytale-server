#!/bin/bash

# Colores para que se vea genial
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

show_menu() {
    clear
    echo -e "${CYAN}==========================================${NC}"
    echo -e "${GREEN}   HYTALE SERVER MANAGEMENT MENU        ${NC}"
    echo -e "${CYAN}==========================================${NC}"
    echo -e "1) 🚀 Iniciar Servidor (start.sh)"
    echo -e "2) 🔄 Buscar Actualizaciones (Hytale CLI)"
    echo -e "3) 📦 Ver Versión Instalada"
    echo -e "4) 🛠️  Rebuild Environment (Codespaces)"
    echo -e "5) ❌ Salir"
    echo -e "${CYAN}==========================================${NC}"
    echo -n "Selecciona una opción [1-5]: "
}

while true; do
    show_menu
    read opt
    case $opt in
        1)
            echo -e "${GREEN}🚀 Iniciando servidor...${NC}"
            chmod +x start.sh
            ./start.sh
            break # Sale del menú para entrar a la consola del juego
            ;;
        2)
            echo -e "${YELLOW}🔄 Ejecutando update.sh...${NC}"
            chmod +x update.sh
            ./update.sh
            echo -e "${YELLOW}Presiona Enter para volver al menú...${NC}"
            read
            ;;
        3)
            echo -e "${CYAN}📦 Versión actual de Hytale:${NC}"
            ./tools/hytale-downloader -print-version
            echo -e "${YELLOW}Presiona Enter para volver al menú...${NC}"
            read
            ;;
        4)
            echo -e "${YELLOW}🛠️ Para reconstruir el contenedor, usa el comando de VS Code:${NC}"
            echo -e "Ctrl+Shift+P -> 'Codespaces: Rebuild Container'"
            read
            ;;
        5)
            echo -e "${GREEN}👋 ¡Hasta luego, Tomas!${NC}"
            exit 0
            ;;
        *)
            echo -e "${YELLOW}⚠️ Opción inválida.${NC}"
            sleep 1
            ;;
    esac
done