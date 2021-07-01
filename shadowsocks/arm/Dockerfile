#
# Dockerfile for shadowsocks-arm
#

FROM vimagick/alpine-arm:edge
MAINTAINER kev <noreply@easypi.pro>

RUN set -ex \
    && apk add -U curl libsodium python \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install --no-cache-dir shadowsocks \
    && apk del curl \
    && rm -rf /var/cache/apk/*

ENV SERVER_ADDR=
ENV SERVER_PORT 8388
ENV METHOD      aes-256-cfb
ENV PASSWORD=
ENV LOCAL_ADDR  0.0.0.0
ENV LOCAL_PORT  1080
ENV TIMEOUT     300

EXPOSE $LOCAL_PORT

CMD sslocal -s "$SERVER_ADDR" \
            -p "$SERVER_PORT" \
            -m "$METHOD"      \
            -k "$PASSWORD"    \
            -b "$LOCAL_ADDR"  \
            -l "$LOCAL_PORT"  \
            -t "$TIMEOUT"     \
            --fast-open
