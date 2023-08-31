#
# Dockerfile for editly
#

FROM node:lts-bullseye
MAINTAINER EasyPi Software Foundation

ARG EDITLY_VERSION=0.14.2
ARG FFMPEG_VERSION=6.0

RUN set -xe \
 && apt update \
 && apt install -y curl dumb-init fonts-noto-cjk xvfb xz-utils \
 && curl -sSL https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz \
    | tar xJC /usr/bin/ ffmpeg-${FFMPEG_VERSION}-amd64-static/ffprobe ffmpeg-${FFMPEG_VERSION}-amd64-static/ffmpeg --strip 1 \
 && ffmpeg -version \
 && ffprobe -version \
 && rm -rf /var/lib/apt/lists/*

RUN set -xe \
 && apt update \
 && apt install -y libxext-dev libxi-dev xserver-xorg-dev \
 && ln -sf /usr/bin/python3 /usr/bin/python \
 && npm install --global --unsafe-perm editly@${EDITLY_VERSION} \
 && apt remove -y libxext-dev libxi-dev xserver-xorg-dev \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /data

ENTRYPOINT ["/usr/bin/dumb-init", "--", "xvfb-run", "--server-args", "-screen 0 1280x1024x24 -ac", "editly"]
CMD ["--help"]
