#
# Dockerfile for netdata-arm:debian
#

FROM resin/rpi-raspbian:jessie
MAINTAINER EasyPi Software Foundation

ENV NETDATA_VER 1.6.0
ENV NETDATA_URL https://github.com/firehol/netdata/releases/download/v${NETDATA_VER}/netdata-${NETDATA_VER}.tar.gz
ENV NETDATA_DEB netdata_${NETDATA_VER}_armhf.deb

WORKDIR /usr/src

RUN set -xe \
    && apt-get update \
    && apt-get -y install autoconf \
                          autoconf-archive \
                          autogen \
                          automake \
                          build-essential \
                          curl \
                          debhelper \
                          dh-autoreconf \
                          dh-systemd \
                          fakeroot \
                          libmnl-dev \
                          pkg-config \
                          uuid-dev \
                          zlib1g-dev \
    && curl -sSL ${NETDATA_URL} | tar xz \
    && cd netdata-${NETDATA_VER} \
    && ln -s contrib/debian \
    && dpkg-buildpackage -us -uc -rfakeroot \
    && cd .. \
    && dpkg -i ${NETDATA_DEB} \
    && apt-get remove -y autoconf \
                         autoconf-archive \
                         autogen \
                         automake \
                         build-essential \
                         curl \
                         debhelper \
                         dh-autoreconf \
                         dh-systemd \
                         pkg-config \
    && rm -rf netdata-${NETDATA_VER} /var/lib/apt/lists/*

VOLUME /etc/netdata

EXPOSE 19999

CMD ["netdata", "-D"]
