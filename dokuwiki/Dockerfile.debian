#
# Dockerfile for DokuWiki
#
# References
# - https://github.com/docker-library/drupal/blob/master/8/Dockerfile
# - https://www.dokuwiki.org/faq:backup
#

FROM php:5.6-apache
MAINTAINER kev <noreply@easypi.pro>

WORKDIR /var/www/html

RUN a2enmod rewrite
RUN curl "http://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz" | tar xz --strip 1
RUN chown -R www-data:www-data .

VOLUME /var/www/html/data/pages \
       /var/www/html/data/meta \
       /var/www/html/data/media \
       /var/www/html/data/media_attic \
       /var/www/html/data/media_meta \
       /var/www/html/data/attic \
       /var/www/html/conf
