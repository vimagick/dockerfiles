#
# Dockerfile for hcfg-arm (Home Assistant Configurator)
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

WORKDIR /opt/hcfg

RUN set -xe \
    && apk add --no-cache curl git python3 \
    && pip3 install --no-cache-dir gitpython \
    && mkdir -p bin etc \
    && curl -sSL https://raw.githubusercontent.com/danielperna84/hass-configurator/master/configurator.py > bin/hcfg \
    && curl -sSL https://raw.githubusercontent.com/danielperna84/hass-configurator/master/settings.conf > etc/hcfg.conf \
    && sed -i '/^GIT/s/False/True/' /opt/hcfg/bin/hcfg \
    && chmod +x bin/hcfg

VOLUME /opt/hcfg

EXPOSE 3218

CMD ["/opt/hcfg/bin/hcfg", "/opt/hcfg/etc/hcfg.conf"]
