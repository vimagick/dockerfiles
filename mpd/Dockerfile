#
# Dockerfile for mpd
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache mpd mpc ncmpc ncmpcpp \
    && setcap -r /usr/bin/mpd

VOLUME /var/lib/mpd

EXPOSE 6600
CMD ["mpd", "--stdout", "--no-daemon", "/etc/mpd/mpd.conf"]
