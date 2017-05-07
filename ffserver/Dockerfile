#
# Dockerfile for ffserver
#

FROM vimagick/ffmpeg

MAINTAINER kev <noreply@easypi.pro>

COPY ffserver.conf /etc/

EXPOSE 554 8090

ENTRYPOINT ["ffserver"]
