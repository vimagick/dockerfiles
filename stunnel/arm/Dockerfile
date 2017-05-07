#
# Dockerfile for stunnel-arm
#

FROM easypi/alpine-arm:edge

MAINTAINER kev <noreply@easypi.pro>

RUN apk add --no-cache stunnel

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME /etc/stunnel

ENTRYPOINT ["/entrypoint.sh"]
