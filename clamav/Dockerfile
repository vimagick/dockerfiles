#
# Dockerfile for clamav
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache clamav clamav-libunrar \
    && cd /etc/clamav/ \
    && freshclam

WORKDIR /data

ENTRYPOINT ["clamscan"]
CMD ["--help"]
