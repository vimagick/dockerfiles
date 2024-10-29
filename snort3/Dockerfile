#
# Dockerfile for snort3
#

FROM ubuntu:24.04
MAINTAINER EasyPi Software Foundation

ARG SNORT_VERSION=3.5.0.0
ARG LIBDAQ_VERSION=3.0.17
ARG LIBDNET_VERSION=1.18.0
ARG PCRE_VERSION=8.45
ARG GPERTOOLS_VERSION=2.16
ARG FLATBUFFERS_VERSION=24.3.25

ARG DEBIAN_FRONTEND=noninteractive

RUN set -xe \
    && apt-get update \
    && apt-get -y install \
        build-essential autoconf check pkg-config libtool tzdata bison cmake flex curl git \
        libhwloc-dev libhyperscan-dev libluajit-5.1-dev libssl-dev libpcap-dev libpcre3-dev zlib1g-dev liblzma-dev \
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
    && mkdir -p pcre \
    && cd pcre \
    && curl -sSL https://sourceforge.net/projects/pcre/files/pcre/$PCRE_VERSION/pcre-$PCRE_VERSION.tar.gz | tar xz --strip 1 \
    && ./configure \
    && make -j7 \
    && make install \
    && cd .. \
    && rm -rf pcre

RUN set -xe \
    && mkdir -p gperftools \
    && cd gperftools \
    && curl -sSL wget https://github.com/gperftools/gperftools/releases/download/gperftools-$GPERTOOLS_VERSION/gperftools-$GPERTOOLS_VERSION.tar.gz | tar xz --strip 1 \
    && ./configure \
    && make -j7 \
    && make install \
    && cd .. \
    && rm -rf gperftools

RUN set -xe \
    && mkdir -p flatbuffers/build \
    && cd flatbuffers \
    && curl -sSL https://github.com/google/flatbuffers/archive/refs/tags/v$FLATBUFFERS_VERSION.tar.gz | tar xz --strip 1 \
    && cd build \
    && cmake .. \
    && make -j7 \
    && make install \
    && cd .. \
    && rm -rf flatbuffers

RUN set -xe \
    && mkdir -p snort3 \
    && cd snort3 \
    && curl -sSL https://github.com/snort3/snort3/archive/$SNORT_VERSION.tar.gz | tar -xz --strip 1 \
    && ./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc \
    && cd build \
    && make -j7 \
    && make install \
    && curl -sSL https://www.snort.org/downloads/community/snort3-community-rules.tar.gz | tar xz -C /usr/local/etc/snort3/ \
    && cd ../.. \
    && rm -rf snort3

ENV LD_LIBRARY_PATH=/usr/local/lib

ENTRYPOINT ["snort"]
CMD ["--help"]
