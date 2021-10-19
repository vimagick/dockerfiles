#
# Dockerfile for teleprompter
#

FROM node:12-alpine
MAINTAINER EasyPi Software Foundation

WORKDIR /opt/app

RUN set -xe \
 && apk add --no-cache curl tar \
 && npm install npm-run-all \
 && ln -s node_modules/npm-run-all/bin/npm-run-all/index.js npm-run-all \
 && curl -sSL https://github.com/manifestinteractive/teleprompter/archive/refs/heads/master.tar.gz | tar xz --strip 1 \
 && npm install

EXPOSE 3000 8080

CMD ["./npm-run-all", "--parallel", "server", "client"]
