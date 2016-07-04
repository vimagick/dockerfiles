#
# Dockerfile for ffmpeg-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache ffmpeg

WORKDIR /data

ENTRYPOINT ["ffmpeg"]
CMD ["--help"]
