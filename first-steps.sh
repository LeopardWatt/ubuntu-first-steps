#!/bin/bash
# Created for using with Ubuntu Distro 18.04+
# Version 1.0.0
# First steps
sudo apt update && sudo apt upgrade
echo "system is updated"
# Installing apps
sudo apt install mc htop ncdu mcedit git -y
echo "Apps installed"
# Installing Docker environment 
# step 1
sudo apt update \
sudo apt install \
ca-certificates \
curl \
gnupg \
lsb-release
echo "step 1"
#step 2
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "step 2"
#step 3
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "step 3"
#step 4
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose docker-compose-plugin -y
echo "step 4"
# step 5
sudo groupadd docker
sudo usermod -aG docker $USER
echo "step 5"
echo "Docker installed"
# Installing Portainer
# step 1
sudo docker volume create portainer_data
echo "step 1p"
# step 2
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
echo "step 2p"
echo "Portainer installed"
exit