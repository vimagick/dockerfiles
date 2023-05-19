#
# Dockerfile for dnsmasq
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache dnsmasq-dnssec \
    && echo "conf-dir=/etc/dnsmasq.d,*.conf" >> /etc/dnsmasq.conf \
    && dnsmasq --version

VOLUME /etc/dnsmasq.d

EXPOSE 53/tcp \
       53/udp \
       67/udp

ENTRYPOINT ["dnsmasq", "--keep-in-foreground", "--user=dnsmasq", "--group=dnsmasq"]
