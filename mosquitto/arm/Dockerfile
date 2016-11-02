#
# Dockerfile for mosquitto-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache mosquitto

VOLUME /etc/mosquitto
EXPOSE 1883

ENTRYPOINT ["mosquitto"]
CMD ["-c", "/etc/mosquitto/mosquitto.conf", "-p", "1883"]
