#
# Dockerfile for kcptun
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

ENV KCPTUN_VERSION 20170329
ENV KCPTUN_FILE kcptun-linux-amd64-${KCPTUN_VERSION}.tar.gz
ENV KCPTUN_URL https://github.com/xtaci/kcptun/releases/download/v${KCPTUN_VERSION}/${KCPTUN_FILE}

RUN set -xe \
    && apk add --no-cache curl \
    && curl -sSL ${KCPTUN_URL} | tar xz -C /usr/local/bin \
    && apk del curl

ENTRYPOINT ["server_linux_amd64"]
CMD ["--help"]
