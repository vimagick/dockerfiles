#
# Dockerfile for stunnel
#

FROM alpine:3

MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache stunnel libressl

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME /etc/stunnel

ENTRYPOINT ["/entrypoint.sh"]
