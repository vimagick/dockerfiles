#
# Dockerfile for proxydetox
#

FROM ubuntu:noble
MAINTAINER EasyPi Software Foundation

ARG PROXYDETOX_VERSION=0.9.6
ARG PROXYDETOX_FILE=proxydetox-${PROXYDETOX_VERSION}-noble_amd64.deb
ARG PROXYDETOX_URL=https://github.com/kiron1/proxydetox/releases/download/v${PROXYDETOX_VERSION}/${PROXYDETOX_FILE}

RUN set -xe \
 && apt update -y \
 && apt install -y curl \
 && curl -L "${PROXYDETOX_URL}" -o "${PROXYDETOX_FILE}" \
 && dpkg -i "${PROXYDETOX_FILE}" \
 && apt remove -y curl \
 && rm -rf "${PROXYDETOX_FILE}" /var/lib/apt/lists/*

ENTRYPOINT ["proxydetox"]
