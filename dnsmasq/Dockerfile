#
# Dockerfile for dnsmasq
#

FROM alpine

MAINTAINER kev <norelply@easypi.pro>

RUN set -xe \
    && apk add --no-cache dnsmasq \
    && echo "conf-dir=/etc/dnsmasq.d/,*.conf" >> /etc/dnsmasq.conf

VOLUME /etc/dnsmasq.d

EXPOSE 53/tcp \
       53/udp \
       67/udp

ENTRYPOINT ["dnsmasq", "--no-daemon", "--user=dnsmasq", "--group=dnsmasq"]
