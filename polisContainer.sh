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


mkdir POLIS_CONTAINER && cd POLIS_CONTAINER
git clone -b master https://github.com/uzzal2k5/polispostgres.git
git clone -b master https://github.com/uzzal2k5/polisserver.git
git clone -b master https://github.com/uzzal2k5/polis_adminparticipants.git
giot clone -b master https://github.com/uzzal2k5/polismath.git

docker-compose -f polisDocker-compose.yml up
