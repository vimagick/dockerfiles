#
# Dockerfile for json-server
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

WORKDIR /app

RUN set -xe \
    && apk add -U nodejs \
    && npm install -g json-server \
    && rm -rf /tmp/npm* /var/cache/apk/*

EXPOSE 3000

ENTRYPOINT ["json-server"]
CMD ["--help"]
