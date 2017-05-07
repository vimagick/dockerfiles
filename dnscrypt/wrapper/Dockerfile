#
# Dockerfile for dnscrypt-wrapper
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

ENV LIBSODIUM_VERSION 1.0.11
ENV DNSCRYPT_VERSION 0.2.1
ENV RESOLVER_ADDR 8.8.8.8:53
ENV LISTEN_ADDR 0.0.0.0:443
ENV PROVIDER_NAME 2.dnscrypt-cert.easypi.info

RUN set -xe \
    && apt-get update \
    && apt-get install -y autoconf \
                          automake \
                          build-essential \
                          curl \
                          git \
                          libevent-2.0 \
                          libevent-dev \
    && mkdir libsodium \
        && cd libsodium \
        && curl -sSL https://download.libsodium.org/libsodium/releases/libsodium-$LIBSODIUM_VERSION.tar.gz | tar xz --strip 1 \
        && ./configure --prefix=/usr \
        && make install \
        && ldconfig \
        && cd .. \
        && rm -rf libsodium \
    && mkdir dnscrypt-wrapper \
        && cd dnscrypt-wrapper \
        && curl -sSL https://github.com/Cofyc/dnscrypt-wrapper/archive/v$DNSCRYPT_VERSION.tar.gz | tar xz --strip 1 \
        && make configure \
        && ./configure --prefix=/usr \
        && make install \
        && cd .. \
        && rm -rf dnscrypt-wrapper \
    && apt-get purge --auto-remove -y autoconf \
                                      automake \
                                      build-essential \
                                      curl \
                                      git \
                                      libevent-dev \
    && rm -rf /var/lib/apt/lists/*

RUN set -xe \
    && mkdir -p /var/lib/dnscrypt-wrapper \
    && cd /var/lib/dnscrypt-wrapper \
    && dnscrypt-wrapper --gen-provider-keypair > README.txt \
    && dnscrypt-wrapper --gen-crypt-keypair --crypt-secretkey-file=1.key \
    && dnscrypt-wrapper --gen-cert-file --crypt-secretkey-file=1.key --provider-cert-file=1.cert

WORKDIR /var/lib/dnscrypt-wrapper
VOLUME /var/lib/dnscrypt-wrapper

EXPOSE 443/tcp 443/udp

CMD dnscrypt-wrapper --resolver-address=${RESOLVER_ADDR} \
                     --listen-address=${LISTEN_ADDR} \
                     --provider-name=${PROVIDER_NAME} \
                     --crypt-secretkey-file=1.key \
                     --provider-cert-file=1.cert \
                     --verbose
