#!/bin/bash
#
# restart webkit instances one by one forever
#

while :
do
    for ((i=8080; i<8090; i++))
    do
        sleep 30
        /usr/bin/supervisorctl restart webkit:webkit-$i
    done
done
