#
# Dockerfile for mantisbt
#

FROM php:7.2-apache
MAINTAINER EasyPi Software Foundation

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y libfreetype6-dev libpng-dev libjpeg-dev libpq-dev libxml2-dev \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr --with-freetype-dir=/usr \
    && docker-php-ext-install gd mbstring mysql mysqli pgsql soap \
    && rm -rf /var/lib/apt/lists/*

ENV MANTIS_VERSION=2.25.0
ENV MANTIS_MD5=a3e4b5c4f91b5d04c37122650cb1189d
ENV MANTIS_URL=https://sourceforge.net/projects/mantisbt/files/mantis-stable/${MANTIS_VERSION}/mantisbt-${MANTIS_VERSION}.tar.gz
ENV MANTIS_FILE=mantisbt.tar.gz

RUN set -xe \
    && curl -fSL ${MANTIS_URL} -o ${MANTIS_FILE} \
    && echo "${MANTIS_MD5}  ${MANTIS_FILE}" | md5sum -c \
    && tar -xz --strip-components=1 -f ${MANTIS_FILE} \
    && rm ${MANTIS_FILE} \
    && chown -R www-data:www-data .

RUN set -xe \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'date.timezone = "Asia/Shanghai"' > /usr/local/etc/php/php.ini
