#!/bin/bash
set -e  # Exit on errors


echo "Updating System ..."
sudo apt update -y && sudo apt upgrade -y

echo "Installing Docker & Docker Compose ..."

echo "Adding Docker's official GPG key"

sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "Adding the repository to Apt sources"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

echo "Installing Docker & Docker Compose ..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

echo "Running Docker Hello World ..."
sudo docker run hello-world

echo "Will delete Hello World container and image"
sudo docker rm $(sudo docker ps -a -q --filter ancestor=hello-world)
sudo docker rmi hello-world -f || true

echo "Done installing Docker!"