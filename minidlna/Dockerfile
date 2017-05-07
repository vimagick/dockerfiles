#
# Dockerfile minidlna
#

FROM alpine
MAINTAINER kev <noreply@easypi.pro>

RUN apk add --no-cache minidlna

VOLUME /opt
WORKDIR /opt

EXPOSE 1900/udp
EXPOSE 8200/tcp

CMD ["minidlnad", "-d"]
