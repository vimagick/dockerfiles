#!/bin/bash

cat > /etc/ppp/peers/${TUNNEL} <<_EOF_
pty "pptp ${SERVER} --nolaunchpppd"
name "${USERNAME}"
password "${PASSWORD}"
remotename PPTP
require-mppe-128
file /etc/ppp/options.pptp
ipparam "${TUNNEL}"
_EOF_

cat > /etc/ppp/ip-up.d/9999routes <<_EOF_
#!/bin/bash
ip route add 0.0.0.0/1 dev \$1
ip route add 128.0.0.0/1 dev \$1
_EOF_

cat > /etc/ppp/ip-down.d/9999routes <<_EOF_
#!/bin/bash
ip route del 0.0.0.0/1 dev \$1
ip route del 128.0.0.0/1 dev \$1
_EOF_

chmod +x /etc/ppp/ip-up.d/9999routes
chmod +x /etc/ppp/ip-down.d/9999routes

exec pon ${TUNNEL} debug dump logfd 2 nodetach persist "$@"
