#
# Dockerfile for hass-arm (Home Assistant)
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache python3 \
    && python3 -m pip install --no-cache-dir homeassistant

VOLUME /etc/hass
EXPOSE 8123

ENTRYPOINT ["hass", "--config", "/etc/hass"]
