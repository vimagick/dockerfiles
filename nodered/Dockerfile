#
# Dockerfile for nodered
#

FROM alpine:edge
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U bash \
               build-base \
               nodejs \
    && npm install -g node-red node-red-admin \
    && apk del build-base \
    && rm -rf /var/cache/apk/*

CMD ["node-red"]
