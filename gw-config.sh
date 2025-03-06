#!/bin/bash
set -euo pipefail

echo "Starting system configuration..."

# Actualización del sistema
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

# Instalación de paquetes esenciales
echo "Installing essential packages..."
sudo apt install -y vim cutecom fail2ban

# Instalación de Oh My Bash
echo "Installing Oh My Bash..."
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" || {
    echo "Oh My Bash installation failed"
    exit 1
}

# Configuración de Vim
echo "Setting up Vim environment..."
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
bash ~/.vim_runtime/install_awesome_vimrc.sh

# Plugins de Vim
echo "Installing Vim plugins..."
PLUGINS=(
    "airblade/vim-gitgutter"
    "pangloss/vim-javascript"
    "tpope/vim-jdaddy"
    "scrooloose/nerdcommenter"
    "MTDL9/vim-log-highlighting"
)

for plugin in "${PLUGINS[@]}"; do
    dir_name=$(basename "$plugin")
    if [ ! -d "~/.vim_runtime/my_plugins/$dir_name" ]; then
        git clone --depth=1 "https://github.com/$plugin.git" "~/.vim_runtime/my_plugins/$dir_name"
    fi
done

# Configuración personalizada de Vim
echo "Applying custom Vim configuration..."
curl -fsSLo ~/.vim_runtime/my_configs.vim https://gist.githubusercontent.com/branny-dev/141770d40dd364403555e85304201ca7/raw/f53157986a9fa661dbaf66a79c2b786537f7b7c1/my_configs.vim

# Configuración de zona horaria
echo "Setting timezone to America/Guayaquil..."
sudo timedatectl set-timezone America/Guayaquil

# Instalación de Docker
echo "Installing Docker..."
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker "$USER"

# Aplicar configuraciones
echo "Applying environment changes..."
source ~/.bashrc

echo "Configuration completed successfully."
echo "Please reboot the system to apply all changes:"
echo "  sudo reboot"
