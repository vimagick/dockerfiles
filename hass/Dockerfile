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
    && pip3 install --no-cache-dir homeassistant==0.31.1 \
                                   netdisco==0.7.2 \
    && apk del build-base \
               linux-headers \
               python3-dev

VOLUME /etc/hass
EXPOSE 8123

ENTRYPOINT ["hass", "--config", "/etc/hass"]
