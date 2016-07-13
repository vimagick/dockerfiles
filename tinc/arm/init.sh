#!/bin/sh -e
#
# initialize server profile
#

if [ -f /etc/tinc/${NETNAME}/hosts/server ]
then
    echo 'Initialized!'
    exit 0
else
    echo 'Initializing...'
fi

mkdir -p /etc/tinc/${NETNAME}/hosts

cd /etc/tinc/${NETNAME}

cat > tinc.conf <<_EOF_
Name = server
Interface = tun0
_EOF_

cat > tinc-up <<_EOF_
#!/bin/sh
ip link set \$INTERFACE up
ip addr add ${ADDRESS} dev \$INTERFACE
ip route add ${NETWORK} dev \$INTERFACE
_EOF_

cat > tinc-down <<_EOF_
#!/bin/sh
ip route del ${NETWORK} dev \$INTERFACE
ip addr del ${ADDRESS} dev \$INTERFACE
ip link set \$INTERFACE down
_EOF_

cat > hosts/server <<_EOF_
Address = ${IP_ADDR}
Subnet = ${ADDRESS}
Subnet = 0.0.0.0/0
_EOF_

chmod +x tinc-up tinc-down

tincd -n${NETNAME} -K${KEYSIZE} < /dev/null
