#
# Dockerfile for ipsec
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apk add --no-cache iptables openssl strongswan util-linux \
    && ln -sf /etc/ipsec.d/ipsec.conf /etc/ipsec.conf \
    && ln -sf /etc/ipsec.d/ipsec.secrets /etc/ipsec.secrets

COPY init.sh /

VOLUME /etc/ipsec.d /etc/strongswan.d

ENV VPN_SUBNET=10.20.30.0/24
ENV VPN_DNS=8.8.8.8,8.8.4.4

EXPOSE 500/udp 4500/udp

CMD set -xe \
    && /init.sh \
    && rm -f /var/run/starter.charon.pid \
    && iptables -t nat -A POSTROUTING -s $VPN_SUBNET -o eth0 -j MASQUERADE \
    && ipsec start --nofork
