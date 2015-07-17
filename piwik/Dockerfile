#
# Dockerfile for piwik
#

FROM php:5.6-apache
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y git \
                          libpng12-0 \
                          libpng12-dev \
                          libjpeg62-turbo \
                          libjpeg-dev \
                          libzip2 \
                          libzip-dev \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd \
                              mbstring \
                              mysqli \
                              zip \
    && apt-get purge --auto-remove -y libpng12-dev \
                                      libjpeg-dev \
                                      libzip-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

ENV PIWIK_VER 2.14.1
ENV PIWIK_MD5 f299515138d99c46eda737761c73c2e6
ENV PIWIK_URL https://github.com/piwik/piwik/archive/$PIWIK_VER.tar.gz
ENV PIWIK_FILE piwik.tar.gz

RUN curl -sSL ${PIWIK_URL} -o ${PIWIK_FILE} \
    && echo "${PIWIK_MD5} ${PIWIK_FILE}" | md5sum -c \
    && tar xzf ${PIWIK_FILE} --strip 1 \
    && rm ${PIWIK_FILE} \
    && curl -sS https://getcomposer.org/installer | php \
    && php composer.phar install \
    && chown -R www-data:www-data .

