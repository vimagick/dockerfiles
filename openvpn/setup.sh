#!/bin/bash
#
# setup script for kylemanna/openvpn
#

OVPN_DIR=./ovpn
OVPN_SERVER=tcp://openvpn.easypi.info

mkdir -p $OVPN_DIR

select opt in server client revoke quit
do
  if [[ $opt == "server" ]]
  then
    echo "setup server ..."
    docker-compose run --rm openvpn ovpn_genconfig -u $OVPN_SERVER
    docker-compose run --rm openvpn ovpn_initpki
  elif [[ $opt == "client" ]]
  then
    echo "setup client ..."
    read -p '>>> ' OVPN_CLIENT
    docker-compose run --rm openvpn easyrsa build-client-full ${OVPN_CLIENT:?client is empty} nopass
    docker-compose run --rm openvpn ovpn_getclient $OVPN_CLIENT > $OVPN_DIR/$OVPN_CLIENT.ovpn
  elif [[ $opt == "revoke" ]]
  then
    echo "revoke client ..."
    read -p '>>> ' OVPN_CLIENT
    docker-compose run --rm openvpn easyrsa revoke ${OVPN_CLIENT:?client is empty}
    docker-compose run --rm openvpn easyrsa gen-crl
  elif [[ $opt == "quit" ]]
  then
    echo "bye"
    exit
  else
    echo "invalid"
  fi
done
