#
# Dockerfile for aria2
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update \
    && apt-get install -y aria2 sudo \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m aria2

ENV CRT   /etc/aria2/server.crt
ENV KEY   /etc/aria2/server.key
ENV TOKEN 00000000-0000-0000-0000-000000000000

EXPOSE 6800
VOLUME /home/aria2 /etc/aria2

CMD sudo -u aria2 aria2c --disable-ipv6            \
                         --enable-rpc              \
                         --rpc-listen-all          \
                         --rpc-listen-port=6800    \
                         --rpc-allow-origin-all    \
                         --rpc-secure              \
                         --rpc-certificate=${CRT}  \
                         --rpc-private-key=${KEY}  \
                         --rpc-secret=${TOKEN}     \
                         --dir=/home/aria2

