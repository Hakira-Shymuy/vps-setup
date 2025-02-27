#!/bin/bash
set -e  # Exit on errors

echo "Starting server setup..."

# Ensure git is installed
if ! command -v git &> /dev/null; then
    echo "Installing Git..."
    sudo apt update -y && sudo apt install -y git
fi

TEMP_DIR="/tmp/vps-setup"
TARGET_DIR="/srv"

if [ -d "$TEMP_DIR" ]; then
    echo "Directory $TEMP_DIR already exists. Removing it."
    sudo rm -rf "$TEMP_DIR"
fi

# Clone the repo if not already present
echo "Cloning the vps-setup repository..."
sudo git clone https://github.com/Hakira-Shymuy/vps-setup.git "$TEMP_DIR"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating /srv/ directory..."
    sudo mkdir -p "$TARGET_DIR"
fi

# Move only the CONTENTS of the "srv" folder into /srv/
sudo rsync -av "$TEMP_DIR/srv/" "$TARGET_DIR/"
# echo "Changing directory files to /srv/..."
# if [ ! -d "/srv/" ]; then
#     echo "Creating /srv/ directory..."
#     sudo mkdir /srv/
# fi

sudo mv -T "$TEMP_DIR/srv/" /srv

# Clean up
echo "Cleaning up..."
sudo rm -rf "$TEMP_DIR"

echo "Running docker script..."
sudo bash /srv/scripts/docker.sh

echo "Running vim script..."
sudo bash /srv/scripts/vim.sh

echo "Server Setup Complete!"