#
# Dockerfile for openconnect
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache nettle openconnect \
    && mkdir -p /etc/openconnect \
    && touch /etc/openconnect/openconnect.conf

VOLUME /etc/openconnect

ENTRYPOINT ["openconnect", "--config=/etc/openconnect/openconnect.conf"]
CMD ["--help"]
