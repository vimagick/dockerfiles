#
# Dockerfile for redis-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -ex \
    && apk add --no-cache redis \
    && sed -i 's/^daemonize yes/daemonize no/' /etc/redis.conf

WORKDIR /var/lib/redis/
VOLUME /var/lib/redis/

EXPOSE 6379

CMD ["redis-server", "/etc/redis.conf"]
