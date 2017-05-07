#
# Dockerfile for stunnel
#

FROM alpine:edge

MAINTAINER kev <noreply@easypi.pro>

RUN apk add --no-cache stunnel libressl

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME /etc/stunnel

ENTRYPOINT ["/entrypoint.sh"]
