#
# Dockerfile for hbdg-arm (Home Bridge)
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk update \
    && apk add avahi \
               avahi-compat-libdns_sd \
               avahi-dev \
               build-base \
               dbus \
               nodejs \
               nodejs-npm \
               python \
    && npm install -g homebridge \
                      homebridge-homeassistant \
    && apk del avahi-dev \
               build-base \
               python \
    && rm -rf /var/cache/apk/*

VOLUME /root/.homebridge

CMD set -xe \
    && rm -f /var/run/dbus.pid \
    && dbus-daemon --system \
    && rm -f /var/run/avahi-daemon/pid \
    && avahi-daemon -D \
    && homebridge
