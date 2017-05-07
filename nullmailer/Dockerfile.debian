#
# Dockerfile for nullmailer
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

ENV DEBIAN_FRONTEND=noninteractive

RUN set -xe \
    && apt-get update \
    && apt-get install -y nullmailer \
    && rm -rf /var/cache/apt/list.d/*

RUN set -xe \
    && mkfifo /var/spool/nullmailer/trigger \
    && chown mail:root /var/spool/nullmailer/trigger \
    && chmod 0622 /var/spool/nullmailer/trigger

VOLUME /etc/nullmailer
WORKDIR /var/spool/nullmailer/queue

CMD ["nullmailer"]
