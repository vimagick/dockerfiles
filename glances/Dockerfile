#
# Dockerfile for glances-arm
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apt-get update \
    && apt-get -y install build-essential \
                          curl \
                          lm-sensors \
                          python \
                          python-dev \
                          wireless-tools \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install "glances[action,batinfo,browser,cpuinfo,chart,docker,export,folders,gpu,ip,raid,snmp,web,wifi]" \
    && apt-get remove -y build-essential \
                         curl \
                         python-dev \
    && rm -rf /var/lib/apt/lists/*

VOLUME /glances
WORKDIR /glances

EXPOSE 61208
EXPOSE 61209

CMD python -m glances -C /glances/conf/glances.conf $GLANCES_OPT
