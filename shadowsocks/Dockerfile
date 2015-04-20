#
# Dockerfile for Shadowsocks
#

FROM ubuntu:latest
MAINTAINER noreply@datageek.info

RUN apt-get update
RUN apt-get install -y python

ADD https://bootstrap.pypa.io/get-pip.py /tmp/

RUN python /tmp/get-pip.py
RUN pip install shadowsocks

ENV PASSWORD secret
ENV METHOD aes-256-cfb
ENV WORKERS 10

CMD ssserver -k $PASSWORD -m $METHOD --workers $WORKERS
