#
# Dockerfile for frp
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

ENV FRP_VERSION 0.31.2
ENV FRP_URL https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz

WORKDIR /opt/frp

RUN set -xe \
    && apk add --no-cache curl tar \
    && curl -sSL $FRP_URL | tar xz --strip 1 \
    && apk del curl tar

EXPOSE 7000/tcp 7000/udp 7500/tcp

CMD ["./frps", "-c", "frps.ini"]
