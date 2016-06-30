#!/bin/sh -e
#
# entrypoint for strongswan
#
# - VPN_DEVICE
# - VPN_NETWORK
#

/init.sh
iptables -t nat -A POSTROUTING -s ${VPN_NETWORK} -o ${VPN_DEVICE} -j MASQUERADE
exec ipsec start --nofork "$@"
