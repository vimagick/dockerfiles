#
# Dockerfile for phpvirtualbox-arm
#

FROM arm32v7/alpine:3
MAINTAINER EasyPi Software Foundation

ENV PHPVBOX_VERSION=5.2-1
ENV PHPVBOX_URL=https://github.com/phpvirtualbox/phpvirtualbox/archive/${PHPVBOX_VERSION}.tar.gz

WORKDIR /var/www

RUN set -xe \
    && apk add --no-cache bash nginx php5-fpm php5-cli php5-json php5-soap \
    && apk add --no-cache --virtual build-dependencies curl tar \
    && touch /etc/php5/fpm.d/empty.conf \
    && curl -sSL ${PHPVBOX_URL} | tar xz --strip 1 \
    && apk del build-dependencies \
    && chown nobody:nobody -R /var/www

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD php-fpm && nginx
