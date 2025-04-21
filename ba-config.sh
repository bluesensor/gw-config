#!/bin/bash -i

# Update APT package repository.
sudo apt update

# Upgrade APT packages.
sudo apt upgrade -y

# Install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Install vim 
sudo apt install vim -y

# Install Ultimate-vim
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# Install Plugins
echo "Installing plugins..."
git clone https://github.com/airblade/vim-gitgutter ~/.vim_runtime/my_plugins/vim-gitgutter
git clone https://github.com/pangloss/vim-javascript.git ~/.vim_runtime/my_plugins/vim-javascript.git
git clone https://github.com/tpope/vim-jdaddy.git ~/.vim_runtime/my_plugins/vim-jdaddy.git
#git clone https://github.com/Yggdroot/indentLine.git ~/.vim_runtime/my_plugins/indentLine.git
git clone https://github.com/scrooloose/nerdcommenter.git ~/.vim_runtime/my_plugins/nerdcommenter.git
git clone https://github.com/MTDL9/vim-log-highlighting.git ~/.vim_runtime/my_plugins/vim-log-highlighting.git
#git clone https://github.com/leafgarland/typescript-vim.git ~/.vim_runtime/my_plugins/typescript-vim.git

curl -o ~/.vim_runtime/my_configs.vim https://gist.githubusercontent.com/branny-dev/141770d40dd364403555e85304201ca7/raw/f53157986a9fa661dbaf66a79c2b786537f7b7c1/my_configs.vim

# timedatectl show
# sudo timedatectl set-timezone America/Guayaquil
# timedatectl list-timezones

# Install docker.
curl -sSL https://get.docker.com | sudo sh

# Add pi user to docker group.
sudo usermod -aG docker bs

echo "Execution completed."
echo "Reboot..."

sudo reboot

#Blueacoustic Shellhub-agent install (bluesensor)
# curl "https://cloud.shellhub.io/install.sh?tenant_id=fe9db089-03ba-45e3-b322-e8e4dc1cafe3" | sh
