#
# Dockerfile for dnscrypt-proxy
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

ENV LIBSODIUM_VERSION 1.0.3
ENV DNSCRYPT_VERSION 1.5.0
ENV LISTEN_ADDR 0.0.0.0:53
ENV RESOLVER_ADDR 208.67.220.220:443
ENV PROVIDER_NAME 2.dnscrypt-cert.opendns.com
ENV PROVIDER_KEY B735:1140:206F:225D:3E2B:D822:D7FD:691E:A1C3:3CC8:D666:8D0C:BE04:BFAB:CA43:FB79

RUN apt-get update \
    && apt-get install -y build-essential curl \
    && mkdir libsodium \
        && curl -sSL https://download.libsodium.org/libsodium/releases/libsodium-$LIBSODIUM_VERSION.tar.gz | tar xz --strip 1 -C libsodium \
        && cd libsodium \
        && ./configure --prefix=/usr --enable-minimal=yes \
        && make install \
        && ldconfig \
        && cd .. \
        && rm -rf libsodium \
    && mkdir dnscrypt-proxy \
        && curl -sSL http://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-$DNSCRYPT_VERSION.tar.gz | tar xz --strip 1 -C dnscrypt-proxy \
        && cd dnscrypt-proxy \
        && ./configure --prefix=/usr \
        && make install \
        && cd .. \
        && rm -rf dnscrypt-proxy \
    && rm -rf /usr/lib/apt/lists/*

EXPOSE 53/tcp 53/udp

CMD dnscrypt-proxy --local-address=$LISTEN_ADDR \
                   --provider-name=$PROVIDER_NAME \
                   --provider-key=$PROVIDER_KEY \
                   --resolver-address=$RESOLVER_ADDR

