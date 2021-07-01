#
# Dockerfile for salt-master
#

FROM debian:jessie
MAINTAINER kev <noreply@easypi.pro>

RUN apt-get update \
    && apt-get install -y curl jq vim-tiny \
    && curl -sSL https://bootstrap.saltstack.com | bash -s -- -M -N -S -X \
    && apt-get install -y salt-ssh \
    && curl -sSL https://bootstrap.pypa.io/get-pip.py | python \
    && pip install --no-cache-dir httpie ipython \
    && rm -rf /var/lib/apt/lists/*

VOLUME /etc/salt /srv/salt
EXPOSE 4505 4506
WORKDIR /srv/salt

CMD salt-master --log-level warning --log-file /dev/stdout
