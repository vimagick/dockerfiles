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
                          vim-tiny \
                          xsltproc \
                          zlib1g-dev \
    && useradd -m openwrt \
    && echo 'openwrt ALL=NOPASSWD: ALL' > /etc/sudoers.d/openwrt

USER openwrt
WORKDIR /home/openwrt

CMD ["bash"]
