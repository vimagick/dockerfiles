#
# Dockerfile for pure-ftpd
#

FROM alpine:3.24

LABEL maintainer="EasyPi Software Foundation"

ENV PURE_PASSWDFILE=/etc/pure-ftpd/pureftpd.passwd
ENV PURE_DBFILE=/etc/pure-ftpd/pureftpd.pdb

RUN set -xe \
 && apk add --no-cache pure-ftpd \
 && mkdir -p /etc/pure-ftpd \
 && mv /etc/pure-ftpd.conf /etc/pure-ftpd \
 && adduser -D -u 1000 -h /home/ftpuser -s /sbin/nologin ftpuser

VOLUME /home/ftpuser /etc/pure-ftpd

EXPOSE 21

ENTRYPOINT ["pure-ftpd"]
CMD ["-l", "puredb:/etc/pure-ftpd/pureftpd.pdb", "-A", "-E", "-j"]
