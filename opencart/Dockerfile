#
# Dockerfile for opencart
#

FROM php:5.6-apache
MAINTAINER kev<noreply@datageek.info>

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev \
        && rm -rf /var/lib/apt/lists/* \
        && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
        && docker-php-ext-install gd mcrypt mbstring mysqli

WORKDIR /var/www/html

ENV OPENCART_VER 2.0.3.0
ENV OPENCART_MD5 27f22c70eac060a304fc64311c8278d5
ENV OPENCART_URL https://github.com/opencart/opencart/archive/${OPENCART_VER}.tar.gz
ENV OPENCART_FILE opencart.tar.gz

RUN curl -fSL ${OPENCART_URL} -o ${OPENCART_FILE} \
        && echo "${OPENCART_MD5} ${OPENCART_FILE}" | md5sum -c \
        && tar xzf ${OPENCART_FILE} --strip 2 '*/upload/' \
        && rm ${OPENCART_FILE} \
        && chown -R www-data:www-data .

