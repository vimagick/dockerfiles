#
# Dockerfile for h2o-arm
#

FROM vimagick/alpine-arm
MAINTAINER kev <noreply@easypi.info>

ENV H2O_VER 2.0.1
ENV H2O_URL https://github.com/h2o/h2o/archive/v${H2O_VER}.tar.gz
ENV H2O_DIR h2o-${H2O_VER}

RUN set -xe \
    && apk add -U build-base \
                  cmake \
                  curl \
                  linux-headers \
                  zlib-dev \
    && curl -sSL ${H2O_URL} | tar xz \
        && cd ${H2O_DIR} \
        && cmake -DWITH_BUNDLED_SSL=on . \
        && make install \
        && cd .. \
        && rm -rf ${H2O_DIR} \
    && apk del build-base \
               cmake \
               curl \
               linux-headers \
               zlib-dev \
    && rm -rf /var/cache/apk/*

COPY h2o.conf /etc/
WORKDIR /var/www/html

EXPOSE 80
CMD ["h2o", "-c", "/etc/h2o.conf"]
