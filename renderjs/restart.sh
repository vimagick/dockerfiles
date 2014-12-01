#!/bin/bash
#
# restart renderjs instances one by one forever
#

while :
do
    for ((i=8080; i<8090; i++))
    do
        sleep 30
        /usr/bin/supervisorctl restart renderjs:renderjs-$i
    done
done
