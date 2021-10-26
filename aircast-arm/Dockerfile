#
# Dockerfile for aircast-arm
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ENV APP_ARCH=arm
ENV APP_FILE=aircast-$APP_ARCH-static
ENV APP_URL=https://github.com/philippe44/AirConnect/raw/master/bin/$APP_FILE


RUN set -xe \
 && apk add --no-cache curl \
 && curl -sSL -o /usr/local/bin/aircast $APP_URL \
 && chmod +x /usr/local/bin/aircast

CMD ["aircast", "-Z"]
