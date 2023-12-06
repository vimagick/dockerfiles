#
# Dockerfile for nextdns
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG NEXTDNS_VERSION=1.41.0
ARG NEXTDNS_OS_ARCH=linux_amd64
ARG NEXTDNS_FILE=nextdns_${NEXTDNS_VERSION}_${NEXTDNS_OS_ARCH}.tar.gz
ARG NEXTDNS_URL=https://github.com/nextdns/nextdns/releases/download/v${NEXTDNS_VERSION}/${NEXTDNS_FILE}

RUN set -xe \
 && apk add --no-cache curl \
 && curl -sSL ${NEXTDNS_URL} | tar xz nextdns -C /usr/local/bin \
 && nextdns version \
 && apk del curl

EXPOSE 53/tcp 53/tcp

ENTRYPOINT ["nextdns"]
CMD ["run", "-listen", ":53"]
