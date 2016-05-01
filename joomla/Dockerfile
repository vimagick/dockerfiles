#
# Dockerfile for Joomla
#

FROM php:5.6-apache
MAINTAINER kev<noreply@easypi.info>

RUN apt-get update && apt-get install -y curl unzip bzip2 libpq-dev libpng12-dev libjpeg-dev \
        && rm -rf /var/lib/apt/lists/* \
        && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
        && docker-php-ext-install gd mysqli pgsql

WORKDIR /var/www/html

ENV JOOMLA_VERSION 3.4.1
ENV JOOMLA_URL https://github.com/joomla/joomla-cms/releases/download/${JOOMLA_VERSION}/Joomla_${JOOMLA_VERSION}-Stable-Full_Package.tar.gz
ENV JOOMLA_MD5 ea0a13638123a300ecc0759e425a6172
ENV JOOMLA_FILE Joomla.tar.gz

RUN curl -fSL ${JOOMLA_URL} -o ${JOOMLA_FILE} \
        && echo "${JOOMLA_MD5} ${JOOMLA_FILE}" | md5sum -c - \
        && tar -xzf ${JOOMLA_FILE} \
        && rm ${JOOMLA_FILE} \
        && chown -R www-data:www-data .

