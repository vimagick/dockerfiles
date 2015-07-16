#!/bin/bash
#
# setup script for kylemanna/openvpn
#

OVPN_DIR=./ovpn
OVPN_IMG=kylemanna/openvpn
OVPN_DATA=openvpn_data_1
OVPN_SERVER=tcp://vpn.datageek.info

mkdir -p $OVPN_DIR

select opt in server client backup quit
do
  if [[ $opt == "server" ]]
  then
    echo "setup server ..."
    docker run --volumes-from $OVPN_DATA --rm $OVPN_IMG ovpn_genconfig -u $OVPN_SERVER
    docker run --volumes-from $OVPN_DATA --rm -it $OVPN_IMG ovpn_initpki
  elif [[ $opt == "client" ]]
  then
    echo "setup client ..."
    read -p '>>> ' OVPN_CLIENT
    docker run --volumes-from $OVPN_DATA --rm -it $OVPN_IMG easyrsa build-client-full ${OVPN_CLIENT:?client is empty} nopass
    docker run --volumes-from $OVPN_DATA --rm $OVPN_IMG ovpn_getclient $OVPN_CLIENT > $OVPN_DIR/$OVPN_CLIENT.ovpn
  elif [[ $opt == "backup" ]]
  then
    echo "backup volume ..."
    docker run --rm --volumes-from openvpn_data_1 -v `pwd`/$OVPN_DIR:/backup alpine tar czf /backup/openvpn.tgz /etc/openvpn
  elif [[ $opt == "quit" ]]
  then
    echo "bye"
    exit
  else
    echo "invalid"
  fi
done

