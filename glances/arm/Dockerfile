#
# Dockerfile for glances-arm
#

FROM resin/rpi-raspbian:jessie
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apt-get update \
    && apt-get -y install build-essential \
                          curl \
                          libfreetype6 \
                          libfreetype6-dev \
                          libpng12-0 \
                          libpng12-dev \
                          lm-sensors \
                          pkg-config \
                          python \
                          python-dev \
                          wireless-tools \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install --no-cache-dir "glances[action,batinfo,browser,cpuinfo,chart,docker,export,folders,gpu,ip,raid,snmp,web,wifi]" \
    && apt-get remove -y build-essential \
                         curl \
                         libfreetype6-dev \
                         libpng12-dev \
                         pkg-config \
                         python-dev \
    && rm -rf /root/.cache/pip /var/lib/apt/lists/*

VOLUME /etc/glances
WORKDIR /etc/glances

EXPOSE 61208
EXPOSE 61209

CMD python -m glances -C /glances/conf/glances.conf $GLANCES_OPT
