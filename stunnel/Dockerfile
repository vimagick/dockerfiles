#
# Dockerfile for stunnel
#

FROM alpine:edge

MAINTAINER kev <noreply@easypi.info>

RUN apk add --no-cache stunnel openssl

COPY docker-entrypoint.sh /entrypoint.sh

VOLUME /etc/stunnel

ENTRYPOINT ["/entrypoint.sh"]
