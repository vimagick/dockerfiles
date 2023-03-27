#
# Dockerfile for shadowsocks-rust
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG SS_RUST_VERSION=v1.15.3
ARG SS_RUST_FILE=shadowsocks-${SS_RUST_VERSION}.x86_64-unknown-linux-musl.tar.xz
ARG SS_RUST_URL=https://github.com/shadowsocks/shadowsocks-rust/releases/download/${SS_RUST_VERSION}/${SS_RUST_FILE}

RUN set -ex \
    && apk add --no-cache curl \
    && curl -sSL ${SS_RUST_URL} | tar xJ ssservice -C /usr/bin/ \
    && apk del curl

ENV SERVER_ADDR=0.0.0.0
ENV SERVER_PORT=8388
ENV METHOD=chacha20-ietf-poly1305
ENV PASSWORD=
ENV DNS=8.8.8.8,8.8.4.4
ENV TIMEOUT=300
ENV WORKERS=4

EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp

CMD ssservice server -s "$SERVER_ADDR:$SERVER_PORT" \
                     -k "${PASSWORD:-$(hostname)}"  \
                     -m "$METHOD"                   \
                     --dns "$DNS"                   \
                     --timeout "$TIMEOUT"           \
                     --worker-threads "$WORKERS"    \
                     --tcp-fast-open --tcp-no-delay \
                     -U

