#
# Dockerfile for rslsync
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl \
    && curl -sSL https://download-cdn.getsync.com/stable/linux-x64/resilio-sync_x64.tar.gz | tar xz -C /usr/bin/ rslsync \
    && apt-get purge -y --auto-remove curl \
    && rm -rf /var/lib/apt/lists/*

COPY config.json /etc/rslsync/

ENV STORAGE_PATH /data/.syncsystem
ENV DIRECTORY_ROOT /data/syncaod

VOLUME /etc/rslsync /data
EXPOSE 8888 55555

CMD set -xe \
    && mkdir -p "$STORAGE_PATH" "$DIRECTORY_ROOT" \
    && rslsync --nodaemon --config /etc/rslsync/config.json
