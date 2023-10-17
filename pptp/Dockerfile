#
# Dockerfile for pptp
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
            pptpclient

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
