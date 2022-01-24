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
        php8-fpm \
        php8-json \
        php8-openssl \
        php8-pdo_sqlite \
        php8-session \
        php8-sqlite3 \
        php8-xml \
        php8-zlib \
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

CMD php-fpm8 && nginx -g 'daemon off;'
