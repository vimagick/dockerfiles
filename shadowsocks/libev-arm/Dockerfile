#
# Dockerfile for shadowsocks-libev-arm
#

FROM vimagick/alpine-arm
MAINTAINER kev <noreply@easypi.pro>

ENV SS_VER 2.4.6
ENV SS_URL https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz
ENV SS_DIR shadowsocks-libev-$SS_VER
ENV SS_DEP autoconf build-base curl libtool linux-headers openssl-dev

RUN set -ex \
    && apk add --update $SS_DEP \
    && curl -sSL $SS_URL | tar xz \
    && cd $SS_DIR \
        && ./configure \
        && make install \
        && cd .. \
        && rm -rf $SS_DIR \
    && apk del --purge $SS_DEP \
    && rm -rf /var/cache/apk/*

ENV SERVER_ADDR=
ENV SERVER_PORT 8388
ENV METHOD      aes-256-cfb
ENV PASSWORD=
ENV LOCAL_ADDR  0.0.0.0
ENV LOCAL_PORT  1080
ENV TIMEOUT     300

EXPOSE $LOCAL_PORT

CMD ss-local -s "$SERVER_ADDR" \
             -p "$SERVER_PORT" \
             -m "$METHOD"      \
             -k "$PASSWORD"    \
             -b "$LOCAL_ADDR"  \
             -l "$LOCAL_PORT"  \
             -t "$TIMEOUT"     \
             --fast-open
