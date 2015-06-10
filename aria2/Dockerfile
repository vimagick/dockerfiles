#
# Dockerfile for aria2
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

ENV DIR   /var/lib/aria2
ENV ETC   /etc/aria2
ENV CERT  server-cert.pem
ENV KEY   server-key.pem
ENV TOKEN 00000000-0000-0000-0000-000000000000
ENV PORT  6800

RUN apt-get update \
    && apt-get install -y aria2 openssl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p $ETC $DIR \
    && cd $ETC \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $KEY -out $CERT -batch

EXPOSE $PORT
VOLUME $DIR $ETC

CMD aria2c --disable-ipv6            \
           --enable-rpc              \
           --rpc-listen-all=false    \
           --rpc-listen-port=${PORT} \
           --rpc-allow-origin-all    \
           --rpc-secure              \
           --rpc-certificate=${CERT} \
           --rpc-private-key=${KEY}  \
           --rpc-secret=${TOKEN}     \
           --dir=${DIR}

