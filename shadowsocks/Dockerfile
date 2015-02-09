#
# Dockerfile for Shadowsocks
#

FROM ubuntu:latest
MAINTAINER noreply@datageek.info

RUN apt-get update
RUN apt-get install -y python python-pip
RUN pip install shadowsocks

ENV PASSWORD secret
ENV METHOD aes-256-cfb
ENV WORKERS 10

CMD ssserver -k $PASSWORD -m $METHOD --workers $WORKERS
