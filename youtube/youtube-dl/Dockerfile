#
# Dockerfile for youtube-dl
#

FROM python:3.9-alpine
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache ca-certificates \
                          ffmpeg \
                          openssl \
                          aria2 \
    && pip3 install --no-cache-dir youtube-dl

# Try to run it so we know it works
RUN youtube-dl --version

WORKDIR /data

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]
