#
# Dockerfile for rsyncd
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U rsync \
    && rm -rf /var/cache/apk/*

COPY rsyncd.* /etc/

VOLUME /data
EXPOSE 873

CMD rsync --daemon --no-detach --log-file /dev/stdout
