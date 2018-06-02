#!/usr/bin/env bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-cache policy docker-ce
apt-get install -y docker-ce
systemctl enable docker
systemctl start docker
systemctl status -l  docker
docker swarm init
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version



#sudo ufw allow 2376/tcp && sudo ufw allow 7946/udp && sudo ufw allow 7946/tcp && sudo ufw allow 80/tcp && sudo ufw allow 2377/tcp && sudo ufw allow 4789/udp && sudo ufw allow 22/tcp
#sudo ufw reload && sudo ufw enable


manager 172.31.38.55
node1   172.31.44.162
node2   172.31.21.70
node3   172.31.26.244
node4   13.59.64.43




172.31.0.0/20



docker swarm init --advertise-addr 172.31.38.55
docker swarm join --token SWMTKN-1-55qk4lsepuvsjyrzmkqsutlv62fdaoc47fzo3e4b81yxsa85i8-0rnddksfjljemqt9uahed6l4e 172.31.38.55:2377
docker swarm join --token SWMTKN-1-3x2q47sdrmvb2288r99dv1413w5up2xii6vsnnybumwov0sw6g-a2riippwcdydcwhyhvbjjfp66 172.31.21.200:2377