#!/bin/sh

ROUTES=${ROUTES:-0.0.0.0/1 128.0.0.0/1}

cat > /etc/ppp/peers/${TUNNEL} <<_EOF_
pty "pptp ${SERVER} --nolaunchpppd"
name "${USERNAME}"
password "${PASSWORD}"
remotename PPTP
require-mppe-128
file /etc/ppp/options.pptp
ipparam "${TUNNEL}"
_EOF_

echo "#!/bin/sh" > /etc/ppp/ip-up
for route in $ROUTES; do
    echo "ip route add ${route} dev \$1" >> /etc/ppp/ip-up
done

echo "#!/bin/sh" > /etc/ppp/ip-down
for route in $ROUTES; do
    echo "ip route del ${route} dev \$1" >> /etc/ppp/ip-down
done

exec pon ${TUNNEL} debug dump logfd 2 nodetach persist "$@"
