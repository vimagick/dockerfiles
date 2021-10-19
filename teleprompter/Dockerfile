#
# Dockerfile for teleprompter
#

FROM node:12-alpine
MAINTAINER EasyPi Software Foundation

ARG APP_DOMAIN=easypi.tv

WORKDIR /opt/app

RUN set -xe \
 && apk add --no-cache curl tar \
 && curl -sSL https://github.com/manifestinteractive/teleprompter/archive/refs/heads/master.tar.gz | tar xz --strip 1 \
 && find . -type f -exec sed -i "s@promptr\.tv@$APP_DOMAIN@g" {} + \
 && npm install \
 && npm install npm-run-all \
 && ln -s node_modules/npm-run-all/bin/npm-run-all/index.js npm-run-all

EXPOSE 3000 8080

CMD ["./npm-run-all", "--parallel", "server", "client"]
