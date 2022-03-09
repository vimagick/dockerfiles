#
# Dockerfile for microsocks
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG MICROSOCKS_VERSION=1.0.3
ARG MICROSOCKS_FILE=microsocks-$MICROSOCKS_VERSION-x86_64-static.xz
ARG MICROSOCKS_URL=https://github.com/rofl0r/microsocks/releases/download/v$MICROSOCKS_VERSION/$MICROSOCKS_FILE

RUN set -xe \
 && apk add --no-cache curl xz \
 && cd /usr/local/bin \
 && curl -sSL $MICROSOCKS_URL | xz -d -c > microsocks \
 && chmod +x microsocks \
 && apk del curl xz

EXPOSE 1080
ENTRYPOINT ["microsocks"]
CMD ["-i", "0.0.0.0", "-p", "1080"]
