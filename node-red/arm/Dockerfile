#
# Dockerfile for node-red-arm
#

FROM arm32v7/alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache \
        bash \
        build-base \
        ca-certificates \
        curl \
        nodejs \
        nodejs-npm \
        python3 \
        python3-dev \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && pip3 install --no-cache-dir rpi.gpio \
    && npm install -g --unsafe-perm \
        node-red \
        node-red-admin \
        node-red-dashboard \
        node-red-node-email \
        node-red-node-feedparser \
        node-red-node-pi-gpio \
        node-red-node-sentiment \
        node-red-node-twitter \
    && mkdir -p /usr/share/doc/python-rpi.gpio \
    && apk del \
        build-base \
        python3-dev \
    && rm -rf /tmp/npm-*

WORKDIR /data
VOLUME /data

EXPOSE 1880

CMD ["node-red", "--userDir", "/data", "--flowFile", "flows.json"]
