#!/bin/sh

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
dns_name = "${VPN_DOMAIN}"
organization = "ocserv"
serial = 2
expiration_days = 365
encryption_key
signing_key
tls_www_server
_EOF_

cat > client.tmpl <<_EOF_
cn = "client@${VPN_DOMAIN}"
uid = "client"
unit = "ocserv"
expiration_days = 365
signing_key
tls_www_client
_EOF_

# gen ca keys
certtool --generate-privkey \
         --outfile ca-key.pem

certtool --generate-self-signed \
         --load-privkey /etc/ocserv/certs/ca-key.pem \
         --template ca.tmpl \
         --outfile ca.pem

# gen server keys
certtool --generate-privkey \
         --outfile server-key.pem

certtool --generate-certificate \
         --load-privkey server-key.pem \
         --load-ca-certificate ca.pem \
         --load-ca-privkey ca-key.pem \
         --template server.tmpl \
         --outfile server-cert.pem

# gen client keys
certtool --generate-privkey \
         --outfile client-key.pem

certtool --generate-certificate \
         --load-privkey client-key.pem \
         --load-ca-certificate ca.pem \
         --load-ca-privkey ca-key.pem \
         --template client.tmpl \
         --outfile client-cert.pem

certtool --to-p12 \
         --pkcs-cipher 3des-pkcs12 \
         --load-ca-certificate ca.pem \
         --load-certificate client-cert.pem \
         --load-privkey client-key.pem \
         --outfile client.p12 \
         --outder \
         --p12-name "${VPN_DOMAIN}" \
         --password "${VPN_PASSWORD}"

sed -i -e "s@^ipv4-network =.*@ipv4-network = ${VPN_NETWORK}@" \
       -e "s@^ipv4-netmask =.*@ipv4-netmask = ${VPN_NETMASK}@" \
       -e "s@^no-route =.*@no-route = ${LAN_NETWORK}/${LAN_NETMASK}@" /etc/ocserv/ocserv.conf

echo "${VPN_PASSWORD}" | ocpasswd -c /etc/ocserv/ocpasswd "${VPN_USERNAME}"
