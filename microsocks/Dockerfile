#
# Dockerfile for microsocks
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

ARG MICROSOCKS_VERSION
ARG MICROSOCKS_FILE=v$MICROSOCKS_VERSION.tar.gz
ARG MICROSOCKS_URL=https://github.com/rofl0r/microsocks/archive/refs/tags/$MICROSOCKS_FILE

RUN set -xe \
 && apk add --no-cache --virtual .build-deps build-base curl \
 && mkdir microsocks \
 && cd microsocks \
 && curl -sSL $MICROSOCKS_URL | tar -xz --strip 1 \
 && make \
 && cp microsocks /usr/local/bin/ \
 && cd .. \
 && rm -rf microsocks \
 && apk del .build-deps

EXPOSE 1080
ENTRYPOINT ["microsocks"]
CMD ["-i", "0.0.0.0", "-p", "1080"]
