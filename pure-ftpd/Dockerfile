#
# Dockerfile for pure-ftpd
#

FROM debian:jessie
MAINTAINER kev <noreply@datageek.info>

RUN apt-get update && apt-get install -y pure-ftpd && rm -rf /var/lib/apt/lists/*
RUN groupadd ftpgroup && useradd -g ftpgroup -m ftpuser

ENV PURE_LOGIN puredb:/etc/pure-ftpd/pureftpd.pdb
ENV PURE_MAXCLIENTSPERIP 2
ENV PURE_USERBANDWIDTH 1024:1024

EXPOSE 21
VOLUME /home/ftpuser /etc/pure-ftpd

CMD pure-ftpd --login $PURE_LOGIN \
              --maxclientsperip $PURE_MAXCLIENTSPERIP \
              --userbandwidth $PURE_USERBANDWIDTH \
              --createhomedir
