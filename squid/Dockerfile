#
# Dockerfile for squid
#

FROM alpine:3.24

MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache squid && squid --version

EXPOSE 3128/tcp 3130/udp

# --foreground	Master process runs in foreground and creates worker kids.
# -Y	        Only return UDP_HIT or UDP_MISS_NOFETCH during fast reload.
# -C	        Do not catch fatal signals.
# -d1	        Set debug level to 1. Minimal logging (level 1 = critical messages only).

ENTRYPOINT ["/usr/sbin/squid", "--foreground", "-YCd1"]
