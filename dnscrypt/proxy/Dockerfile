#
# Dockerfile for dnscrypt-proxy
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y build-essential curl \
    && mkdir libsodium \
        && curl -sSL https://download.libsodium.org/libsodium/releases/libsodium-1.0.3.tar.gz | tar xz --strip 1 -C libsodium
        && cd libsodium \
        && ./configure --prefix=/usr \
        && make install \
        && ldconfig \
        && cd .. \
        && rm -rf libsodium \
    && mkdir dnscrypt-proxy \
        && curl -sSL http://download.dnscrypt.org/dnscrypt-proxy/dnscrypt-proxy-1.4.3.tar.gz | tar xz --strip 1 -C dnscrypt-proxy \
        && cd dnscrypt-proxy \
        && ./configure --prefix=/usr \
        && make install \
        && cd .. \
        && rm -rf dnscrypt-proxy \
    && rm -rf /usr/lib/apt/lists/*

ENV LISTEN_ADDR 0.0.0.0:53
ENV RESOLVER_ADDR 208.67.220.220:443
ENV PROVIDER_NAME 2.dnscrypt-cert.opendns.com
ENV PROVIDER_KEY B735:1140:206F:225D:3E2B:D822:D7FD:691E:A1C3:3CC8:D666:8D0C:BE04:BFAB:CA43:FB79

EXPOSE 53/tcp 53/udp

CMD dnscrypt-proxy --local-address $LISTEN_ADDR \
                   --provider-name $PROVIDER_NAME \
                   --provider-key $PROVIDER_KEY \
                   --resolver-address $RESOLVER_ADDR

