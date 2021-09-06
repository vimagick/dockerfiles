#
# Dockerfile for aria2
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ENV TOKEN=00000000-0000-0000-0000-000000000000

RUN set -xe \
    && apk add --no-cache aria2 \
    && aria2c https://github.com/tianon/gosu/releases/download/1.14/gosu-amd64 -o /usr/local/bin/gosu \
    && chmod +x /usr/local/bin/gosu \
    && adduser -D aria2

COPY ./data/aria2.conf /etc/aria2/
VOLUME /data /etc/aria2
WORKDIR /data

EXPOSE 6800
CMD set -xe \
    && chown -R aria2:aria2 /data \
    && gosu aria2 aria2c --conf-path=/etc/aria2/aria2.conf \
                         --rpc-secret=${TOKEN}
