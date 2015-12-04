#
# Dockerfile for nodered
#

FROM alpine:edge
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

VOLUME /root/.node-red
EXPOSE 1880

CMD ["node-red"]
