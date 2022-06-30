#
# Dockerfile for ot-recorder
#

FROM debian:bullseye
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl gnupg libcurl3-gnutls \
    && curl -sSL http://repo.owntracks.org/repo.owntracks.org.gpg.key | apt-key add - \
    && echo 'deb http://repo.owntracks.org/debian bullseye main' > /etc/apt/sources.list.d/owntracks.list \
    && apt-get update \
    && apt-get install -y ot-recorder || true \
    && rm -rf /var/lib/apt/lists/*

ENV OTR_HOST=mqtt.eclipse.org \
    OTR_PORT=1883             \
    OTR_HTTPHOST=0.0.0.0      \
    OTR_HTTPPORT=8083         \
    OTR_TOPICS=owntracks/#    \
    OTR_STORAGEDIR=/var/spool/owntracks/recorder/store

VOLUME $OTR_STORAGEDIR

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8083 8085
