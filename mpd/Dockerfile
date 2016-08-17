#
# Dockerfile for mpd
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN apk add --no-cache mpd mpc
COPY mpd.conf /etc/mpd.conf
VOLUME /var/lib/mpd

EXPOSE 6600
CMD ["mpd", "--stdout", "--no-daemon"]
