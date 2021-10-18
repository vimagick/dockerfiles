#
# Dockerfile for ffmpeg
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache ffmpeg

WORKDIR /data

ENTRYPOINT ["ffmpeg"]
CMD ["--help"]
