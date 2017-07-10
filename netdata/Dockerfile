#
# Dockerfile for netdata
#

FROM alpine
MAINTAINER EasyPi Software Foundation

ENV NETDATA_VERSION 1.6.0

RUN set -xe \
    && apk add --no-cache autoconf \
                          automake \
                          bash \
                          build-base \
                          curl \
                          nodejs \
                          nodejs-npm \
                          python \
                          libmnl \
                          libmnl-dev \
                          libuuid \
                          util-linux-dev \
                          zlib \
                          zlib-dev \
    && addgroup -g 1000 netdata \
    && adduser -D -H -u 1000 -G netdata netdata \
    && curl -sSL https://github.com/firehol/netdata/releases/download/v$NETDATA_VERSION/netdata-$NETDATA_VERSION.tar.gz | tar xz \
    && cd netdata-$NETDATA_VERSION \
    && ./netdata-installer.sh --dont-start-it --dont-wait \
    && cd .. \
    && rm -rf netdata-$NETDATA_VERSION \
    && apk del autoconf \
               automake \
               build-base \
               libmnl-dev \
               util-linux-dev \
               zlib-dev

VOLUME /etc/netdata

USER netdata

EXPOSE 19999

CMD ["netdata", "-D"]
