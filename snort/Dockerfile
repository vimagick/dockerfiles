#
# Dockerfile for snort
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y build-essential \
                          bison \
                          curl \
                          flex \
                          libdnet \
                          libdnet-dev \
                          libpcap0.8 \
                          libpcap-dev \
                          libpcre3 \
                          libpcre3-dev \
                          zlib1g \
                          zlib1g-dev \
    && mkdir daq \
        && curl -sSL https://snort.org/downloads/snort/daq-2.0.6.tar.gz | tar xz --strip 1 -C daq \
        && cd daq \
        && ./configure \
        && make install \
        && cd .. \
        && rm -rf daq \
    && mkdir libdnet \
        && curl -sSL https://github.com/dugsong/libdnet/archive/libdnet-1.12.tar.gz | tar xz --strip 1 -C libdnet \
        && cd libdnet \
        && ./configure \
        && make install \
        && (cd /usr/local/lib && ln -s libdnet.1 libdnet.so.1) \
        && cd .. \
        && rm -rf libdnet \
    && mkdir snort \
        && curl -sSL https://snort.org/downloads/snort/snort-2.9.7.5.tar.gz | tar xz --strip 1 -C snort \
        && cd snort \
        && ./configure --enable-sourcefire \
        && make install \
        && cd .. \
        && rm -rf snort \
    && apt-get purge -y --auto-remove build-essential \
                                      bison \
                                      flex \
                                      libdnet-dev \
                                      libpcap-dev \
                                      libpcre3-dev \
                                      zlib1g-dev

CMD ["snort", "--help"]
