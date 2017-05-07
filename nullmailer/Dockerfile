#
# Dockerfile for nullmailer
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

ENV NM_VER 2.0
ENV NM_URL https://github.com/bruceg/nullmailer/archive/$NM_VER.tar.gz

RUN set -xe \
    && apk add -U autoconf \
                  automake \
                  build-base \
                  curl \
                  gnutls \
                  gnutls-dev \
                  libstdc++ \
                  tar \
    && adduser -H -D nullmail \
    && mkdir nullmailer \
        && cd nullmailer \
        && curl -sSL $NM_URL | tar xz --strip 1 \
        && mv ChangeLog.old ChangeLog \
        && chmod +x autogen.sh \
        && ./autogen.sh \
        && ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-tls \
        && make install install-root \
        && cd .. \
        && rm -rf nullmailer \
    && apk del autoconf \
               automake \
               build-base \
               curl \
               gnutls-dev \
               tar \
    && rm -rf /var/cache/apk/*

VOLUME /etc/nullmailer
WORKDIR /var/spool/nullmailer/queue

CMD ["nullmailer-send"]
