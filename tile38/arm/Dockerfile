#
# Dockerfile for tile38-arm
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ENV TILE38_VERSION=1.25.3
ENV TILE38_FILE=tile38-${TILE38_VERSION}-linux-arm.tar.gz
ENV TILE38_URL=https://github.com/tidwall/tile38/releases/download/${TILE38_VERSION}/${TILE38_FILE}

RUN set -xe \
 && apk add --no-cache ca-certificates curl tar \
 && cd /usr/local/bin \
 && curl -sSL ${TILE38_URL} | tar xz --strip 1

VOLUME /data
EXPOSE 9851

CMD ["tile38-server", "-d", "/data"]
