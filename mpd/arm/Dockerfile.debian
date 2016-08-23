#
# Dockerfile for mpd-arm
#

FROM armhf/debian:jessie
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apt-get update \
    && apt-get install -y mpd mpc \
    && rm -rf /var/lib/apt/lists/*

COPY mpd.conf /etc/mpd.conf
VOLUME /var/lib/mpd

EXPOSE 6600
CMD ["mpd", "--stdout", "--no-daemon"]
