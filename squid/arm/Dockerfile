#
# Dockerfile for squid-arm
#

FROM easypi/alpine-arm:edge
MAINTAINER EasyPi Software Foundation

RUN set -xe \
    && apk add -U squid \
    && rm -rf /var/cache/apk/*

EXPOSE 3128 3130

ENTRYPOINT ["/usr/sbin/squid", "-NYCd1"]
