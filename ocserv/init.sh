#!/bin/bash

set -e

if [ -f /etc/ocserv/certs/server-cert.pem ]
then
    echo "Initialized!"
    exit 0
else
    echo "Initializing ..."
fi

mkdir -p /etc/ocserv/certs
cd /etc/ocserv/certs

cat > ca.tmpl <<_EOF_
cn = "ocserv Root CA"
organization = "ocserv"
serial = 1
expiration_days = 3650
ca
signing_key
cert_signing_key
crl_signing_key
_EOF_

cat > server.tmpl <<_EOF_
cn = "${VPN_DOMAIN}"
organization = "ocserv"
serial = 2
expiration_days = 3650
encryption_key
signing_key
tls_www_server
_EOF_

certtool --generate-privkey \
         --outfile ca-key.pem

certtool --generate-self-signed \
         --load-privkey /etc/ocserv/certs/ca-key.pem \
         --template ca.tmpl \
         --outfile ca-cert.pem

certtool --generate-privkey \
         --outfile server-key.pem

certtool --generate-certificate \
         --load-privkey server-key.pem \
         --load-ca-certificate ca-cert.pem \
         --load-ca-privkey ca-key.pem \
         --template server.tmpl \
         --outfile server-cert.pem

sed -i -e "s@^ipv4-network =.*@ipv4-network = ${VPN_NETWORK}@" \
       -e "s@^ipv4-netmask =.*@ipv4-netmask = ${VPN_NETMASK}@" /etc/ocserv/ocserv.conf

echo "${VPN_PASSWORD}" | ocpasswd -c /etc/ocserv/ocpasswd "${VPN_USERNAME}"
