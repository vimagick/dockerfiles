#
# Dockerfile for ffmpeg-arm
#

FROM arm32v7/alpine:3
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache ffmpeg

WORKDIR /data

ENTRYPOINT ["ffmpeg"]
CMD ["--help"]
