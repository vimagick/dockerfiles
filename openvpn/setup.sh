#!/bin/bash
#
# setup script for vimagick/openvpn
#

OVPN_DIR=./ovpn
OVPN_IMG=vimagick/openvpn
OVPN_DATA=openvpn_data_1
OVPN_BACKUP=openvpn.tgz
OVPN_SERVER=tcp://vpn.easypi.info

mkdir -p $OVPN_DIR

select opt in server client revoke backup restore quit
do
  if [[ $opt == "server" ]]
  then
    echo "setup server ..."
    docker run --rm --volumes-from $OVPN_DATA $OVPN_IMG ovpn_genconfig -u $OVPN_SERVER
    docker run -it --rm --volumes-from $OVPN_DATA $OVPN_IMG ovpn_initpki
  elif [[ $opt == "client" ]]
  then
    echo "setup client ..."
    read -p '>>> ' OVPN_CLIENT
    docker run -it --rm --volumes-from $OVPN_DATA $OVPN_IMG easyrsa build-client-full ${OVPN_CLIENT:?client is empty} nopass
    docker run --rm --volumes-from $OVPN_DATA $OVPN_IMG ovpn_getclient $OVPN_CLIENT > $OVPN_DIR/$OVPN_CLIENT.ovpn
  elif [[ $opt == "revoke" ]]
  then
    read -p '>>> ' OVPN_CLIENT
    docker run -it --rm --volumes-from $OVPN_DATA $OVPN_IMG easyrsa revoke ${OVPN_CLIENT:?client is empty}
    docker run -it --rm --volumes-from $OVPN_DATA $OVPN_IMG easyrsa gen-crl
  elif [[ $opt == "backup" ]]
  then
    echo "backup volume ..."
    docker run --rm --volumes-from $OVPN_DATA alpine tar cvzf - -C /etc openvpn > $OVPN_DIR/$OVPN_BACKUP
  elif [[ $opt == "restore" ]]
  then
    echo "restore volume ..."
    if docker inspect $OVPN_DATA >& /dev/null
    then
        docker run --rm --volumes-from $OVPN_DATA -i alpine tar xvzf - -C /etc < $OVPN_DIR/$OVPN_BACKUP
    else
        docker run --name $OVPN_DATA -v /etc/openvpn -i alpine tar xvzf - -C /etc < $OVPN_DIR/$OVPN_BACKUP
    fi
  elif [[ $opt == "quit" ]]
  then
    echo "bye"
    exit
  else
    echo "invalid"
  fi
done
