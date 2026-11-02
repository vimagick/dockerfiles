#
# Dockerfile for nmap
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && apk add --no-cache nmap nmap-ncat nmap-scripts rgrc

ENTRYPOINT ["rgrc", "nmap"]
CMD ["--help"]
