#
# Dockerfile for postgres-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk update \
    && apk add bash libpq postgresql postgresql-client postgresql-contrib su-exec \
    && sed -ri "s@^#?(listen_addresses)\s*=\s*\S+.*@\1 = '*'@" /usr/share/postgresql/postgresql.conf.sample \
    && mkdir /docker-entrypoint-initdb.d \
    && rm -rf /var/cache/apk/*

ENV LANG en_US.utf8
ENV PGDATA /var/lib/postgresql/data
VOLUME /var/lib/postgresql/data

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 5432
CMD ["postgres"]
