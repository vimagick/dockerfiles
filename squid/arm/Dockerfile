#
# Dockerfile for squid-arm
#

FROM alpine:3

MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache squid

EXPOSE 3128/tcp 3130/udp

ENTRYPOINT ["/usr/sbin/squid", "--foreground", "-YCd1"]
