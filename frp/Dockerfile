#
# Dockerfile for frp
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG FRP_VERSION=0.46.0
ARG FRP_ARCH=amd64
ARG FRP_FILE=frp_${FRP_VERSION}_linux_${FRP_ARCH}.tar.gz
ARG FRP_URL=https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/${FRP_FILE}

WORKDIR /opt/frp

RUN set -xe \
    && apk add --no-cache curl tar \
    && mkdir -p bin etc \
    && curl -sSL ${FRP_URL} | tar xz --strip 1 -C bin

EXPOSE 7000/tcp 7000/udp 7500/tcp

CMD ["./bin/frps", "-c", "./etc/frps.ini"]
