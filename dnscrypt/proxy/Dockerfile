#
# Dockerfile for dnscrypt-proxy
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

ARG TARGETPLATFORM
ARG DNSCRYPT_PROXY_VERSION

WORKDIR /etc/dnscrypt-proxy

RUN set -xe \
 && DNSCRYPT_PROXY_ARCH=$(echo $TARGETPLATFORM | sed -e 's@linux/amd64@x86_64@' \
                                                     -e 's@linux/arm64@arm64@') \
 && DNSCRYPT_PROXY_FILE=dnscrypt-proxy-linux_${DNSCRYPT_PROXY_ARCH}-${DNSCRYPT_PROXY_VERSION}.tar.gz \
 && DNSCRYPT_PROXY_URL=https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/${DNSCRYPT_PROXY_VERSION}/${DNSCRYPT_PROXY_FILE} \
 && apk add --no-cache curl tar \
 && curl -sSL ${DNSCRYPT_PROXY_URL} | tar xz --strip 1 \
 && mv dnscrypt-proxy /usr/local/bin/ \
 && sed '/^listen_addresses/s/127.0.0.1:53/0.0.0.0:53/' example-dnscrypt-proxy.toml > dnscrypt-proxy.toml

VOLUME /etc/dnscrypt-proxy

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["dnscrypt-proxy"]
CMD ["-config", "dnscrypt-proxy.toml"]
