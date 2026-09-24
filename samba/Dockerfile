#
# Dockerfile for samba
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache samba-common-tools samba-server

COPY ./data/etc/smb.conf /etc/samba/

VOLUME /etc/samba \
       /var/lib/samba

EXPOSE 137/udp \
       138/udp \
       139/tcp \
       445/tcp

CMD nmbd -D && smbd -FS --no-process-group
