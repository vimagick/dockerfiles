#!/bin/sh -e
#
# generate peer profile
#

PEER_NAME=${1:?peer name is empty}
PEER_ADDR=${2:?peer addr is empty}

if [ -f /etc/tinc/${NETNAME}/hosts/${PEER_NAME} ]
then
    echo 'Peer name was taken!'
    exit 1
elif fgrep -qr ${PEER_ADDR} /etc/tinc/${NETNAME}/hosts/
then
    echo 'Peer addr was taken!'
    exit 2
else
    echo 'Generating...'
fi

mkdir -p /etc/tinc/${NETNAME}/peers/${PEER_NAME}/tinc/${NETNAME}/hosts

cd /etc/tinc/${NETNAME}/peers/${PEER_NAME}/tinc/${NETNAME}

cp /etc/tinc/${NETNAME}/hosts/server hosts/server

cat > tinc.conf <<_EOF_
Name = ${PEER_NAME}
Interface = tun0
ConnectTo = server
_EOF_

cat > hosts/${PEER_NAME} <<_EOF_
Subnet = ${PEER_ADDR}
_EOF_

tincd -c. -K${KEYSIZE} < /dev/null

cp /etc/tinc/${NETNAME}/peers/${PEER_NAME}/tinc/${NETNAME}/hosts/${PEER_NAME} \
   /etc/tinc/${NETNAME}/hosts/${PEER_NAME}

cat > tinc-up <<_EOF_
#!/bin/sh
ip link set \$INTERFACE up
ip addr add  ${PEER_ADDR}/${NETMASK} dev \$INTERFACE
_EOF_

cat > tinc-down <<_EOF_
#!/bin/sh
ip addr del ${PEER_ADDR}/${NETMASK} dev \$INTERFACE
ip link set \$INTERFACE down
_EOF_

cat > hosts/server-up <<"_EOF_"
#!/bin/sh
ORIGINAL_GATEWAY=$(ip route show | grep ^default | cut -d ' ' -f 2-3)
ip route add $REMOTEADDRESS $ORIGINAL_GATEWAY
ip route add 0.0.0.0/1 dev $INTERFACE
ip route add 128.0.0.0/1 dev $INTERFACE
_EOF_

cat > hosts/server-down <<"_EOF_"
#!/bin/sh
ORIGINAL_GATEWAY=$(ip route show | grep ^default | cut -d ' ' -f 2-3)
ip route del $REMOTEADDRESS $ORIGINAL_GATEWAY
ip route del 0.0.0.0/1 dev $INTERFACE
ip route del 128.0.0.0/1 dev $INTERFACE
_EOF_

chmod +x tinc-up tinc-down hosts/server-up hosts/server-down

cd /etc/tinc/${NETNAME}/peers
tar czf ${PEER_NAME}.tar.gz ${PEER_NAME}
rm -rf ${PEER_NAME}

echo "'${PEER_NAME}' => '${PWD}/${PEER_NAME}.tar.gz'"
