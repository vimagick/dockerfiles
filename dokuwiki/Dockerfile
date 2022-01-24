#
# Dockerfile for dokuwiki
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

WORKDIR /var/www/html

RUN set -xe \
    && apk add --no-cache \
        ca-certificates \
        gzip \
        nginx \
        openssl \
        php7-fpm \
        php7-json \
        php7-openssl \
        php7-pdo_sqlite \
        php7-session \
        php7-sqlite3 \
        php7-xml \
        php7-zlib \
        tar \
    && wget -O- http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz | tar xz --strip 1 \
    && chown -R nobody:nobody .

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

CMD php-fpm7 && nginx -g 'daemon off;'
