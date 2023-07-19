#
# Dockerfile for aircast-arm64
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG APP_OS=linux
ARG APP_ARCH=aarch64
ARG APP_FILE=aircast-${APP_OS}-${APP_ARCH}-static
ARG APP_URL=https://github.com/philippe44/AirConnect/raw/master/bin/${APP_FILE}

RUN set -xe \
 && apk add --no-cache curl \
 && curl -sSL -o /usr/local/bin/aircast ${APP_URL} \
 && chmod +x /usr/local/bin/aircast

CMD ["aircast", "-Z"]
