#
# Dockerfile for openconnect
#

FROM alpine:edge
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache openconnect \
    && mkdir -p /etc/openconnect \
    && touch /etc/openconnect/openconnect.conf

VOLUME /etc/openconnect

ENTRYPOINT ["openconnect", "--config=/etc/openconnect/openconnect.conf"]
CMD ["--help"]
