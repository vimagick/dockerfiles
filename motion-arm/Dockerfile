#
# Dockerfile for motion-arm
#

FROM resin/rpi-raspbian
MAINTAINER kev <noreply@datageek.info>

RUN set -xe \
    && apt-get update \
    && apt-get install -y motion \
    && sed -i -e 's/^daemon on/daemon off/' \
              -e 's/^webcontrol_localhost on/webcontrol_localhost off/' \
              -e 's/^stream_localhost on/stream_localhost off/' \
              /etc/motion/motion.conf \
    && rm -rf /var/cache/apt/*

VOLUME /var/lib/motion

EXPOSE 8080 8081

CMD ["/usr/bin/motion"]
