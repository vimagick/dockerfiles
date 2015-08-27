#
# Dockerfile for h2o
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U build-base \
               cmake \
               curl \
               linux-headers \
               zlib-dev \
    && curl -sSL https://github.com/h2o/h2o/archive/master.tar.gz | tar xz \
        && cd h2o-master \
        && cmake -DWITH_BUNDLED_SSL=on . \
        && make install \
        && cd .. \
        && rm -rf h2o-master \
    && apk del build-base \
               cmake \
               curl \
               linux-headers \
               zlib-dev \
    && rm -rf /var/cache/apk/*

COPY h2o.conf /etc/

WORKDIR /var/www/html

EXPOSE 80 443

CMD ["h2o", "-c", "/etc/h2o.conf"]
