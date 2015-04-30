#
# Dockerfile for obfsproxy
#

FROM ubuntu:14.04
MAINTAINER kev<noreply@datageek.info>

RUN apt-get update && apt-get install -y build-essential curl python python-dev
RUN curl https://bootstrap.pypa.io/get-pip.py | python
RUN pip install obfsproxy

ENV LOG_MIN_SEVERITY info
ENV DATA_DIR /var/lib/obfsproxy
ENV PASSWORD XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
ENV DEST_ADDR openvpn
ENV DEST_PORT 1194
ENV LISTEN_ADDR 0.0.0.0
ENV LISTEN_PORT 4911

EXPOSE $LISTEN_PORT

CMD obfsproxy --log-min-severity=$LOG_MIN_SEVERITY --data-dir=$DATA_DIR \
              scramblesuit --password=$PASSWORD --dest=$DEST_ADDR:$DEST_PORT \
              server $LISTEN_ADDR:$LISTEN_PORT

