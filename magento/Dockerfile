#
# Dockerfile for magento
#

FROM php:5.6-apache
MAINTAINER kev<noreply@datageek.info>

RUN a2enmod rewrite

RUN apt-get update \
    && apt-get install -y libcurl3-dev \
                          libfreetype6 \
                          libfreetype6-dev \
                          libjpeg62-turbo \
                          libjpeg62-turbo-dev \
                          libmcrypt-dev \
                          libmcrypt4 \
                          libpng12-dev \
                          libpng12-dev \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd mcrypt mbstring pdo_mysql \
    && apt-get purge -y --auto-remove libcurl3-dev \
                                      libfreetype6-dev \
                                      libjpeg62-turbo-dev \
                                      libmcrypt-dev \
                                      libpng12-dev \
                                      libpng12-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

ENV MAGENTO_VER 1.9.1.1
ENV MAGENTO_MD5 0066442dbdfc70bf1385e42c1bff1559
ENV MAGENTO_URL http://www.magentocommerce.com/downloads/assets/$MAGENTO_VER/magento-$MAGENTO_VER.tar.gz
ENV MAGENTO_FILE magento.tar.gz

RUN curl -sSL ${MAGENTO_URL} -o ${MAGENTO_FILE} \
    && echo "${MAGENTO_MD5} ${MAGENTO_FILE}" | md5sum -c \
    && tar xzf ${MAGENTO_FILE} --strip 1 \
    && rm ${MAGENTO_FILE} \
    && chown -R www-data:www-data .

