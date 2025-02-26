#!/bin/bash
set -e  # Exit on errors

echo "Starting server setup..."

# Run Docker installation script
if [ -f "/srv/docker.sh" ]; then
    echo "Running Docker setup..."
    sudo bash /srv/docker.sh
else
    echo "Error: docker.sh not found!"
    exit 1
fi

# Run Vim installation script
if [ -f "/srv/vim.sh" ]; then
    echo "Running Vim setup..."
    sudo bash /srv/vim.sh
else
    echo "Error: vim.sh not found!"
    exit 1
fi

echo "Server setup complete!"
