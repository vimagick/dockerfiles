#
# Dockerfile for salt-master
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y curl \
    && curl -sSL https://bootstrap.saltstack.com | bash -s -- -M -N -X \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 4505 4506

CMD salt-master --log-level warning --log-file /dev/stdout
