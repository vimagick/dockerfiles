#
# Dockerfile for wireguard-arm
#

FROM arm32v7/alpine:edge

MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache coreutils iptables wireguard-tools

EXPOSE 51820/udp

CMD ["wg", "--help"]
