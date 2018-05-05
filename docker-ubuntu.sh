#!/usr/bin/env bash
# Install Docker-ce
apt-get update && apt-get install \
apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

apt-get install -y wget curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-get install docker-ce
systemctl enable docker
systemctl start docker

# Install Docker-compose
curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


# Install Docker Swarm
systemctl diable firewalld
systemctl stop firewalld

docker swarm init --advertise-addr 127.0.0.1

# Manage group
#Manage Docker as a non-root user

#sudo groupadd docker
#sudo usermod -aG docker $USER
#sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
#sudo chmod g+rwx "/home/$USER/.docker" -R
