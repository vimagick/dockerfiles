#
# Dockerfile for mpd-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache mpd mpc
COPY mpd.conf /etc/mpd.conf
VOLUME /var/lib/mpd

EXPOSE 6600
CMD ["mpd", "--stdout", "--no-daemon"]
