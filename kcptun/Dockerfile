#
# Dockerfile for kcptun
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG KCPTUN_VERSION=20230214
ARG KCPTUN_FILE=kcptun-linux-amd64-${KCPTUN_VERSION}.tar.gz
ARG KCPTUN_URL=https://github.com/xtaci/kcptun/releases/download/v${KCPTUN_VERSION}/${KCPTUN_FILE}

RUN set -xe \
    && apk add --no-cache curl \
    && curl -sSL ${KCPTUN_URL} | tar xz -C /usr/local/bin \
    && server_linux_amd64 --version \
    && apk del curl

ENTRYPOINT ["server_linux_amd64"]
CMD ["--help"]
