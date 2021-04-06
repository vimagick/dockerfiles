#
# Dockerfile for openconnect-arm
#

FROM arm32v7/alpine:edge
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache openconnect \
    && mkdir -p /etc/openconnect \
    && touch /etc/openconnect/openconnect.conf

VOLUME /etc/openconnect

ENTRYPOINT ["openconnect", "--config=/etc/openconnect/openconnect.conf"]
CMD ["--help"]
