FROM php:5.5-apache
MAINTAINER kev<noreply@datageek.info>

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql

WORKDIR /var/www/html

ENV MANTIS_VERSION 1.2.19
ENV MANTIS_MD5 ef1523405d1d1c87b3431e47e82b3ab0
ENV MANTIS_URL http://jaist.dl.sourceforge.net/project/mantisbt/mantis-stable/${MANTIS_VERSION}/mantisbt-${MANTIS_VERSION}.tar.gz

RUN curl -fSL -o mantisbt.tar.gz ${MANTIS_URL} \
	&& echo "${MANTIS_MD5} mantisbt.tar.gz" | md5sum -c - \
	&& tar -xz --strip-components=1 -f mantisbt.tar.gz \
	&& rm mantisbt.tar.gz \
	&& chown -R www-data:www-data .
