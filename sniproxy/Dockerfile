#
# Dockerfile for sniproxy
#
# See: https://pkgs.alpinelinux.org/package/v3.24/community/x86_64/sniproxy
#

FROM alpine:3.24
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache sniproxy

EXPOSE 80 443

ENTRYPOINT ["/usr/sbin/sniproxy"]
CMD ["-f", "-n", "65536", "-c", "/etc/sniproxy/sniproxy.conf"]
