#
# Dockerfile for telegraf-arm
#

FROM easypi/alpine-arm
MAINTAINER kev <noreply@easypi.info>

ENV TELEGRAF_VERSION 1.0.0
ENV TELEGRAF_FILE telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz
ENV TELEGRAF_URL https://dl.influxdata.com/telegraf/releases/${TELEGRAF_FILE}

RUN set -xe \
    && apk add --no-cache --virtual .build-deps ca-certificates curl tar \
    && update-ca-certificates \
    && curl -sSL ${TELEGRAF_URL} | tar xz --strip 2 -C / \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

EXPOSE 8092/udp 8094/tcp 8125/udp

ENTRYPOINT ["telegraf"]
