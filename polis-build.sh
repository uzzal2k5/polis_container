#!/usr/bin/env bash
repo=(polisserver polisClientAdmin polisClientParticipation polismath)
cd ..
for i in ${repo[@]} ;
do

git clone https://github.com/uzzal2k5/$i.git

done
cp polis_container/docker-compose-build.yml .
docker-compose -f docker-compose-build.yml up -d

