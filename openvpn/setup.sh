#!/bin/bash
#
# setup script for kylemanna/openvpn
#

OVPN_DATA=${OVPN_DATA:-openvpn_data_1}
OVPN_SERVER=${OVPN_SERVER:-tcp://vpn.datageek.info}
OVPN_CLIENT=${OVPN_CLIENT:-client}

select opt in server client quit
do
  if [[ $opt == "server" ]]
  then
    echo "setup server ..."
    docker run --volumes-from $OVPN_DATA --rm kylemanna/openvpn ovpn_genconfig -c -u $OVPN_SERVER
    docker run --volumes-from $OVPN_DATA --rm -it kylemanna/openvpn ovpn_initpki
  elif [[ $opt == "client" ]]
  then
    echo "setup client ..."
    docker run --volumes-from $OVPN_DATA --rm -it kylemanna/openvpn easyrsa build-client-full $OVPN_CLIENT nopass
    docker run --volumes-from $OVPN_DATA --rm kylemanna/openvpn ovpn_getclient $OVPN_CLIENT > $OVPN_CLIENT.ovpn
  elif [[ $opt == "quit" ]]
  then
    echo "bye"
    exit
  else
    echo "invalid"
  fi
done

