#
# Dockerfile for wireproxy
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG WIREPROXY_VERSION=1.0.8
ARG WIREPROXY_OS=linux
ARG WIREPROXY_ARCH=amd64
ARG WIREPROXY_FILE=wireproxy_${WIREPROXY_OS}_${WIREPROXY_ARCH}.tar.gz
ARG WIREPROXY_URL=https://github.com/pufferffish/wireproxy/releases/download/v${WIREPROXY_VERSION}/${WIREPROXY_FILE}

RUN set -xe \
 && apk add --no-cache curl \
 && curl -sSL ${WIREPROXY_URL} | tar xz -C /usr/local/bin/ \
 && wireproxy --version \
 && apk del curl

EXPOSE 9080

CMD ["wireproxy", "--info", "0.0.0.0:9080", "--config", "/etc/wireproxy/wireproxy.conf"]
