#!/bin/bash
set -e  # Exit on errors

echo "Starting server setup..."

# Ensure git is installed
if ! command -v git &> /dev/null; then
    echo "Installing Git..."
    sudo apt update -y && sudo apt install -y git
fi

# Clone the repo if not already present
if [ ! -d "/srv/.git" ]; then
    echo "Cloning the vps-setup repository..."
    sudo git clone https://github.com/Hakira-Shymuy/vps-setup.git /srv/
else
    echo "Repository already exists. Pulling latest changes..."
    cd /srv/
    sudo git pull origin main
fi

echo "Running server setup..."
# sudo bash /srv/scripts/setup-server.sh

echo "VPS Setup Complete!"

echo "Server setup complete!"