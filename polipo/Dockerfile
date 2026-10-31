#
# Dockerfile for polipo
#

FROM alpine:3.24

MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache build-base openssl \
    && wget https://github.com/jech/polipo/archive/master.zip -O polipo.zip \
    && unzip polipo.zip \
    && cd polipo-master \
    && make \
    && install polipo /usr/local/bin/ \
    && cd .. \
    && rm -rf polipo.zip polipo-master \
    && mkdir -p /usr/share/polipo/www /var/cache/polipo \
    && apk del build-base openssl

EXPOSE 8123

ENTRYPOINT ["polipo", "proxyAddress=0.0.0.0", "proxyPort=8123"]
