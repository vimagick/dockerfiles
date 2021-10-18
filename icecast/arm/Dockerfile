#
# Dockerfile for icecast-arm
#

FROM alpine:3

MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apk add --no-cache icecast \
 && mkdir -p /etc/icecast \
 && mv /etc/icecast.xml /etc/icecast \
 && icecast --version

EXPOSE 8000

CMD ["icecast", "-c", "/etc/icecast/icecast.xml"]
