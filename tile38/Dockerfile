#
# Dockerfile for tile38
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

ARG TARGETPLATFORM
ARG TILE38_VERSION

RUN set -xe \
 && TILE38_ARCH=$(echo $TARGETPLATFORM | sed -e 's@linux/@@') \
 && TILE38_FILE=tile38-${TILE38_VERSION}-linux-${TILE38_ARCH}.tar.gz \
 && TILE38_URL=https://github.com/tidwall/tile38/releases/download/${TILE38_VERSION}/${TILE38_FILE} \
 && apk add --no-cache ca-certificates curl tar \
 && cd /usr/local/bin \
 && curl -sSL ${TILE38_URL} | tar xz --strip 1

VOLUME /data
EXPOSE 9851

CMD ["tile38-server", "-d", "/data"]
