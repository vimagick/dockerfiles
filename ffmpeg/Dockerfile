#
# Dockerfile for ffmpeg
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN apk add --no-cache ffmpeg

WORKDIR /data

ENTRYPOINT ["ffmpeg"]
CMD ["--help"]
