#
# Dockerfile for Shadowsocks
#

FROM python:latest
MAINTAINER noreply@datageek.info

RUN pip install shadowsocks

ENV PASSWORD secret
ENV METHOD aes-256-cfb
ENV WORKERS 10

CMD ssserver -k $PASSWORD -m $METHOD --workers $WORKERS
