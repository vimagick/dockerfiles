#
# Dockerfile for snort3
#

FROM ubuntu:26.04
MAINTAINER EasyPi Software Foundation

ARG SNORT_VERSION
ARG LIBDAQ_VERSION=3.0.27
ARG LIBDNET_VERSION=1.18.2
ARG GPERTOOLS_VERSION=2.18.1
ARG FLATBUFFERS_VERSION=25.12.19-2026-02-06-03fffb2

ARG DEBIAN_FRONTEND=noninteractive

RUN set -xe \
    && apt-get update \
    && apt-get -y install \
        build-essential autoconf check pkg-config libtool tzdata bison cmake flex curl git \
        libhwloc-dev libhyperscan-dev libluajit-5.1-dev libssl-dev libpcap-dev libpcre2-dev zlib1g-dev liblzma-dev \
    && echo "==========timezone==========" \
    && echo "UTC" > /etc/timezone  \
    && ln -fs /usr/share/zoneinfo/UTC /etc/localtime \
    && dpkg-reconfigure tzdata \
    && echo "==========libdaq==========" \
    && mkdir -p libdaq \
    && cd libdaq \
    && curl -sSL https://github.com/snort3/libdaq/archive/v$LIBDAQ_VERSION.tar.gz | tar xz --strip 1 \
    && ./bootstrap \
    && ./configure \
    && make -j7 \
    && make install \
    && cd .. \
    && rm -rf libdaq \
    && echo "=========libdnet===========" \
    && mkdir -p libdnet \
    && cd libdnet \
    && curl -sSL https://github.com/ofalk/libdnet/archive/libdnet-$LIBDNET_VERSION.tar.gz | tar xz --strip 1 \
    && ./configure \
    && make -j7 \
    && make install \
    && cd .. \
    && rm -rf libdnet \
    && echo "=========gperftools==========" \
    && mkdir -p gperftools \
    && cd gperftools \
    && curl -sSL wget https://github.com/gperftools/gperftools/releases/download/gperftools-$GPERTOOLS_VERSION/gperftools-$GPERTOOLS_VERSION.tar.gz | tar xz --strip 1 \
    && ./configure \
    && make -j7 \
    && make install \
    && cd .. \
    && rm -rf gperftools \
    && echo "=========flatbuffers==========" \
    && mkdir -p flatbuffers/build \
    && cd flatbuffers \
    && curl -sSL https://github.com/google/flatbuffers/archive/refs/tags/v$FLATBUFFERS_VERSION.tar.gz | tar xz --strip 1 \
    && cd build \
    && cmake .. \
    && make -j7 \
    && make install \
    && cd .. \
    && rm -rf flatbuffers \
    && echo "==========snort3==========" \
    && mkdir -p snort3 \
    && cd snort3 \
    && curl -sSL https://github.com/snort3/snort3/archive/$SNORT_VERSION.tar.gz | tar -xz --strip 1 \
    && ./configure_cmake.sh --prefix=/usr/local --enable-tcmalloc \
    && cd build \
    && make -j7 \
    && make install \
    && curl -sSL https://www.snort.org/downloads/community/snort3-community-rules.tar.gz | tar xz -C /usr/local/etc/snort/ \
    && curl -sSL https://www.snort.org/downloads/openappid/33380 | tar xz -C /usr/local/etc/snort/ \
    && cd ../.. \
    && rm -rf snort3 \
    && ldconfig \
    && snort --version \
    && echo "==========cleanup==========" \
    && apt-get -y remove \
        build-essential autoconf check pkg-config libtool bison cmake flex git \
        libhwloc-dev libhyperscan-dev libluajit-5.1-dev libssl-dev libpcap-dev libpcre2-dev zlib1g-dev liblzma-dev \
    && apt-get -y autoremove --purge \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["snort"]
CMD ["--help"]
