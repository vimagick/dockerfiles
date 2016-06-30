#!/bin/sh -e
#
# gen config files for strongswan
#
# - VPN_DNS
# - VPN_DOMAIN
# - VPN_NETWORK
# - LAN_NETWORK
# - VPN_P12_PASSWORD
#

if [ -e /etc/ipsec.d/ipsec.conf ]
then
    echo "Initialized!"
    exit 0
else
    echo "Initializing..."
fi

cat > /etc/ipsec.d/ipsec.conf <<_EOF_
config setup
    uniqueids=never
    charondebug="cfg 2, dmn 2, ike 2, net 2"

conn %default
    keyexchange=ike
    dpdaction=clear
    dpddelay=300s
    rekey=no
    left=%any
    leftca=ca.cert.pem
    leftcert=server.cert.pem
    leftsubnet=0.0.0.0/0
    right=%any
    rightdns=${VPN_DNS}
    rightsourceip=${VPN_NETWORK}
    rightsubnets=${LAN_NETWORK}

conn IPSec-IKEv2
    keyexchange=ikev2
    ike=aes256-sha256-modp1024,3des-sha1-modp1024,aes256-sha1-modp1024!
    esp=aes256-sha256,3des-sha1,aes256-sha1!
    leftid="${VPN_DOMAIN}"
    leftsendcert=always
    leftauth=pubkey
    rightauth=pubkey
    rightid="client@${VPN_DOMAIN}"
    rightcert=client.cert.pem
    auto=add
_EOF_


cat > /etc/ipsec.d/ipsec.secrets <<_EOF_
: RSA server.pem
_EOF_


# gen ca key and cert
ipsec pki --gen --outform pem > /etc/ipsec.d/private/ca.pem

ipsec pki --self \
          --in /etc/ipsec.d/private/ca.pem \
          --dn "C=CN, O=strongSwan, CN=strongSwan Root CA" \
          --ca \
          --lifetime 3650 \
          --outform pem > /etc/ipsec.d/cacerts/ca.cert.pem

# gen server key and cert
ipsec pki --gen --outform pem > /etc/ipsec.d/private/server.pem  

ipsec pki --pub --in /etc/ipsec.d/private/server.pem |
    ipsec pki --issue --lifetime 1200 --cacert /etc/ipsec.d/cacerts/ca.cert.pem \
              --cakey /etc/ipsec.d/private/ca.pem --dn "C=CN, O=strongSwan, CN=${VPN_DOMAIN}" \
              --san="${VPN_DOMAIN}" --flag serverAuth --flag ikeIntermediate \
              --outform pem > /etc/ipsec.d/certs/server.cert.pem

# gen client key and cert
ipsec pki --gen --outform pem > /etc/ipsec.d/private/client.pem

ipsec pki --pub --in /etc/ipsec.d/private/client.pem |
    ipsec pki --issue \
              --cacert /etc/ipsec.d/cacerts/ca.cert.pem \
              --cakey /etc/ipsec.d/private/ca.pem --dn "C=CN, O=strongSwan, CN=client@${VPN_DOMAIN}" \
              --san="client@${VPN_DOMAIN}" \
              --outform pem > /etc/ipsec.d/certs/client.cert.pem

openssl pkcs12 -export \
               -inkey /etc/ipsec.d/private/client.pem \
               -in /etc/ipsec.d/certs/client.cert.pem \
               -name "client@${VPN_DOMAIN}" \
               -certfile /etc/ipsec.d/cacerts/ca.cert.pem \
               -caname "strongSwan Root CA" \
               -out /etc/ipsec.d/client.cert.p12 \
               -passout pass:${VPN_P12_PASSWORD}

# gen mobileconfig for mac

UUID1=$(uuidgen)
UUID2=$(uuidgen)
UUID3=$(uuidgen)
UUID4=$(uuidgen)
UUID5=$(uuidgen)
UUID6=$(uuidgen)

cat > /etc/ipsec.d/client.mobileconfig <<_EOF_
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
 <key>PayloadContent</key>
 <array>
  <dict>
   <key>Password</key>
   <string>${VPN_P12_PASSWORD}</string>
   <key>PayloadCertificateFileName</key>
   <string>client.cert.p12</string>
   <key>PayloadContent</key>
   <data>
$(base64 /etc/ipsec.d/client.cert.p12)
   </data>
   <key>PayloadDescription</key>
   <string>添加 PKCS#12 格式的证书</string>
   <key>PayloadDisplayName</key>
   <string>client.cert.p12</string>
   <key>PayloadIdentifier</key>
   <string>com.apple.security.pkcs12.${UUID1}</string>
   <key>PayloadType</key>
   <string>com.apple.security.pkcs12</string>
   <key>PayloadUUID</key>
   <string>${UUID1}</string>
   <key>PayloadVersion</key>
   <integer>1</integer>
  </dict>
  <dict>
   <key>PayloadCertificateFileName</key>
   <string>ca.cer</string>
   <key>PayloadContent</key>
   <data>
$(base64 /etc/ipsec.d/cacerts/ca.cert.pem)
   </data>
   <key>PayloadDescription</key>
   <string>添加 CA 根证书</string>
   <key>PayloadDisplayName</key>
   <string>strongSwan Root CA</string>
   <key>PayloadIdentifier</key>
   <string>com.apple.security.root.${UUID2}</string>
   <key>PayloadType</key>
   <string>com.apple.security.root</string>
   <key>PayloadUUID</key>
   <string>${UUID2}</string>
   <key>PayloadVersion</key>
   <integer>1</integer>
  </dict>
  <dict>
   <key>IKEv2</key>
   <dict>
    <key>AuthenticationMethod</key>
    <string>Certificate</string>
    <key>ChildSecurityAssociationParameters</key>
    <dict>
     <key>DiffieHellmanGroup</key>
     <integer>2</integer>
     <key>EncryptionAlgorithm</key>
     <string>3DES</string>
     <key>IntegrityAlgorithm</key>
     <string>SHA1-96</string>
     <key>LifeTimeInMinutes</key>
     <integer>1440</integer>
    </dict>
    <key>DeadPeerDetectionRate</key>
    <string>Medium</string>
    <key>DisableMOBIKE</key>
    <integer>0</integer>
    <key>DisableRedirect</key>
    <integer>0</integer>
    <key>EnableCertificateRevocationCheck</key>
    <integer>0</integer>
    <key>EnablePFS</key>
    <integer>0</integer>
    <key>IKESecurityAssociationParameters</key>
    <dict>
     <key>DiffieHellmanGroup</key>
     <integer>2</integer>
     <key>EncryptionAlgorithm</key>
     <string>3DES</string>
     <key>IntegrityAlgorithm</key>
     <string>SHA1-96</string>
     <key>LifeTimeInMinutes</key>
     <integer>1440</integer>
    </dict>
    <key>LocalIdentifier</key>
    <string>client@${VPN_DOMAIN}</string>
    <key>PayloadCertificateUUID</key>
    <string>${UUID1}</string>
    <key>RemoteAddress</key>
    <string>${VPN_DOMAIN}</string>
    <key>RemoteIdentifier</key>
    <string>${VPN_DOMAIN}</string>
    <key>UseConfigurationAttributeInternalIPSubnet</key>
    <integer>0</integer>
   </dict>
   <key>IPv4</key>
   <dict>
    <key>OverridePrimary</key>
    <integer>1</integer>
   </dict>
   <key>PayloadDescription</key>
   <string>Configures VPN settings</string>
   <key>PayloadDisplayName</key>
   <string>VPN</string>
   <key>PayloadIdentifier</key>
   <string>com.apple.vpn.managed.${UUID4}</string>
   <key>PayloadType</key>
   <string>com.apple.vpn.managed</string>
   <key>PayloadUUID</key>
   <string>${UUID4}</string>
   <key>PayloadVersion</key>
   <real>1</real>
   <key>Proxies</key>
   <dict>
    <key>HTTPEnable</key>
    <integer>0</integer>
    <key>HTTPSEnable</key>
    <integer>0</integer>
   </dict>
   <key>UserDefinedName</key>
   <string>VPN (IKEv2)</string>
   <key>VPNType</key>
   <string>IKEv2</string>
  </dict>
  <dict>
   <key>PayloadCertificateFileName</key>
   <string>server.cer</string>
   <key>PayloadContent</key>
   <data>
$(base64 /etc/ipsec.d/certs/server.cert.pem)
   </data>
   <key>PayloadDescription</key>
   <string>添加 PKCS#1 格式的证书</string>
   <key>PayloadDisplayName</key>
   <string>${VPN_DOMAIN}</string>
   <key>PayloadIdentifier</key>
   <string>com.apple.security.pkcs1.${UUID5}</string>
   <key>PayloadType</key>
   <string>com.apple.security.pkcs1</string>
   <key>PayloadUUID</key>
   <string>${UUID5}</string>
   <key>PayloadVersion</key>
   <integer>1</integer>
  </dict>
 </array>
 <key>PayloadDisplayName</key>
 <string>VPN</string>
 <key>PayloadIdentifier</key>
 <string>com.github.vimagick.strongswan</string>
 <key>PayloadRemovalDisallowed</key>
 <false/>
 <key>PayloadType</key>
 <string>Configuration</string>
 <key>PayloadUUID</key>
 <string>${UUID6}</string>
 <key>PayloadVersion</key>
 <integer>1</integer>
</dict>
</plist>
_EOF_
