#
# Dockerfile for pptp
#

FROM alpine:edge
MAINTAINER kev <noreply@easypi.pro>

RUN apk add --no-cache \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
            pptpclient

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
