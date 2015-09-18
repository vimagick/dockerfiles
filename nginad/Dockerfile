#
# Dockerfile for nginad
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

WORKDIR /var/www/html

RUN apk add -U ca-certificates \
               git \
               gzip \
               nginx \
               php-fpm \
               php-json \
               php-openssl \
               php-pdo \
               php-pdo_mysql \
               php-phar \
               php-xml \
               php-zlib \
               tar \
    && wget -O- https://github.com/nginadfoundation/nginad/archive/1.6.5.tar.gz | tar xz --strip 1 \
    && cd upload \
    && php composer.phar self-update \
    && php composer.phar install \
    && cd config/autoload \
    && cp database.local.php.dist database.local.php \
    && cp delivery.local.php.dist delivery.local.php \
    && cp email.local.php.dist email.local.php \
    && cp rtb.config.local.php.dist rtb.config.local.php \
    && sed -i -e "s/'pass'   => ''/'pass'   => 'root'/" \
              -e "s/'host'   => 'localhost'/'host'   => 'mysql'/" database.local.php \
    && chown -R nobody:nobody . \
    && apk del git \
    && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD php-fpm && nginx -g 'daemon off;'
