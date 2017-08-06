#
# Dockerfile for building docker-compose-arm
#

FROM resin/rpi-raspbian:jessie
MAINTAINER EasyPi Software Foundation

ENV DOCKER_COMPOSE_VERSION 1.15.0
ENV PYINSTALLER_VERSION 3.2.1

RUN set -xe \
    && apt-get update \
    && apt-get install -y build-essential \
                          curl \
                          python-dev \
                          zlib1g-dev \
    && curl https://bootstrap.pypa.io/get-pip.py | python \
    && pip install docker-compose==$DOCKER_COMPOSE_VERSION \
                   pyinstaller==$PYINSTALLER_VERSION \
    && cd /usr/local/lib/python2.7/dist-packages \
    && pip download --no-binary :all: --no-deps pyinstaller==$PYINSTALLER_VERSION \
    && tar xjf PyInstaller-$PYINSTALLER_VERSION.tar.bz2 \
    && cd PyInstaller-$PYINSTALLER_VERSION/bootloader \
    && ./waf all --no-lsb \
    && cp -r ../PyInstaller/bootloader/Linux-32bit-arm/ ../../PyInstaller/bootloader/ \
    && cd /usr/local/lib/python2.7/dist-packages \
    && mkdir -p bin \
    && curl -sSL https://github.com/docker/compose/raw/$DOCKER_COMPOSE_VERSION/docker-compose.spec > docker-compose.spec \
    && curl -sSL https://github.com/docker/compose/raw/$DOCKER_COMPOSE_VERSION/bin/docker-compose > bin/docker-compose \
    && pyinstaller docker-compose.spec \
    && cp docker-compose/dist/docker-compose /usr/local/bin/ \
    && docker-compose version

ENTRYPOINT ["docker-compose"]
CMD ["help"]
