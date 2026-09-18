#
# Dockerfile for mpd
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache mpd mpc ncmpc ncmpcpp libcap \
    && setcap -r /usr/bin/mpd || true \
    && apk del libcap

VOLUME /var/lib/mpd

EXPOSE 6600
CMD ["mpd", "--stdout", "--no-daemon", "/etc/mpd/mpd.conf"]
