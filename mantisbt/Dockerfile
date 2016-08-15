#
# Dockerfile for mantisbt
#

FROM php:5.6-apache
MAINTAINER kev <noreply@easypi.info>

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y libpng12-dev libjpeg-dev libpq-dev libxml2-dev \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mbstring mysql mysqli pgsql soap \
    && rm -rf /var/lib/apt/lists/*

ENV MANTIS_VER 1.3.0
ENV MANTIS_MD5 74415837b3ebcc17068258a6e5ab0732
ENV MANTIS_URL http://jaist.dl.sourceforge.net/project/mantisbt/mantis-stable/${MANTIS_VER}/mantisbt-${MANTIS_VER}.tar.gz
ENV MANTIS_FILE mantisbt.tar.gz

RUN set -xe \
    && curl -fSL ${MANTIS_URL} -o ${MANTIS_FILE} \
    && echo "${MANTIS_MD5}  ${MANTIS_FILE}" | md5sum -c \
    && tar -xz --strip-components=1 -f ${MANTIS_FILE} \
    && rm ${MANTIS_FILE} \
    && chown -R www-data:www-data .

RUN set -xe \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo 'date.timezone = "Asia/Shanghai"' > /usr/local/etc/php/php.ini
