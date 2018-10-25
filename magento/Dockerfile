#
# Dockerfile for magento
#

FROM php:5.6-apache
MAINTAINER kev <noreply@easypi.pro>

RUN a2enmod rewrite

RUN set -xe \
    && apt-get update \
    && apt-get install -y build-essential     \
                          libcurl3            \
                          libcurl3-dev        \
                          libfreetype6        \
                          libfreetype6-dev    \
                          libicu52            \
                          libicu-dev          \
                          libjpeg62-turbo     \
                          libjpeg62-turbo-dev \
                          libmcrypt4          \
                          libmcrypt-dev       \
                          libpng16-16         \
                          libpng-dev          \
                          libxslt1.1          \
                          libxslt1-dev        \
                          zlib1g              \
                          zlib1g-dev          \
                          zziplib-bin         \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd        \
                              intl      \
                              mbstring  \
                              mcrypt    \
                              pdo_mysql \
                              xsl       \
                              zip       \
    && curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get purge -y --auto-remove build-essential     \
                                      libcurl3-dev        \
                                      libfreetype6-dev    \
                                      libicu-dev          \
                                      libjpeg62-turbo-dev \
                                      libmcrypt-dev       \
                                      libpng-dev          \
                                      libxslt1-dev        \
                                      zlib1g-dev          \
    && rm -rf /var/lib/apt/lists/*

RUN {                                             \
        echo 'always_populate_raw_post_data = -1';\
        echo 'max_execution_time = 240';          \
        echo 'max_input_vars = 1500';             \
        echo 'upload_max_filesize = 32M';         \
        echo 'post_max_size = 32M';               \
    } > /usr/local/etc/php/conf.d/typo3.ini
    

WORKDIR /var/www/html

ENV MAGENTO_VER 2.1.15
ENV MAGENTO_MD5 139aeece901f0e8c07f3e572bba646da
ENV MAGENTO_URL https://github.com/magento/magento2/archive/$MAGENTO_VER.tar.gz
ENV MAGENTO_FILE magento.tar.gz

RUN set -xe \
    && curl -sSL ${MAGENTO_URL} -o ${MAGENTO_FILE}        \
    && echo "${MAGENTO_MD5}  ${MAGENTO_FILE}" | md5sum -c \
    && tar xzf ${MAGENTO_FILE} --strip 1                  \
    && rm ${MAGENTO_FILE}                                 \
    && chown -R www-data:www-data .                       \
    && composer install
