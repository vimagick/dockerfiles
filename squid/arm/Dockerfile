#
# Dockerfile for squid-arm
#

FROM arm32v7/alpine:3

MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache squid

EXPOSE 3128/tcp 3130/udp

ENTRYPOINT ["/usr/sbin/squid", "-NYCd1"]
