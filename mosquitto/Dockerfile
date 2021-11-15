#
# Dockerfile for mosquitto
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache ca-certificates mosquitto

VOLUME /etc/mosquitto
EXPOSE 1883 8883

ENTRYPOINT ["mosquitto"]
CMD ["-c", "/etc/mosquitto/mosquitto.conf"]
