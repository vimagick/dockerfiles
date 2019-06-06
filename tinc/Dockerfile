#
# Dockerfile for tinc
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN apk add --no-cache iptables tinc

COPY init.sh /init.sh
COPY docker-entrypoint.sh /entrypoint.sh
COPY peer.sh /usr/local/bin/peer.sh

VOLUME /etc/tinc

ENV NETNAME=netname \
    KEYSIZE=4096    \
    VERBOSE=2

ENV IP_ADDR=1.2.3.4       \
    ADDRESS=10.20.30.1    \
    NETMASK=255.255.255.0 \
    NETWORK=10.20.30.0/24 \
    RUNMODE=server

EXPOSE 655/tcp 655/udp

ENTRYPOINT ["/entrypoint.sh"]
