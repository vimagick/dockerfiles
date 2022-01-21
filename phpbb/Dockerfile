#
# Dockerfile for phpBB
#

FROM php:8-apache
MAINTAINER EasyPi Software Foundation

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl unzip bzip2 libfreetype6-dev libjpeg-dev libpng-dev libpq-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pgsql

WORKDIR /var/www/html

ENV PHPBB_VERSION=3.3.5
ENV PHPBB_URL=https://www.phpbb.com/files/release/phpBB-${PHPBB_VERSION}.tar.bz2
ENV PHPBB_URL=https://download.phpbb.com/pub/release/3.3/${PHPBB_VERSION}/phpBB-${PHPBB_VERSION}.tar.bz2
ENV PHPBB_SHA=349699e0cfaf235669cdb72528982e6519c6ebd109b3c4bc31d1847ca1520d0b
ENV PHPBB_FILE=phpBB.tar.bz2

RUN set -xe \
    && curl -fSL ${PHPBB_URL} -o ${PHPBB_FILE} \
    && echo "${PHPBB_SHA}  ${PHPBB_FILE}" | sha256sum -c - \
    && tar -xjf ${PHPBB_FILE} --strip-components=1 \
    && rm ${PHPBB_FILE} \
    && chown -R www-data:www-data .
