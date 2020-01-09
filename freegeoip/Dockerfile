#
# Dockerfile for freegeoip
#

FROM alpine
MAINTAINER EasyPi Software Foundation

ENV FREEGEOIP_VERSION=3.4.1
ENV FREEGEOIP_FILE=freegeoip-${FREEGEOIP_VERSION}-linux-amd64.tar.gz
ENV FREEGEOIP_URL=https://github.com/fiorix/freegeoip/releases/download/v${FREEGEOIP_VERSION}/${FREEGEOIP_FILE}

WORKDIR /opt/freegeoip

RUN set -xe \
    && apk add --no-cache curl tar \
    && curl -sSL ${FREEGEOIP_URL} | tar xz --strip 1 \
    && apk del curl tar

COPY data/GeoLite2-City.mmdb.gz /opt/freegeoip/data/

EXPOSE 8080 8888

ENTRYPOINT ["./freegeoip"]
CMD ["-public", "public", "-http", ":8080", "-internal-server", ":8888", "-db", "data/GeoLite2-City.mmdb.gz"]
