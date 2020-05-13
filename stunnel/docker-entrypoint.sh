#!/bin/sh

cd /etc/stunnel

cat > stunnel.conf <<_EOF_
foreground = yes
setuid = stunnel
setgid = stunnel
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
cert = ${CERT:=/etc/stunnel/stunnel.pem}
client = ${CLIENT:-no}

[${SERVICE}]
accept = ${ACCEPT}
connect = ${CONNECT}
_EOF_

if ! [ -f "${CERT}" ]
then
    openssl req -x509 -nodes -newkey rsa:2048 -days 3650 -subj '/CN=stunnel' \
                -keyout "${CERT}" -out "${CERT}"
    chmod 600 "${CERT}"
fi

exec stunnel "$@"
