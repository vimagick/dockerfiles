#
# Dockerfile minidlna-arm
#

FROM easypi/alpine-arm
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add -U minidlna \
    && rm -rf /var/cache/apk/*

VOLUME /opt
WORKDIR /opt

EXPOSE 1900/udp
EXPOSE 8200/tcp

CMD ["minidlna", "-d"]
