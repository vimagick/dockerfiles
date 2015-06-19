#
# Dockerfile for dnscrypt-wrapper
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

ENV LIBSODIUM_VERSION 1.0.3
ENV RESOLVER_ADDR 8.8.8.8:53
ENV LISTEN_ADDR 0.0.0.0:443
ENV PROVIDER_NAME 2.dnscrypt-cert.datageek.info

RUN apt-get update \
    && apt-get install -y autoconf \
                          automake \
                          build-essential \
                          curl \
                          git \
                          libevent-2.0 \
                          libevent-dev \
    && mkdir libsodium \
        && curl -sSL https://download.libsodium.org/libsodium/releases/libsodium-$LIBSODIUM_VERSION.tar.gz | tar xz --strip 1 -C libsodium \
        && cd libsodium \
        && ./configure --prefix=/usr \
        && make install \
        && ldconfig \
        && cd .. \
        && rm -rf libsodium \
    && git clone --recursive git://github.com/Cofyc/dnscrypt-wrapper.git \
        && cd dnscrypt-wrapper \
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

RUN mkdir -p /var/lib/dnscrypt-wrapper \
    && cd /var/lib/dnscrypt-wrapper \
    && dnscrypt-wrapper --gen-provider-keypair > provider_keypair.txt \
    && dnscrypt-wrapper --gen-crypt-keypair > crypt_keypair.txt \
    && dnscrypt-wrapper --crypt-publickey-file=crypt_public.key \
                        --crypt-secretkey-file=crypt_secret.key \
                        --provider-publickey-file=public.key \
                        --provider-secretkey-file=secret.key \
                        --gen-cert-file > cert_file.txt

WORKDIR /var/lib/dnscrypt-wrapper
VOLUME /var/lib/dnscrypt-wrapper

EXPOSE 443/tcp 443/udp

CMD dnscrypt-wrapper --crypt-publickey-file=crypt_public.key \
                     --crypt-secretkey-file=crypt_secret.key \
                     --listen-address=${LISTEN_ADDR} \
                     --provider-cert-file=dnscrypt.cert \
                     --provider-name=${PROVIDER_NAME} \
                     --resolver-address=${RESOLVER_ADDR} \
                     --verbose

