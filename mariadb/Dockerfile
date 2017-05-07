#
# Dockerfile for mariadb
#

FROM alpine
MAINTAINER kev <noreplay@easypi.pro>

RUN set -xe \
    && apk add -U bash \
                  mariadb \
                  mariadb-client \
                  tzdata \
    && mkdir -p /run/mysqld \
    && chown mysql:mysql /run/mysqld \
    && sed -Ei -e 's/^(bind-address|log)/#&/' \
               -e 's/^\[mysqld\]$/&\nskip-host-cache\nskip-name-resolve\nuser=mysql/' /etc/mysql/my.cnf \
    && rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /

VOLUME /var/lib/mysql
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
