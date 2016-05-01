#
# Dockerfile for ffmpeg
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN apk add -U ffmpeg

ADD ffserver.conf /etc/

EXPOSE 8090

CMD ["ffserver"]
