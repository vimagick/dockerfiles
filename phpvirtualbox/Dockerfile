#
# Dockerfile for phpvirtualbox
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

ARG PHPVBOX_VERSION
ARG PHPVBOX_URL=https://github.com/phpvirtualbox/phpvirtualbox/archive/${PHPVBOX_VERSION}.tar.gz

WORKDIR /var/www

RUN set -xe \
    && apk add --no-cache bash nginx php85-fpm php85-cli php85-common php85-json php85-soap php85-simplexml php85-session \
    && apk add --no-cache --virtual build-dependencies curl tar \
    && curl -sSL ${PHPVBOX_URL} | tar xz --strip 1 \
    && apk del build-dependencies \
    && chown nobody:nobody -R /var/www

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD php-fpm85 && nginx
