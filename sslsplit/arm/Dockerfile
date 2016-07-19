#
# Dockerfile for sslsplit-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

ENV SSLSPLIT_VERSION 0.5.0

RUN set -xe \
    && apk add --no-cache build-base \
                          curl \
                          fts \
                          fts-dev \
                          libevent \
                          libevent-dev \
                          linux-headers \
                          openssl \
                          openssl-dev \
                          tar \
    && mkdir sslsplit \
    && cd sslsplit \
    && curl -sSL https://github.com/droe/sslsplit/archive/${SSLSPLIT_VERSION}.tar.gz | tar xz --strip 1 \
    && sed -i '/^LIBS/s/$/ -lfts/' GNUmakefile \
    && make install \
    && cd .. \
    && rm -rf sslsplit \
    && apk del build-base \
               curl \
               fts-dev \
               libevent-dev \
               linux-headers \
               openssl-dev \
               tar

ENTRYPOINT ["sslsplit", "-D"]
CMD ["-h"]
