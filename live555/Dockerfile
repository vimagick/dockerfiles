#
# Dockerfile for live555
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && wget -qP /usr/local/bin/ http://www.live555.com/mediaServer/linux/live555MediaServer \
    && chmod +x /usr/local/bin/live555MediaServer

WORKDIR /data

EXPOSE 80 554

ENTRYPOINT ["live555MediaServer"]
