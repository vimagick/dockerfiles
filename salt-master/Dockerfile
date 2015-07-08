#
# Dockerfile for salt-master
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y curl \
    && curl -sSL https://bootstrap.saltstack.com | bash -s -- -M -N -X \
    && apt-get install -y salt-ssh \
    && rm -rf /var/lib/apt/lists/*

VOLUME /etc/salt /srv/salt
EXPOSE 4505 4506
WORKDIR /srv/salt

CMD salt-master --log-level warning --log-file /dev/stdout
