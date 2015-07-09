#
# Dockerfile for aria2
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -u aria2 \
    && rm -rf /var/cache/apk/* \
    && aria2c https://github.com/tianon/gosu/releases/download/1.4/gosu-amd64 -o /usr/local/bin/gosu \
    && chmod +x /usr/local/bin/gosu \
    && adduser -D aria2

ENV CRT    /etc/aria2/server.crt
ENV KEY    /etc/aria2/server.key
ENV TOKEN  00000000-0000-0000-0000-000000000000

ENV ULIMIT 0
ENV DLIMIT 0
ENV RSEED  1.0
ENV TSEED  0

EXPOSE 6800
VOLUME /home/aria2 /etc/aria2

CMD chown -R aria2:aria2 /home/aria2                    \
    && gosu aria2 aria2c --disable-ipv6                 \
                         --enable-rpc                   \
                         --rpc-listen-all               \
                         --rpc-listen-port=6800         \
                         --rpc-allow-origin-all         \
                         --rpc-secure                   \
                         --rpc-certificate=${CRT}       \
                         --rpc-private-key=${KEY}       \
                         --rpc-secret=${TOKEN}          \
                         --max-upload-limit=${ULIMIT}   \
                         --max-download-limit=${DLIMIT} \
                         --seed-ratio=${RSEED}          \
                         --seed-time=${TSEED}           \
                         --dir=/home/aria2

