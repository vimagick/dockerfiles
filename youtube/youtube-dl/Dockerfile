#
# Dockerfile for youtube-dl
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          ffmpeg \
                          openssl \
                          python3 \
                          aria2 \
    && pip3 install youtube-dl==2018.09.26

WORKDIR /data

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]
