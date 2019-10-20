#
# Dockerfile for hass-arm (Home Assistant)
#

FROM arm32v7/alpine:3
MAINTAINER EasyPi Software Foundation

ENV HASS_VERSION=0.100.2
ENV HASS_CLI_VERSION=3.1.0

RUN set -xe \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        build-base \
        libffi-dev \
        linux-headers \
        openssl-dev \
        python3 \
        python3-dev \
    && pip3 install --no-cache-dir homeassistant==${HASS_VERSION} \
    && wget https://github.com/home-assistant/hassio-cli/releases/download/${HASS_CLI_VERSION}/hassio_armhf -O /usr/local/bin/hassio

VOLUME /etc/hass
EXPOSE 8123
ENTRYPOINT ["hass", "--config", "/etc/hass"]
