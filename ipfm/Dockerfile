#
# Dockerfile for ipfm
#

FROM debian:12
MAINTAINER EasyPi Software Foundation

RUN set -xe \
 && apt update -y \
 && apt install -y ipfm \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/sbin/ipfm"]
CMD ["-n", "-c", "/etc/ipfm/ipfm.conf"]
