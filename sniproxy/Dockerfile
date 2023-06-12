#
# Dockerfile for sniproxy
#

FROM alpine:3
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache sniproxy

EXPOSE 80 443

ENTRYPOINT ["/usr/sbin/sniproxy"]
CMD ["-f", "-n", "65536", "-c", "/etc/sniproxy/sniproxy.conf"]
