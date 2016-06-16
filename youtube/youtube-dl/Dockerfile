#
# Dockerfile for youtube-dl
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          ffmpeg \
                          python \
    && wget -O- https://bootstrap.pypa.io/get-pip.py | python \
    && pip install youtube-dl

WORKDIR /data

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]
