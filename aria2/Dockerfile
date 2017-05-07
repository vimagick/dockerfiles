#
# Dockerfile for aria2
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

ENV TOKEN 00000000-0000-0000-0000-000000000000

RUN set -xe \
    && apk add -U aria2 \
    && rm -rf /var/cache/apk/* \
    && aria2c https://github.com/tianon/gosu/releases/download/1.8/gosu-amd64 -o /usr/local/bin/gosu \
    && chmod +x /usr/local/bin/gosu \
    && adduser -D aria2

COPY aria2.conf /etc/aria2/
VOLUME /home/aria2 /etc/aria2

EXPOSE 6800
CMD set -xe \
    && chown -R aria2:aria2 /home/aria2 \
    && gosu aria2 aria2c --conf-path=/etc/aria2/aria2.conf \
                         --rpc-secret=${TOKEN}
