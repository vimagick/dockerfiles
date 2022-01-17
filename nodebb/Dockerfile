#
# Dockerfile for nodebb
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ENV BB_VER=1.19.0
ENV BB_URL=https://github.com/NodeBB/NodeBB/archive/v$BB_VER.tar.gz
ENV BB_DIR=/opt/nodebb
ENV NODE_ENV=production

WORKDIR $BB_DIR

RUN set -ex \
    && apk add -U bash \
                  icu \
                  imagemagick \
                  nodejs \
                  npm \
                  openssl \
    && apk add -t TMP build-base \
                      curl \
                      git \
                      icu-dev \
                      openssl-dev \
                      python3 \
                      tar \
    && curl -sSL $BB_URL | tar xz --strip 1 \
    && curl -sSL https://github.com/NodeBB/NodeBB/raw/v1.19.0/install/package.json > package.json \
    && npm install \
    && apk del TMP \
    && rm -rf /tmp/npm* \
              /var/cache/apk/*

VOLUME $BB_DIR/config \
       $BB_DIR/build \
       $BB_DIR/public/uploads

ENV silent=false
ENV daemon=false

EXPOSE 4567

CMD ["./nodebb", "--config", "config/config.json", "start"]
