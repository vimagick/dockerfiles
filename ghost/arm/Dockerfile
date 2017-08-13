#
# Dockerfile for ghost-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

ENV GHOST_VERSION 1.5.2
ENV GHOST_INSTALL /var/lib/ghost
ENV GHOST_CONTENT /var/lib/ghost/content
ENV GHOST_CLI_VERSION 1.0.3
ENV NPM_CONFIG_LOGLEVEL warn
ENV NODE_ENV production

RUN set -xe \
    && addgroup -g 1000 node \
    && adduser -u 1000 -G node -s /bin/sh -D node \
    && apk add --no-cache bash build-base nodejs nodejs-npm python su-exec \
    && npm install -g --unsafe-perm ghost-cli@$GHOST_CLI_VERSION knex-migrator@latest \
    && mkdir -p $GHOST_INSTALL \
    && chown node:node $GHOST_INSTALL \
    && su-exec node ghost install $GHOST_VERSION --db sqlite3 --no-prompt --no-stack --no-setup --dir $GHOST_INSTALL \
    && cd $GHOST_INSTALL \
    && su-exec node ghost config --ip 0.0.0.0 --port 2368 --no-prompt --db sqlite3 --url http://localhost:2368 --dbpath $GHOST_CONTENT/data/ghost.db \
    && su-exec node ghost config paths.contentPath $GHOST_CONTENT \
    && mv $GHOST_CONTENT $GHOST_INSTALL/content.orig \
    && mkdir -p $GHOST_CONTENT \
    && chown node:node $GHOST_CONTENT \
    && apk del build-base python

WORKDIR $GHOST_INSTALL
VOLUME $GHOST_CONTENT

COPY docker-entrypoint.sh /usr/local/bin
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 2368
CMD ["node", "current/index.js"]
