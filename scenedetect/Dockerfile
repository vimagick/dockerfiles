#
# Dockerfile for scenedetect
#

FROM python:3.11-bookworm
MAINTAINER EasyPi Software Foundation

ARG SCENEDETECT_VERSION=0.6.3
ARG FFMPEG_VERSION=6.1

RUN set -xe \
 && apt update \
 && apt install -y curl dumb-init fonts-noto-cjk xvfb xz-utils \
 && curl -sSL https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
    | tar xJC /usr/bin/ ffmpeg-${FFMPEG_VERSION}-amd64-static/ffprobe ffmpeg-${FFMPEG_VERSION}-amd64-static/ffmpeg --strip 1 \
 && ffmpeg -version \
 && ffprobe -version \
 && rm -rf /var/lib/apt/lists/*

RUN set -xe \
 && pip install scenedetect[opencv-headless]==$SCENEDETECT_VERSION \
 && scenedetect version

ENTRYPOINT ["scenedetect"]
CMD ["--help"]
