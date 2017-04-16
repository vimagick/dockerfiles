#
# Dockerfile for hass-arm (Home Assistant)
#

FROM resin/rpi-raspbian:jessie
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apt-get update \
    && apt-get install -y build-essential \
                          bluez \
                          curl \
                          libbluetooth3 \
                          libbluetooth-dev \
                          libboost-python-dev \
                          libboost-thread-dev \
                          libglib2.0 \
                          libglib2.0-dev \
                          pkg-config \
                          python-dev \
                          python3-dev \
    && curl https://bootstrap.pypa.io/get-pip.py | python3 \
    && pip3 install --no-cache-dir gattlib \
                                   homeassistant \
                                   pybluez \
    && setcap 'cap_net_raw,cap_net_admin+eip' /usr/bin/python3.4 \
    && apt-get remove -y curl \
                         libbluetooth-dev \
                         libboost-python-dev \
                         libboost-thread-dev \
                         libglib2.0-dev \
                         pkg-config \
                         python-dev

VOLUME /etc/hass
EXPOSE 8123

ENTRYPOINT ["hass", "--config", "/etc/hass"]
