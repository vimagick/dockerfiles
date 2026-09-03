#
# Dockerfile for FTLDNS (pihole-FTL)
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

ARG TARGETPLATFORM
ARG FTL_VERSION

RUN set -xe \
 && FTL_ARCH=$(echo $TARGETPLATFORM | sed -e 's@linux/@@') \
 && FTL_URL=https://github.com/pi-hole/FTL/releases/download/${FTL_VERSION}/pihole-FTL-${FTL_ARCH} \
 && apk add --no-cache curl \
 && echo "conf-dir=/etc/pihole/dnsmasq.d,*.conf" >> /etc/dnsmasq.conf \
 && curl -sSL ${FTL_URL} -o /usr/bin/pihole-FTL \
 && chmod +x /usr/bin/pihole-FTL \
 && pihole-FTL --version \
 && mkdir -p /opt/pihole \
 && cd /opt/pihole \
 && SCRIPT_URL=https://github.com/pi-hole/pi-hole/raw/master/advanced/Scripts \
 && curl -sSL -O ${SCRIPT_URL}/api.sh \
              -O ${SCRIPT_URL}/list.sh \
              -O ${SCRIPT_URL}/query.sh \
              -O ${SCRIPT_URL}/utils.sh \
              -O ${SCRIPT_URL}/version.sh \
              -O ${SCRIPT_URL}/COL_TABLE \
 && cd /usr/local/bin \
 && curl -sSL ${FTL_GIT}/pi-hole/raw/master/pihole -o /usr/local/bin/pihole \
 && chmod +x /usr/local/bin/pihole /opt/pihole/*.sh \
 && apk del curl

VOLUME /etc/pihole

EXPOSE 4711/tcp \
       53/tcp \
       53/udp

CMD ["pihole-FTL", "-f"]
