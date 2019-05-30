#
# Dockerfile for n2n
#

FROM debian:stretch
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apt update \
    && apt install -y gnupg lsb-release wget \
    && wget http://apt.ntop.org/stretch/all/apt-ntop.deb \
    && dpkg -i apt-ntop.deb \
    && apt update \
    && apt install -y n2n \
    && rm -rf apt-ntop.deb /var/lib/apt/lists/*

EXPOSE 5645/udp 7654/udp

ENTRYPOINT ["supernode"]
CMD ["-l", "7654"]
