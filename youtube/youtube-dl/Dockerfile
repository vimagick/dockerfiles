#
# Dockerfile for youtube-dl
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN apk add -U ca-certificates \
               ffmpeg \
               python \
    && rm -rf /var/cache/apk/* \
    && wget -O- https://bootstrap.pypa.io/get-pip.py | python \
    && pip install youtube-dl \
    && mkdir -p /data

WORKDIR /data

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]
