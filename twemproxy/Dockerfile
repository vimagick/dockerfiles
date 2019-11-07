#
# Dockerfile for twemproxy
#

FROM alpine:3

ENV TWEMPROXY_VERSION=0.4.1
ENV TWEMPROXY_URL=https://github.com/twitter/twemproxy/archive/v${TWEMPROXY_VERSION}.tar.gz
ENV TWEMPROXY_HOME=/opt/twemproxy

WORKDIR ${TWEMPROXY_HOME}

RUN set -xe \
    && apk --no-cache add -t TMP alpine-sdk autoconf automake curl libtool tar \
    && mkdir -p conf logs src \
    && curl -sSL ${TWEMPROXY_URL} | tar xz --strip 1 -C src \
    && cd src \
    && autoreconf -fvi \
    && CFLAGS="-O3" ./configure \
    && make install \
    && nutcracker --version \
    && cd .. \
    && rm -rf src \
    && apk del TMP

EXPOSE 22222

ENTRYPOINT ["nutcracker"]
CMD ["--help"]
