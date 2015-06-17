#
# Dockerfile for dante-server
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y curl \
    && curl -o dante-server.deb http://ftp.us.debian.org/debian/pool/main/d/dante/dante-server_1.1.19.dfsg-3+b3_amd64.deb \
    && dpkg -i dante-server.deb || apt-get install -f -y \
    && apt-get purge -y --auto-remove curl \
    && rm -rf /var/lib/apt/lists/*

ADD danted.conf /etc/danted.conf

EXPOSE 1080

CMD danted -f /etc/danted.conf
