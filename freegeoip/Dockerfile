#
# Dockerfile for freegeoip
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG FREEGEOIP_VERSION=3.4.1
ARG FREEGEOIP_FILE=freegeoip-${FREEGEOIP_VERSION}-linux-amd64.tar.gz
ARG FREEGEOIP_URL=https://github.com/fiorix/freegeoip/releases/download/v${FREEGEOIP_VERSION}/${FREEGEOIP_FILE}
ARG MMDB_URL=https://cdn.jsdelivr.net/npm/geolite2-city@1.0.4/GeoLite2-City.mmdb.gz

WORKDIR /opt/freegeoip

RUN set -xe \
    && apk add --no-cache curl tar wget \
    && curl -sSL ${FREEGEOIP_URL} | tar xz --strip 1 \
    && mkdir -p data \
    && wget -P data ${MMDB_URL} \
    && apk del curl tar wget

EXPOSE 8080 8888

ENTRYPOINT ["./freegeoip"]
CMD ["-public", "public", "-http", ":8080", "-internal-server", ":8888", "-db", "data/GeoLite2-City.mmdb.gz", "-use-x-forwarded-for"]
