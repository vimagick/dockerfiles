#
# Dockerfile for mtproxy
#

FROM debian:stretch
MAINTAINER EasyPi Software Foundation

WORKDIR /usr/local/src/mtproxy

RUN set -xe \
    && apt update \
    && apt install -y build-essential curl git libssl-dev zlib1g-dev \
    && git clone --single-branch --depth 1 https://github.com/TelegramMessenger/MTProxy.git . \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && cp ./objs/bin/mtproto-proxy /usr/local/bin/ \
    && apt remove -y build-essential git libssl-dev zlib1g-dev \
    && cd .. \
    && rm -r mtproxy /var/lib/apt/lists/*

WORKDIR /etc/mtproxy

RUN set -xe \
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

