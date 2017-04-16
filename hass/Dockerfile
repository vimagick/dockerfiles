#
# Dockerfile for hass (Home Assistant)
#

FROM alpine
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk update \
    && apk add --no-cache ca-certificates \
                          build-base \
                          linux-headers \
                          python3 \
                          python3-dev \
    && pip3 install --no-cache-dir homeassistant

VOLUME /etc/hass
EXPOSE 8123

ENTRYPOINT ["hass", "--config", "/etc/hass"]
