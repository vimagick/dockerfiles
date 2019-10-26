#
# Dockerfile for kismet
#

FROM ubuntu:16.04

RUN set -xe \
    && apt-get update \
    && apt-get install -y autoconf \
                          build-essential \
                          curl \
                          gdb \
                          gdbserver \
                          libcap-dev \
                          libdw-dev \
                          libmicrohttpd-dev \
                          libncurses5-dev \
                          libnl-3-dev \
                          libnl-genl-3-dev \
                          libnm-dev \
                          libpcap-dev \
                          libprotobuf-c-dev \
                          libprotobuf-dev \
                          librtlsdr0 \
                          libsqlite3-dev \
                          pkg-config \
                          protobuf-c-compiler \
                          protobuf-compiler \
                          python \
                          python-pip \
                          python-setuptools \
                          zlib1g-dev \
    && mkdir /opt/kismet \
    && cd /opt/kismet \
    && curl -sSL https://github.com/kismetwireless/kismet/archive/master.tar.gz | tar xz --strip 1 \
    && ./configure --prefix=/usr --sysconfdir=/etc/kismet \
    && make \
    && make suidinstall \
    && make forceconfigs \
    && touch /etc/kismet_site.conf \
    && apt-get remove -y autoconf \
                         build-essential \
                         curl \
                         pkg-config \
                         protobuf-c-compiler \
                         protobuf-compiler \
                         python-pip \
                         python-setuptools \
    && cd / \
    && rm -rf /opt/kismet

VOLUME /root/.kismet

EXPOSE 2501 3501

CMD ["kismet", "--no-ncurses"]
