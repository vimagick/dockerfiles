#
# Dockerfile for aria2
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add --update aria2 \
    && rm -rf /var/cache/apk/* \
    && aria2c https://github.com/tianon/gosu/releases/download/1.4/gosu-amd64 -o /usr/local/bin/gosu \
    && chmod +x /usr/local/bin/gosu \
    && adduser -D aria2

ENV CRT   /etc/aria2/server.crt
ENV KEY   /etc/aria2/server.key
ENV TOKEN 00000000-0000-0000-0000-000000000000

EXPOSE 6800
VOLUME /home/aria2 /etc/aria2

CMD chown -R aria2:aria2 /home/aria2 \
    && gosu aria2 aria2c --disable-ipv6            \
                         --enable-rpc              \
                         --rpc-listen-all          \
                         --rpc-listen-port=6800    \
                         --rpc-allow-origin-all    \
                         --rpc-secure              \
                         --rpc-certificate=${CRT}  \
                         --rpc-private-key=${KEY}  \
                         --rpc-secret=${TOKEN}     \
                         --dir=/home/aria2

