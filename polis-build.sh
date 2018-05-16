#!/usr/bin/env bash
repo=(polisserver polisClientAdmin polisClientParticipation polismath)

for i in ${repo[@]} ;
do
cd ..
git clone https://github.com/uzzal2k5/${repo[i]}.git
done
cd ..
cp polis_container/docker-compose-build.yml .
docker-compose -f docker-compose-build.yml up -d

