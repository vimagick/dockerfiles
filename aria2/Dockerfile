#
# Dockerfile for aria2
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

ENV DIR   /var/lib/aria2
ENV ETC   /etc/aria2
ENV CRT   $ETC/server.crt
ENV KEY   $ETC/server.key
ENV TOKEN 00000000-0000-0000-0000-000000000000
ENV PORT  6800

RUN apt-get update \
    && apt-get install -y aria2 \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p $ETC $DIR

EXPOSE $PORT
VOLUME $DIR $ETC

CMD aria2c --disable-ipv6            \
           --enable-rpc              \
           --rpc-listen-all          \
           --rpc-listen-port=${PORT} \
           --rpc-allow-origin-all    \
           --rpc-secure              \
           --rpc-certificate=${CRT}  \
           --rpc-private-key=${KEY}  \
           --rpc-secret=${TOKEN}     \
           --dir=${DIR}

