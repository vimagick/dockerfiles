#
# Dockerfile for ghost-arm
#

FROM vimagick/alpine-arm:edge
MAINTAINER kev <noreply@datageek.info>

ENV GHOST_VER 0.7.4
ENV GHOST_URL https://ghost.org/archives/ghost-$GHOST_VER.zip
ENV GHOST_SOURCE /usr/src/ghost
ENV GHOST_CONTENT /var/lib/ghost

WORKDIR $GHOST_SOURCE
VOLUME $GHOST_CONTENT

RUN set -ex \
    && apk add -U bash \
                  nodejs \
    && apk add -t TMP build-base \
                      curl \
                      python \
    && curl -sSL $GHOST_URL -o ghost.zip \
    && unzip ghost.zip \
    && npm install --production \
    && npm cache clean \
    && apk del TMP \
    && rm -rf ghost.zip \
              /tmp/npm* \
              /var/cache/apk/*

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 2368
CMD ["npm", "start"]
