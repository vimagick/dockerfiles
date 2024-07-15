#
# Dockerfile for dnsmonster
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ARG DNSMONSTER_VERSION=0.9.9
ARG DNSMONSTER_FILE=dnsmonster-musl-static-stripped-amd64.tar.gz
ARG DNSMONSTER_URL=https://github.com/mosajjal/dnsmonster/releases/download/v${DNSMONSTER_VERSION}/${DNSMONSTER_FILE}

RUN set -xe \
 && apk add --no-cache curl \
 && curl -sSL "${DNSMONSTER_URL}" | tar xz \
 && mv dnsmonster-linux-amd64.bin /usr/local/bin/dnsmonster \
 && apk del curl

ENTRYPOINT ["dnsmonster"]
