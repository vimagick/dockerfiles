#
# Dockerfile minidlna-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add --no-cache minidlna \
    && mkdir -p /etc/minidlna \
    && mv /etc/minidlna.conf /etc/minidlna

VOLUME /etc/minidlna /var/lib/minidlna /opt
WORKDIR /opt

EXPOSE 1900/udp
EXPOSE 8200/tcp

CMD ["minidlnad", "-d", "-f", "/etc/minidlna/minidlna.conf"]
