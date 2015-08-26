#
# Dockerfile for dokuwiki
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

WORKDIR /var/www/html

RUN apk add -U nginx \
               openssl \
               php-fpm \
               php-openssl \
               php-xml \
               php-zlib \
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

CMD php-fpm && nginx -g 'daemon off;'
