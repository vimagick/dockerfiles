#
# Dockerfile for shadowsocks
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add --update curl python \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install shadowsocks \
    && apk del --purge curl \
    && rm -rf /var/cache/apk/*

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV PASSWORD=
ENV METHOD      aes-256-cfb
ENV TIMEOUT     300
ENV WORKERS     10

EXPOSE $SERVER_PORT

CMD ssserver -s $SERVER_ADDR \
             -p $SERVER_PORT \
             -k ${PASSWORD:-$(head -c 6 /dev/urandom | base64)} \
             -m $METHOD \
             -t $TIMEOUT \
             --fast-open \
             --workers $WORKERS

