#
# Dockerfile for json-server
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache nodejs nodejs-npm \
    && npm install -g json-server \
    && rm -rf /tmp/npm* /var/cache/apk/*

WORKDIR /data

EXPOSE 3000

ENTRYPOINT ["json-server"]
CMD ["--help"]
