#!/bin/bash

set -e

echo "🚀 Установка nvim-ruby-ide..."
echo ""

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Определяем ОС
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="UNKNOWN:${OS}"
esac

echo -e "${GREEN}Обнаружена ОС: ${MACHINE}${NC}"

# Проверка Neovim
if ! command -v nvim &> /dev/null; then
    echo -e "${RED}❌ Neovim не найден.${NC}"
    if [[ "$MACHINE" == "Mac" ]]; then
        echo "  Установка: brew install neovim"
    elif [[ "$MACHINE" == "Linux" ]]; then
        echo "  Установка: sudo apt install neovim (Debian/Ubuntu)"
        echo "            sudo dnf install neovim (Fedora)"
        echo "            sudo pacman -S neovim (Arch)"
    fi
    exit 1
fi

echo -e "${GREEN}✅ Neovim найден: $(nvim --version | head -n1)${NC}"

# Проверка ripgrep
if ! command -v rg &> /dev/null; then
    echo -e "${YELLOW}⚠️  ripgrep не найден.${NC}"
    read -p "Установить ripgrep? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if [[ "$MACHINE" == "Mac" ]]; then
            brew install ripgrep
        elif [[ "$MACHINE" == "Linux" ]]; then
            if command -v apt &> /dev/null; then
                sudo apt install ripgrep
            elif command -v dnf &> /dev/null; then
                sudo dnf install ripgrep
            elif command -v pacman &> /dev/null; then
                sudo pacman -S ripgrep
            fi
        fi
    fi
fi

# Проверка fd
if ! command -v fd &> /dev/null; then
    echo -e "${YELLOW}⚠️  fd не найден.${NC}"
    read -p "Установить fd? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if [[ "$MACHINE" == "Mac" ]]; then
            brew install fd
        elif [[ "$MACHINE" == "Linux" ]]; then
            if command -v apt &> /dev/null; then
                sudo apt install fd-find
                # На Ubuntu/Debian fd называется fdfind
                sudo ln -s $(which fdfind) /usr/local/bin/fd 2>/dev/null || true
            elif command -v dnf &> /dev/null; then
                sudo dnf install fd-find
            elif command -v pacman &> /dev/null; then
                sudo pacman -S fd
            fi
        fi
    fi
fi

# Бэкап
if [ -d "$HOME/.config/nvim" ]; then
    BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
    echo -e "${YELLOW}📦 Бэкап: $BACKUP_DIR${NC}"
    mv "$HOME/.config/nvim" "$BACKUP_DIR"
fi

# Клонирование
echo -e "${GREEN}📥 Клонируем репозиторий...${NC}"
git clone https://github.com/leva84/nvim_ruby_ide.git "$HOME/.config/nvim"

# Ruby LSP
echo -e "${GREEN}💎 Установка Ruby LSP...${NC}"
if command -v gem &> /dev/null; then
    gem install ruby-lsp
else
    echo -e "${YELLOW}⚠️  Ruby не найден. Установи Ruby и запусти: gem install ruby-lsp${NC}"
fi

echo ""
echo -e "${GREEN}✅ Установка завершена!${NC}"
echo "Запусти: nvim"

