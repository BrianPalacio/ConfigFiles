#!/bin/bash

set -e

echo "🌟 Starting full system configuration..."

# ---------------------------------------------------
# 1. Confirm yay is available
# ---------------------------------------------------
if ! command -v yay &> /dev/null; then
  echo "❌ 'yay' is required but not installed."
  echo "Install yay manually first: https://github.com/Jguer/yay"
  exit 1
fi

# ---------------------------------------------------
# 2. Install required packages
# ---------------------------------------------------
echo "📦 Installing required packages..."

yay -S --noconfirm \
  btop \
  dolphin \
  hyprland \
  kitty \
  ml4w \
  nautilus \
  neofetch \
  nvim \
  warp-terminal-bin \
  waybar \
  waypaper \
  zsh \
  nordic-theme \
  ttf-jetbrains-mono-nerd \
  unzip \
  curl \
  git

# ---------------------------------------------------
# 3. Apply configuration files
# ---------------------------------------------------
echo "🛠️  Copying configuration files..."

mkdir -p ~/.config

cp -r .config/* ~/.config/
cp .zshrc ~/.zshrc
cp .bashrc ~/.bashrc

# ---------------------------------------------------
# 4. Set zsh as default shell
# ---------------------------------------------------
if [[ "$SHELL" != *"zsh" ]]; then
  echo "🐚 Changing default shell to zsh..."
  chsh -s "$(which zsh)"
fi

# ---------------------------------------------------
# 5. Install Fonts
# ---------------------------------------------------
echo "🔤 Installing fonts..."

mkdir -p ~/.local/share/fonts
cp -r fonts/* ~/.local/share/fonts
fc-cache -fv

# ---------------------------------------------------
# 6. Set up Neovim with Lazy + Nord
# ---------------------------------------------------
echo "📘 Setting up Neovim plugins with Lazy..."

NVIM_DIR="$HOME/.config/nvim"
LAZY_DIR="$NVIM_DIR/lazy"

mkdir -p "$NVIM_DIR"

# Only set up Lazy if not already done
if [ ! -d "$NVIM_DIR/lazy" ]; then
  git clone https://github.com/folke/lazy.nvim "$NVIM_DIR/lazy"
fi

# Optional: validate/init nvim plugins
nvim --headless "+Lazy! sync" +qa

# ---------------------------------------------------
# 7. Finish
# ---------------------------------------------------
echo "✅ Dotfiles and setup complete!"
echo "You can now reboot or log out and log back in to apply everything."

read -p "🔄 Would you like to reboot now? [y/N] " reboot_choice
if [[ "$reboot_choice" =~ ^[Yy]$ ]]; then
  reboot
fi

