#
# Dockerfile for dnsmasq
#

FROM alpine
MAINTAINER kev <norelply@datageek.info>

RUN set -xe \
    && apk add -U dnsmasq \
    && echo "conf-dir=/etc/dnsmasq.d/,*.conf" >> /etc/dnsmasq.conf \
    && mkdir -p /etc/dnsmasq.d \
    && rm -rf /var/cache/apk/*

VOLUME /etc/dnsmasq.d

EXPOSE 53/tcp 53/udp 67/udp

ENTRYPOINT ["/usr/sbin/dnsmasq", "--user=dnsmasq", "--group=dnsmasq"]
