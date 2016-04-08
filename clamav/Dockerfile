#
# Dockerfile for clamav
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN set -xe \
    && apk add -U clamav clamav-libunrar \
    && cd /etc/clamav/ \
    && mv clamd.conf.sample clamd.conf \
    && mv freshclam.conf.sample freshclam.conf \
    && freshclam \
    && rm -rf /var/cache/apk/*

WORKDIR /data

ENTRYPOINT ["clamscan"]
CMD ["--help"]
