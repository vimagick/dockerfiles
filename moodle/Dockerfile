#
# Dockerfile for moodle
#
# - https://docs.moodle.org/30/en/Step-by-step_Installation_Guide_for_Ubuntu
#

FROM php:5.6-apache
MAINTAINER kev<noreply@datageek.info>

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y aspell \
                          clamav \
                          graphviz \
                          libpng12-0 \
                          libpng12-dev \
                          libjpeg62-turbo \
                          libjpeg-dev \
                          libmcrypt4 \
                          libmcrypt-dev \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd \
                              intl \
                              ldap \
                              mcrypt \
                              mbstring \
                              mysqli \
                              opcache \
                              pspell \
                              xmlrpc \
                              zip \
    && apt-get remove -y libpng12-dev \
                         libjpeg-dev \
                         libmcrypt-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

ENV MOODLE_VER 3.0.1+
ENV MOODLE_MD5 560c9b2ff110d9d833513e3e2568d79b
ENV MOODLE_URL https://download.moodle.org/download.php/direct/stable30/moodle-latest-30.tgz
ENV MOODLE_FILE moodle.tgz

RUN curl -sSL ${MOODLE_URL} -o ${MOODLE_FILE} \
    && echo "${MOODLE_MD5} ${MOODLE_FILE}" | md5sum -c \
    && tar xzf ${MOODLE_FILE} --strip 1 \
    && rm ${MOODLE_FILE} \
    && chown -R www-data:www-data .
