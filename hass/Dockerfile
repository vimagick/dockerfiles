#
# Dockerfile for hass (Home Assistant)
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

ENV HASS_VERSION=2021.11.1
ENV HASS_CLI_VERSION=4.14.0

ARG HASS_CLI_ARCH=amd64

RUN set -xe \
    && apk update \
    && apk add --no-cache \
        ca-certificates \
        curl \
        build-base \
        libffi-dev \
        linux-headers \
        openssl-dev \
        python3 \
        python3-dev \
    && curl https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip3 install --no-cache-dir homeassistant==${HASS_VERSION} \
    && wget https://github.com/home-assistant/cli/releases/download/${HASS_CLI_VERSION}/ha_${HASS_CLI_ARCH} -O /usr/local/bin/ha \
    && chmod +x /usr/local/bin/ha

VOLUME /etc/hass
EXPOSE 8123
ENTRYPOINT ["hass", "--config", "/etc/hass"]
