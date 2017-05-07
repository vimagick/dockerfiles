#
# Dockerfile for moodle
#
# - https://docs.moodle.org/30/en/Step-by-step_Installation_Guide_for_Ubuntu
#

FROM php:5.6-apache
MAINTAINER kev<noreply@easypi.pro>

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y clamav \
                          graphviz \
                          libicu52 \
                          libicu-dev \
                          libjpeg62-turbo \
                          libjpeg-dev \
                          libldap-2.4-2 \
                          libldap2-dev \
                          libmcrypt4 \
                          libmcrypt-dev \
                          libpng12-0 \
                          libpng12-dev \
                          libpspell-dev \
                          libxml2 \
                          libxml2-dev \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu \
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
    && apt-get remove -y libicu-dev \
                         libjpeg-dev \
                         libldap2-dev \
                         libmcrypt-dev \
                         libpng12-dev \
                         libpspell-dev \
                         libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

ENV MOODLE_VERSION 3.1.2
ENV MOODLE_FILE moodle-${MOODLE_VERSION}.tgz
ENV MOODLE_URL https://download.moodle.org/stable31/${MOODLE_FILE}
ENV MOODLE_MD5 02b0ab99babb90bfa52c6100d7c91659

RUN curl -sSL ${MOODLE_URL} -o ${MOODLE_FILE} \
    && echo "${MOODLE_MD5}  ${MOODLE_FILE}" | md5sum -c \
    && tar xzf ${MOODLE_FILE} --strip 1 \
    && rm ${MOODLE_FILE} \
    && chown -R www-data:www-data .
