#
# Dockerfile for audiowaveform
#

FROM ubuntu:20.04
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apt update \
    && apt install -y software-properties-common \
    && add-apt-repository ppa:chris-needham/ppa \
    && apt update \
    && apt install -y audiowaveform \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["audiowaveform"]
CMD ["--help"]

