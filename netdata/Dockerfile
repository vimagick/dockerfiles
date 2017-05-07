#
# Dockerfile for netdata
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

ENV NETDATA_VERSION 1.3.0

RUN set -xe \
    && apk add --no-cache autoconf \
                          automake \
                          bash \
                          build-base \
                          curl \
                          libmnl \
                          libmnl-dev \
                          libuuid \
                          util-linux-dev \
                          zlib-dev \
    && addgroup -g 1000 netdata \
    && adduser -D -H -u 1000 -G netdata netdata \
    && curl -sSL https://github.com/firehol/netdata/releases/download/v$NETDATA_VERSION/netdata-$NETDATA_VERSION.tar.gz | tar xz \
    && cd netdata-$NETDATA_VERSION \
    && ./netdata-installer.sh --dont-wait \
    && cd .. \
    && rm -rf netdata-$NETDATA_VERSION \
    && apk del autoconf \
               automake \
               build-base \
               curl \
               libmnl-dev \
               util-linux-dev \
               zlib-dev

EXPOSE 19999

CMD ["netdata", "-nd"]
