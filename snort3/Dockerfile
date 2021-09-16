#
# Dockerfile for snort3
#

FROM ubuntu:20.04
MAINTAINER EasyPi Software Foundation

ENV SNORT_VERSION=3.1.12.0
ENV LIBDAQ_VERSION=3.0.5
ENV LIBDNET_VERSION=1.14

ARG DEBIAN_FRONTEND=noninteractive

RUN set -xe \
    && apt-get update \
    && apt-get -y install \
        build-essential autoconf pkg-config libtool tzdata bison cmake flex curl git \
        libpcap-dev libhwloc-dev libluajit-5.1-dev libssl-dev libpcre3-dev zlib1g-dev liblzma-dev \
    && rm -rf /var/lib/apt/lists/*

RUN set -xe \
    && echo "UTC" > /etc/timezone  \
    && ln -fs /usr/share/zoneinfo/UTC /etc/localtime \
    && dpkg-reconfigure tzdata

RUN set -xe \
    && mkdir -p libdaq \
    && cd libdaq \
    && curl -sSL https://github.com/snort3/libdaq/archive/v$LIBDAQ_VERSION.tar.gz | tar xz --strip 1 \
    && ./bootstrap \
    && ./configure \
    && make -j7 \
    && make install \
    && cd .. \
    && rm -rf libdaq

RUN set -xe \
    && mkdir -p libdnet \
    && cd libdnet \
    && curl -sSL https://github.com/ofalk/libdnet/archive/libdnet-$LIBDNET_VERSION.tar.gz | tar xz --strip 1 \
    && ./configure \
    && make -j7 \
    && make install \
    && cd .. \
    && rm -rf libdnet

RUN set -xe \
    && mkdir -p snort3 \
    && cd snort3 \
    && curl -sSL https://github.com/snort3/snort3/archive/$SNORT_VERSION.tar.gz | tar -xz --strip 1 \
    && ./configure_cmake.sh --prefix=/usr/local \
    && cd build \
    && make -j7 \
    && make install \
    && cd ../.. \
    && rm -rf snort3

ENV LD_LIBRARY_PATH=/usr/local/lib

ENTRYPOINT ["snort"]
CMD ["--help"]
