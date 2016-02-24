#
# Dockerfile for rtmp-client-arm
#

FROM vimagick/alpine-arm
MAINTAINER kev <noreply@datageek.info>

RUN set -xe \
    && apk add -U ffmpeg \
    && rm -rf /var/cache/apk/*

CMD ffmpeg -f video4linux2 -r ${RTMP_RATE:-24} -i /dev/video0 -f flv ${RTMP_URI}
