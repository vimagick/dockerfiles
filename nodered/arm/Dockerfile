#
# Dockerfile for nodered-arm
#

FROM vimagick/alpine-arm:edge
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U bash \
               build-base \
               nodejs \
               python \
               python-dev \
    && npm install -g node-red node-red-admin \
    && apk del build-base \
               python-dev \
    && rm -rf /var/cache/apk/*

WORKDIR /root/.node-red
VOLUME /root/.node-red
EXPOSE 1880

CMD ["node-red"]
