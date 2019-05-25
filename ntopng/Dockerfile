#
# Dockerfile for ntopng
#

FROM ubuntu:18.04

MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apt update \
    && apt install -y wget lsb-release gnupg libjson-c3 \
    && wget -q http://apt-stable.ntop.org/18.04/all/apt-ntop-stable.deb \
    && dpkg -i apt-ntop-stable.deb \
    && apt update \
    && apt install -y ntopng \
    && rm -rf /var/lib/apt/lists/*

VOLUME /var/lib/ntopng

EXPOSE 3000 5556

CMD ntopng --http-port 0.0.0.0:3000 \
           --interface tcp://0.0.0.0:5556c \
           --redis redis \
           --data-dir /var/lib/ntopng
