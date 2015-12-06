#
# Dockerfile for ghost-arm
#

FROM vimagick/alpine-arm:edge
MAINTAINER kev <noreply@datageek.info>

ENV GHOST_VER 0.7.2
ENV GHOST_URL https://github.com/TryGhost/Ghost/archive/$GHOST_VER.tar.gz
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
                      tar \
    && curl -sSL $GHOST_URL | tar xz --strip 1 \
    && npm install --production \
    && apk del TMP \
    && rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 2368
CMD ["npm", "start"]
