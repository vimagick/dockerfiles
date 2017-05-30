#
# Dockerfile for dokuwiki
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

WORKDIR /var/www/html

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          gzip \
                          nginx \
                          openssl \
                          php5-fpm \
                          php5-openssl \
                          php5-pdo_sqlite \
                          php5-sqlite3 \
                          php5-xml \
                          php5-zlib \
                          tar \
    && touch /etc/php5/fpm.d/empty.conf \
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

CMD php-fpm5 && nginx -g 'daemon off;'
