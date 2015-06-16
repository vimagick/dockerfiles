#
# Dockerfile for shadowsocks
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y curl python \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install shadowsocks \
    && rm -rf /var/lib/apt/lists/*

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8388
ENV PASSWORD    secret
ENV METHOD      aes-256-cfb
ENV TIMEOUT     300
ENV WORKERS     10

EXPOSE 8388

CMD ssserver -s $SERVER_ADDR \
             -p $SERVER_PORT \
             -k $PASSWORD \
             -m $METHOD \
             -t $TIMEOUT \
             --fast-open \
             --workers $WORKERS

