#
# Dockerfile for stunnel-arm
#

FROM easypi/alpine-arm

MAINTAINER kev <noreply@easypi.info>

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing stunnel

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME /etc/stunnel

ENTRYPOINT ["/entrypoint.sh"]
