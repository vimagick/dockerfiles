#
# Dockerfile for nextcloud
#

FROM php:7-apache
MAINTAINER kev <noreply@easypi.info>

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y bzip2 \
                          libcurl4-openssl-dev \
                          libfreetype6-dev \
                          libicu-dev \
                          libjpeg-dev \
                          libldap2-dev \
                          libmcrypt-dev \
                          libmemcached-dev \
                          libpng12-dev \
                          libpq-dev \
                          libxml2-dev \
                          smbclient \
    && ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && mkdir -p /usr/src/php/ext/memcached \
    && curl -sSL https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz | tar xz --strip 1 -C /usr/src/php/ext/memcached \
    && docker-php-ext-configure memcached \
    && docker-php-ext-install exif \
                              gd \
                              intl \
                              ldap \
                              mbstring \
                              mcrypt \
                              memcached \
                              mysqli \
                              pcntl \
                              pdo_mysql \
                              pdo_pgsql \
                              pgsql \
                              zip \
    && pecl install APCu-5.1.5 \
    && pecl install redis-3.0.0 \
    && docker-php-ext-enable apcu redis \
    && rm -rf /var/lib/apt/lists/*

ENV NC_VERSION 9.0.52
ENV NC_FILE nextcloud-${NC_VERSION}.tar.bz2
ENV NC_MD5 08f0fc5b85b491e99069da8a86fc9fe8
ENV NC_URL https://download.nextcloud.com/server/releases/${NC_FILE}

RUN set -xe \
    && curl -sSL ${NC_URL} -o ${NC_FILE} \
    && echo "${NC_MD5}  ${NC_FILE}" | md5sum -c \
    && tar xjf ${NC_FILE} --strip 1 \
    && rm -rf ${NC_FILE} \
    && chown -R www-data:www-data .

VOLUME /var/www/html/data
