#!/bin/bash

echo '********* mkdir -p /tmp/opsschool-vol1 *********'
mkdir -p /tmp/opsschool-vol1
echo '********* for i in `seq 1 10`; do dd if=/dev/zero of=/tmp/opsschool-vol1/$i bs=1024 count=1000  > /dev/null 2>&1 ; done ***********'
for i in `seq 1 10`; do dd if=/dev/zero of=/tmp/opsschool-vol1/$i bs=1024 count=1000  > /dev/null 2>&1; done 
echo '********* docker run --name vol1 -d -v /tmp/opsschoo-vol1:/tmp/testvol1 centos sleep 10000 ***********'
docker run --name vol1 -d -v /tmp/opsschool-vol1:/tmp/myvol1 centos sleep 10000
echo '********* docker exec -it `docker ps | grep vol1 | awk "{print $1}"` /bin/bash **********'
docker exec -it `docker ps | grep vol1 | awk '{print $1}'` /bin/bash
