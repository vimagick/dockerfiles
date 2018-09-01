#
# Dockerfile for hass-arm (Home Assistant)
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk update \
    && apk add --no-cache ca-certificates \
                          build-base \
                          libffi-dev \
                          linux-headers \
                          openssl-dev \
                          python3 \
                          python3-dev \
    && pip3 install --no-cache-dir homeassistant \
    && wget https://github.com/home-assistant/hassio-cli/releases/download/1.3.1/hassio_armhf -O /usr/local/bin/hassio

VOLUME /etc/hass
EXPOSE 8123

ENTRYPOINT ["hass", "--config", "/etc/hass"]
