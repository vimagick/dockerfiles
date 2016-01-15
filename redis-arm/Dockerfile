#
# Dockerfile for redis-arm
#

FROM vimagick/alpine-arm
MAINTAINER kev <noreply@datageek.info>

RUN set -ex \
    && apk add -U redis \
    && sed -i 's/^daemonize yes/daemonize no/' /etc/redis.conf \
    && rm -rf /var/cache/apk/*

VOLUME /var/lib/redis/

EXPOSE 6379

CMD ["redis-server"]
