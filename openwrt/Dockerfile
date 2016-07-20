#
# Dockerfile for openwrt
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apt-get update \
    && apt-get install -y build-essential \
                          curl \
                          file \
                          gawk \
                          gettext \
                          git \
                          libncurses5-dev \
                          libssl-dev \
                          mercurial \
                          python \
                          subversion \
                          sudo \
                          tree \
                          unzip \
                          wget \
                          xsltproc \
                          zlib1g-dev \
    && useradd -m openwrt \
    && echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt
WORKDIR /home/openwrt

ENV OPENWRT_VERSION=15.05.1
ENV OPENWRT_URL=https://downloads.openwrt.org/chaos_calmer/15.05.1/brcm2708/bcm2708
ENV OPENWRT_IMG=OpenWrt-ImageBuilder-15.05.1-brcm2708-bcm2708.Linux-x86_64
ENV OPENWRT_SDK=OpenWrt-SDK-15.05.1-brcm2708-bcm2708_gcc-4.8-linaro_uClibc-0.9.33.2_eabi.Linux-x86_64
ENV OPENWRT_IMG_URL=${OPENWRT_URL}/${OPENWRT_IMG}.tar.bz2
ENV OPENWRT_SDK_URL=${OPENWRT_URL}/${OPENWRT_SDK}.tar.bz2

RUN set -xe \
    && curl -sSL ${OPENWRT_IMG_URL} | tar xj \
    && curl -sSL ${OPENWRT_SDK_URL} | tar xj \
    && ln -s ${OPENWRT_IMG} img \
    && ln -s ${OPENWRT_SDK} sdk \
    && cd sdk \
    && ./scripts/feeds update -a

CMD ["bash"]
