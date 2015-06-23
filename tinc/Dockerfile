#
# Dockerfile for tinc
#

FROM alpine
MAINTAINER kev <noreply@datageek.inf>

ENV NETNAME netname
ENV PIDFILE /run/tinc.$NETNAME.pid
ENV VERBOSE 2

ENV ADDRESS 10.0.0.1
ENV NETMASK 255.255.255.0
ENV NETWORK 10.0.0.0/24

RUN apk add -U iptables tinc \
    && rm -rf /var/cache/apk/* \
    && mkdir -p /etc/tinc/$NETNAME/hosts

WORKDIR /etc/tinc/$NETNAME

RUN echo -e "Name=server" > tinc.conf \
    && echo -e "Subnet=$ADDRESS\\nSubnet=0.0.0.0/0" > hosts/server \
    && echo -e "\\n" | tincd -n $NETNAME -K4096 \
    && echo -e "ifconfig \$INTERFACE $ADDRESS netmask $NETMASK" > tinc-up \
    && echo -e "ifconfig \$INTERFACE down" > tinc-down \
    && chmod +x tinc-up tinc-down

VOLUME /etc/tinc
EXPOSE 655/tcp 655/udp

CMD mkdir -p /dev/net \
    && [ -e /dev/net/tun ] || mknod /dev/net/tun c 10 200 \
    && iptables -t nat -A POSTROUTING -s $NETWORK -o eth0 -j MASQUERADE \
    && tincd --no-detach \
             --net $NETNAME \
             --pidfile $PIDFILE \
             --debug $VERBOSE

