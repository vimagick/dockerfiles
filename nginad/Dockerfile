#
# Dockerfile for nginad
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

ENV NGINAD_VER 1.6.12
ENV NGINAD_URL https://github.com/nginadfoundation/nginad/archive/${NGINAD_VER}.tar.gz

WORKDIR /var/www/html

RUN apk add --no-cache curl \
                       git \
                       gzip \
                       nginx \
                       php5-apcu \
                       php5-curl \
                       php5-fpm \
                       php5-iconv \
                       php5-json \
                       php5-openssl \
                       php5-pdo \
                       php5-pdo_mysql \
                       php5-phar \
                       php5-xml \
                       php5-zlib \
                       tar \
    && touch /etc/php5/fpm.d/empty.conf \
    && curl -sSL ${NGINAD_URL} | tar xz --strip 1 \
    && cd upload \
    && php composer.phar self-update \
    && php composer.phar install \
    && chown -R nobody:nobody . \
    && cd config/autoload \
    && cp database.local.php.dist database.local.php \
    && cp delivery.local.php.dist delivery.local.php \
    && cp email.local.php.dist email.local.php \
    && cp rtb.config.local.php.dist rtb.config.local.php \
    && sed -i -e "s/'pass'   => ''/'pass'   => 'root'/" \
              -e "s/'host'   => 'localhost'/'host'   => 'mysql'/" database.local.php \
    && apk del curl git

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD php-fpm && nginx -g 'daemon off;'
