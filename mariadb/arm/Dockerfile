#
# Dockerfile for mariadb-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache bash \
                          mariadb \
                          mariadb-client \
                          tzdata \
    && mkdir -p /run/mysqld \
    && chown mysql:mysql /run/mysqld \
    && sed -Ei -e 's/^(bind-address|log)/#&/' \
               -e 's/^\[mysqld\]$/&\nskip-host-cache\nskip-name-resolve\nuser=mysql/' \
               /etc/mysql/my.cnf

COPY docker-entrypoint.sh /

VOLUME /var/lib/mysql
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
