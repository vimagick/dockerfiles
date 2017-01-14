#
# Dockerfile for node-red-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache bash \
                          build-base \
                          ca-certificates \
                          curl \
                          nodejs \
                          python \
                          python-dev \
                          sudo \
    && curl https://bootstrap.pypa.io/get-pip.py | python \
    && pip install rpi.gpio \
    && npm install -g --unsafe-perm node-red \
                                    node-red-admin \
                                    node-red-dashboard \
    && apk del build-base \
               python-dev \
    && rm -rf /tmp/npm-*

WORKDIR /root/.node-red
VOLUME /root/.node-red

EXPOSE 1880

CMD ["node-red"]
