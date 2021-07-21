#
# Dockerfile for editly
#

FROM node:lts-buster
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apt update \
 && apt install -y dumb-init ffmpeg xvfb \
 && rm -rf /var/lib/apt/lists/*

RUN npm install --global --unsafe-perm editly

WORKDIR /data

ENTRYPOINT ["/usr/bin/dumb-init", "--", "xvfb-run", "--server-args", "-screen 0 1280x1024x24 -ac", "editly"]
CMD ["--help"]
