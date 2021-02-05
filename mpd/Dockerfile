#
# Dockerfile for mpd
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache mpd mpc \
    && setcap -r /usr/bin/mpd

COPY mpd.conf /etc/mpd.conf
VOLUME /var/lib/mpd

EXPOSE 6600
CMD ["mpd", "--stdout", "--no-daemon"]
