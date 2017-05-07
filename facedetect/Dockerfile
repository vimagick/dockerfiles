#
# Dockerfile for facedetect
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apt-get update \
    && apt-get install -y curl python python-opencv libopencv-dev \
    && curl -sSL https://github.com/wavexx/facedetect/raw/master/facedetect > /usr/local/bin/facedetect \
    && chmod +x /usr/local/bin/facedetect \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["facedetect"]
CMD ["--help"]
