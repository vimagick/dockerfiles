#
# Dockerfile for mosquitto
#

FROM alpine
MAINTAINER kev <noreply@easypi.info>

RUN set -x \
    && apk add -U mosquitto \
    && rm -rf /var/cache/apk/*

VOLUME /etc/mosquitto
EXPOSE 1883

ENTRYPOINT ["mosquitto"]
CMD ["-c", "/etc/mosquitto/mosquitto.conf", "-p", "1883"]
