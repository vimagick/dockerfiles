#
# Dockerfile for open-vmdk
#

FROM debian:12
MAINTAINER EasyPi Software Foundation

ARG OPEN_VMDK_VERSION=v0.3.10
ARG OPEN_VMDK_URL=https://github.com/vmware/open-vmdk/archive/refs/tags/$OPEN_VMDK_VERSION.tar.gz

RUN set -xe \
 && apt update -y \
 && apt install -y build-essential curl zlib1g-dev \
 && mkdir -p open-vmdk \
 && cd open-vmdk \
 && curl -sSL $OPEN_VMDK_URL | tar xz --strip 1 \
 && make \
 && make install \
 && cd .. \
 && apt remove -y build-essential curl zlib1g-dev \
 && rm -rf open-vmdk /var/lib/apt/lists/*
