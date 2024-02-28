#
# Dockerfile for FTLDNS (pihole-FTL)
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG FTL_VERSION=v5.25.1
ARG FTL_FILE=pihole-FTL-musl-linux-x86_64
ARG FTL_GIT=https://github.com/pi-hole
ARG FTL_URL=${FTL_GIT}/FTL/releases/download/${FTL_VERSION}/${FTL_FILE}

RUN set -xe \
 && apk add --no-cache curl \
 && echo "conf-dir=/etc/pihole/dnsmasq.d,*.conf" >> /etc/dnsmasq.conf \
 && curl -sSL ${FTL_URL} -o /usr/bin/pihole-FTL \
 && chmod +x /usr/bin/pihole-FTL \
 && pihole-FTL --version \
 && mkdir -p /opt/pihole \
 && cd /opt/pihole \
 && curl -sSL -O ${FTL_GIT}/pi-hole/raw/master/advanced/Scripts/list.sh \
              -O ${FTL_GIT}/pi-hole/raw/master/advanced/Scripts/utils.sh \
              -O ${FTL_GIT}/pi-hole/raw/master/advanced/Scripts/chronometer.sh \
              -O ${FTL_GIT}/pi-hole/raw/master/advanced/Scripts/COL_TABLE \
 && cd /usr/local/bin \
 && curl -sSL ${FTL_GIT}/pi-hole/raw/master/pihole -o /usr/local/bin/pihole \
 && chmod +x /usr/local/bin/pihole /opt/pihole/*.sh \
 && apk del curl

VOLUME /etc/pihole

EXPOSE 4711/tcp \
       53/tcp \
       53/udp

CMD ["pihole-FTL", "-f"]
