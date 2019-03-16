#
# Dockerfile for node-red
#

FROM alpine
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache build-base \
                          ca-certificates \
                          curl \
                          nodejs \
                          nodejs-npm \
                          python3 \
                          python3-dev \
    && ln -sf /usr/bin/python3 /usr/bin/python \
    && pip3 install --no-cache-dir rpi.gpio \
    && npm install -g --unsafe-perm node-red \
                                    node-red-admin \
                                    node-red-dashboard \
    && sed -i '1s/bash/sh/' /usr/lib/node_modules/node-red/node_modules/@node-red/nodes/core/hardware/nrgpio \
    && mkdir -p /usr/share/doc/python-rpi.gpio \
    && apk del build-base \
               python3-dev \
    && rm -rf /tmp/npm-*

WORKDIR /data
VOLUME /data

EXPOSE 1880

CMD ["node-red", "--userDir", "/data", "--flowFile", "flows.json"]
