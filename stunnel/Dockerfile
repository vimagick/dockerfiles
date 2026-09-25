#
# Dockerfile for stunnel
#

FROM alpine:3.24

MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache stunnel libressl \
 && mkdir -p /etc/stunnel/conf.d \
 && stunnel -version

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME /etc/stunnel

ENTRYPOINT ["/entrypoint.sh"]
