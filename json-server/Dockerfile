#
# Dockerfile for json-server
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

ARG JSON_SERVER_VERSION=latest

RUN set -xe \
    && apk add --no-cache nodejs npm \
    && npm install -g json-server@${JSON_SERVER_VERSION} \
    && rm -rf /tmp/npm* /var/cache/apk/*

WORKDIR /data

EXPOSE 3000

ENTRYPOINT ["json-server"]
CMD ["--help"]
