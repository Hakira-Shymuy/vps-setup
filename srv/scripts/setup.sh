#!/bin/bash
set -e  # Exit on errors

echo "Starting server setup..."

# Ensure git is installed
if ! command -v git &> /dev/null; then
    echo "Installing Git..."
    sudo apt update -y && sudo apt install -y git
fi

TEMP_DIR="/tmp/vps-setup"

if [ -d "$TEMP_DIR" ]; then
    echo "Directory $TEMP_DIR already exists. Removing it."
    sudo rm -rf "$TEMP_DIR"
fi

# Clone the repo if not already present
echo "Cloning the vps-setup repository..."
sudo git clone https://github.com/Hakira-Shymuy/vps-setup.git "$TEMP_DIR"

# Move only the CONTENTS of the "srv" folder into /srv/
echo "Changing directory files to /srv/..."
sudo mv "$TEMP_DIR/srv/"* /srv/

# Clean up
echo "Cleaning up..."
sudo rm -rf "$TEMP_DIR"

echo "Running server setup..."
sudo bash /srv/scripts/setup.sh

echo "Server Setup Complete!"