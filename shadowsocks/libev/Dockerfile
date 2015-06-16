#
# Dockerfile for shadowsocks-libev
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y curl \
    && curl http://shadowsocks.org/debian/1D27208A.gpg | apt-key add - \
    && echo 'deb http://shadowsocks.org/debian wheezy main' > /etc/apt/sources.list.d/ss-libev.list \
    && apt-get update \
    && apt-get install -y shadowsocks-libev \
    && rm -rf /var/lib/apt/lists/*

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV PASSWORD    secret
ENV METHOD      aes-256-cfb
ENV TIMEOUT     300
ENV DNS_ADDR    8.8.8.8

EXPOSE $SERVER_PORT

CMD ss-server -s $SERVER_ADDR \
              -p $SERVER_PORT \
              -k $PASSWORD \
              -m $METHOD \
              -t $TIMEOUT \
              --fast-open \
              -d $DNS_ADDR \
              -u
