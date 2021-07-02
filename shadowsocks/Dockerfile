#
# Dockerfile for shadowsocks
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -ex \
    && echo 'http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories \
    && apk add -U curl libsodium python \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install --no-cache-dir shadowsocks \
    && apk del curl \
    && rm -rf /var/cache/apk/*

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV METHOD      aes-256-cfb
ENV PASSWORD=
ENV TIMEOUT     300
ENV WORKERS     10

EXPOSE $SERVER_PORT

CMD ssserver -s "$SERVER_ADDR"              \
             -p "$SERVER_PORT"              \
             -k "${PASSWORD:-$(hostname)}"  \
             -m "$METHOD"                   \
             -t "$TIMEOUT"                  \
             --workers "$WORKERS"           \
             --fast-open

