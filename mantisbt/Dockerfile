#
# Dockerfile for mantisbt
#

FROM php:5.6-apache
MAINTAINER kev<noreply@datageek.info>

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev libcurl3 \
        && rm -rf /var/lib/apt/lists/* \
        && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
        && docker-php-ext-install curl fileinfo gd mbstring mysql mysqli pgsql

WORKDIR /var/www/html

ENV MANTIS_VERSION 1.2.19
ENV MANTIS_MD5 8377a0219ec344b9ab9c186012b5114f
ENV MANTIS_URL http://jaist.dl.sourceforge.net/project/mantisbt/mantis-stable/${MANTIS_VERSION}/mantisbt-${MANTIS_VERSION}.tar.gz
ENV MANTIS_FILE mantisbt.tar.gz

RUN curl -fSL ${MANTIS_URL} -o ${MANTIS_FILE} \
        && echo "${MANTIS_MD5} ${MANTIS_FILE}" | md5sum -c - \
        && tar -xz --strip-components=1 -f ${MANTIS_FILE} \
        && rm ${MANTIS_FILE} \
        && chown -R www-data:www-data .

