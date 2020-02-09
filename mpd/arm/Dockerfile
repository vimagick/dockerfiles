#
# Dockerfile for mpd-arm
#

FROM arm32v7/alpine:3
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache mpd mpc
COPY mpd.conf /etc/mpd.conf
VOLUME /var/lib/mpd

EXPOSE 6600
CMD ["mpd", "--stdout", "--no-daemon"]
