#
# Dockerfile for phpmyadmin-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

WORKDIR /www/

RUN set -xe \
    && apk add -U curl \
                  php5-cli \
                  php5-ctype \
                  php5-curl \
                  php5-gd \
                  php5-json \
                  php5-mcrypt \
                  php5-mysqli \
                  php5-opcache \
                  php5-openssl \
                  php5-xml \
                  php5-zlib \
                  tar \
    && curl -sSL https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz | tar xz --strip 1 \
    && rm -rf ./examples/ ./js/jquery/src/ ./po/ \
    && curl -sSL https://github.com/phpmyadmin/docker/raw/master/config.inc.php > ./config.inc.php \
    && curl -sSL https://github.com/phpmyadmin/docker/raw/master/run.sh > /run.sh \
    && chmod +x /run.sh \
    && mkdir -p /sessions \
    && apk del curl tar \
    && rm -rf /var/cache/apk/*

ENV PHP_UPLOAD_MAX_FILESIZE=64M
ENV PHP_MAX_INPUT_VARS=2000

EXPOSE 80

CMD ["/run.sh"]
