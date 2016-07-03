#
# Dockerfile for rtmp-client-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache ffmpeg

ENV RTMP_DEV=/dev/video0 \
    RTMP_FMT=flv \
    RTMP_URI=

CMD ffmpeg -i $RTMP_DEV -f $RTMP_FMT $RTMP_URI
