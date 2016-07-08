#
# Dockerfile for openconnect-arm
#

FROM easypi/alpine-arm:edge
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache \
               --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
               openconnect \
    && mkdir -p /etc/openconnect \
    && touch /etc/openconnect/openconnect.conf

VOLUME /etc/openconnect

ENTRYPOINT ["openconnect", "--config=/etc/openconnect/openconnect.conf"]
CMD ["--help"]
