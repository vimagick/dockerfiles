#
# Dockerfile for phpvirtualbox-arm
#

FROM easypi/alpine-arm
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache bash nginx php5-fpm php5-cli php5-json php5-soap \
    && apk add --no-cache --virtual build-dependencies wget unzip \
    && touch /etc/php5/fpm.d/empty.conf \
    && wget --no-check-certificate https://sourceforge.net/projects/phpvirtualbox/files/latest/download -O phpvirtualbox.zip \
    && unzip phpvirtualbox.zip -d phpvirtualbox \
    && mkdir -p /var/www \
    && mv -v phpvirtualbox/*/* /var/www/ \
    && rm phpvirtualbox.zip \
    && rm phpvirtualbox/ -R \
    && apk del build-dependencies \
    && rm -rf /var/cache/apk/* \
    && echo "<?php return array(); ?>" > /var/www/config-servers.php \
    && echo "<?php return array(); ?>" > /var/www/config-override.php \
    && chown nobody:nobody -R /var/www

COPY config.php /var/www/config.php
COPY nginx.conf /etc/nginx/nginx.conf
COPY servers-from-env.php /servers-from-env.php

EXPOSE 80

CMD php /servers-from-env.php && php-fpm && nginx
