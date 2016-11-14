#!/bin/bash

echo '********* mkdir -p /tmp/opsschool-vol2 *********'
mkdir -p /tmp/opsschool-vol2
echo '********* for i in `seq 1 10`; touch /tmp/opsschool-vol2/$i > /dev/null 2>&1 ; done ***********'
for i in `seq 1 10`; do touch /tmp/opsschool-vol2/$i > /dev/null 2>&1; done 
echo '********* docker create --name opsvol1 --volume /tmp/opsschoo-vol2:/tmp/testvol2 centos /bin/true  ***********'
docker create --name opsvol2 --volume /tmp/opsschoo-vol2:/tmp/testvol2 centos /bin/true
echo 'docker run --name vol2 -d --volumes-from opsvol2 centos /bin/bash'
docker run -d --name vol2 -d --volumes-from opsvol2 centos sleep 10000
echo '********* docker exec -it `docker ps | grep vol2 | awk "{print $1}"` /bin/bash **********'
docker exec -it `docker ps | grep vol2 | awk '{print $1}'` /bin/bash
