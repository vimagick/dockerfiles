#
# Dockerfile for dnscrypt-proxy
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG DNSCRYPT_PROXY_VERSION=2.1.4
ARG DNSCRYPT_PROXY_ARCH=x86_64
ARG DNSCRYPT_PROXY_FILE=dnscrypt-proxy-linux_${DNSCRYPT_PROXY_ARCH}-${DNSCRYPT_PROXY_VERSION}.tar.gz
ARG DNSCRYPT_PROXY_URL=https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/${DNSCRYPT_PROXY_VERSION}/${DNSCRYPT_PROXY_FILE}

WORKDIR /etc/dnscrypt-proxy

RUN set -xe \
 && apk add --no-cache curl tar \
 && curl -sSL ${DNSCRYPT_PROXY_URL} | tar xz --strip 1 \
 && mv dnscrypt-proxy /usr/local/bin/ \
 && sed '/^listen_addresses/s/127.0.0.1:53/0.0.0.0:53/' example-dnscrypt-proxy.toml > dnscrypt-proxy.toml

VOLUME /etc/dnscrypt-proxy

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["dnscrypt-proxy"]
CMD ["-config", "dnscrypt-proxy.toml"]
