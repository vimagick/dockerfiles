#
# Dockerfile for pure-ftpd
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update && apt-get install -y pure-ftpd vim-tiny && rm -rf /var/lib/apt/lists/*
RUN groupadd ftpgroup && useradd -g ftpgroup -s /bin/bash -m ftpuser

ENV PURE_PASSWDFILE /etc/pure-ftpd/pureftpd.passwd
ENV PURE_DBFILE /etc/pure-ftpd/pureftpd.pdb
ENV MAXCLIENTSPERIP 2
ENV USERBANDWIDTH 1024:1024

EXPOSE 21
VOLUME /home/ftpuser /etc/pure-ftpd

CMD pure-ftpd --login puredb:$PURE_DBFILE \
              --maxclientsperip $MAXCLIENTSPERIP \
              --userbandwidth $USERBANDWIDTH \
              --createhomedir
