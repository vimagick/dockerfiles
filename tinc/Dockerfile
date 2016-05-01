#
# Dockerfile for tinc
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

ENV NETNAME=netname \
    PIDFILE=/run/tinc.$NETNAME.pid \
    KEYSIZE=4096 \
    VERBOSE=2

ENV ADDRESS=10.0.0.1 \
    NETMASK=255.255.255.0 \
    NETWORK=10.0.0.0/24

RUN set -xe \
    && apk add -U iptables tinc \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /etc/tinc/$NETNAME/hosts

WORKDIR /etc/tinc/$NETNAME

RUN set -xe \
    && echo -e "Name=server\\nInterface=tun0" > tinc.conf \
    && echo -e "Subnet=$ADDRESS\\nSubnet=0.0.0.0/0" > hosts/server \
    && tincd -n $NETNAME -K$KEYSIZE < /dev/null \
    && echo -e "ifconfig \$INTERFACE $ADDRESS netmask $NETMASK" > tinc-up \
    && echo -e "ifconfig \$INTERFACE down" > tinc-down \
    && chmod +x tinc-up tinc-down

VOLUME /etc/tinc

EXPOSE 655/tcp 655/udp

CMD set -xe \
    && mkdir -p /dev/net \
    && [ -e /dev/net/tun ] || mknod /dev/net/tun c 10 200 \
    && iptables -t nat -A POSTROUTING -s $NETWORK -o eth0 -j MASQUERADE \
    && tincd --no-detach \
             --net $NETNAME \
             --pidfile $PIDFILE \
             --debug $VERBOSE

