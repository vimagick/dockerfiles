#
# Dockerfile for deface
#

FROM debian:bullseye
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apt update \
 && apt install -y curl ffmpeg git libsm6 libxext6 python3 python3-distutils \
 && curl https://bootstrap.pypa.io/get-pip.py | python3 \
 && pip3 install --no-cache-dir git+https://github.com/ORB-HD/deface \
 && apt remove -y curl git \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["deface"]
CMD ["--help"]
