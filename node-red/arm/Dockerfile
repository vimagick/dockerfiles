#
# Dockerfile for node-red-arm
#

FROM easypi/alpine-arm
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
                                   six \
    && npm install -g --unsafe-perm node-red \
                                    node-red-admin \
                                    node-red-dashboard \
    && cd /usr/lib/node_modules/node-red/nodes/core/hardware \
    && curl -sSL https://github.com/vimagick/dockerfiles/raw/master/node-red/patch/nrgpio > nrgpio \
    && curl -sSL https://github.com/vimagick/dockerfiles/raw/master/node-red/patch/nrgpio.py > nrgpio.py \
    && curl -sSL https://github.com/vimagick/dockerfiles/raw/master/node-red/patch/36-rpi-gpio.js > 36-rpi-gpio.js \
    && apk del build-base \
               python3-dev \
    && rm -rf /tmp/npm-*

WORKDIR /root/.node-red
VOLUME /root/.node-red

EXPOSE 1880

CMD ["node-red"]
