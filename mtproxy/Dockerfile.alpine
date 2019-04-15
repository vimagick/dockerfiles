#
# Dockerfile for mtproxy
#

FROM alpine
MAINTAINER EasyPi Software Foundation

WORKDIR /usr/local/src/mtproxy

RUN set -xe \
    && apk add --no-cache curl gcc git linux-headers make musl-dev openssl-dev zlib-dev \
    && git clone --single-branch --depth 1 https://github.com/TelegramMessenger/MTProxy.git . \
    && curl -sSL https://github.com/alexdoesh/mtproxy/raw/master/patches/randr_compat.patch > randr_compat.patch \
    && patch -p0 -i randr_compat.patch \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && cp ./objs/bin/mtproto-proxy /usr/local/bin/ \
    && cd .. \
    && rm -r mtproxy \
    && apk del gcc git linux-headers make musl-dev openssl-dev zlib-dev

WORKDIR /etc/mtproxy

RUN set -xe \
    && ln -s /usr/lib/libcrypto.so.42 /usr/lib/libcrypto.so.1.0.0 \
    && curl -sSL https://core.telegram.org/getProxySecret > proxy-secret \
    && curl -sSL https://core.telegram.org/getProxyConfig > proxy-multi.conf

VOLUME /etc/mtproxy

ENV MTP_SECRET 00000000000000000000000000000000
ENV MTP_SLAVES 1

EXPOSE 443 8888

CMD set -xe \
    && curl -sSL https://core.telegram.org/getProxySecret > proxy-secret \
    && curl -sSL https://core.telegram.org/getProxyConfig > proxy-multi.conf \
    && mtproto-proxy --allow-skip-dh \
                     --user root \
                     --address 0.0.0.0 \
                     --port 8888 \
                     --http-ports 443 \
                     --slaves $MTP_SLAVES \
                     --mtproto-secret $MTP_SECRET \
                     --aes-pwd proxy-secret \
                     proxy-multi.conf

