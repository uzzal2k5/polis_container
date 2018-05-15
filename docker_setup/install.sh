#!/bin/bash
# Maintainer uzzal2k5@gmail.com
# Update apt package
apt-get update -y

# allow package on Repository
apt-get install -y apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Add Repositories
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update and Install

apt-get update -y
apt-get install -y docker-ce
systemctl enable docker
systemctl start docker

# Install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# Test Compose
docker-compose --version

# Install Docker Swarm
systemctl diable firewalld
systemctl stop firewalld

# Install  Docker Swarm
docker swarm init --advertise-addr 127.0.0.1


