#
# Dockerfile for deface
#

FROM debian:bullseye
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apt update \
 && apt install -y curl ffmpeg libsm6 libxext6 python3 python3-distutils \
 && curl -sSL https://bootstrap.pypa.io/get-pip.py | python3 \
 && pip3 install --no-cache-dir https://github.com/ORB-HD/deface/archive/refs/heads/master.zip \
 && apt remove -y curl \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["deface"]
CMD ["--help"]
