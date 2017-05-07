#
# Dockerfile for zoneminder
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && echo 'deb http://http.debian.net/debian jessie-backports main' >> /etc/apt/sources.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y fcgiwrap \
                                                  ffmpeg \
                                                  nginx \
                                                  php5-fpm \
                                                  zoneminder \
    && rm -rf /var/lib/apt/lists/*

RUN set -xe \
    && chmod o+r /etc/zm/zm.conf \
    && sed -i 's@^ZM_DB_HOST=.*$@ZM_DB_HOST=mysql@' /etc/zm/zm.conf \
    && sed -i 's@^;date.timezone =.*$@date.timezone = Asia/Shanghai@' /etc/php5/*/php.ini \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'FCGI_CHILDREN=4' > /etc/default/fcgiwrap

COPY nginx.conf /etc/nginx/sites-available/default

EXPOSE 80

CMD set -xe \
    && mkdir -p /var/run/zm \
    && chown www-data:www-data /var/run/zm \
    && /etc/init.d/fcgiwrap start \
    && /etc/init.d/php5-fpm start \
    && nginx -g 'daemon off;'
