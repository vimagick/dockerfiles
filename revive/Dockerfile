#
# Dockerfile for revive
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

WORKDIR /var/www/html

RUN apk add -U git \
               gzip \
               nginx \
               php-apcu \
               php-curl \
               php-fpm \
               php-gd \
               php-mysql \
               php-openssl \
               php-phar \
               php-xml \
               php-zlib \
               tar \
    && wget -O- http://download.revive-adserver.com/revive-adserver-3.2.1.tar.gz | tar xz --strip 1 \
    && chown -R nobody:nobody . \
    && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD php-fpm && nginx -g 'daemon off;'
