#
# Dockerfile for hass (Home Assistant)
#

FROM alpine
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache build-base \
                          linux-headers \
                          python3 \
                          python3-dev \
    && pip3 install --no-cache-dir homeassistant==0.41 \
                                   netdisco==0.9.2\
                                   pychromecast==0.8.1 \
    && apk del build-base \
               linux-headers \
               python3-dev

VOLUME /etc/hass
EXPOSE 8123

ENTRYPOINT ["hass", "--config", "/etc/hass"]
