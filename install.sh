#!/bin/bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color
RED='\033[0;31m'

read -p "🔄 Do you need backup of current config? (y/n): " backup_choice
if [[ "$backup_choice" == "y" ]]; then
  echo -e "${YELLOW}📦 Creating backup...${NC}"
  if [ -d "$HOME/.config/nvim" ]; then
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak.$(date +%s)"
    echo -e "${GREEN} ✅ Backup created successfully!${NC}"
  else
    echo -e "${BLUE}ℹ️ No existing config found. Skipping backup.${NC}"
  fi
  echo -e "${GREEN} ✅ Success!"
fi

if uname -r | grep -q "WSL"; then
  echo -e "$BLUE Seems like you're using WSL"
  echo -e "$GREEN it's oficially supported, in case of troubles visit README.md"
fi

if ! command -v git &>/dev/null; then
  echo -e "${RED}🚨 ERROR: git is not installed!${NC}"
  echo "🔧 Install it and try again"
  exit 1
else
  git clone https://github.com/marosiak/lazyvim-go-dart ~/.config/nvim
fi

echo -e "${GREEN} 🏁 Configuration successfully installed!"

if ! command -v nvim &>/dev/null; then
  echo -e "${RED}🚨 ERROR: neovim is not installed!${NC}"
  echo "🔧 Install it, then run 'nvim' and have fun :)"
else
  nvim
fi
