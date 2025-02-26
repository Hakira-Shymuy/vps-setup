#!/bin/bash
set -e  # Exit on errors

echo "Installing Vim..."
sudo apt update -y
sudo apt install -y vim


echo "Setting Vim as the default editor..."
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100
sudo update-alternatives --set editor /usr/bin/vim

echo "Applying recommended Vim settings..."

cat <<EOF > ~/.vimrc
set number          " Show line numbers
syntax on          " Enable syntax highlighting
set tabstop=4      " Set tab width to 4 spaces
set shiftwidth=4   " Set indentation to 4 spaces
set autoindent     " Auto-indent new lines
set clipboard=unnamedplus " Use system clipboard
EOF

echo "Vim installation and configuration complete!"