#
# Dockerfile for piwik
#

FROM php:5.6-apache
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apt-get update \
    && apt-get install -y git \
                          libfreetype6 \
                          libfreetype6-dev \
                          libjpeg62-turbo \
                          libjpeg-dev \
                          libpng12-0 \
                          libpng12-dev \
                          libzip2 \
                          libzip-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr \
                                   --with-jpeg-dir=/usr \
                                   --with-png-dir=/usr \
    && docker-php-ext-install gd \
                              mbstring \
                              mysqli \
                              zip \
    && apt-get purge --auto-remove -y libfreetype6-dev \
                                      libjpeg-dev \
                                      libpng12-dev \
                                      libzip-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

ENV PIWIK_VER 2.15.0
ENV PIWIK_MD5 a57398f53384879aaf459748329ff614
ENV PIWIK_URL https://github.com/piwik/piwik/archive/$PIWIK_VER.tar.gz
ENV PIWIK_FILE piwik.tar.gz

RUN set -xe \
    && curl -sSL ${PIWIK_URL} -o ${PIWIK_FILE} \
    && echo "${PIWIK_MD5}  ${PIWIK_FILE}" | md5sum -c \
    && tar xzf ${PIWIK_FILE} --strip 1 \
    && rm ${PIWIK_FILE} \
    && curl -sS https://getcomposer.org/installer | php \
    && php composer.phar install \
    && echo "always_populate_raw_post_data=-1" >> /usr/local/etc/php/php.ini \
    && chown -R www-data:www-data .

