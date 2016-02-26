#
# Dockerfile for rtmp-client-arm
#

FROM vimagick/alpine-arm
MAINTAINER kev <noreply@datageek.info>

RUN set -xe \
    && apk add -U ffmpeg \
    && rm -rf /var/cache/apk/*

ENV RTMP_DEV=/dev/video0 \
    RTMP_FMT=flv \
    RTMP_URI=

CMD ffmpeg -i $RTMP_DEV -f $RTMP_FMT $RTMP_URI
