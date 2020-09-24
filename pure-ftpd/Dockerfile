#
# Dockerfile for pure-ftpd
#

FROM debian:buster
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apt-get update \
    && apt-get install -y pure-ftpd \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd ftpgroup \
    && useradd -g ftpgroup -m ftpuser

EXPOSE 21
VOLUME /home/ftpuser /etc/pure-ftpd

ENTRYPOINT ["pure-ftpd"]
CMD ["/etc/pure-ftpd/pure-ftpd.conf"]
