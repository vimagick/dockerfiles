#
# Dockerfile for nextcloud
#

FROM php:7-apache
MAINTAINER kev <noreply@easypi.pro>

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y bzip2 \
                          libcurl4-openssl-dev \
                          libfreetype6-dev \
                          libicu-dev \
                          libjpeg-dev \
                          libmcrypt-dev \
                          libmemcached-dev \
                          libpng12-dev \
                          libpq-dev \
                          libxml2-dev \
                          smbclient \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install exif \
                              gd \
                              intl \
                              mbstring \
                              mcrypt \
                              mysqli \
                              pcntl \
                              pdo_mysql \
                              pdo_pgsql \
                              pgsql \
                              zip \
    && pecl install APCu-5.1.5 \
    && pecl install memcached-2.2.0 \
    && pecl install redis-3.0.0 \
    && docker-php-ext-enable apcu memcached redis \
    && rm -rf /var/lib/apt/lists/*

ENV NC_VERSION 9.0.53
ENV NC_FILE nextcloud-${NC_VERSION}.tar.bz2
ENV NC_URL https://download.nextcloud.com/server/releases/${NC_FILE}

RUN set -xe \
    && curl -sSL ${NC_URL} -o ${NC_FILE} \
    && curl -sSL ${NC_URL}.md5 | md5sum -c \
    && tar xjf ${NC_FILE} --strip 1 \
    && rm -rf ${NC_FILE} \
    && chown -R www-data:www-data .

VOLUME /var/www/html/data
