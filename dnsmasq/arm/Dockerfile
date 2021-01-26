#
# Dockerfile for dnsmasq-arm
#

FROM arm32v7/alpine:3

MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache dnsmasq-dnssec \
    && echo "conf-dir=/etc/dnsmasq.d,*.conf" >> /etc/dnsmasq.conf

VOLUME /etc/dnsmasq.d

EXPOSE 53/tcp \
       53/udp \
       67/udp

ENTRYPOINT ["dnsmasq", "--no-daemon", "--user=dnsmasq", "--group=dnsmasq"]
