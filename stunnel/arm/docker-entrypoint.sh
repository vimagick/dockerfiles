#!/bin/sh

cd /etc/stunnel

cat > stunnel.conf <<_EOF_
foreground = yes
setuid = stunnel
setgid = stunnel
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
cert = /etc/stunnel/stunnel.pem
client = ${CLIENT:-no}

[${SERVICE}]
accept = ${ACCEPT}
connect = ${CONNECT}
_EOF_

if ! [ -f stunnel.pem ]
then
    openssl req -x509 -nodes -newkey rsa:2048 -days 3650 -subj '/CN=stunnel' \
                -keyout stunnel.pem -out stunnel.pem
    chmod 600 stunnel.pem
fi

exec stunnel "$@"
