#!/bin/sh -e

/init.sh

if ! [[ -c /dev/net/tun ]]
then
    mkdir -p /dev/net
    mknod /dev/net/tun c 10 200
fi

if [[ $RUNMODE = server ]]
then
    iptables -t nat -A POSTROUTING -s ${NETWORK} -o eth0 -j MASQUERADE
fi

exec tincd --no-detach \
           --net=${NETNAME} \
           --debug=${VERBOSE} \
           "$@"
