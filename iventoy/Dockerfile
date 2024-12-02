#
# Dockerfile for iventoy
#

FROM debian:bookworm

ARG IVENTOY_VERSION=1.0.20
ARG IVENTOY_FILE=iventoy-$IVENTOY_VERSION-linux-free.tar.gz
ARG IVENTOY_URL=https://github.com/ventoy/PXE/releases/download/v$IVENTOY_VERSION/$IVENTOY_FILE

WORKDIR /opt/iventoy

RUN set -xe \
 && apt update -y \
 && apt install -y curl tar \
 && curl -sSL $IVENTOY_URL | tar xz --strip 1 \
 && apt remove -y curl tar \
 && rm -rf /var/lib/apt/lists/*

ENV IVENTOY_API_ALL=1
ENV IVENTOY_AUTO_RUN=1

EXPOSE 67/udp 68/udp 69/udp 10809 16000 26000

CMD ./lib/iventoy && sleep inf
