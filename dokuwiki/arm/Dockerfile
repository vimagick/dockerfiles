#
# Dockerfile for dokuwiki-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

WORKDIR /var/www/html

RUN set -xe \
    && apk add -U ca-certificates \
                  gzip \
                  nginx \
                  php5-fpm \
                  php5-openssl \
                  php5-pdo_sqlite \
                  php5-sqlite3 \
                  php5-xml \
                  php5-zlib \
                  tar \
    && wget -O- http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz | tar xz --strip 1 \
    && chown -R nobody:nobody . \
    && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

VOLUME /var/www/html/conf \
       /var/www/html/data/pages \
       /var/www/html/data/meta \
       /var/www/html/data/media \
       /var/www/html/data/media_attic \
       /var/www/html/data/media_meta \
       /var/www/html/data/attic \
       /var/www/html/lib/plugins

EXPOSE 80

CMD mkdir -p /run/nginx && php-fpm && nginx -g 'daemon off;'
