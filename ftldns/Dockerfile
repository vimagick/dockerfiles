#
# Dockerfile for FTLDNS (pihole-FTL)
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG FTL_VERSION=v5.23
ARG FTL_FILE=pihole-FTL-musl-linux-x86_64
ARG FTL_URL=https://github.com/pi-hole/FTL/releases/download/${FTL_VERSION}/${FTL_FILE}

RUN set -xe \
 && apk add --no-cache curl \
 && echo "conf-dir=/etc/pihole/dnsmasq.d,*.conf" >> /etc/dnsmasq.conf \
 && curl -sSL ${FTL_URL} -o /usr/bin/pihole-FTL \
 && chmod +x /usr/bin/pihole-FTL \
 && pihole-FTL --version \
 && apk del curl

VOLUME /etc/pihole

EXPOSE 4711/tcp \
       53/tcp \
       53/udp

CMD ["pihole-FTL", "-f"]
