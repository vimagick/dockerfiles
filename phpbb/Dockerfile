#
# Dockerfile for phpBB
#

FROM php:5.6-apache
MAINTAINER kev<noreply@easypi.pro>

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl unzip bzip2 libpq-dev libpng12-dev libjpeg-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mysqli pgsql

WORKDIR /var/www/html

ENV PHPBB_VERSION 3.1.10
ENV PHPBB_URL https://www.phpbb.com/files/release/phpBB-${PHPBB_VERSION}.tar.bz2
ENV PHPBB_SHA 198fda1a0bd833d42e0d4f4fe26a47d656a6e087ed9a561e06b0940de131a22c
ENV PHPBB_FILE phpBB.tar.bz2

RUN set -xe \
    && curl -fSL ${PHPBB_URL} -o ${PHPBB_FILE} \
    && echo "${PHPBB_SHA}  ${PHPBB_FILE}" | sha256sum -c - \
    && tar -xjf ${PHPBB_FILE} --strip-components=1 \
    && rm ${PHPBB_FILE} \
    && chown -R www-data:www-data .

