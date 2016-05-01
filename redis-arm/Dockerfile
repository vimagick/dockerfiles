#
# Dockerfile for redis-arm
#

FROM vimagick/alpine-arm
MAINTAINER kev <noreply@easypi.info>

RUN set -ex \
    && apk add -U redis \
    && sed -i 's/^daemonize yes/daemonize no/' /etc/redis.conf \
    && rm -rf /var/cache/apk/*

WORKDIR /var/lib/redis/
VOLUME /var/lib/redis/

EXPOSE 6379

CMD ["redis-server", "/etc/redis.conf"]
