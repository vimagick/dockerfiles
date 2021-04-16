#
# Dockerfile for opencart
#

FROM php:7.2-apache
MAINTAINER EasyPi Software Foundation

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y libpng-dev libjpeg-dev libmcrypt-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mbstring mysqli zip \
    && pecl install mcrypt-1.0.4 \
    && docker-php-ext-enable mcrypt

WORKDIR /var/www/html

ENV OPENCART_VERSION=3.0.3.7
ENV OPENCART_MD5=52288349b779a4517d4b7987253caceb
ENV OPENCART_URL=https://github.com/opencart/opencart/archive/${OPENCART_VERSION}.tar.gz
ENV OPENCART_FILE=opencart.tar.gz

RUN set -xe \
    && curl -sSL ${OPENCART_URL} -o ${OPENCART_FILE} \
    && echo "${OPENCART_MD5}  ${OPENCART_FILE}" | md5sum -c \
    && tar xzf ${OPENCART_FILE} --strip 2 --wildcards '*/upload/' \
    && mv config-dist.php config.php \
    && mv admin/config-dist.php admin/config.php \
    && rm ${OPENCART_FILE} \
    && chown -R www-data:www-data /var/www

