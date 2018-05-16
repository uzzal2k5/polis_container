#!/usr/bin/env bash
# DIable SELinux
setenforce 0
sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
# Check OS
OSNAME=$(awk -F= '/^NAME/{print $2}' /etc/os-release)
if [ ${OSNAME}=="CentOS Linux" ];
then
    sh docker-centos.sh
elif [ ${OSNAME}=="Ubuntu" ];
then
    sh docekr-ubuntus.h
 fi


repo=('polisserver','polisClientAdmin','polisClientParticipation','polismath')

for i in "${repo[@]}" ;
do
cd ..
git clone https://github.com/uzzal2k5/$i.git
done
cd ..
cp polis_container/docker-compose-build.yml .
docker-compose -f docker-compose-build.yml up -d

