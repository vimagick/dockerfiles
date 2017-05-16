#
# Dockerfile for phpBB
#

FROM php:7-apache
MAINTAINER kev <noreply@easypi.pro>

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl unzip bzip2 libpq-dev libpng12-dev libjpeg-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mysqli pgsql

WORKDIR /var/www/html

ENV PHPBB_VERSION 3.2.0
ENV PHPBB_URL https://www.phpbb.com/files/release/phpBB-${PHPBB_VERSION}.tar.bz2
ENV PHPBB_SHA 610d960b6e050b205b7248dea366c63bf1feee0551170c75fa4ecbacd5213a0d
ENV PHPBB_FILE phpBB.tar.bz2

RUN set -xe \
    && curl -fSL ${PHPBB_URL} -o ${PHPBB_FILE} \
    && echo "${PHPBB_SHA}  ${PHPBB_FILE}" | sha256sum -c - \
    && tar -xjf ${PHPBB_FILE} --strip-components=1 \
    && rm ${PHPBB_FILE} \
    && chown -R www-data:www-data .

