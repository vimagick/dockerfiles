#
# Dockerfile for rslsync
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apt-get update \
    && apt-get install -y ca-certificates curl zip \
    && curl -sSL https://download-cdn.getsync.com/stable/linux-x64/resilio-sync_x64.tar.gz | tar xz -C /usr/bin/ rslsync \
    && apt-get purge -y --auto-remove curl \
    && rm -rf /var/lib/apt/lists/*

ENV CONFIG_FILE /etc/rslsync.json
ENV STORAGE_PATH /data/system
ENV DIRECTORY_ROOT /data/user

COPY rslsync.json $CONFIG_FILE
VOLUME /data
EXPOSE 8888 55555

CMD set -xe \
    && mkdir -p "$STORAGE_PATH" "$DIRECTORY_ROOT" \
    && rslsync --nodaemon --config "$CONFIG_FILE"
