#
# Dockerfile for Dokuwiki
#

FROM php:5.6-apache
MAINTAINER kev <noreply@datageek.info>

WORKDIR /var/www/html

RUN a2enmod rewrite
RUN curl "http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz" | tar xz --strip 1
RUN chown -R www-data:www-data .

VOLUME [ \
    "/var/www/html/conf", \
    "/var/www/html/data", \
    "/var/www/html/lib/plugins" \
]

