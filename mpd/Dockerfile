#
# Dockerfile for mpd
#

FROM alpine:3.12
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache mpd mpc ncmpc \
    && setcap -r /usr/bin/mpd

VOLUME /var/lib/mpd

EXPOSE 6600
CMD ["mpd", "--stdout", "--no-daemon"]
