#
# Dockerfile for samba
#

FROM alpine
MAINTAINER kev <noreply@datageek.info>

RUN apk add -U samba-common-tools samba-server \
    && rm -rf /var/cache/apk/*

COPY smb.conf /etc/samba/

VOLUME /etc/samba

EXPOSE 137/udp 138/udp 139/tcp 445/tcp

CMD smbd --foreground --log-stdout
