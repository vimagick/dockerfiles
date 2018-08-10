#
# Dockerfile for squid-arm
#

FROM easypi/alpine-arm:edge
MAINTAINER EasyPi Software Foundation

RUN apk add --no-cache squid

EXPOSE 3128 3130

ENTRYPOINT ["/usr/sbin/squid", "-NYCd1"]
