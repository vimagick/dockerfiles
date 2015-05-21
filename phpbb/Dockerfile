#
# Dockerfile for phpBB
#

FROM php:5.6-apache
MAINTAINER kev<noreply@datageek.info>

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev \
        && rm -rf /var/lib/apt/lists/* \
        && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
        && docker-php-ext-install fileinfo gd mbstring mysql mysqli pgsql

WORKDIR /var/www/html

ENV PHPBB_VERSION 3.1.4
ENV PHPBB_MD5 8b0bfa3bf487e68b59ff81a4e99e4d8f
ENV PHPBB_URL https://www.phpbb.com/files/release/phpBB-3.1.4.tar.bz2
ENV PHPBB_FILE phpBB.tar.bz2

RUN curl -fSL ${PHPBB_URL} -o ${PHPBB_FILE} \
        && echo "${PHPBB_MD5} ${PHPBB_FILE}" | md5sum -c - \
        && tar -xj --strip-components=1 -f ${PHPBB_FILE} \
        && rm ${PHPBB_FILE} \
        && chown -R www-data:www-data .

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo 'date.timezone = "Asia/Shanghai"' > /usr/local/etc/php/php.ini
