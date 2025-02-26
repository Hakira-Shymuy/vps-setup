#!/bin/bash
set -e  # Exit on errors

echo "Starting server setup..."

# Run Docker installation script
if [ -f "/srv/scripts/docker.sh" ]; then
    echo "Running Docker setup..."
    sudo bash /srv/scripts/docker.sh
else
    echo "Error: docker.sh not found!"
    exit 1
fi

# Run Vim installation script
if [ -f "/srv/scripts/vim.sh" ]; then
    echo "Running Vim setup..."
    sudo bash /srv/scripts/vim.sh
else
    echo "Error: vim.sh not found!"
    exit 1
fi

echo "Server setup complete!"