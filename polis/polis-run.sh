#!/usr/bin/env bash
docker rm $(docker stop $(docker ps -qa))
docker run -itd --name polisdb -p 5432:5432 uzzal2k5/polis_postgresql:1.0
docker run -itd --name server -p 5000:5000 -e STATIC_FILES_HOST=172.17.0.4 -e DATABASE_URL=postgres://polis:polis@172.17.0.2:5432/polis uzzal2k5/polis_server:latest

docker run -itd --name clientadmin -p 5002:5002 -e SERVICE_URL=http://172.17.0.3 uzzal2k5/polis_clientadmin:latest
docker run -itd --name clientparticipant -p 5001:5001 -p 8000:8000 -e SERVICE_URL=http://172.17.0.3 uzzal2k5/polis_clientparticipation:latest
docker run -itd --name math -p 8080:8080 -e SERVICE_URL=http://polisserver_ip -e DATABASE_URL=postgres://polis:polis@polisdb:5432/polis uzzal2k5/polis_math:1.0



docker run -itd --name server -p 5000:5000 -e STATIC_FILES_HOST=clientadmin -e DATABASE_URL=postgres://polis:polis@polisdb:5432/polis uzzal2k5/polis_server:1.0

docker run -itd --name server3 -p 5050:5000 -e STATIC_FILES_HOST=172.17.0.4 -e DATABASE_URL=postgres://polis:polis@172.17.0.2:5432/polis polis_server:latest
docker run -itd --name clientadmin2 -p 5005:5002 -e SERVICE_URL=http://172.17.0.6 polis_clientadmin:latest
