#!/bin/sh -e

/init.sh

mkdir -p /dev/net

[ -e /dev/net/tun ] || mknod /dev/net/tun c 10 200

iptables -t nat -A POSTROUTING -s ${NETWORK} -o eth0 -j MASQUERADE

exec tincd --no-detach \
           --net=${NETNAME} \
           --debug=${VERBOSE} \
           "$@"
