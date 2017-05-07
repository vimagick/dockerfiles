#
# Dockerfile for ipsec
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache iptables openssl strongswan util-linux \
    && ln -sf /etc/ipsec.d/ipsec.conf /etc/ipsec.conf \
    && ln -sf /etc/ipsec.d/ipsec.secrets /etc/ipsec.secrets

COPY init.sh /init.sh
COPY docker-entrypoint.sh /entrypoint.sh

VOLUME /etc/ipsec.d /etc/strongswan.d

ENV VPN_DEVICE=eth0
ENV VPN_NETWORK=10.20.30.0/24
ENV LAN_NETWORK=192.168.0.0/16
ENV VPN_DNS=8.8.8.8,8.8.4.4

EXPOSE 500/udp 4500/udp

ENTRYPOINT ["/entrypoint.sh"]
