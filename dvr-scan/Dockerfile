#
# Dockerfile for dvr-scan
#

FROM ubuntu:20.04
MAINTAINER EasyPi Software Foundation

ARG DEBIAN_FRONTEND=noninteractive

RUN set -xe \
 && apt-get update \
 && apt-get install -y python3 python3-pip libgl1-mesa-glx libglib2.0-0 \
 && pip3 install dvr-scan[opencv] \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /data

ENTRYPOINT ["dvr-scan"]
CMD ["--help"]
