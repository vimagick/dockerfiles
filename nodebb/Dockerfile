#
# Dockerfile for nodebb
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

ENV BB_VER 0.9.3
ENV BB_URL https://github.com/NodeBB/NodeBB/archive/v$BB_VER.tar.gz
ENV BB_SOURCE /usr/src/nodebb
ENV BB_CONTENT /var/lib/nodebb

WORKDIR $BB_SOURCE
VOLUME $BB_CONTENT

RUN set -ex \
    && apk add -U bash \
                  imagemagick \
                  nodejs \
                  openssl \
    && apk add -t TMP build-base \
                      curl \
                      git \
                      openssl-dev \
                      python \
                      tar \
    && curl -sSL $BB_URL | tar xz --strip 1 \
    && sed -i '/"bufferutil": {/,/},/d; /"utf-8-validate": {/,/},/d' npm-shrinkwrap.json \
    && npm install --production \
    && npm install connect-redis \
    && npm cache clean \
    && apk del TMP \
    && rm -rf /tmp/npm* \
              /var/cache/apk/*

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 4567
CMD ["npm", "start"]
