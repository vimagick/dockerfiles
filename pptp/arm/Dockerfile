#
# Dockerfile for pptp-arm
#

FROM easypi/alpine-arm:edge
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache \
            --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
            pptpclient

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
